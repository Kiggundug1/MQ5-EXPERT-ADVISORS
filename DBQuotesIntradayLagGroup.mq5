//+------------------------------------------------------------------+
//|                                     DBQuotesIntradayLagGroup.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property description "Display quotes groupped by LAGs at intraday time and day of week.\nUse DBquotesImport.mq5 to generate and populate the database beforehand."
#property script_show_inputs

#include <MQL5Book/DBSQLite.mqh>
#include <MQL5Book/Periods.mqh>

//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
input string Database = "MQL5Book/DB/Quotes";
input datetime SubsetStart = D'2015.01.01';
input datetime SubsetStop = D'2021.01.01';

const string Table = "MqlRatesDB";

#resource "DBQuotesIntradayLagGroup.sql" as string sql1

/*
   Copy & paste example for SQL query in MetaEditor DB viewer
   
   SELECT
      AVG(product) / STDDEV(product) AS objective,
      SUM(estimate) AS backtest_profit,
      SUM(CASE WHEN estimate >= 0 THEN estimate ELSE 0 END) / SUM(CASE WHEN estimate < 0 THEN -estimate ELSE 0 END) AS backtest_PF,
      intraday, day
   FROM
   (
      SELECT
         time,
         TIME(time, 'unixepoch') AS intraday,
         STRFTIME('%w', time, 'unixepoch') AS day,
         (LAG(open,-1) OVER (ORDER BY time) - open) AS delta,
         SIGN(open - LAG(open) OVER (ORDER BY time)) AS direction,
         (LAG(open,-1) OVER (ORDER BY time) - open) * (open - LAG(open) OVER (ORDER BY time)) AS product,
         (LAG(open,-1) OVER (ORDER BY time) - open) * SIGN(open - LAG(open) OVER (ORDER BY time)) AS estimate
      FROM MqlRatesDB
      WHERE (time >= STRFTIME('%s', '2015-01-01') AND time < STRFTIME('%s', '2021-01-01'))
   )
   GROUP BY intraday, day
   ORDER BY objective DESC
*/

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   Print("");
   DBSQLite db(Database + _Symbol + PeriodToString());
   if(!PRTF(db.isOpen())) return;
   if(!PRTF(db.hasTable(Table))) return;

   // custom "preparation" of SQL-query for formatting
   string sqlrep = sql1;
   // single percent sign would be consumed by StringFormat,
   // we need to preserve it 'as is' for proper SQL execution
   StringReplace(sqlrep, "%", "%%");
   StringReplace(sqlrep, "?1", "%ld");
   StringReplace(sqlrep, "?2", "%ld");
   
   // actual parameter substitution
   const string sqlfmt = StringFormat(sqlrep, SubsetStart, SubsetStop);
   Print(sqlfmt);
   
   // SQL-query execution and print out
   DatabasePrint(db.getHandle(), sqlfmt, 0);
}
//+------------------------------------------------------------------+
/*

   db.isOpen()=true / ok
   db.hasTable(Table)=true / ok
      SELECT
         AVG(product) / STDDEV(product) AS objective,
         SUM(estimate) AS backtest_profit,
         SUM(CASE WHEN estimate >= 0 THEN estimate ELSE 0 END) / SUM(CASE WHEN estimate < 0 THEN -estimate ELSE 0 END) AS backtest_PF,
         intraday, day
      FROM
      (
         SELECT
            time,
            TIME(time, 'unixepoch') AS intraday,
            STRFTIME('%w', time, 'unixepoch') AS day,
            (LAG(open,-1) OVER (ORDER BY time) - open) AS delta,
            SIGN(open - LAG(open) OVER (ORDER BY time)) AS direction,
            (LAG(open,-1) OVER (ORDER BY time) - open) * (open - LAG(open) OVER (ORDER BY time)) AS product,
            (LAG(open,-1) OVER (ORDER BY time) - open) * SIGN(open - LAG(open) OVER (ORDER BY time)) AS estimate
         FROM MqlRatesDB
         WHERE (time >= 1420070400 AND time < 1609459200)
      )
      GROUP BY intraday, day
      ORDER BY objective DESC
     #|             objective       backtest_profit       backtest_PF intraday day
   ---+---------------------------------------------------------------------------
     1|      0.16713214428916     0.073200000000001  1.46040631486258 16:00:00 5   
     2|     0.118128291843983    0.0433099999999995  1.33678071539657 20:00:00 3   
     3|     0.103701251751617   0.00929999999999853  1.14148790506616 05:00:00 2   
     4|     0.102930330078208    0.0164399999999973   1.1932071923845 08:00:00 4   
     5|     0.089531492651001    0.0064300000000006  1.10167615433271 07:00:00 2   
     6|    0.0827628326995007 -8.99999999970369e-05 0.999601152226913 17:00:00 4   
     7|    0.0823433025146974    0.0159700000000012  1.21665988332657 21:00:00 1   
     8|    0.0767938336191962   0.00522999999999874  1.04226945769012 13:00:00 1   
     9|    0.0657741522256548    0.0162299999999986  1.09699976093712 15:00:00 2   
    10|    0.0635243373432768   0.00932000000000044  1.08294766820933 22:00:00 3   
    11|    0.0623455237646223    0.0154000000000003  1.10044351682755 15:00:00 1   
    12|    0.0611311003782229    0.0191399999999957  1.10094404303568 17:00:00 3   
    13|    0.0603091366315941    0.0277700000000005  1.41929639136343 05:00:00 5   
    14|    0.0585389379786665   0.00334999999999996  1.03894443152755 04:00:00 3   
    15|     0.057377314038757    0.0193600000000012  1.23684854416444 04:00:00 4   
    16|    0.0573063422330552    0.0117299999999985  1.08600337268127 12:00:00 4   
    17|    0.0572803333187238    0.0144899999999994  1.28108632395731 06:00:00 5   
    18|    0.0543313045372004    0.0231100000000006  1.13573358393046 10:00:00 2   
    19|    0.0522234308193375   0.00711999999999868  1.08198986642099 08:00:00 3   
    20|    0.0509042604023954    0.0146599999999975  1.09737628694784 11:00:00 4   
    21|     0.050544127390581    0.0134200000000027  1.11372881355935 12:00:00 2   
    22|    0.0505094536724595    0.0120799999999981    1.175555878506 05:00:00 3   
    23|    0.0492348110892364  -0.00231000000000092 0.962711864406766 06:00:00 3   
    24|    0.0479673290683895   0.00780000000000114  1.12751348700346 02:00:00 2   
    25|    0.0462716009204473    0.0299700000000018  1.18895403820693 16:00:00 1   
    26|    0.0458139381349133   0.00218999999999991  1.01262466132472 21:00:00 3   
    27|    0.0408907469745224  0.000309999999998034   1.0049871299871 07:00:00 3   
    28|    0.0393633749488827  -0.00718000000000019 0.924221635883902 03:00:00 5   
    29|    0.0369741494098486   -0.0319400000000005 0.870173156653929 16:00:00 4   
    30|    0.0353247937148132    0.0161000000000002  1.08557457212714 16:00:00 3   
    31|    0.0321292435692497   0.00850000000000062  1.06220270764728 13:00:00 4   
    32|    0.0305136698247891    0.0232900000000011  1.20561490244549 21:00:00 4   
    33|    0.0289062786935775    0.0255699999999999  1.21062602965404 13:00:00 2   
    34|    0.0271064989563544   -0.0347399999999973 0.778344924392285 09:00:00 3   
    35|    0.0266151766395079   -0.0027100000000011 0.981655723278947 11:00:00 5   
    36|    0.0257887732684008   0.00848999999999878   1.0626892121391 09:00:00 5   
    37|    0.0245688226705506   0.00143000000000026  1.02301255230126 07:00:00 5   
    38|    0.0239247828463491   -0.0229999999999997 0.842541247347165 13:00:00 5   
    39|    0.0214966998043054   -0.0251300000000025 0.869914069779468 15:00:00 3   
    40|    0.0208336620016311   0.00290999999999753  1.02191430077564 12:00:00 1   
    41|    0.0206033857840952  -0.00157000000000052 0.991458571350849 16:00:00 2   
    42|    0.0198926317510929 -0.000850000000000684 0.988288784789189 02:00:00 4   
    43|    0.0182102258283443  -0.00463000000000169 0.960376551133918 19:00:00 1   
    44|    0.0161172998833366    0.0147599999999994  1.17186772240335 04:00:00 2   
    45|    0.0149682763181311   -0.0395100000000017  0.84912937223155 15:00:00 4   
    46|    0.0145351167678307   0.00109999999999699  1.00680608835538 10:00:00 3   
    47|    0.0115935896337062  -0.00084000000000084  0.98976109215016 23:00:00 3   
    48|    0.0101605494765125   -0.0217299999999982 0.886224409654964 14:00:00 4   
    49|   0.00958770083330551   0.00705999999999918  1.13908589440503 01:00:00 3   
    50|   0.00608558150441834   0.00773000000000157  1.13345994475141 07:00:00 1   
    51|   0.00492752747188311    0.0188500000000016  1.24222564893346 04:00:00 1   
    52|   0.00119434960576392    0.0206499999999974  1.18782972530469 19:00:00 5   
    53| -0.000838154722261324    0.0116900000000013  1.05888575458393 10:00:00 4   
    54|  -0.00202838775890642  -0.00484999999999958 0.923969274180913 07:00:00 4   
    55|  -0.00211381131508719    0.0123100000000016  1.06296353127718 17:00:00 2   
    56|  -0.00295885735463623    0.0110399999999997  1.19031201516979 01:00:00 4   
    57|  -0.00300915367363466   -0.0132099999999999 0.872305461575641 21:00:00 2   
    58|  -0.00442017218158207     0.012690000000003  1.09391651865011 14:00:00 2   
    59|  -0.00454035248777325   0.00692999999999855  1.04569130348783 09:00:00 2   
    60|  -0.00597400371437388  -0.00529000000000268 0.964899475814461 18:00:00 5   
    61|  -0.00739364354810872   -0.0152200000000016 0.881951446521357 14:00:00 1   
    62|  -0.00901765750534236   -0.0267299999999984 0.774316109422505 22:00:00 5   
    63|  -0.00930357306364694   -0.0085399999999991  0.86239123428941 23:00:00 1   
    64|  -0.00943902403661846               -0.0468 0.747545582047685 23:00:00 5   
    65|   -0.0154584740504693   0.00992000000000326  1.09304943251105 03:00:00 1   
    66|   -0.0157180125534758  -0.00272999999999612 0.978291984732855 12:00:00 3   
    67|   -0.0170471590021677   -0.0230099999999998 0.695070235886563 23:00:00 2   
    68|   -0.0183799552509626   -0.0104800000000005 0.921456943715802 13:00:00 3   
    69|   -0.0209693895581613   0.00687999999999778  1.05500919485086 14:00:00 3   
    70|   -0.0211148080619913   0.00145000000000417  1.01785934228358 22:00:00 2   
    71|    -0.022375359030735   -0.0162200000000015 0.798007471980061 02:00:00 5   
    72|   -0.0276963976069807  -0.00566999999999873 0.931405758528929 03:00:00 2   
    73|   -0.0297160844533128   -0.0166299999999993 0.886158269441406 20:00:00 4   
    74|   -0.0301792471418656     0.011540000000001  1.08227577356339 09:00:00 1   
    75|   -0.0332789718520231  -0.00461000000000089  0.92851604899983 01:00:00 5   
    76|    -0.033767151799259  -0.00590000000000157 0.895036470378908 01:00:00 2   
    77|   -0.0351809058498753   -0.0296499999999968 0.679494108745024 04:00:00 5   
    78|   -0.0358166251670762   -0.0191800000000029 0.743102062684134 05:00:00 1   
    79|    -0.038052881227643   -0.0114300000000001 0.838399547575284 23:00:00 4   
    80|    -0.038397862746323   -0.0167500000000012 0.889875082182767 11:00:00 3   
    81|    -0.039724911138701  -0.00453999999999999 0.940513626834382 22:00:00 1   
    82|   -0.0408406951795748   -0.0580999999999992 0.804961562993053 15:00:00 5   
    83|   -0.0443689865111622   -0.0186799999999998  0.78261375538229 05:00:00 4   
    84|   -0.0448716595913865   0.00143999999999878  1.01407074457689 20:00:00 5   
    85|    -0.044984167587657   -0.0308200000000005 0.776666666666663 20:00:00 2   
    86|   -0.0463706489926068  -0.00487999999999933 0.979101537407394 17:00:00 5   
    87|   -0.0519635249552873   -0.0152199999999982 0.861837327523617 20:00:00 1   
    88|   -0.0525362253765298   -0.0242299999999984 0.851468154232828 18:00:00 2   
    89|   -0.0532284987864957   -0.0200199999999997 0.864802809292276 18:00:00 1   
    90|   -0.0533104397953623   0.00575000000000125  1.06522972206468 01:00:00 1   
    91|   -0.0553214020292255 -3.00000000008627e-05 0.999647556390967 08:00:00 1   
    92|   -0.0587282865228479  -0.00770000000000004 0.947321611821851 11:00:00 1   
    93|   -0.0606411180940267   -0.0611000000000004 0.647594878301995 09:00:00 4   
    94|   -0.0606727956038308    -0.047079999999998 0.697778918988326 18:00:00 3   
    95|   -0.0658053715209465   -0.0170099999999997  0.90405009025271 18:00:00 4   
    96|   -0.0660313886783148  -0.00735000000000152 0.958920187793419 17:00:00 1   
    97|   -0.0663811860556746    -0.014619999999999  0.92068572668584 11:00:00 2   
    98|    -0.066476045086213   -0.0240500000000008 0.654900272635954 00:00:00 4   
    99|   -0.0666325857658802   -0.0165500000000016 0.915776081424929 10:00:00 1   
   100|   -0.0691986027849773   -0.0189199999999987 0.760506329113941 02:00:00 3   
   101|   -0.0697287093075506  -0.00283999999999929 0.952563888424931 06:00:00 1   
   102|   -0.0698406627783849   -0.0243999999999995 0.873823559830388 10:00:00 5   
   103|   -0.0700099737151066   0.00629999999999775  1.07211538461536 03:00:00 3   
   104|   -0.0734717138519144  -0.00658999999999721 0.951040118870748 19:00:00 2   
   105|   -0.0750612413078805  -0.00437000000000043  0.95588532202705 03:00:00 4   
   106|   -0.0759898392818295  -0.00520000000000231 0.919728311207127 06:00:00 2   
   107|   -0.0775250903401206   -0.0100600000000002 0.923730098559513 14:00:00 5   
   108|   -0.0800435048271025   -0.0124500000000001 0.905688962957352 19:00:00 3   
   109|   -0.0804303804315245   -0.0245099999999987 0.764440172993765 08:00:00 5   
   110|   -0.0814131025461459   -0.0189100000000015 0.820605255668329 21:00:00 5   
   111|   -0.0899571263478305   -0.0321900000000028 0.721250432975386 22:00:00 4   
   112|   -0.0909772560603298   -0.0226100000000016 0.851161872161138 19:00:00 4   
   113|   -0.0961794181717023  -0.00846999999999931 0.936377976414036 12:00:00 5   
   114|    -0.108868074018582   -0.0246099999999998 0.634920634920637 00:00:00 5   
   115|    -0.109368419185336   -0.0250700000000013 0.744496534855268 08:00:00 2   
   116|    -0.121893581607986   -0.0234599999999998 0.610945273631843 00:00:00 3   
   117|    -0.135416609546408   -0.0898899999999971 0.343437294573087 00:00:00 1   
   118|    -0.142128458003631   -0.0255200000000018 0.681835182645536 06:00:00 4   
   119|    -0.142196924506816   -0.0205700000000004 0.629769618430515 00:00:00 2   
   120|     -0.15200009633513   -0.0301499999999988 0.708864426419475 02:00:00 1   

*/
//+------------------------------------------------------------------+
