 
 # p r o p e r t y   c o p y r i g h t       " m e t a t r o o p e r . s t o r e "  
 # p r o p e r t y   l i n k                 " m e t a t r o o p e r . s t o r e "  
 # p r o p e r t y   d e s c r i p t i o n   " "  
 # p r o p e r t y   v e r s i o n           " 1 . 0 "  
 # p r o p e r t y   s t r i c t  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                               I N P U T   P A R A M E T E R S ,   G L O B A L   V A R I A B L E S ,   C O N S T A N T S ,   I M P O R T S   a n d   I N C L U D E S                                                 |   / /  
 / /   |                                             S y s t e m   a n d   C u s t o m   v a r i a b l e s   a n d   o t h e r   d e f i n i t i o n s   u s e d   i n   t h e   p r o j e c t                                               |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   S y s t e m   c o n s t a n t s   ( p r o j e c t   s e t t i n g s )   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 / / - -  
 # d e f i n e   P R O J E C T _ I D   " m t 5 - 9 7 2 4 "  
 / / - -  
 / /   P o i n t   F o r m a t   R u l e s  
 # d e f i n e   P O I N T _ F O R M A T _ R U L E S   " 0 . 0 0 1 = 0 . 0 1 , 0 . 0 0 0 0 1 = 0 . 0 0 0 1 , 0 . 0 0 0 0 0 1 = 0 . 0 0 0 1 "   / /   t h i s   i s   d e s e r i a l i z e d   i n   a   s p e c i a l   f u n c t i o n   l a t e r  
 # d e f i n e   E N A B L E _ S P R E A D _ M E T E R   t r u e  
 # d e f i n e   E N A B L E _ S T A T U S   t r u e  
 # d e f i n e   E N A B L E _ T E S T _ I N D I C A T O R S   t r u e  
 / / - -  
 / /   E v e n t s   O n / O f f  
 # d e f i n e   E N A B L E _ E V E N T _ T I C K   1   / /   e n a b l e   " T i c k "   e v e n t  
 # d e f i n e   E N A B L E _ E V E N T _ T R A D E   0   / /   e n a b l e   " T r a d e "   e v e n t  
 # d e f i n e   E N A B L E _ E V E N T _ T I M E R   0   / /   e n a b l e   " T i m e r "   e v e n t  
 / / - -  
 / /   V i r t u a l   S t o p s  
 # d e f i n e   V I R T U A L _ S T O P S _ E N A B L E D   0   / /   e n a b l e   v i r t u a l   s t o p s  
 # d e f i n e   V I R T U A L _ S T O P S _ T I M E O U T   0   / /   v i r t u a l   s t o p s   t i m e o u t  
 # d e f i n e   U S E _ E M E R G E N C Y _ S T O P S   " n o "   / /   " y e s "   t o   u s e   e m e r g e n c y   ( h a r d   s t o p s )   w h e n   v i r t u a l   s t o p s   a r e   i n   u s e .   " a l w a y s "   t o   u s e   E M E R G E N C Y _ S T O P S _ A D D   a s   e m e r g e n c y   s t o p s   w h e n   t h e r e   i s   n o   v i r t u a l   s t o p .  
 # d e f i n e   E M E R G E N C Y _ S T O P S _ R E L   0   / /   u s e   0   t o   d i s a b l e   h a r d   s t o p s   w h e n   v i r t u a l   s t o p s   a r e   e n a b l e d .   U s e   a   v a l u e   > = 0   t o   a u t o m a t i c a l l y   s e t   h a r d   s t o p s   w i t h   v i r t u a l .   E x a m p l e :   i f   2   i s   u s e d ,   t h e n   h a r d   s t o p s   w i l l   b e   2   t i m e s   b i g g e r   t h a n   v i r t u a l   o n e s .  
 # d e f i n e   E M E R G E N C Y _ S T O P S _ A D D   0   / /   a d d   p i p s   t o   r e l a t i v e   s i z e   o f   e m e r g e n c y   s t o p s   ( h a r d   s t o p s )  
 / / - -  
 / /   S e t t i n g s   f o r   e v e n t s  
 # d e f i n e   O N _ T I M E R _ P E R I O D   6 0   / /   T i m e r   e v e n t   p e r i o d   ( i n   s e c o n d s )  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   S y s t e m   c o n s t a n t s   ( p r e d e f i n e d   c o n s t a n t s )   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 / / - -  
 # d e f i n e   T L O B J P R O P _ T I M E 1   8 0 1  
 # d e f i n e   O B J P R O P _ T L _ P R I C E _ B Y _ S H I F T   8 0 2  
 # d e f i n e   O B J P R O P _ T L _ S H I F T _ B Y _ P R I C E   8 0 3  
 # d e f i n e   O B J P R O P _ F I B O V A L U E   8 0 4  
 # d e f i n e   O B J P R O P _ F I B O P R I C E V A L U E   8 0 5  
 # d e f i n e   O B J P R O P _ F I R S T L E V E L   8 0 6  
 # d e f i n e   O B J P R O P _ T I M E 1   8 0 7  
 # d e f i n e   O B J P R O P _ T I M E 2   8 0 8  
 # d e f i n e   O B J P R O P _ T I M E 3   8 0 9  
 # d e f i n e   O B J P R O P _ P R I C E 1   8 1 0  
 # d e f i n e   O B J P R O P _ P R I C E 2   8 1 1  
 # d e f i n e   O B J P R O P _ P R I C E 3   8 1 2  
 # d e f i n e   O B J P R O P _ B A R S H I F T 1   8 1 3  
 # d e f i n e   O B J P R O P _ B A R S H I F T 2   8 1 4  
 # d e f i n e   O B J P R O P _ B A R S H I F T 3   8 1 5  
 # d e f i n e   S E L _ C U R R E N T   0  
 # d e f i n e   S E L _ I N I T I A L   1  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   E n u m e r a t i o n s ,   I m p o r t s ,   C o n s t a n t s ,   V a r i a b l e s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
  
  
  
  
  
  
 / / - -  
 / /   C o n s t a n t s   ( I n p u t   P a r a m e t e r s )  
 i n p u t   d o u b l e   m u l t i   =   4 . 0 ;  
 i n p u t   i n t   M a g i c S t a r t   =   9 7 2 4 ;   / /   M a g i c   N u m b e r ,   k i n d   o f . . .  
 c l a s s   c  
 {  
 	 	 p u b l i c :  
 	 s t a t i c   d o u b l e   m u l t i ;  
 	 s t a t i c   i n t   M a g i c S t a r t ;  
 } ;  
 d o u b l e   c : : m u l t i ;  
 i n t   c : : M a g i c S t a r t ;  
  
  
 / / - -  
 / /   V a r i a b l e s   ( G l o b a l   V a r i a b l e s )  
 c l a s s   v  
 {  
 	 	 p u b l i c :  
 } ;  
  
  
  
 / / - -  
 / /   E x t e r n s   ( G l o b a l   V a r i a b l e s )  
 i n p u t   i n t   i n p 3 _ f a s t E M A   =   1 2 ;  
 i n p u t   i n t   i n p 3 _ s l o w E M A   =   2 6 ;  
 i n p u t   i n t   i n p 3 _ s i g n a l S M A   =   9 ;  
 i n p u t   d o u b l e   i n p 3 _ m a c d T h r e s h o l d   =   0 . 0 0 0 3 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 3 _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 4 _ f a s t E M A   =   1 2 ;  
 i n p u t   i n t   i n p 4 _ s l o w E M A   =   2 6 ;  
 i n p u t   i n t   i n p 4 _ s i g n a l S M A   =   9 ;  
 i n p u t   d o u b l e   i n p 4 _ m a c d T h r e s h o l d   =   0 . 0 0 0 3 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 4 _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 5 _ L o _ K p e r i o d   =   5 0 ;  
 i n p u t   i n t   i n p 5 _ L o _ D p e r i o d   =   9 ;  
 i n p u t   i n t   i n p 5 _ L o _ S l o w i n g   =   2 0 ;  
 i n p u t   i n t   i n p 5 _ L o _ M o d e   =   0 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 5 _ L o _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 5 _ R o _ K p e r i o d   =   5 0 ;  
 i n p u t   i n t   i n p 5 _ R o _ D p e r i o d   =   9 ;  
 i n p u t   i n t   i n p 5 _ R o _ S l o w i n g   =   2 0 ;  
 i n p u t   i n t   i n p 5 _ R o _ M o d e   =   1 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 5 _ R o _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 6 _ L o _ K p e r i o d   =   5 0 ;  
 i n p u t   i n t   i n p 6 _ L o _ D p e r i o d   =   9 ;  
 i n p u t   i n t   i n p 6 _ L o _ S l o w i n g   =   2 0 ;  
 i n p u t   i n t   i n p 6 _ L o _ M o d e   =   0 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 6 _ L o _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 6 _ R o _ K p e r i o d   =   5 0 ;  
 i n p u t   i n t   i n p 6 _ R o _ D p e r i o d   =   9 ;  
 i n p u t   i n t   i n p 6 _ R o _ S l o w i n g   =   2 0 ;  
 i n p u t   i n t   i n p 6 _ R o _ M o d e   =   1 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 6 _ R o _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 9 _ I n d i c a t o r _ K p e r i o d   =   5 0 ;  
 i n p u t   i n t   i n p 9 _ I n d i c a t o r _ D p e r i o d   =   9 ;  
 i n p u t   i n t   i n p 9 _ I n d i c a t o r _ S l o w i n g   =   2 0 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 9 _ I n d i c a t o r _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 9 _ C a n d l e s S h i f t   =   1 ;  
 i n p u t   i n t   i n p 9 _ C a n d l e s P e r i o d   =   1 ;  
 i n p u t   i n t   i n p 9 _ E x c e p t i o n C a n d l e s   =   0 ;  
 i n p u t   d o u b l e   i n p 9 _ U p p e r L e v e l   =   3 0 . 0 ;  
 i n p u t   d o u b l e   i n p 9 _ L o w e r L e v e l   =   0 . 0 ;  
 i n p u t   i n t   i n p 1 0 _ I n d i c a t o r _ K p e r i o d   =   5 0 ;  
 i n p u t   i n t   i n p 1 0 _ I n d i c a t o r _ D p e r i o d   =   9 ;  
 i n p u t   i n t   i n p 1 0 _ I n d i c a t o r _ S l o w i n g   =   2 0 ;  
 i n p u t   E N U M _ T I M E F R A M E S   i n p 1 0 _ I n d i c a t o r _ P e r i o d   =   N U L L ;  
 i n p u t   i n t   i n p 1 0 _ C a n d l e s S h i f t   =   1 ;  
 i n p u t   i n t   i n p 1 0 _ C a n d l e s P e r i o d   =   1 ;  
 i n p u t   i n t   i n p 1 0 _ E x c e p t i o n C a n d l e s   =   0 ;  
 i n p u t   d o u b l e   i n p 1 0 _ U p p e r L e v e l   =   1 0 0 . 0 ;  
 i n p u t   d o u b l e   i n p 1 0 _ L o w e r L e v e l   =   7 0 . 0 ;  
 i n p u t   s t r i n g   i n p 1 4 _ A l e r t T i t l e   =   " Y o u r   A l e r t   M e s s a g e   h e r e " ;  
 i n p u t   b o o l   i n p 1 4 _ A l s o S e n d N o t i f i c a t i o n   =   f a l s e ;  
 i n p u t   s t r i n g   i n p 1 5 _ A l e r t T i t l e   =   " A l e r t   M e s s a g e " ;  
 i n p u t   b o o l   i n p 1 5 _ A l s o S e n d N o t i f i c a t i o n   =   f a l s e ;  
 c l a s s   _ e x t e r n s  
 {  
 	 	 p u b l i c :  
 	 s t a t i c   i n t   i n p 3 _ f a s t E M A ;  
 	 s t a t i c   i n t   i n p 3 _ s l o w E M A ;  
 	 s t a t i c   i n t   i n p 3 _ s i g n a l S M A ;  
 	 s t a t i c   d o u b l e   i n p 3 _ m a c d T h r e s h o l d ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 3 _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 4 _ f a s t E M A ;  
 	 s t a t i c   i n t   i n p 4 _ s l o w E M A ;  
 	 s t a t i c   i n t   i n p 4 _ s i g n a l S M A ;  
 	 s t a t i c   d o u b l e   i n p 4 _ m a c d T h r e s h o l d ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 4 _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 5 _ L o _ K p e r i o d ;  
 	 s t a t i c   i n t   i n p 5 _ L o _ D p e r i o d ;  
 	 s t a t i c   i n t   i n p 5 _ L o _ S l o w i n g ;  
 	 s t a t i c   i n t   i n p 5 _ L o _ M o d e ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 5 _ L o _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 5 _ R o _ K p e r i o d ;  
 	 s t a t i c   i n t   i n p 5 _ R o _ D p e r i o d ;  
 	 s t a t i c   i n t   i n p 5 _ R o _ S l o w i n g ;  
 	 s t a t i c   i n t   i n p 5 _ R o _ M o d e ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 5 _ R o _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 6 _ L o _ K p e r i o d ;  
 	 s t a t i c   i n t   i n p 6 _ L o _ D p e r i o d ;  
 	 s t a t i c   i n t   i n p 6 _ L o _ S l o w i n g ;  
 	 s t a t i c   i n t   i n p 6 _ L o _ M o d e ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 6 _ L o _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 6 _ R o _ K p e r i o d ;  
 	 s t a t i c   i n t   i n p 6 _ R o _ D p e r i o d ;  
 	 s t a t i c   i n t   i n p 6 _ R o _ S l o w i n g ;  
 	 s t a t i c   i n t   i n p 6 _ R o _ M o d e ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 6 _ R o _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 9 _ I n d i c a t o r _ K p e r i o d ;  
 	 s t a t i c   i n t   i n p 9 _ I n d i c a t o r _ D p e r i o d ;  
 	 s t a t i c   i n t   i n p 9 _ I n d i c a t o r _ S l o w i n g ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 9 _ I n d i c a t o r _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 9 _ C a n d l e s S h i f t ;  
 	 s t a t i c   i n t   i n p 9 _ C a n d l e s P e r i o d ;  
 	 s t a t i c   i n t   i n p 9 _ E x c e p t i o n C a n d l e s ;  
 	 s t a t i c   d o u b l e   i n p 9 _ U p p e r L e v e l ;  
 	 s t a t i c   d o u b l e   i n p 9 _ L o w e r L e v e l ;  
 	 s t a t i c   i n t   i n p 1 0 _ I n d i c a t o r _ K p e r i o d ;  
 	 s t a t i c   i n t   i n p 1 0 _ I n d i c a t o r _ D p e r i o d ;  
 	 s t a t i c   i n t   i n p 1 0 _ I n d i c a t o r _ S l o w i n g ;  
 	 s t a t i c   E N U M _ T I M E F R A M E S   i n p 1 0 _ I n d i c a t o r _ P e r i o d ;  
 	 s t a t i c   i n t   i n p 1 0 _ C a n d l e s S h i f t ;  
 	 s t a t i c   i n t   i n p 1 0 _ C a n d l e s P e r i o d ;  
 	 s t a t i c   i n t   i n p 1 0 _ E x c e p t i o n C a n d l e s ;  
 	 s t a t i c   d o u b l e   i n p 1 0 _ U p p e r L e v e l ;  
 	 s t a t i c   d o u b l e   i n p 1 0 _ L o w e r L e v e l ;  
 	 s t a t i c   s t r i n g   i n p 1 4 _ A l e r t T i t l e ;  
 	 s t a t i c   b o o l   i n p 1 4 _ A l s o S e n d N o t i f i c a t i o n ;  
 	 s t a t i c   s t r i n g   i n p 1 5 _ A l e r t T i t l e ;  
 	 s t a t i c   b o o l   i n p 1 5 _ A l s o S e n d N o t i f i c a t i o n ;  
 } ;  
 i n t   _ e x t e r n s : : i n p 3 _ f a s t E M A ;  
 i n t   _ e x t e r n s : : i n p 3 _ s l o w E M A ;  
 i n t   _ e x t e r n s : : i n p 3 _ s i g n a l S M A ;  
 d o u b l e   _ e x t e r n s : : i n p 3 _ m a c d T h r e s h o l d ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 3 _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 4 _ f a s t E M A ;  
 i n t   _ e x t e r n s : : i n p 4 _ s l o w E M A ;  
 i n t   _ e x t e r n s : : i n p 4 _ s i g n a l S M A ;  
 d o u b l e   _ e x t e r n s : : i n p 4 _ m a c d T h r e s h o l d ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 4 _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 5 _ L o _ K p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 5 _ L o _ D p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 5 _ L o _ S l o w i n g ;  
 i n t   _ e x t e r n s : : i n p 5 _ L o _ M o d e ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 5 _ L o _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 5 _ R o _ K p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 5 _ R o _ D p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 5 _ R o _ S l o w i n g ;  
 i n t   _ e x t e r n s : : i n p 5 _ R o _ M o d e ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 5 _ R o _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 6 _ L o _ K p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 6 _ L o _ D p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 6 _ L o _ S l o w i n g ;  
 i n t   _ e x t e r n s : : i n p 6 _ L o _ M o d e ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 6 _ L o _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 6 _ R o _ K p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 6 _ R o _ D p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 6 _ R o _ S l o w i n g ;  
 i n t   _ e x t e r n s : : i n p 6 _ R o _ M o d e ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 6 _ R o _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ K p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ D p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ S l o w i n g ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 9 _ C a n d l e s S h i f t ;  
 i n t   _ e x t e r n s : : i n p 9 _ C a n d l e s P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 9 _ E x c e p t i o n C a n d l e s ;  
 d o u b l e   _ e x t e r n s : : i n p 9 _ U p p e r L e v e l ;  
 d o u b l e   _ e x t e r n s : : i n p 9 _ L o w e r L e v e l ;  
 i n t   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ K p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ D p e r i o d ;  
 i n t   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ S l o w i n g ;  
 E N U M _ T I M E F R A M E S   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 1 0 _ C a n d l e s S h i f t ;  
 i n t   _ e x t e r n s : : i n p 1 0 _ C a n d l e s P e r i o d ;  
 i n t   _ e x t e r n s : : i n p 1 0 _ E x c e p t i o n C a n d l e s ;  
 d o u b l e   _ e x t e r n s : : i n p 1 0 _ U p p e r L e v e l ;  
 d o u b l e   _ e x t e r n s : : i n p 1 0 _ L o w e r L e v e l ;  
 s t r i n g   _ e x t e r n s : : i n p 1 4 _ A l e r t T i t l e ;  
 b o o l   _ e x t e r n s : : i n p 1 4 _ A l s o S e n d N o t i f i c a t i o n ;  
 s t r i n g   _ e x t e r n s : : i n p 1 5 _ A l e r t T i t l e ;  
 b o o l   _ e x t e r n s : : i n p 1 5 _ A l s o S e n d N o t i f i c a t i o n ;  
  
  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   S y s t e m   g l o b a l   v a r i a b l e s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 / / - -  
 / /   B l o c k s   L o o k u p   F u n c t i o n s  
 s t r i n g   f x d B l o c k s L o o k u p T a b l e [ ] ;  
  
 i n t   F X D _ C U R R E N T _ F U N C T I O N _ I D   =   0 ;  
 d o u b l e   F X D _ M I L S _ I N I T _ E N D         =   0 ;  
 i n t   F X D _ T I C K S _ F R O M _ S T A R T         =   0 ;  
 i n t   F X D _ M O R E _ S H I F T                     =   0 ;  
 b o o l   F X D _ D R A W _ S P R E A D _ I N F O       =   f a l s e ;  
 b o o l   F X D _ F I R S T _ T I C K _ P A S S E D     =   f a l s e ;  
 b o o l   F X D _ B R E A K                             =   f a l s e ;  
 b o o l   F X D _ C O N T I N U E                       =   f a l s e ;  
 b o o l   U S E _ V I R T U A L _ S T O P S   =   V I R T U A L _ S T O P S _ E N A B L E D ;  
 s t r i n g   F X D _ C U R R E N T _ S Y M B O L       =   " " ;  
 i n t   F X D _ B L O C K S _ C O U N T                 =   1 1 ;  
 d a t e t i m e   F X D _ T I C K S K I P _ U N T I L   =   0 ;  
  
 i n t   F X D _ I C U S T O M _ H A N D L E S _ I D S [ ] ;   / /   o n l y   u s e d   i n   M Q L 5  
 s t r i n g   F X D _ I C U S T O M _ H A N D L E S _ K E Y S [ ] ;   / /   o n l y   u s e d   i n   M Q L 5  
  
 / / -   f o r   u s e   i n   O n C h a r t ( )   e v e n t  
 s t r u c t   f x d _ o n c h a r t  
 {  
 	 i n t   i d ;  
 	 l o n g   l p a r a m ;  
 	 d o u b l e   d p a r a m ;  
 	 s t r i n g   s p a r a m ;  
 } ;  
 f x d _ o n c h a r t   F X D _ O N C H A R T ;  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                                                                                   E V E N T   F U N C T I O N S                                                                                                     |   / /  
 / /   |                                                       T h e s e   a r e   t h e   m a i n   f u n c t i o n s   t h a t   c o n t r o l s   t h e   w h o l e   p r o j e c t                                                       |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n c e   w h e n   t h e   p r o g r a m   s t a r t s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 i n t   O n I n i t ( )  
 {  
  
 	 / /   I n i t i a t e   C o n s t a n t s  
 	 c : : m u l t i   =   m u l t i ;  
 	 c : : M a g i c S t a r t   =   M a g i c S t a r t ;  
  
  
  
  
 	 / /   I n i t i a t e   E x t e r n s  
 	 _ e x t e r n s : : i n p 3 _ f a s t E M A   =   i n p 3 _ f a s t E M A ;  
 	 _ e x t e r n s : : i n p 3 _ s l o w E M A   =   i n p 3 _ s l o w E M A ;  
 	 _ e x t e r n s : : i n p 3 _ s i g n a l S M A   =   i n p 3 _ s i g n a l S M A ;  
 	 _ e x t e r n s : : i n p 3 _ m a c d T h r e s h o l d   =   i n p 3 _ m a c d T h r e s h o l d ;  
 	 _ e x t e r n s : : i n p 3 _ P e r i o d   =   i n p 3 _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 4 _ f a s t E M A   =   i n p 4 _ f a s t E M A ;  
 	 _ e x t e r n s : : i n p 4 _ s l o w E M A   =   i n p 4 _ s l o w E M A ;  
 	 _ e x t e r n s : : i n p 4 _ s i g n a l S M A   =   i n p 4 _ s i g n a l S M A ;  
 	 _ e x t e r n s : : i n p 4 _ m a c d T h r e s h o l d   =   i n p 4 _ m a c d T h r e s h o l d ;  
 	 _ e x t e r n s : : i n p 4 _ P e r i o d   =   i n p 4 _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 5 _ L o _ K p e r i o d   =   i n p 5 _ L o _ K p e r i o d ;  
 	 _ e x t e r n s : : i n p 5 _ L o _ D p e r i o d   =   i n p 5 _ L o _ D p e r i o d ;  
 	 _ e x t e r n s : : i n p 5 _ L o _ S l o w i n g   =   i n p 5 _ L o _ S l o w i n g ;  
 	 _ e x t e r n s : : i n p 5 _ L o _ M o d e   =   i n p 5 _ L o _ M o d e ;  
 	 _ e x t e r n s : : i n p 5 _ L o _ P e r i o d   =   i n p 5 _ L o _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 5 _ R o _ K p e r i o d   =   i n p 5 _ R o _ K p e r i o d ;  
 	 _ e x t e r n s : : i n p 5 _ R o _ D p e r i o d   =   i n p 5 _ R o _ D p e r i o d ;  
 	 _ e x t e r n s : : i n p 5 _ R o _ S l o w i n g   =   i n p 5 _ R o _ S l o w i n g ;  
 	 _ e x t e r n s : : i n p 5 _ R o _ M o d e   =   i n p 5 _ R o _ M o d e ;  
 	 _ e x t e r n s : : i n p 5 _ R o _ P e r i o d   =   i n p 5 _ R o _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 6 _ L o _ K p e r i o d   =   i n p 6 _ L o _ K p e r i o d ;  
 	 _ e x t e r n s : : i n p 6 _ L o _ D p e r i o d   =   i n p 6 _ L o _ D p e r i o d ;  
 	 _ e x t e r n s : : i n p 6 _ L o _ S l o w i n g   =   i n p 6 _ L o _ S l o w i n g ;  
 	 _ e x t e r n s : : i n p 6 _ L o _ M o d e   =   i n p 6 _ L o _ M o d e ;  
 	 _ e x t e r n s : : i n p 6 _ L o _ P e r i o d   =   i n p 6 _ L o _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 6 _ R o _ K p e r i o d   =   i n p 6 _ R o _ K p e r i o d ;  
 	 _ e x t e r n s : : i n p 6 _ R o _ D p e r i o d   =   i n p 6 _ R o _ D p e r i o d ;  
 	 _ e x t e r n s : : i n p 6 _ R o _ S l o w i n g   =   i n p 6 _ R o _ S l o w i n g ;  
 	 _ e x t e r n s : : i n p 6 _ R o _ M o d e   =   i n p 6 _ R o _ M o d e ;  
 	 _ e x t e r n s : : i n p 6 _ R o _ P e r i o d   =   i n p 6 _ R o _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ K p e r i o d   =   i n p 9 _ I n d i c a t o r _ K p e r i o d ;  
 	 _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ D p e r i o d   =   i n p 9 _ I n d i c a t o r _ D p e r i o d ;  
 	 _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ S l o w i n g   =   i n p 9 _ I n d i c a t o r _ S l o w i n g ;  
 	 _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ P e r i o d   =   i n p 9 _ I n d i c a t o r _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 9 _ C a n d l e s S h i f t   =   i n p 9 _ C a n d l e s S h i f t ;  
 	 _ e x t e r n s : : i n p 9 _ C a n d l e s P e r i o d   =   i n p 9 _ C a n d l e s P e r i o d ;  
 	 _ e x t e r n s : : i n p 9 _ E x c e p t i o n C a n d l e s   =   i n p 9 _ E x c e p t i o n C a n d l e s ;  
 	 _ e x t e r n s : : i n p 9 _ U p p e r L e v e l   =   i n p 9 _ U p p e r L e v e l ;  
 	 _ e x t e r n s : : i n p 9 _ L o w e r L e v e l   =   i n p 9 _ L o w e r L e v e l ;  
 	 _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ K p e r i o d   =   i n p 1 0 _ I n d i c a t o r _ K p e r i o d ;  
 	 _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ D p e r i o d   =   i n p 1 0 _ I n d i c a t o r _ D p e r i o d ;  
 	 _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ S l o w i n g   =   i n p 1 0 _ I n d i c a t o r _ S l o w i n g ;  
 	 _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ P e r i o d   =   i n p 1 0 _ I n d i c a t o r _ P e r i o d ;  
 	 _ e x t e r n s : : i n p 1 0 _ C a n d l e s S h i f t   =   i n p 1 0 _ C a n d l e s S h i f t ;  
 	 _ e x t e r n s : : i n p 1 0 _ C a n d l e s P e r i o d   =   i n p 1 0 _ C a n d l e s P e r i o d ;  
 	 _ e x t e r n s : : i n p 1 0 _ E x c e p t i o n C a n d l e s   =   i n p 1 0 _ E x c e p t i o n C a n d l e s ;  
 	 _ e x t e r n s : : i n p 1 0 _ U p p e r L e v e l   =   i n p 1 0 _ U p p e r L e v e l ;  
 	 _ e x t e r n s : : i n p 1 0 _ L o w e r L e v e l   =   i n p 1 0 _ L o w e r L e v e l ;  
 	 _ e x t e r n s : : i n p 1 4 _ A l e r t T i t l e   =   i n p 1 4 _ A l e r t T i t l e ;  
 	 _ e x t e r n s : : i n p 1 4 _ A l s o S e n d N o t i f i c a t i o n   =   i n p 1 4 _ A l s o S e n d N o t i f i c a t i o n ;  
 	 _ e x t e r n s : : i n p 1 5 _ A l e r t T i t l e   =   i n p 1 5 _ A l e r t T i t l e ;  
 	 _ e x t e r n s : : i n p 1 5 _ A l s o S e n d N o t i f i c a t i o n   =   i n p 1 5 _ A l s o S e n d N o t i f i c a t i o n ;  
  
  
  
 	 / /   d o   o r   d o   n o t   n o t   i n i t i l i a l i z e   o n   r e l o a d  
 	 i f   ( U n i n i t i a l i z e R e a s o n ( )   ! =   0 )  
 	 {  
 	 	 i f   ( U n i n i t i a l i z e R e a s o n ( )   = =   R E A S O N _ C H A R T C H A N G E )  
 	 	 {  
 	 	 	 / /   i f   t h e   s y m b o l   i s   t h e   s a m e ,   d o   n o t   r e l o a d ,   o t h e r w i s e   c o n t i n u e   b e l o w  
 	 	 	 i f   ( F X D _ C U R R E N T _ S Y M B O L   = =   S y m b o l ( ) )   { r e t u r n   I N I T _ S U C C E E D E D ; }  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 r e t u r n   I N I T _ S U C C E E D E D ;  
 	 	 }  
 	 }  
 	 F X D _ C U R R E N T _ S Y M B O L   =   S y m b o l ( ) ;  
  
 	 C u r r e n t S y m b o l ( F X D _ C U R R E N T _ S Y M B O L ) ;   / /   C u r r e n t S y m b o l ( )   h a s   i n t e r n a l   m e m o r y   t h a t   s h o u l d   b e   s e t   f r o m   h e r e   w h e n   t h e   s y m b o l l   i s   c h a n g e d  
 	 C u r r e n t T i m e f r a m e ( P E R I O D _ C U R R E N T ) ;  
  
  
  
  
  
 	 C o m m e n t ( " " ) ;  
 	 f o r   ( i n t   i = O b j e c t s T o t a l ( C h a r t I D ( ) ) ;   i > = 0 ;   i - - )  
 	 {  
 	 	 s t r i n g   n a m e   =   O b j e c t N a m e ( C h a r t I D ( ) ,   i ) ;  
 	 	 i f   ( S t r i n g S u b s t r ( n a m e , 0 , 8 )   = =   " f x d _ c m n t " )   { O b j e c t D e l e t e ( C h a r t I D ( ) ,   n a m e ) ; }  
 	 }  
 	 C h a r t R e d r a w ( ) ;  
  
  
  
 	 / / - -   d i s a b l e   v i r t u a l   s t o p s   i n   o p t i m i z a t i o n ,   b e c a u s e   g r a p h i c a l   o b j e c t s   d o e s   n o t   w o r k  
 	 / /   h t t p : / / d o c s . m q l 4 . c o m / r u n t i m e / t e s t i n g  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ O P T I M I Z A T I O N ) )   {  
 	 	 U S E _ V I R T U A L _ S T O P S   =   f a l s e ;  
 	 }  
  
 	 / / - -   s e t   i n i t i a l   l o c a l   a n d   s e r v e r   t i m e  
 	 T i m e A t S t a r t ( " s e t " ) ;  
  
 	 / / - -   s e t   i n i t i a l   b a l a n c e  
 	 A c c o u n t B a l a n c e A t S t a r t ( ) ;  
  
 	 / / - -   d r a w   t h e   i n i t i a l   s p r e a d   i n f o   m e t e r  
 	 i f   ( E N A B L E _ S P R E A D _ M E T E R   = =   f a l s e )   {  
 	 	 F X D _ D R A W _ S P R E A D _ I N F O   =   f a l s e ;  
 	 }  
 	 e l s e   {  
 	 	 F X D _ D R A W _ S P R E A D _ I N F O   =   ! ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )   & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E ) ) ;  
 	 }  
 	 i f   ( F X D _ D R A W _ S P R E A D _ I N F O )   D r a w S p r e a d I n f o ( ) ;  
  
 	 / / - -   d r a w   i n i t i a l   s t a t u s  
 	 i f   ( E N A B L E _ S T A T U S )   D r a w S t a t u s ( " w a i t i n g   f o r   t i c k . . . " ) ;  
  
 	 / / - -   d r a w   i n d i c a t o r s   a f t e r   t e s t  
 	 T e s t e r H i d e I n d i c a t o r s ( ! E N A B L E _ T E S T _ I N D I C A T O R S ) ;  
  
 	 i f   ( E N A B L E _ E V E N T _ T I M E R )   {  
 	 	 O n T i m e r S e t ( O N _ T I M E R _ P E R I O D ) ;  
 	 }  
  
  
 	 / / - -   I n i t i a l i z e   b l o c k s   c l a s s e s  
 	 A r r a y R e s i z e ( _ b l o c k s _ ,   1 1 ) ;  
  
 	 _ b l o c k s _ [ 0 ]   =   n e w   B l o c k 0 ( ) ;  
 	 _ b l o c k s _ [ 1 ]   =   n e w   B l o c k 1 ( ) ;  
 	 _ b l o c k s _ [ 2 ]   =   n e w   B l o c k 2 ( ) ;  
 	 _ b l o c k s _ [ 3 ]   =   n e w   B l o c k 3 ( ) ;  
 	 _ b l o c k s _ [ 4 ]   =   n e w   B l o c k 4 ( ) ;  
 	 _ b l o c k s _ [ 5 ]   =   n e w   B l o c k 5 ( ) ;  
 	 _ b l o c k s _ [ 6 ]   =   n e w   B l o c k 6 ( ) ;  
 	 _ b l o c k s _ [ 7 ]   =   n e w   B l o c k 7 ( ) ;  
 	 _ b l o c k s _ [ 8 ]   =   n e w   B l o c k 8 ( ) ;  
 	 _ b l o c k s _ [ 9 ]   =   n e w   B l o c k 9 ( ) ;  
 	 _ b l o c k s _ [ 1 0 ]   =   n e w   B l o c k 1 0 ( ) ;  
  
 	 / /   f i l l   t h e   l o o k u p   t a b l e  
 	 A r r a y R e s i z e ( f x d B l o c k s L o o k u p T a b l e ,   A r r a y S i z e ( _ b l o c k s _ ) ) ;  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( _ b l o c k s _ ) ;   i + + )  
 	 {  
 	 	 f x d B l o c k s L o o k u p T a b l e [ i ]   =   _ b l o c k s _ [ i ] . _ _ b l o c k _ u s e r _ n u m b e r ;  
 	 }  
  
 	 / /   f i l l   t h e   l i s t   o f   i n b o u n d   b l o c k s   f o r   e a c h   B l o c k C a l l s   i n s t a n c e  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( _ b l o c k s _ ) ;   i + + )  
 	 {  
 	 	 _ b l o c k s _ [ i ] . _ _ a n n o u n c e T h i s B l o c k ( ) ;  
 	 }  
  
 	 / /   L i s t   o f   i n i t i a l l y   d i s a b l e d   b l o c k s  
 	 i n t   d i s a b l e d _ b l o c k s _ l i s t [ ]   =   { } ;  
 	 f o r   ( i n t   l   =   0 ;   l   <   A r r a y S i z e ( d i s a b l e d _ b l o c k s _ l i s t ) ;   l + + )   {  
 	 	 _ b l o c k s _ [ d i s a b l e d _ b l o c k s _ l i s t [ l ] ] . _ _ d i s a b l e d   =   t r u e ;  
 	 }  
  
  
  
 	 F X D _ M I L S _ I N I T _ E N D           =   ( d o u b l e ) G e t T i c k C o u n t ( ) ;  
 	 F X D _ F I R S T _ T I C K _ P A S S E D   =   f a l s e ;   / /   r e s e t   i s   n e e d e d   w h e n   c h a n g i n g   i n p u t s  
  
 	 r e t u r n ( I N I T _ S U C C E E D E D ) ;  
 }  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n   e v e r y   i n c o m i n g   t i c k   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n T i c k ( )  
 {  
 	 F X D _ T I C K S _ F R O M _ S T A R T + + ;  
  
 	 i f   ( E N A B L E _ S T A T U S   & &   F X D _ T I C K S _ F R O M _ S T A R T   = =   1 )   D r a w S t a t u s ( " w o r k i n g " ) ;  
  
 	 / / - -   s p e c i a l   s y s t e m   a c t i o n s  
 	 i f   ( F X D _ D R A W _ S P R E A D _ I N F O )   D r a w S p r e a d I n f o ( ) ;  
 	 T i c k s D a t a ( " " ) ;   / /   C o l l e c t   t i c k s   ( i f   n e e d e d )  
 	 T i c k s P e r S e c o n d ( f a l s e ,   t r u e ) ;   / /   C o l l e c t   t i c k s   p e r   s e c o n d  
 	 i f   ( U S E _ V I R T U A L _ S T O P S )   { V i r t u a l S t o p s D r i v e r ( ) ; }  
  
 	 i f   ( f a l s e )   E x p i r a t i o n W o r k e r   *   e x p i r a t i o n D u m m y   =   n e w   E x p i r a t i o n W o r k e r ( ) ;  
 	 e x p i r a t i o n W o r k e r . R u n ( ) ;  
  
 	 O C O D r i v e r ( ) ;   / /   C h e c k   a n d   c l o s e   O C O   o r d e r s  
  
 	 / /   s k i p   t i c k s  
 	 i f   ( T i m e L o c a l ( )   <   F X D _ T I C K S K I P _ U N T I L )   { r e t u r n ; }  
  
 	 / / - -   r u n   b l o c k s  
 	 i n t   b l o c k s _ t o _ r u n [ ]   =   { 0 } ;  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( b l o c k s _ t o _ r u n ) ;   i + + )   {  
 	 	 _ b l o c k s _ [ b l o c k s _ t o _ r u n [ i ] ] . r u n ( ) ;  
 	 }  
  
  
 	 r e t u r n ;  
 }  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n   t r a d e   e v e n t s   -   o p e n ,   c l o s e ,   m o d i f y   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n T r a d e ( )  
 {  
 	 / /   T h i s   i s   n e e d e d   s o   t h a t   t h e   O n T r a d e E v e n t D e t e c t o r   c l a s s   i s   a d d e d   i n t o   t h e   c o d e  
 	 i f   ( f a l s e )   O n T r a d e E v e n t D e t e c t o r   *   d u m m y   =   n e w   O n T r a d e E v e n t D e t e c t o r ( ) ;  
  
 }  
  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n   a   p e r i o d   b a s i s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n T i m e r ( )  
 {  
  
 }  
  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   w h e n   c h a r t   e v e n t   h a p p e n s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n C h a r t E v e n t (  
 	 c o n s t   i n t   i d ,                   / /   E v e n t   I D  
 	 c o n s t   l o n g &   l p a r a m ,       / /   P a r a m e t e r   o f   t y p e   l o n g   e v e n t  
 	 c o n s t   d o u b l e &   d p a r a m ,   / /   P a r a m e t e r   o f   t y p e   d o u b l e   e v e n t  
 	 c o n s t   s t r i n g &   s p a r a m     / /   P a r a m e t e r   o f   t y p e   s t r i n g   e v e n t s  
 )  
 {  
 	 / / - -   w r i t e   p a r a m e t e r   t o   t h e   s y s t e m   g l o b a l   v a r i a b l e s  
 	 F X D _ O N C H A R T . i d           =   i d ;  
 	 F X D _ O N C H A R T . l p a r a m   =   l p a r a m ;  
 	 F X D _ O N C H A R T . d p a r a m   =   d p a r a m ;  
 	 F X D _ O N C H A R T . s p a r a m   =   s p a r a m ;  
  
  
 	 r e t u r n ;  
 }  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n c e   w h e n   t h e   p r o g r a m   e n d s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n D e i n i t ( c o n s t   i n t   r e a s o n )  
 {  
 	 i n t   r e s o n   =   U n i n i t i a l i z e R e a s o n ( ) ;  
 	 i f   ( r e s o n   = =   R E A S O N _ C H A R T C H A N G E   | |   r e s o n   = =   R E A S O N _ P A R A M E T E R S   | |   r e a s o n   = =   R E A S O N _ T E M P L A T E   | |   r e a s o n   = =   R E A S O N _ A C C O U N T )   { r e t u r n ; }  
  
 	 / / - -   i f   T i m e r   w a s   s e t ,   k i l l   i t   h e r e  
 	 E v e n t K i l l T i m e r ( ) ;  
  
 	 i f   ( E N A B L E _ S T A T U S )   D r a w S t a t u s ( " s t o p p e d " ) ;  
 	 i f   ( E N A B L E _ S P R E A D _ M E T E R )   D r a w S p r e a d I n f o ( ) ;  
  
  
  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R ) )   {  
 	 	 P r i n t ( " B a c k t e s t e d   i n   " + D o u b l e T o S t r i n g ( ( G e t T i c k C o u n t ( ) - F X D _ M I L S _ I N I T _ E N D ) / 1 0 0 0 ,   2 ) + "   s e c o n d s " ) ;  
 	 	 d o u b l e   t c   =   G e t T i c k C o u n t ( ) - F X D _ M I L S _ I N I T _ E N D ;  
 	 	 i f   ( t c   >   0 )  
 	 	 {  
 	 	 	 P r i n t ( " A v e r a g e   t i c k s   p e r   s e c o n d :   " + D o u b l e T o S t r i n g ( F X D _ T I C K S _ F R O M _ S T A R T / t c ,   0 ) ) ;  
 	 	 }  
 	 }  
  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ P R O G R A M _ T Y P E )   = =   P R O G R A M _ E X P E R T )  
 	 {  
 	 	 s w i t c h ( U n i n i t i a l i z e R e a s o n ( ) )  
 	 	 {  
 	 	 	 c a s e   R E A S O N _ P R O G R A M 	 	 :   P r i n t ( " E x p e r t   A d v i s o r   s e l f   t e r m i n a t e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ R E M O V E 	 	 :   P r i n t ( " E x p e r t   A d v i s o r   r e m o v e d   f r o m   t h e   c h a r t " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ R E C O M P I L E 	 :   P r i n t ( " E x p e r t   A d v i s o r   h a s   b e e n   r e c o m p i l e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ C H A R T C H A N G E 	 :   P r i n t ( " S y m b o l   o r   c h a r t   p e r i o d   h a s   b e e n   c h a n g e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ C H A R T C L O S E 	 :   P r i n t ( " C h a r t   h a s   b e e n   c l o s e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ P A R A M E T E R S 	 :   P r i n t ( " I n p u t   p a r a m e t e r s   h a v e   b e e n   c h a n g e d   b y   a   u s e r " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ A C C O U N T 	 	 :   P r i n t ( " A n o t h e r   a c c o u n t   h a s   b e e n   a c t i v a t e d   o r   r e c o n n e c t i o n   t o   t h e   t r a d e   s e r v e r   h a s   o c c u r r e d   d u e   t o   c h a n g e s   i n   t h e   a c c o u n t   s e t t i n g s " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ T E M P L A T E 	 	 :   P r i n t ( " A   n e w   t e m p l a t e   h a s   b e e n   a p p l i e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ I N I T F A I L E D 	 :   P r i n t ( " O n I n i t ( )   h a n d l e r   h a s   r e t u r n e d   a   n o n z e r o   v a l u e " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ C L O S E 	 	 	 :   P r i n t ( " T e r m i n a l   h a s   b e e n   c l o s e d " ) ;   b r e a k ;  
 	 	 }  
 	 }  
  
 	 / /   d e l e t e   d y n a m i c   p o i n t e r s  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( _ b l o c k s _ ) ;   i + + )  
 	 {  
 	 	 d e l e t e   _ b l o c k s _ [ i ] ;  
 	 	 _ b l o c k s _ [ i ]   =   N U L L ;  
 	 }  
 	 A r r a y R e s i z e ( _ b l o c k s _ ,   0 ) ;  
  
 	 r e t u r n ;  
 }  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                                                                           C l a s s e s   o f   b l o c k s                                                                                                         |   / /  
 / /   |                             C l a s s e s   t h a t   c o n t a i n   t h e   a c t u a l   c o d e   o f   t h e   b l o c k s   a n d   t h e i r   i n p u t   p a r a m e t e r s   a s   w e l l                               |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 / * *  
 	 T h e   b a s e   c l a s s   f o r   a l l   b l o c k   c a l l s  
       * /  
 c l a s s   B l o c k C a l l s  
 {  
 	 p u b l i c :  
 	 	 b o o l   _ _ d i s a b l e d ;   / /   w h e t h e r   o r   n o t   t h e   b l o c k   i s   d i s a b l e d  
  
 	 	 s t r i n g   _ _ b l o c k _ u s e r _ n u m b e r ;  
                 i n t   _ _ b l o c k _ n u m b e r ;  
 	 	 i n t   _ _ b l o c k _ w a i t i n g ;  
 	 	 i n t   _ _ p a r e n t _ n u m b e r ;  
 	 	 i n t   _ _ i n b o u n d _ b l o c k s [ ] ;  
 	 	 i n t   _ _ o u t b o u n d _ b l o c k s [ ] ;  
  
 	 	 v o i d   _ _ a d d I n b o u n d B l o c k ( i n t   i d   =   0 )   {  
 	 	 	 i n t   s i z e   =   A r r a y S i z e ( _ _ i n b o u n d _ b l o c k s ) ;  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )   {  
 	 	 	 	 i f   ( _ _ i n b o u n d _ b l o c k s [ i ]   = =   i d )   {  
 	 	 	 	 	 r e t u r n ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 A r r a y R e s i z e ( _ _ i n b o u n d _ b l o c k s ,   s i z e   +   1 ) ;  
 	 	 	 _ _ i n b o u n d _ b l o c k s [ s i z e ]   =   i d ;  
 	 	 }  
  
 	 	 v o i d   B l o c k C a l l s ( )   {  
 	 	 	 _ _ d i s a b l e d                     =   f a l s e ;  
 	 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " " ;  
 	 	 	 _ _ b l o c k _ n u m b e r             =   0 ;  
 	 	 	 _ _ b l o c k _ w a i t i n g           =   0 ;  
 	 	 	 _ _ p a r e n t _ n u m b e r           =   0 ;  
 	 	 }  
  
 	 	 / * *  
 	 	       A n n o u n c e   t h i s   b l o c k   t o   t h e   l i s t   o f   i n b o u n d   c o n n e c t i o n s   o f   a l l   t h e   b l o c k s   t o   w h i c h   t h i s   b l o c k   i s   c o n n e c t e d   t o  
 	 	       * /  
 	 	 v o i d   _ _ a n n o u n c e T h i s B l o c k ( )  
 	 	 {  
 	 	       / /   a d d   t h e   c u r r e n t   b l o c k   n u m b e r   t o   t h e   l i s t   o f   i n b o u n d   b l o c k s  
 	 	       / /   f o r   e a c h   o u t b o u n d   b l o c k   t h a t   i s   p r o v i d e d  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   A r r a y S i z e ( _ _ o u t b o u n d _ b l o c k s ) ;   i + + )  
 	 	 	 {  
 	 	 	 	 i n t   b l o c k   =   _ _ o u t b o u n d _ b l o c k s [ i ] ;   / /   o u t b o u n d   b l o c k   n u m b e r  
 	 	 	 	 i n t   s i z e     =   A r r a y S i z e ( _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s ) ;   / /   t h e   s i z e   o f   i t s   i n b o u n d   l i s t  
  
 	 	 	 	 / /   s k i p   i f   t h e   c u r r e n t   b l o c k   w a s   a l r e a d y   a d d e d  
 	 	 	 	 f o r   ( i n t   j   =   0 ;   j   <   s i z e ;   j + + )   {  
 	 	 	 	 	 i f   ( _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s [ j ]   = =   _ _ b l o c k _ n u m b e r )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e t u r n ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
  
 	 	 	 	 / /   a d d   t h e   c u r r e n t   b l o c k   n u m b e r   t o   t h e   l i s t   o f   i n b o u n d   b l o c k s   o f   t h e   o t h e r   b l o c k  
 	 	 	 	 A r r a y R e s i z e ( _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s ,   s i z e   +   1 ) ;  
 	 	 	 	 _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s [ s i z e ]   =   _ _ b l o c k _ n u m b e r ;  
 	 	 	 }  
 	 	 }  
  
 	 	 / /   t h i s   i s   h e r e ,   b e c a u s e   i t   i s   u s e d   i n   t h e   " r u n "   f u n c t i o n  
 	 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )   =   0 ;  
  
 	 	 / * *  
 	 	 	 I n   t h e   d e r i v e d   c l a s s   t h i s   m e t h o d   s h o u l d   b e   u s e d   t o   s e t   d y n a m i c   p a r a m e t e r s   o r   o t h e r   s t u f f   b e f o r e   t h e   m a i n   e x e c u t e .  
 	 	 	 T h i s   m e t h o d   i s   a u t o m a t i c a l l y   c a l l e d   w i t h i n   t h e   m a i n   " r u n "   m e t h o d   b e l o w ,   b e f o r e   t h e   e x e c u t i o n   o f   t h e   m a i n   c l a s s .  
 	 	 	 * /  
 	 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )   { r e t u r n ; } ;  
 	 	 b o o l   _ b e f o r e E x e c u t e E n a b l e d ;   / /   f o r   s p e e d  
  
 	 	 / * *  
 	 	 	 S a m e   a s   _ b e f o r e E x e c u t e _ ,   b u t   t o   w o r k   a f t e r   t h e   e x e c u t e   m e t h o d .  
 	 	 	 * /  
 	 	 v i r t u a l   v o i d   _ a f t e r E x e c u t e _ ( )   { r e t u r n ; } ;  
 	 	 b o o l   _ a f t e r E x e c u t e E n a b l e d ;   / /   f o r   s p e e d  
  
 	 	 / * *  
 	 	 	 T h i s   i s   t h e   m e t h o d   t h a t   i s   u s e d   t o   r u n   t h e   b l o c k  
 	 	 	 * /  
 	 	 v i r t u a l   v o i d   r u n ( i n t   _ p a r e n t _ = 0 )   {  
 	 	 	 _ _ p a r e n t _ n u m b e r   =   _ p a r e n t _ ;  
 	 	 	 i f   ( _ _ d i s a b l e d   | |   F X D _ B R E A K )   { r e t u r n ; }  
 	 	 	 F X D _ C U R R E N T _ F U N C T I O N _ I D   =   _ _ b l o c k _ n u m b e r ;  
  
 	 	 	 i f   ( _ b e f o r e E x e c u t e E n a b l e d )   { _ b e f o r e E x e c u t e _ ( ) ; }  
 	 	 	 _ e x e c u t e _ ( ) ;  
 	 	 	 i f   ( _ a f t e r E x e c u t e E n a b l e d )   { _ a f t e r E x e c u t e _ ( ) ; }  
  
 	 	 	 i f   ( _ _ b l o c k _ w a i t i n g   & &   F X D _ C U R R E N T _ F U N C T I O N _ I D   = =   _ _ b l o c k _ n u m b e r )   { f x d W a i t . A c c u m u l a t e ( F X D _ C U R R E N T _ F U N C T I O N _ I D ) ; }  
 	 	 }  
 } ;  
  
 B l o c k C a l l s   * _ b l o c k s _ [ ] ;  
  
  
 / /   " O n c e   p e r   b a r "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 >  
 c l a s s   M D L _ O n c e P e r B a r :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   S y m b o l ;  
 	 T 2   P e r i o d ;  
 	 T 3   P a s s M a x T i m e s ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 s t r i n g   t o k e n s [ ] ;  
 	 i n t   p a s s e s [ ] ;  
 	 d a t e t i m e   o l d _ v a l u e s [ ] ;  
 	 d a t e t i m e   t i m e [ ] ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ O n c e P e r B a r ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 	 P a s s M a x T i m e s   =   ( i n t ) 1 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 / /   t h i s   i s   s t a t i c   f o r   s p e e d   r e a s o n s  
 	 	  
 	 	 b o o l   n e x t         =   f a l s e ;  
 	 	 s t r i n g   t o k e n   =   S y m b o l   +   I n t e g e r T o S t r i n g ( P e r i o d ) ;  
 	 	 i n t   i n d e x         =   A r r a y S e a r c h ( t o k e n s ,   t o k e n ) ;  
 	 	  
 	 	 i f   ( i n d e x   = =   - 1 )  
 	 	 {  
 	 	 	 i n d e x   =   A r r a y S i z e ( t o k e n s ) ;  
 	 	 	  
 	 	 	 A r r a y R e s i z e ( t o k e n s ,   i n d e x   +   1 ) ;  
 	 	 	 A r r a y R e s i z e ( o l d _ v a l u e s ,   i n d e x   +   1 ) ;  
 	 	 	 A r r a y R e s i z e ( p a s s e s ,   i n d e x   +   1 ) ;  
 	 	 	  
 	 	 	 t o k e n s [ i n d e x ]   =   t o k e n ;  
 	 	 	 p a s s e s [ i n d e x ]   =   0 ;  
 	 	 	 o l d _ v a l u e s [ i n d e x ]   =   0 ;  
 	 	 }  
 	 	  
 	 	 i f   ( P a s s M a x T i m e s   >   0 )  
 	 	 {  
 	 	 	 C o p y T i m e ( S y m b o l ,   P e r i o d ,   1 ,   1 ,   t i m e ) ;  
 	 	 	 d a t e t i m e   n e w _ v a l u e   =   t i m e [ 0 ] ;  
 	 	  
 	 	 	 i f   ( n e w _ v a l u e   >   o l d _ v a l u e s [ i n d e x ] )  
 	 	 	 {  
 	 	 	 	 p a s s e s [ i n d e x ] + + ;  
 	 	  
 	 	 	 	 i f   ( p a s s e s [ i n d e x ]   > =   P a s s M a x T i m e s )  
 	 	 	 	 {  
 	 	 	 	 	 o l d _ v a l u e s [ i n d e x ]     =   n e w _ v a l u e ;  
 	 	 	 	 	 p a s s e s [ i n d e x ]   =   0 ;  
 	 	 	 	 }  
 	 	  
 	 	 	 	 n e x t   =   t r u e ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 i f   ( n e x t )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " M A C D   D i v e r g e n c e   ( B e a r i s h ) "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 >  
 c l a s s   M D L _ m a c d D i v B e a r :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   S y m b o l ;  
 	 T 2   f a s t E M A ;  
 	 T 3   s l o w E M A ;  
 	 T 4   s i g n a l S M A ;  
 	 T 5   m a c d T h r e s h o l d ;  
 	 T 6   P e r i o d ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d a t e t i m e   B a r T i m e ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ m a c d D i v B e a r ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 f a s t E M A   =   ( i n t ) 1 2 ;  
 	 	 s l o w E M A   =   ( i n t ) 2 6 ;  
 	 	 s i g n a l S M A   =   ( i n t ) 9 ;  
 	 	 m a c d T h r e s h o l d   =   ( d o u b l e ) 0 . 0 0 0 3 ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 d o u b l e   m a c d [ ] ;   A r r a y R e s i z e ( m a c d , 0 ) ;  
 	 	 i n t   o f f s e t 1   =   0 ,   o f f s e t 2   =   0 ;  
 	 	 d o u b l e   p e a k 1   =   0 ,   p e a k 2   =   0 ;  
 	 	 b o o l   d r a w I t   =   f a l s e ;  
 	 	 d o u b l e   m a c d 0   =   0 ;  
 	 	 i n t   d e p t h   =   0 ;  
 	 	 i n t   i   =   0 ,   j   =   0 ;  
 	 	  
 	 	 i f   ( B a r T i m e   <   ( i n t ) i T i m e ( S y m b o l ,   P e r i o d ,   1 ) )  
 	 	 {  
 	 	 	 B a r T i m e   =   ( i n t ) i T i m e ( S y m b o l ,   P e r i o d ,   1 ) ;  
 	 	  
 	 	 	 / /   L o a d i n g   i n i t i a l   d a t a  
 	 	 	 f o r   ( i   =   0 ;   i   < =   5 ;   i + + )  
 	 	 	 {  
 	 	 	 	 A r r a y R e s i z e ( m a c d , A r r a y S i z e ( m a c d ) + 1 ) ;  
 	 	 	 	 m a c d [ i ]   =   i M A C D ( S y m b o l ,   P e r i o d ,   f a s t E M A ,   s l o w E M A ,   s i g n a l S M A ,   P R I C E _ C L O S E ,   0 ,   i ) ;  
 	 	 	 }  
 	 	  
 	 	 	 / /   W e   a r e   o n   m a c d   p e a k   n o w ?  
 	 	 	 i f   (  
 	 	 	 	       m a c d [ 1 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 2 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 3 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 4 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 1 ]   <   m a c d [ 2 ]  
 	 	 	 	 & &   m a c d [ 3 ]   <   m a c d [ 2 ]  
 	 	 	 	 & &   m a c d [ 4 ]   <   m a c d [ 2 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 / /   L o c a t e   p r i c e   p e a k   v a l u e   a n d   i t ' s   o f f s e t  
 	 	 	 	 f o r   ( i   =   0 ;   i   < =   1 5 ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       i H i g h ( S y m b o l ,   P e r i o d ,   i )   >   i H i g h ( S y m b o l ,   P e r i o d ,   i + 1 )  
 	 	 	 	 	 	 & &   i H i g h ( S y m b o l ,   P e r i o d ,   i )   >   i H i g h ( S y m b o l ,   P e r i o d ,   i + 2 )  
 	 	 	 	 	 	 & &   i H i g h ( S y m b o l ,   P e r i o d ,   i )   >   i H i g h ( S y m b o l ,   P e r i o d ,   i + 3 )  
 	 	 	 	 	 	 & &   i H i g h ( S y m b o l ,   P e r i o d ,   i )   >   i H i g h ( S y m b o l ,   P e r i o d ,   i + 4 )  
 	 	 	 	 	 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p e a k 2       =   i H i g h ( S y m b o l ,   P e r i o d ,   i ) ;  
 	 	 	 	 	 	 o f f s e t 2   =   i ;  
 	 	  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	  
 	 	 	 	 / /   L o c a t e   p r e v i o u s   m a c d   p e a k / s  
 	 	 	 	 f o r   ( i   =   6 ;   i   < =   i B a r s ( S y m b o l ,   P e r i o d ) ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 A r r a y R e s i z e ( m a c d ,   A r r a y S i z e ( m a c d ) + 1 ) ;  
 	 	 	 	 	 m a c d [ i ]   =   i M A C D ( S y m b o l ,   P e r i o d ,   f a s t E M A ,   s l o w E M A ,   s i g n a l S M A ,   P R I C E _ C L O S E ,   0 ,   i ) ;  
 	 	  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       i   >   1 0  
 	 	 	 	 	 	 & &   m a c d [ i ]   >   m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 1 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 2 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 3 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 4 ]   >   m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i ]   <   m a c d [ i - 2 ]  
 	 	 	 	 	 	 & &   m a c d [ i - 1 ]   <   m a c d [ i - 2 ]  
 	 	 	 	 	 	 & &   m a c d [ i - 2 ]   >   m a c d [ i - 3 ]  
 	 	 	 	 	 	 & &   m a c d [ i - 2 ]   >   m a c d [ i - 4 ]  
 	 	 	 	 	 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( m a c d 0   = =   0   | |   ( m a c d [ i - 2 ]   >   m a c d 0   & &   d e p t h   > =   1 ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 m a c d 0   =   m a c d [ i - 2 ] ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 	 e l s e  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 	 }  
 	 	  
 	 	 	 	 	 	 d e p t h + + ;  
 	 	  
 	 	 	 	 	 	 / /   L o c a t e   p r e v i o u s   p r i c e   p e a k   v a l u e   a n d   i t ' s   o f f s e t  
 	 	 	 	 	 	 f o r   ( j   =   i - 4 ;   j   < =   i + 1 5 ;   j + + )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	 	       i H i g h ( S y m b o l ,   P e r i o d , j )   >   i H i g h ( S y m b o l ,   P e r i o d ,   j + 1 )  
 	 	 	 	 	 	 	 	 & &   i H i g h ( S y m b o l ,   P e r i o d , j )   >   i H i g h ( S y m b o l ,   P e r i o d ,   j + 2 )  
 	 	 	 	 	 	 	 	 & &   i H i g h ( S y m b o l ,   P e r i o d , j )   >   i H i g h ( S y m b o l ,   P e r i o d ,   j + 3 )  
 	 	 	 	 	 	 	 	 & &   i H i g h ( S y m b o l ,   P e r i o d , j )   >   i H i g h ( S y m b o l ,   P e r i o d ,   j + 4 )  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 p e a k 1       =   i H i g h ( S y m b o l ,   P e r i o d ,   j ) ;  
 	 	 	 	 	 	 	 	 o f f s e t 1   =   j ;  
 	 	  
 	 	 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
 	 	  
 	 	 	 	 	 	 / /   C h e c k   i f   t h e r e   i s   a   d i v e r g e n c e  
 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	       d e p t h   < =   1 8  
 	 	 	 	 	 	 	 & &   ( ( m a c d [ i - 2 ]   >   m a c d [ 2 ]   & &   p e a k 1   <   p e a k 2 )   | |   ( m a c d [ i - 2 ]   <   m a c d [ 2 ]   & &   p e a k 1   >   p e a k 2 ) )  
 	 	 	 	 	 	 )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 d r a w I t   =   t r u e ;  
 	 	  
 	 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( d r a w I t   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 / /   D r a w   d i v e r g e n c e   l i n e  
 	 	 	 	 s t r i n g   l a b e l   =   " m a c d D i v e r g e n c e B e a r i s h "   +   ( s t r i n g ) T i m e C u r r e n t ( ) ;  
 	 	  
 	 	 	 	 O b j e c t C r e a t e ( 0 ,   l a b e l ,   O B J _ T R E N D ,   0 ,   i T i m e ( S y m b o l ,   P e r i o d ,   o f f s e t 1 ) ,   i H i g h ( S y m b o l ,   P e r i o d ,   o f f s e t 1 ) ,   i T i m e ( S y m b o l ,   P e r i o d ,   o f f s e t 2 ) ,   i H i g h ( S y m b o l ,   P e r i o d ,   o f f s e t 2 ) ,   0 ,   0 ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   l a b e l ,   O B J P R O P _ S T Y L E ,   S T Y L E _ S O L I D ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   l a b e l ,   O B J P R O P _ C O L O R ,   c l r D a r k G r a y ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   l a b e l ,   O B J P R O P _ R A Y ,   0 ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 i f   ( d r a w I t   = =   t r u e )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " M A C D   D i v e r g e n c e   ( B u l l i s h ) "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 >  
 c l a s s   M D L _ m a c d D i v B u l l :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   S y m b o l ;  
 	 T 2   f a s t E M A ;  
 	 T 3   s l o w E M A ;  
 	 T 4   s i g n a l S M A ;  
 	 T 5   m a c d T h r e s h o l d ;  
 	 T 6   P e r i o d ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d a t e t i m e   B a r T i m e ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ m a c d D i v B u l l ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 f a s t E M A   =   ( i n t ) 1 2 ;  
 	 	 s l o w E M A   =   ( i n t ) 2 6 ;  
 	 	 s i g n a l S M A   =   ( i n t ) 9 ;  
 	 	 m a c d T h r e s h o l d   =   ( d o u b l e ) 0 . 0 0 0 3 ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 d o u b l e   m a c d [ ] ;   A r r a y R e s i z e ( m a c d , 0 ) ;  
 	 	 i n t   o f f s e t 1   =   0 ,   o f f s e t 2   =   0 ;  
 	 	 d o u b l e   d i p 1   =   0 ,   d i p 2   =   0 ;  
 	 	 b o o l   d r a w I t   =   f a l s e ;  
 	 	 d o u b l e   m a c d 0   =   0 ;  
 	 	 i n t   d e p t h   =   0 ;  
 	 	 i n t   i   =   0 ,   j   =   0 ;  
 	 	  
 	 	 i f   ( B a r T i m e   <   ( i n t ) i T i m e ( S y m b o l ,   P e r i o d ,   1 ) )  
 	 	 {  
 	 	 	 B a r T i m e   =   ( i n t ) i T i m e ( S y m b o l ,   P e r i o d   ,   1 ) ;  
 	 	  
 	 	 	 / /   L o a d i n g   i n i t i a l   d a t a  
 	 	 	 f o r   ( i   =   0 ;   i   < =   5 ;   i + + )  
 	 	 	 {  
 	 	 	 	 A r r a y R e s i z e ( m a c d ,   A r r a y S i z e ( m a c d ) + 1 ) ;  
 	 	 	 	 m a c d [ i ]   =   i M A C D ( S y m b o l ,   P e r i o d ,   f a s t E M A ,   s l o w E M A ,   s i g n a l S M A ,   P R I C E _ C L O S E ,   0 ,   i ) ;  
 	 	 	 }  
 	 	  
 	 	 	 / /   W e   a r e   o n   m a c d   d i p   n o w ?  
 	 	 	 i f   (  
 	 	 	 	       m a c d [ 1 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 2 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 3 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 4 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 & &   m a c d [ 1 ]   >   m a c d [ 2 ]  
 	 	 	 	 & &   m a c d [ 3 ]   >   m a c d [ 2 ]  
 	 	 	 	 & &   m a c d [ 4 ]   >   m a c d [ 2 ]  
 	 	 	 	 )  
 	 	 	 {  
 	 	 	 	 / /   L o c a t e   p r i c e   d i p   v a l u e   a n d   i t ' s   o f f s e t  
 	 	 	 	 f o r   ( i   =   0 ;   i   < =   1 5 ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       i L o w ( S y m b o l ,   P e r i o d ,   i )   <   i L o w ( S y m b o l ,   P e r i o d ,   i + 1 )  
 	 	 	 	 	 	 & &   i L o w ( S y m b o l ,   P e r i o d ,   i )   <   i L o w ( S y m b o l ,   P e r i o d ,   i + 2 )  
 	 	 	 	 	 	 & &   i L o w ( S y m b o l ,   P e r i o d ,   i )   <   i L o w ( S y m b o l ,   P e r i o d ,   i + 3 )  
 	 	 	 	 	 	 & &   i L o w ( S y m b o l ,   P e r i o d ,   i )   <   i L o w ( S y m b o l ,   P e r i o d ,   i + 4 )  
 	 	 	 	 	 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 d i p 2         =   i L o w ( S y m b o l ,   P e r i o d ,   i ) ;  
 	 	 	 	 	 	 o f f s e t 2   =   i ;  
 	 	  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	  
 	 	 	 	 / /   L o c a t e   p r e v i o u s   m a c d   d i p / s  
 	 	 	 	 f o r   ( i   =   6 ;   i   < =   i B a r s ( S y m b o l ,   P e r i o d ) ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 A r r a y R e s i z e ( m a c d ,   A r r a y S i z e ( m a c d ) + 1 ) ;  
 	 	 	 	 	 m a c d [ i ] = i M A C D ( S y m b o l ,   P e r i o d ,   f a s t E M A ,   s l o w E M A ,   s i g n a l S M A ,   P R I C E _ C L O S E ,   0 ,   i ) ;  
 	 	  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       i   >   1 0  
 	 	 	 	 	 	 & &   m a c d [ i ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 1 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 2 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 3 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i - 4 ]   <   - 1 * m a c d T h r e s h o l d  
 	 	 	 	 	 	 & &   m a c d [ i ]   >   m a c d [ i - 2 ]  
 	 	 	 	 	 	 & &   m a c d [ i - 1 ]   >   m a c d [ i - 2 ]  
 	 	 	 	 	 	 & &   m a c d [ i - 2 ]   <   m a c d [ i - 3 ]  
 	 	 	 	 	 	 & &   m a c d [ i - 2 ]   <   m a c d [ i - 4 ]  
 	 	 	 	 	   )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( m a c d 0   = =   0   | |   ( m a c d [ i - 2 ]   <   m a c d 0   & &   d e p t h   > =   1 ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 m a c d 0   =   m a c d [ i - 2 ] ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 	 e l s e  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 	 }  
 	 	  
 	 	 	 	 	 	 d e p t h + + ;  
 	 	  
 	 	 	 	 	 	 / /   L o c a t e   p r e v i o u s   p r i c e   p e a k   v a l u e   a n d   i t ' s   o f f s e t  
 	 	 	 	 	 	 f o r   ( j   =   i - 4 ;   j   < =   i + 1 5 ;   j + + )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	 	       i L o w ( S y m b o l ,   P e r i o d ,   j )   <   i L o w ( S y m b o l ,   P e r i o d ,   j + 1 )  
 	 	 	 	 	 	 	 	 & &   i L o w ( S y m b o l ,   P e r i o d ,   j )   <   i L o w ( S y m b o l ,   P e r i o d ,   j + 2 )  
 	 	 	 	 	 	 	 	 & &   i L o w ( S y m b o l ,   P e r i o d ,   j )   <   i L o w ( S y m b o l ,   P e r i o d ,   j + 3 )  
 	 	 	 	 	 	 	 	 & &   i L o w ( S y m b o l ,   P e r i o d ,   j )   <   i L o w ( S y m b o l ,   P e r i o d ,   j + 4 )  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 d i p 1         =   i L o w ( S y m b o l ,   P e r i o d ,   j ) ;  
 	 	 	 	 	 	 	 	 o f f s e t 1   =   j ;  
 	 	  
 	 	 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
 	 	  
 	 	 	 	 	 	 / /   C h e c k   i f   t h e r e   i s   a   d i v e r g e n c e  
 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	       d e p t h   < =   1 8  
 	 	 	 	 	 	 	 & &   ( ( m a c d [ i - 2 ]   >   m a c d [ 2 ]   & &   d i p 1 < d i p 2 )   | |   ( m a c d [ i - 2 ]   <   m a c d [ 2 ]   & &   d i p 1   >   d i p 2 ) )  
 	 	 	 	 	 	 )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 d r a w I t   =   t r u e ;  
 	 	  
 	 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( d r a w I t   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 / /   D r a w   d i v e r g e n c e   l i n e  
 	 	 	 	 s t r i n g   l a b e l   =   " m a c d D i v e r g e n c e B u l l i s h "   +   ( s t r i n g ) T i m e C u r r e n t ( ) ;  
 	 	  
 	 	 	 	 O b j e c t C r e a t e ( 0 ,   l a b e l ,   O B J _ T R E N D ,   0 ,   i T i m e ( S y m b o l ,   P e r i o d ,   o f f s e t 1 ) ,   i L o w ( S y m b o l ,   P e r i o d ,   o f f s e t 1 ) ,   i T i m e ( S y m b o l ,   P e r i o d ,   o f f s e t 2 ) ,   i L o w ( S y m b o l ,   P e r i o d ,   o f f s e t 2 ) ,   0 ,   0 ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   l a b e l ,   O B J P R O P _ S T Y L E ,   S T Y L E _ S O L I D ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   l a b e l ,   O B J P R O P _ C O L O R ,   c l r D a r k G r a y ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   l a b e l ,   O B J P R O P _ R A Y ,   0 ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 i f   ( d r a w I t   = =   t r u e )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " C o n d i t i o n "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   _ T 1 _ , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   _ T 3 _ , t y p e n a m e   T 4 >  
 c l a s s   M D L _ C o n d i t i o n :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   L o ;   v i r t u a l   _ T 1 _   _ L o _ ( ) { r e t u r n ( _ T 1 _ ) 0 ; }  
 	 T 2   c o m p a r e ;  
 	 T 3   R o ;   v i r t u a l   _ T 3 _   _ R o _ ( ) { r e t u r n ( _ T 3 _ ) 0 ; }  
 	 T 4   c r o s s w i d t h ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ C o n d i t i o n ( )  
 	 {  
 	 	 c o m p a r e   =   ( s t r i n g ) " > " ;  
 	 	 c r o s s w i d t h   =   ( i n t ) 1 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 b o o l   o u t p u t 1   =   f a l s e ,   o u t p u t 2   =   f a l s e ;   / /   o u t p u t   1   a n d   o u t p u t   2  
 	 	 i n t   c r o s s o v e r   =   0 ;  
 	 	  
 	 	 i f   ( c o m p a r e   = =   " x > "   | |   c o m p a r e   = =   " x < " )   { c r o s s o v e r   =   1 ; }  
 	 	  
 	 	 f o r   ( i n t   i   =   0 ;   i   < =   c r o s s o v e r ;   i + + )  
 	 	 {  
 	 	 	 / /   i = 0   -   n o r m a l   p a s s ,   i = 1   -   c r o s s o v e r   p a s s  
 	 	  
 	 	 	 / /   L e f t   o p e r a n d   o f   t h e   c o n d i t i o n  
 	 	 	 F X D _ M O R E _ S H I F T   =   i   *   c r o s s w i d t h ;  
 	 	 	 _ T 1 _   l o   =   _ L o _ ( ) ;  
 	 	 	 i f   ( M a t h A b s ( l o )   = =   E M P T Y _ V A L U E )   { r e t u r n ; }  
 	 	  
 	 	 	 / /   R i g h t   o p e r a n d   o f   t h e   c o n d i t i o n  
 	 	 	 F X D _ M O R E _ S H I F T   =   i   *   c r o s s w i d t h ;  
 	 	 	 _ T 3 _   r o   =   _ R o _ ( ) ;  
 	 	 	 i f   ( M a t h A b s ( r o )   = =   E M P T Y _ V A L U E )   { r e t u r n ; }  
 	 	  
 	 	 	 / /   C o n d i t i o n s  
 	 	 	 i f   ( C o m p a r e V a l u e s ( c o m p a r e ,   l o ,   r o ) )  
 	 	 	 {  
 	 	 	 	 i f   ( i   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t 1   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   ( i   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t 2   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t 2   =   f a l s e ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( c r o s s o v e r   = =   1 )  
 	 	 	 {  
 	 	 	 	 i f   ( C o m p a r e V a l u e s ( c o m p a r e ,   r o ,   l o ) )  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( i   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 o u t p u t 2   =   t r u e ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( i   = =   1 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 o u t p u t 1   =   f a l s e ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 F X D _ M O R E _ S H I F T   =   0 ;   / /   r e s e t  
 	 	  
 	 	 	     i f   ( o u t p u t 1   = =   t r u e )   { _ c a l l b a c k _ ( 1 ) ; }  
 	 	 e l s e   i f   ( o u t p u t 2   = =   t r u e )   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " I n d i c a t o r   m o v e s   w i t h i n   l i m i t s "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   _ T 1 _ , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 , t y p e n a m e   T 7 , t y p e n a m e   _ T 7 _ , t y p e n a m e   T 8 , t y p e n a m e   T 9 , t y p e n a m e   T 1 0 , t y p e n a m e   _ T 1 0 _ >  
 c l a s s   M D L _ I n d i c a t o r W i t h i n L i m i t s :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   I n d i c a t o r ;   v i r t u a l   _ T 1 _   _ I n d i c a t o r _ ( ) { r e t u r n ( _ T 1 _ ) 0 ; }  
 	 T 2   C a n d l e s S h i f t ;  
 	 T 3   C a n d l e s P e r i o d ;  
 	 T 4   E x c e p t i o n C a n d l e s ;  
 	 T 5   U p p e r L e v e l M o d e ;  
 	 T 6   U p p e r L e v e l ;  
 	 T 7   d U p p e r L e v e l ;   v i r t u a l   _ T 7 _   _ d U p p e r L e v e l _ ( ) { r e t u r n ( _ T 7 _ ) 0 ; }  
 	 T 8   L o w e r L e v e l M o d e ;  
 	 T 9   L o w e r L e v e l ;  
 	 T 1 0   d L o w e r L e v e l ;   v i r t u a l   _ T 1 0 _   _ d L o w e r L e v e l _ ( ) { r e t u r n ( _ T 1 0 _ ) 0 ; }  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d a t e t i m e   l a s t _ b a r _ t i m e ;  
 	 b o o l   f a i l e d ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ I n d i c a t o r W i t h i n L i m i t s ( )  
 	 {  
 	 	 C a n d l e s S h i f t   =   ( i n t ) 1 ;  
 	 	 C a n d l e s P e r i o d   =   ( i n t ) 1 0 ;  
 	 	 E x c e p t i o n C a n d l e s   =   ( i n t ) 0 ;  
 	 	 U p p e r L e v e l M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 U p p e r L e v e l   =   ( d o u b l e ) 7 0 . 0 ;  
 	 	 L o w e r L e v e l M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 L o w e r L e v e l   =   ( d o u b l e ) 3 0 . 0 ;  
 	 	 / *   S t a t i c   P a r a m e t e r s   ( i n i t i a l   v a l u e )   * /  
 	 	 l a s t _ b a r _ t i m e   =     0 ;  
 	 	 f a i l e d   =     0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 i n t   l a s t _ c a n d l e     =   C a n d l e s S h i f t   +   C a n d l e s P e r i o d   -   1 ;  
 	 	 i n t   c o u n t _ t r u e       =   0 ;   / /   t h e   c o u n t   o f   c a n d l e s   w h e r e   t h e   v a l u e   i s   w i t h i n   t h e   l i m i t s  
 	 	 i n t   c o u n t _ f a i l e d   =   0 ;   / /   t h e   c o u n t   o f   c a n d l e s   w h e r e   t h e   v a l u e   i s   o u t s i d e   l i m i t s  
 	 	  
 	 	 / / i n t   c o u n t _ n e e d e d   =   C a n d l e s P e r i o d ;  
 	 	 / / i f   ( E x c e p t i o n C a n d l e s   >   0 )   {  
 	 	 / / 	 c o u n t _ n e e d e d   =   C a n d l e s P e r i o d   -   E x c e p t i o n C a n d l e s ;  
 	 	 / / }  
 	 	  
 	 	 f o r   ( i n t   i = C a n d l e s S h i f t ;   i < = l a s t _ c a n d l e ;   i + + )  
 	 	 {  
 	 	 	  
 	 	 	 / /   T O   D O :   i f   C a n d l e S h i f t = = 0   ( f i r s t   c a n d l e )   t o   c h e c k   o n l y   t h i s   c a n d l e   i f   o l d e r   c a n d l e s   a r e   c h e c k e d .  
 	 	 	 / /   d o n ' t   f o r g e t   t o   c h e c k   c a n d l e   0   t i m e  
 	 	 	 / /   d o n ' t   f o r g e t   t o   c h e c k   e x c e p t i o n s  
 	 	 	  
 	 	 	 / *  
 	 	 	 / /   t h i s   i s   t h e   c a c h e ,   b u t   I   r e m o v e d   i t   b e c a u s e   o f   s p e c i f i c   s i t u a t i o n  
 	 	 	 i f   ( i = = C a n d l e s S h i f t   & &   C a n d l e s S h i f t > 0 )   {  
 	 	 	 	 d a t e t i m e   c u r r e n t _ b a r _ t i m e = i T i m e ( C u r r e n t S y m b o l ( ) , C u r r e n t T i m e f r a m e ( ) , 0 ) ;  
 	 	 	 	 i f   ( l a s t _ b a r _ t i m e = = c u r r e n t _ b a r _ t i m e )   { b r e a k ; }   e l s e   { f a i l e d = f a l s e ; }  
 	 	 	 	 l a s t _ b a r _ t i m e = c u r r e n t _ b a r _ t i m e ;  
 	 	 	 }  
 	 	 	 * /  
 	 	  
 	 	 	 f a i l e d   =   f a l s e ;  
 	 	  
 	 	 	 F X D _ M O R E _ S H I F T   =   i ;  
 	 	 	 _ T 1 _   i v a l u e   =   _ I n d i c a t o r _ ( ) ;  
 	 	 	 F X D _ M O R E _ S H I F T   =   0 ;  
 	 	 	  
 	 	 	 d o u b l e   u p l e v e l   =   E M P T Y _ V A L U E ;  
 	 	 	 d o u b l e   d n l e v e l   =   - E M P T Y _ V A L U E ;  
 	 	 	  
 	 	 	 i f   ( U p p e r L e v e l M o d e   ! =   " " )  
 	 	 	 {  
 	 	 	 	 i f   ( U p p e r L e v e l M o d e   = =   " f i x e d " )  
 	 	 	 	 {  
 	 	 	 	 	 u p l e v e l   =   U p p e r L e v e l ;  
 	 	 	 	 }  
 	 	 	 	 e l s e    
 	 	 	 	 / / i f   ( U p p e r L e v e l M o d e   = =   " d y n a m i c " )  
 	 	 	 	 {  
 	 	 	 	 	 F X D _ M O R E _ S H I F T   =   i ;  
 	 	 	 	 	 u p l e v e l                 =   _ d U p p e r L e v e l _ ( ) ;  
 	 	 	 	 	 F X D _ M O R E _ S H I F T   =   0 ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( L o w e r L e v e l M o d e   ! =   " " )  
 	 	 	 {  
 	 	 	 	 i f   ( L o w e r L e v e l M o d e   = =   " f i x e d " )  
 	 	 	 	 {  
 	 	 	 	 	 d n l e v e l   =   L o w e r L e v e l ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 / / i f   ( L o w e r L e v e l M o d e = = " d y n a m i c " )  
 	 	 	 	 {  
 	 	 	 	 	 F X D _ M O R E _ S H I F T   =   i ;  
 	 	 	 	 	 d n l e v e l                 =   _ d L o w e r L e v e l _ ( ) ;  
 	 	 	 	 	 F X D _ M O R E _ S H I F T   =   0 ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	  
 	 	 	 / / - -   l e v e l s   a r e   i n v e r t e d ,   n o r m a l i z e   t h e m  
 	 	 	 i f   ( u p l e v e l   <   d n l e v e l )  
 	 	 	 {  
 	 	 	 	 d o u b l e   t m p l e v e l   =   u p l e v e l ;  
 	 	 	 	 u p l e v e l   =   d n l e v e l ;  
 	 	 	 	 d n l e v e l   =   t m p l e v e l ;  
 	 	 	 }  
 	 	 	  
 	 	 	 i f   ( i v a l u e   >   u p l e v e l   | |   i v a l u e   <   d n l e v e l )  
 	 	 	 {  
 	 	 	 	 f a i l e d   =   t r u e ;  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( f a i l e d   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 i f   ( E x c e p t i o n C a n d l e s   < =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 c o u n t _ f a i l e d + + ;  
 	 	  
 	 	 	 	 	 i f   ( c o u n t _ f a i l e d   >   E x c e p t i o n C a n d l e s )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	     	 / / i f   ( f a i l e d = = f a l s e )   {  
 	 	 	 / / 	 c o u n t _ t r u e + + ;  
 	 	 	 / / 	 i f   ( c o u n t _ t r u e   > =   c o u n t _ n e e d e d )   { b r e a k ; }  
 	 	 	 / / }  
 	 	 }  
 	 	  
 	 	 F X D _ M O R E _ S H I F T   =   0 ;  
 	 	  
 	 	 i f   ( f a i l e d   = =   f a l s e )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " A l e r t   m e s s a g e "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   _ T 3 _ , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   _ T 5 _ , t y p e n a m e   T 6 , t y p e n a m e   T 7 , t y p e n a m e   _ T 7 _ , t y p e n a m e   T 8 , t y p e n a m e   T 9 , t y p e n a m e   _ T 9 _ , t y p e n a m e   T 1 0 , t y p e n a m e   T 1 1 , t y p e n a m e   _ T 1 1 _ , t y p e n a m e   T 1 2 , t y p e n a m e   T 1 3 , t y p e n a m e   _ T 1 3 _ , t y p e n a m e   T 1 4 , t y p e n a m e   T 1 5 , t y p e n a m e   _ T 1 5 _ , t y p e n a m e   T 1 6 , t y p e n a m e   T 1 7 , t y p e n a m e   _ T 1 7 _ , t y p e n a m e   T 1 8 , t y p e n a m e   T 1 9 , t y p e n a m e   _ T 1 9 _ , t y p e n a m e   T 2 0 , t y p e n a m e   T 2 1 , t y p e n a m e   _ T 2 1 _ , t y p e n a m e   T 2 2 >  
 c l a s s   M D L _ A l e r t M e s s a g e A d v a n c e d :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   A l e r t T i t l e ;  
 	 T 2   A l e r t L a b e l 1 ;  
 	 T 3   A l e r t V a l u e 1 ;   v i r t u a l   _ T 3 _   _ A l e r t V a l u e 1 _ ( ) { r e t u r n ( _ T 3 _ ) 0 ; }  
 	 T 4   A l e r t L a b e l 2 ;  
 	 T 5   A l e r t V a l u e 2 ;   v i r t u a l   _ T 5 _   _ A l e r t V a l u e 2 _ ( ) { r e t u r n ( _ T 5 _ ) 0 ; }  
 	 T 6   A l e r t L a b e l 3 ;  
 	 T 7   A l e r t V a l u e 3 ;   v i r t u a l   _ T 7 _   _ A l e r t V a l u e 3 _ ( ) { r e t u r n ( _ T 7 _ ) 0 ; }  
 	 T 8   A l e r t L a b e l 4 ;  
 	 T 9   A l e r t V a l u e 4 ;   v i r t u a l   _ T 9 _   _ A l e r t V a l u e 4 _ ( ) { r e t u r n ( _ T 9 _ ) 0 ; }  
 	 T 1 0   A l e r t L a b e l 5 ;  
 	 T 1 1   A l e r t V a l u e 5 ;   v i r t u a l   _ T 1 1 _   _ A l e r t V a l u e 5 _ ( ) { r e t u r n ( _ T 1 1 _ ) 0 ; }  
 	 T 1 2   A l e r t L a b e l 6 ;  
 	 T 1 3   A l e r t V a l u e 6 ;   v i r t u a l   _ T 1 3 _   _ A l e r t V a l u e 6 _ ( ) { r e t u r n ( _ T 1 3 _ ) 0 ; }  
 	 T 1 4   A l e r t L a b e l 7 ;  
 	 T 1 5   A l e r t V a l u e 7 ;   v i r t u a l   _ T 1 5 _   _ A l e r t V a l u e 7 _ ( ) { r e t u r n ( _ T 1 5 _ ) 0 ; }  
 	 T 1 6   A l e r t L a b e l 8 ;  
 	 T 1 7   A l e r t V a l u e 8 ;   v i r t u a l   _ T 1 7 _   _ A l e r t V a l u e 8 _ ( ) { r e t u r n ( _ T 1 7 _ ) 0 ; }  
 	 T 1 8   A l e r t L a b e l 9 ;  
 	 T 1 9   A l e r t V a l u e 9 ;   v i r t u a l   _ T 1 9 _   _ A l e r t V a l u e 9 _ ( ) { r e t u r n ( _ T 1 9 _ ) 0 ; }  
 	 T 2 0   A l e r t L a b e l 1 0 ;  
 	 T 2 1   A l e r t V a l u e 1 0 ;   v i r t u a l   _ T 2 1 _   _ A l e r t V a l u e 1 0 _ ( ) { r e t u r n ( _ T 2 1 _ ) 0 ; }  
 	 T 2 2   A l s o S e n d N o t i f i c a t i o n ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ A l e r t M e s s a g e A d v a n c e d ( )  
 	 {  
 	 	 A l e r t T i t l e   =   ( s t r i n g ) " A l e r t   M e s s a g e " ;  
 	 	 A l e r t L a b e l 1   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 2   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 3   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 4   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 5   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 6   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 7   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 8   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 9   =   ( s t r i n g ) " " ;  
 	 	 A l e r t L a b e l 1 0   =   ( s t r i n g ) " " ;  
 	 	 A l s o S e n d N o t i f i c a t i o n   =   ( b o o l ) f a l s e ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 s t r i n g   t e x t   =   " " ;  
 	 	  
 	 	 i f   ( A l e r t L a b e l 1   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 1   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 1 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 2   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 2   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 2 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 3   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 3   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 3 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 4   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 4   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 4 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 5   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 5   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 5 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 6   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 6   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 6 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 7   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 7   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 7 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 8   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 8   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 8 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 9   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 9   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 9 _ ( ) ) ; }  
 	 	 i f   ( A l e r t L a b e l 1 0   ! =   " " )   { t e x t   + =   " \ n "   +   A l e r t L a b e l 1 0   +   " :   "   +   ( s t r i n g ) ( _ A l e r t V a l u e 1 0 _ ( ) ) ; }  
 	 	  
 	 	 t e x t   =   A l e r t T i t l e   +   " \ n "   +   t e x t ;  
 	 	  
 	 	 A l e r t ( t e x t ) ;  
 	 	  
 	 	 i f   ( A l s o S e n d N o t i f i c a t i o n = = t r u e )   S e n d N o t i f i c a t i o n ( t e x t ) ;  
 	 	  
 	 	 _ c a l l b a c k _ ( 1 ) ;  
 	 }  
 } ;  
  
 / /   " D r a w   A r r o w "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 , t y p e n a m e   _ T 6 _ , t y p e n a m e   T 7 , t y p e n a m e   _ T 7 _ , t y p e n a m e   T 8 , t y p e n a m e   T 9 , t y p e n a m e   T 1 0 , t y p e n a m e   T 1 1 , t y p e n a m e   T 1 2 , t y p e n a m e   T 1 3 , t y p e n a m e   T 1 4 , t y p e n a m e   T 1 5 , t y p e n a m e   T 1 6 , t y p e n a m e   T 1 7 >  
 c l a s s   M D L _ C h a r t D r a w A r r o w :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   O b j e c t P e r B a r ;  
 	 T 2   O b j e c t U p d a t e ;  
 	 T 3   O b j N a m e ;  
 	 T 4   O b j e c t T y p e ;  
 	 T 5   O b j A r r o w C o d e ;  
 	 T 6   O b j T i m e 1 ;   v i r t u a l   _ T 6 _   _ O b j T i m e 1 _ ( ) { r e t u r n ( _ T 6 _ ) 0 ; }  
 	 T 7   O b j P r i c e 1 ;   v i r t u a l   _ T 7 _   _ O b j P r i c e 1 _ ( ) { r e t u r n ( _ T 7 _ ) 0 ; }  
 	 T 8   O b j A n c h o r ;  
 	 T 9   O b j C o l o r ;  
 	 T 1 0   O b j S t y l e ;  
 	 T 1 1   O b j W i d t h ;  
 	 T 1 2   O b j B a c k ;  
 	 T 1 3   O b j S e l e c t a b l e ;  
 	 T 1 4   O b j S e l e c t e d ;  
 	 T 1 5   O b j H i d d e n ;  
 	 T 1 6   O b j Z o r d e r ;  
 	 T 1 7   O b j C h a r t S u b W i n d o w ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 i n t   c o u n t ;  
 	 d a t e t i m e   t i m e 0 ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ C h a r t D r a w A r r o w ( )  
 	 {  
 	 	 O b j e c t P e r B a r   =   ( b o o l ) t r u e ;  
 	 	 O b j e c t U p d a t e   =   ( b o o l ) t r u e ;  
 	 	 O b j N a m e   =   ( s t r i n g ) " " ;  
 	 	 O b j e c t T y p e   =   ( E N U M _ O B J E C T ) O B J _ A R R O W _ U P ;  
 	 	 O b j A r r o w C o d e   =   ( i n t ) 5 8 ;  
 	 	 O b j A n c h o r   =   ( i n t ) A N C H O R _ T O P ;  
 	 	 O b j C o l o r   =   ( c o l o r ) c l r D e e p P i n k ;  
 	 	 O b j S t y l e   =   ( E N U M _ L I N E _ S T Y L E ) S T Y L E _ S O L I D ;  
 	 	 O b j W i d t h   =   ( i n t ) 1 ;  
 	 	 O b j B a c k   =   ( b o o l ) f a l s e ;  
 	 	 O b j S e l e c t a b l e   =   ( b o o l ) t r u e ;  
 	 	 O b j S e l e c t e d   =   ( b o o l ) f a l s e ;  
 	 	 O b j H i d d e n   =   ( b o o l ) f a l s e ;  
 	 	 O b j Z o r d e r   =   ( i n t ) 0 ;  
 	 	 O b j C h a r t S u b W i n d o w   =   ( s t r i n g ) " " ;  
 	 	 / *   S t a t i c   P a r a m e t e r s   ( i n i t i a l   v a l u e )   * /  
 	 	 c o u n t   =     0 ;  
 	 	 t i m e 0   =     0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 s t r i n g   O b j N a m e P r e f i x   =   " f x d _ a r r o w _ " ;  
 	 	 l o n g   O b j C h a r t I D             =   0 ;  
 	 	 i n t   s u b w i n d o w _ i d           =   W i n d o w F i n d V i s i b l e ( O b j C h a r t I D ,   O b j C h a r t S u b W i n d o w ) ;  
 	 	  
 	 	 i f   ( s u b w i n d o w _ i d   > =   0 )  
 	 	 {  
 	 	 	 s t r i n g   n a m e               =   " " ;  
 	 	 	 s t r i n g   n a m e _ b a s e     =   " " ;  
 	 	 	 b o o l   g e t _ n e w _ n a m e   =   f a l s e ;  
 	 	 	 b o o l   d o _ u p d a t e         =   t r u e ;  
 	 	  
 	 	 	 i f   ( O b j e c t P e r B a r   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 d a t e t i m e   t i m e   =   i T i m e ( S y m b o l ( ) , 0 , 1 ) ;  
 	 	  
 	 	 	 	 i f   ( t i m e 0   <   t i m e )  
 	 	 	 	 {  
 	 	 	 	 	 t i m e 0                 =   t i m e ;  
 	 	 	 	 	 g e t _ n e w _ n a m e   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( O b j e c t U p d a t e   = =   f a l s e )   { d o _ u p d a t e   =   f a l s e ; }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   ( O b j e c t U p d a t e   = =   f a l s e )   { g e t _ n e w _ n a m e   =   t r u e ; }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( d o _ u p d a t e )  
 	 	 	 {  
 	 	 	 	 i f   ( O b j N a m e   ! =   " " )   { n a m e _ b a s e   =   O b j N a m e ; }   e l s e   { n a m e _ b a s e   =   O b j N a m e P r e f i x   +   _ _ b l o c k _ u s e r _ n u m b e r   +   " _ " ; }  
 	 	  
 	 	 	 	 i f   ( g e t _ n e w _ n a m e   = =   f a l s e )  
 	 	 	 	 {  
 	 	 	 	 	 n a m e   =   n a m e _ b a s e   +   I n t e g e r T o S t r i n g ( c o u n t ) ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 w h i l e   ( t r u e )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 c o u n t + + ;  
 	 	 	 	 	 	 n a m e   =   n a m e _ b a s e   +   I n t e g e r T o S t r i n g ( c o u n t ) ;  
 	 	  
 	 	 	 	 	 	 i f   ( O b j e c t F i n d ( O b j C h a r t I D , n a m e )   <   0 )   { b r e a k ; }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	  
 	 	 	 	 i f   ( O b j N a m e   ! =   " "   & &   c o u n t   = =   0 )   { n a m e   =   O b j N a m e ; }  
 	 	  
 	 	 	 	 i f   ( O b j e c t F i n d ( O b j C h a r t I D , n a m e )   <   0   & &   ! O b j e c t C r e a t e ( O b j C h a r t I D , n a m e , ( E N U M _ O B J E C T ) O b j e c t T y p e , s u b w i n d o w _ i d , 0 , 0 ) )  
 	 	 	 	 {  
 	 	 	 	 	 P r i n t ( _ _ F U N C T I O N _ _ , " :   f a i l e d   t o   c r e a t e   a r r o w   o b j e c t !   E r r o r   c o d e   =   " , G e t L a s t E r r o r ( ) ) ;  
 	 	 	 	 }  
 	 	  
 	 	 	 	 i f   ( O b j e c t T y p e   = =   O B J _ A R R O W )   O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ A R R O W C O D E , O b j A r r o w C o d e ) ;  
 	 	  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ T I M E , 0 , ( l o n g ) _ O b j T i m e 1 _ ( ) ) ;  
 	 	 	 	 O b j e c t S e t D o u b l e ( O b j C h a r t I D , n a m e , O B J P R O P _ P R I C E , 0 , ( d o u b l e ) _ O b j P r i c e 1 _ ( ) ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ A N C H O R , O b j A n c h o r ) ;  
 	 	  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ S T Y L E , O b j S t y l e ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ C O L O R , O b j C o l o r ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ B A C K , O b j B a c k ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ W I D T H , O b j W i d t h ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ S E L E C T A B L E , O b j S e l e c t a b l e ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ S E L E C T E D , O b j S e l e c t e d ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ H I D D E N , O b j H i d d e n ) ;  
 	 	 	 	 O b j e c t S e t I n t e g e r ( O b j C h a r t I D , n a m e , O B J P R O P _ Z O R D E R , O b j Z o r d e r ) ;  
 	 	  
 	 	 	 	 C h a r t R e d r a w ( ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 _ c a l l b a c k _ ( 1 ) ;  
 	 }  
 } ;  
  
  
 / / - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 / /   " S t o c h a s t i c   O s c i l l a t o r "   m o d e l  
 c l a s s   M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 i n t   K p e r i o d ;  
 	 i n t   D p e r i o d ;  
 	 i n t   S l o w i n g ;  
 	 E N U M _ M A _ M E T H O D   M A m e t h o d ;  
 	 E N U M _ S T O _ P R I C E   P r i c e F i e l d ;  
 	 i n t   M o d e ;  
 	 s t r i n g   S y m b o l ;  
 	 E N U M _ T I M E F R A M E S   P e r i o d ;  
 	 i n t   S h i f t ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c ( )  
 	 {  
 	 	 K p e r i o d   =   ( i n t ) 5 ;  
 	 	 D p e r i o d   =   ( i n t ) 3 ;  
 	 	 S l o w i n g   =   ( i n t ) 3 ;  
 	 	 M A m e t h o d   =   ( E N U M _ M A _ M E T H O D ) M O D E _ S M A ;  
 	 	 P r i c e F i e l d   =   ( E N U M _ S T O _ P R I C E ) S T O _ L O W H I G H ;  
 	 	 M o d e   =   ( i n t ) 0 ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 	 S h i f t   =   ( i n t ) 0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d o u b l e   _ e x e c u t e _ ( )  
 	 {  
 	 	 r e t u r n   i S t o c h a s t i c ( S y m b o l ,   P e r i o d ,   K p e r i o d ,   D p e r i o d ,   S l o w i n g ,   M A m e t h o d ,   P r i c e F i e l d ,   M o d e ,   S h i f t   +   F X D _ M O R E _ S H I F T ) ;  
 	 }  
 } ;  
  
 / /   " N u m e r i c "   m o d e l  
 c l a s s   M D L I C _ v a l u e _ v a l u e  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 d o u b l e   V a l u e ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ v a l u e _ v a l u e ( )  
 	 {  
 	 	 V a l u e   =   ( d o u b l e ) 1 . 0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d o u b l e   _ e x e c u t e _ ( )  
 	 {  
 	 	 r e t u r n   V a l u e ;  
 	 }  
 } ;  
  
 / /   " T i m e "   m o d e l  
 c l a s s   M D L I C _ v a l u e _ t i m e  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 i n t   M o d e T i m e ;  
 	 i n t   T i m e S o u r c e ;  
 	 s t r i n g   T i m e S t a m p ;  
 	 i n t   T i m e C a n d l e I D ;  
 	 s t r i n g   T i m e M a r k e t ;  
 	 E N U M _ T I M E F R A M E S   T i m e C a n d l e T i m e f r a m e ;  
 	 i n t   T i m e C o m p o n e n t Y e a r ;  
 	 i n t   T i m e C o m p o n e n t M o n t h ;  
 	 d o u b l e   T i m e C o m p o n e n t D a y ;  
 	 d o u b l e   T i m e C o m p o n e n t H o u r ;  
 	 d o u b l e   T i m e C o m p o n e n t M i n u t e ;  
 	 i n t   T i m e C o m p o n e n t S e c o n d ;  
 	 d a t e t i m e   T i m e V a l u e ;  
 	 i n t   M o d e T i m e S h i f t ;  
 	 i n t   T i m e S h i f t Y e a r s ;  
 	 i n t   T i m e S h i f t M o n t h s ;  
 	 i n t   T i m e S h i f t W e e k s ;  
 	 d o u b l e   T i m e S h i f t D a y s ;  
 	 d o u b l e   T i m e S h i f t H o u r s ;  
 	 d o u b l e   T i m e S h i f t M i n u t e s ;  
 	 i n t   T i m e S h i f t S e c o n d s ;  
 	 b o o l   T i m e S k i p W e e k d a y s ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d a t e t i m e   r e t v a l ;  
 	 d a t e t i m e   r e t v a l 0 ;  
 	 d a t e t i m e   T i m e [ ] ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ v a l u e _ t i m e ( )  
 	 {  
 	 	 M o d e T i m e   =   ( i n t ) 0 ;  
 	 	 T i m e S o u r c e   =   ( i n t ) 0 ;  
 	 	 T i m e S t a m p   =   ( s t r i n g ) " 0 0 : 0 0 " ;  
 	 	 T i m e C a n d l e I D   =   ( i n t ) 1 ;  
 	 	 T i m e M a r k e t   =   ( s t r i n g ) " " ;  
 	 	 T i m e C a n d l e T i m e f r a m e   =   ( E N U M _ T I M E F R A M E S ) 0 ;  
 	 	 T i m e C o m p o n e n t Y e a r   =   ( i n t ) 0 ;  
 	 	 T i m e C o m p o n e n t M o n t h   =   ( i n t ) 0 ;  
 	 	 T i m e C o m p o n e n t D a y   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e C o m p o n e n t H o u r   =   ( d o u b l e ) 1 2 . 0 ;  
 	 	 T i m e C o m p o n e n t M i n u t e   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e C o m p o n e n t S e c o n d   =   ( i n t ) 0 ;  
 	 	 T i m e V a l u e   =   ( d a t e t i m e ) 0 ;  
 	 	 M o d e T i m e S h i f t   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t Y e a r s   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t M o n t h s   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t W e e k s   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t D a y s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e S h i f t H o u r s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e S h i f t M i n u t e s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e S h i f t S e c o n d s   =   ( i n t ) 0 ;  
 	 	 T i m e S k i p W e e k d a y s   =   ( b o o l ) f a l s e ;  
 	 	 / *   S t a t i c   P a r a m e t e r s   ( i n i t i a l   v a l u e )   * /  
 	 	 r e t v a l   =     0 ;  
 	 	 r e t v a l 0   =     0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d a t e t i m e   _ e x e c u t e _ ( )  
 	 {  
 	 	 / /   t h i s   i s   s t a t i c   f o r   s p e e d   r e a s o n s  
 	 	  
 	 	 i f   ( T i m e M a r k e t   = =   " " )   T i m e M a r k e t   =   S y m b o l ( ) ;  
 	 	  
 	 	 i f   ( M o d e T i m e   = =   0 )  
 	 	 {  
 	 	 	           i f   ( T i m e S o u r c e   = =   0 )   { r e t v a l   =   T i m e C u r r e n t ( ) ; }  
 	 	 	 e l s e   i f   ( T i m e S o u r c e   = =   1 )   { r e t v a l   =   T i m e L o c a l ( )   +   ( T i m e C u r r e n t ( )   -   T i m e L o c a l ( ) ) ; }  
 	 	 	 e l s e   i f   ( T i m e S o u r c e   = =   2 )   { r e t v a l   =   T i m e G M T ( )   +   ( T i m e C u r r e n t ( )   -   T i m e G M T ( ) ) ; }  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e   = =   1 )  
 	 	 {  
 	 	 	 r e t v a l     =   S t r i n g T o T i m e ( T i m e S t a m p ) ;  
 	 	 	 r e t v a l 0   =   r e t v a l ;  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e = = 2 )  
 	 	 {  
 	 	 	 r e t v a l   =   T i m e F r o m C o m p o n e n t s ( T i m e S o u r c e ,   T i m e C o m p o n e n t Y e a r ,   T i m e C o m p o n e n t M o n t h ,   T i m e C o m p o n e n t D a y ,   T i m e C o m p o n e n t H o u r ,   T i m e C o m p o n e n t M i n u t e ,   T i m e C o m p o n e n t S e c o n d ) ;  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e   = =   3 )  
 	 	 {  
 	 	 	 A r r a y S e t A s S e r i e s ( T i m e , t r u e ) ;  
 	 	 	 C o p y T i m e ( T i m e M a r k e t , T i m e C a n d l e T i m e f r a m e , T i m e C a n d l e I D , 1 , T i m e ) ;  
 	 	 	 r e t v a l   =   T i m e [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e   = =   4 )  
 	 	 {  
 	 	 	 r e t v a l   =   T i m e V a l u e ;  
 	 	 }  
 	 	  
 	 	 i f   ( M o d e T i m e S h i f t   >   0 )  
 	 	 {  
 	 	 	 i n t   s h   =   1 ;  
 	 	  
 	 	 	 i f   ( M o d e T i m e S h i f t   = =   1 )   { s h   =   - 1 ; }  
 	 	  
 	 	 	 i f   ( T i m e S h i f t Y e a r s   >   0   | |   T i m e S h i f t M o n t h s   >   0 )  
 	 	 	 {  
 	 	 	 	 i n t   y e a r   =   0 ,   m o n t h   =   0 ,   w e e k   =   0 ,   d a y   =   0 ,   h o u r   =   0 ,   m i n u t e   =   0 ,   s e c o n d   =   0 ;  
 	 	  
 	 	 	 	 i f   ( M o d e T i m e   = =   3 )  
 	 	 	 	 {  
 	 	 	 	 	 y e a r       =   T i m e C o m p o n e n t Y e a r ;  
 	 	 	 	 	 m o n t h     =   T i m e C o m p o n e n t Y e a r ;  
 	 	 	 	 	 d a y         =   ( i n t ) M a t h F l o o r ( T i m e C o m p o n e n t D a y ) ;  
 	 	 	 	 	 h o u r       =   ( i n t ) ( M a t h F l o o r ( T i m e C o m p o n e n t H o u r )   +   ( 2 4   *   ( T i m e C o m p o n e n t D a y   -   M a t h F l o o r ( T i m e C o m p o n e n t D a y ) ) ) ) ;  
 	 	 	 	 	 m i n u t e   =   ( i n t ) ( M a t h F l o o r ( T i m e C o m p o n e n t M i n u t e )   +   ( 6 0   *   ( T i m e C o m p o n e n t H o u r   -   M a t h F l o o r ( T i m e C o m p o n e n t H o u r ) ) ) ) ;  
 	 	 	 	 	 s e c o n d   =   ( i n t ) ( T i m e C o m p o n e n t S e c o n d   +   ( 6 0   *   ( T i m e C o m p o n e n t M i n u t e   -   M a t h F l o o r ( T i m e C o m p o n e n t M i n u t e ) ) ) ) ;  
 	 	 	 	 }  
 	 	 	 	 e l s e   {  
 	 	 	 	 	 y e a r       =   T i m e Y e a r ( r e t v a l ) ;  
 	 	 	 	 	 m o n t h     =   T i m e M o n t h ( r e t v a l ) ;  
 	 	 	 	 	 d a y         =   T i m e D a y ( r e t v a l ) ;  
 	 	 	 	 	 h o u r       =   T i m e H o u r ( r e t v a l ) ;  
 	 	 	 	 	 m i n u t e   =   T i m e M i n u t e ( r e t v a l ) ;  
 	 	 	 	 	 s e c o n d   =   T i m e S e c o n d s ( r e t v a l ) ;  
 	 	 	 	 }  
 	 	  
 	 	 	 	 y e a r     =   y e a r   +   T i m e S h i f t Y e a r s   *   s h ;  
 	 	 	 	 m o n t h   =   m o n t h   +   T i m e S h i f t M o n t h s   *   s h ;  
 	 	  
 	 	 	 	 i f   ( m o n t h   <   0 )   { m o n t h   =   1 2   -   m o n t h ; }  
 	 	 	 	 e l s e   i f   ( m o n t h   >   1 2 )   { m o n t h   =   m o n t h   -   1 2 ; }  
 	 	  
 	 	 	 	 r e t v a l   =   S t r i n g T o T i m e ( I n t e g e r T o S t r i n g ( y e a r ) + " . " + I n t e g e r T o S t r i n g ( m o n t h ) + " . " + I n t e g e r T o S t r i n g ( d a y ) + "   " + I n t e g e r T o S t r i n g ( h o u r ) + " : " + I n t e g e r T o S t r i n g ( m i n u t e ) + " : " + I n t e g e r T o S t r i n g ( s e c o n d ) ) ;  
 	 	 	 }  
 	 	  
 	 	 	 r e t v a l   =   r e t v a l   +   ( s h   *   ( ( 6 0 4 8 0 0   *   T i m e S h i f t W e e k s )   +   S e c o n d s F r o m C o m p o n e n t s ( T i m e S h i f t D a y s ,   T i m e S h i f t H o u r s ,   T i m e S h i f t M i n u t e s ,   T i m e S h i f t S e c o n d s ) ) ) ;  
 	 	  
 	 	 	 i f   ( T i m e S k i p W e e k d a y s   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 i n t   w e e k d a y   =   T i m e D a y O f W e e k ( r e t v a l ) ;  
 	 	  
 	 	 	 	 i f   ( s h   >   0 )   {   / /   f o r w a r d  
 	 	 	 	 	           i f   ( w e e k d a y   = =   0 )   { r e t v a l   =   r e t v a l   +   8 6 4 0 0 ; }  
 	 	 	 	 	 e l s e   i f   ( w e e k d a y   = =   6 )   { r e t v a l   =   r e t v a l   +   1 7 2 8 0 0 ; }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( s h   <   0 )   {   / /   b a c k  
 	 	 	 	 	           i f   ( w e e k d a y   = =   0 )   { r e t v a l   =   r e t v a l   -   1 7 2 8 0 0 ; }  
 	 	 	 	 	 e l s e   i f   ( w e e k d a y   = =   6 )   { r e t v a l   =   r e t v a l   -   8 6 4 0 0 ; }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	  
 	 	 r e t u r n   ( d a t e t i m e ) r e t v a l ;  
 	 }  
 } ;  
  
 / /   " C a n d l e "   m o d e l  
 c l a s s   M D L I C _ c a n d l e s _ c a n d l e s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 s t r i n g   i O H L C ;  
 	 s t r i n g   M o d e C a n d l e F i n d B y ;  
 	 i n t   C a n d l e I D ;  
 	 s t r i n g   T i m e S t a m p ;  
 	 s t r i n g   S y m b o l ;  
 	 E N U M _ T I M E F R A M E S   P e r i o d ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ c a n d l e s _ c a n d l e s ( )  
 	 {  
 	 	 i O H L C   =   ( s t r i n g ) " i C l o s e " ;  
 	 	 M o d e C a n d l e F i n d B y   =   ( s t r i n g ) " i d " ;  
 	 	 C a n d l e I D   =   ( i n t ) 0 ;  
 	 	 T i m e S t a m p   =   ( s t r i n g ) " 0 0 : 0 0 " ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d o u b l e   _ e x e c u t e _ ( )  
 	 {  
 	 	 i n t   d i g i t s   =   ( i n t ) S y m b o l I n f o I n t e g e r ( S y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 	 	  
 	 	 d o u b l e   O [ ] ;  
 	 	 d o u b l e   H [ ] ;  
 	 	 d o u b l e   L [ ] ;  
 	 	 d o u b l e   C [ ] ;    
 	 	 l o n g   c T i c k V o l u m e [ ] ;  
 	 	 l o n g   c R e a l V o l u m e [ ] ;  
 	 	 d a t e t i m e   T [ ] ;  
 	 	  
 	 	 d o u b l e   r e t v a l   =   E M P T Y _ V A L U E ;  
 	 	  
 	 	 / /   c a n d l e ' s   i d   w i l l   c h a n g e ,   s o   w e   d o n ' t   w a n t   t o   m e s s   w i t h   t h e   v a r i a b l e   C a n d l e I D ;  
 	 	 i n t   c I D   =   C a n d l e I D ;  
 	 	  
 	 	 i f   ( M o d e C a n d l e F i n d B y   = =   " t i m e " )  
 	 	 {  
 	 	 	 c I D   =   i C a n d l e I D ( S y m b o l ,   P e r i o d ,   S t r i n g T o T i m e E x ( T i m e S t a m p ,   " s e r v e r " ) ) ;  
 	 	 }  
 	 	  
 	 	 c I D   =   c I D   +   F X D _ M O R E _ S H I F T ;  
 	 	  
 	 	 / / - -   t h e   c o m m o n   l e v e l s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( i O H L C   = =   " i O p e n " )  
 	 	 {  
 	 	 	 i f   ( C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1 )   r e t v a l   =   O [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i H i g h " )  
 	 	 {  
 	 	 	 i f   ( C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1 )   r e t v a l   =   H [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i L o w " )  
 	 	 {  
 	 	 	 i f   ( C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1 )   r e t v a l   =   L [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i C l o s e " )  
 	 	 {  
 	 	 	 i f   ( C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1 )   r e t v a l   =   C [ 0 ] ;  
 	 	 }  
 	 	  
 	 	 / / - -   n o n - p r i c e   v a l u e s     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 e l s e   i f   ( i O H L C   = =   " i V o l u m e "   | |   i O H L C   = =   " i T i c k V o l u m e " )  
 	 	 {  
 	 	 	 i f   ( C o p y T i c k V o l u m e ( S y m b o l , P e r i o d , c I D , 1 , c T i c k V o l u m e )   >   - 1 )   r e t v a l   =   ( d o u b l e ) c T i c k V o l u m e [ 0 ] ;  
 	 	 	  
 	 	 	 r e t u r n   r e t v a l ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i R e a l V o l u m e " )  
 	 	 {  
 	 	 	 i f   ( C o p y R e a l V o l u m e ( S y m b o l , P e r i o d , c I D , 1 , c R e a l V o l u m e )   >   - 1 )   r e t v a l   =   ( d o u b l e ) c R e a l V o l u m e [ 0 ] ;  
 	 	 	  
 	 	 	 r e t u r n   r e t v a l ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i T i m e " )  
 	 	 {  
 	 	 	 i f   ( C o p y T i m e ( S y m b o l , P e r i o d , c I D , 1 , T )   >   - 1 )   r e t v a l   =   ( d o u b l e ) T [ 0 ] ;  
 	 	 	  
 	 	 	 r e t u r n   r e t v a l ;  
 	 	 }  
 	 	  
 	 	 / / - -   s i m p l e   c a l c u l a t i o n s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 e l s e   i f   ( i O H L C   = =   " i M e d i a n " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( ( L [ 0 ] + H [ 0 ] ) / 2 ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i T y p i c a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( ( L [ 0 ] + H [ 0 ] + C [ 0 ] ) / 3 ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i A v e r a g e " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( ( L [ 0 ] + H [ 0 ] + C [ 0 ] + C [ 0 ] ) / 4 ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 / / - -   m o r e   c o m p l e x   l e v e l s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 e l s e   i f   ( i O H L C = = " i T o t a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( M a t h A b s ( H [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B o d y " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( M a t h A b s ( C [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i U p p e r W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( C [ 0 ]   >   O [ 0 ] )   ?   t o P i p s ( M a t h A b s ( H [ 0 ] - C [ 0 ] ) , S y m b o l )   :   t o P i p s ( M a t h A b s ( H [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B o t t o m W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( C [ 0 ]   >   O [ 0 ] )   ?   t o P i p s ( M a t h A b s ( O [ 0 ] - L [ 0 ] ) , S y m b o l )   :   t o P i p s ( M a t h A b s ( C [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i G a p " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D + 1 , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( M a t h A b s ( O [ 0 ] - C [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l T o t a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l B o d y " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( C [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l U p p e r W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - C [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l B o t t o m W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( O [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r T o t a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r B o d y " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( O [ 0 ] - C [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r U p p e r W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r B o t t o m W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( C [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 r e t u r n   N o r m a l i z e D o u b l e ( r e t v a l ,   d i g i t s ) ;  
 	 }  
 } ;  
  
  
 / / - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 / /   B l o c k   2   ( O n c e   p e r   b a r )  
 c l a s s   B l o c k 0 :   p u b l i c   M D L _ O n c e P e r B a r < s t r i n g , E N U M _ T I M E F R A M E S , i n t >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 0 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   0 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 2 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 2 ]   =   { 1 , 2 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 1 ] . r u n ( 0 ) ;  
 	 	 	 _ b l o c k s _ [ 2 ] . r u n ( 0 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 }  
 } ;  
  
 / /   B l o c k   3   ( M A C D   D i v e r g e n c e   ( B e a r i s h ) )  
 c l a s s   B l o c k 1 :   p u b l i c   M D L _ m a c d D i v B e a r < s t r i n g , i n t , i n t , i n t , d o u b l e , E N U M _ T I M E F R A M E S >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 1 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   1 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 3 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 4 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 4 ] . r u n ( 1 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 f a s t E M A   =   ( i n t ) _ e x t e r n s : : i n p 3 _ f a s t E M A ;  
 	 	 s l o w E M A   =   ( i n t ) _ e x t e r n s : : i n p 3 _ s l o w E M A ;  
 	 	 s i g n a l S M A   =   ( i n t ) _ e x t e r n s : : i n p 3 _ s i g n a l S M A ;  
 	 	 m a c d T h r e s h o l d   =   ( d o u b l e ) _ e x t e r n s : : i n p 3 _ m a c d T h r e s h o l d ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) _ e x t e r n s : : i n p 3 _ P e r i o d ;  
 	 }  
 } ;  
  
 / /   B l o c k   4   ( M A C D   D i v e r g e n c e   ( B u l l i s h ) )  
 c l a s s   B l o c k 2 :   p u b l i c   M D L _ m a c d D i v B u l l < s t r i n g , i n t , i n t , i n t , d o u b l e , E N U M _ T I M E F R A M E S >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 2 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   2 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 4 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 3 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 3 ] . r u n ( 2 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 f a s t E M A   =   ( i n t ) _ e x t e r n s : : i n p 4 _ f a s t E M A ;  
 	 	 s l o w E M A   =   ( i n t ) _ e x t e r n s : : i n p 4 _ s l o w E M A ;  
 	 	 s i g n a l S M A   =   ( i n t ) _ e x t e r n s : : i n p 4 _ s i g n a l S M A ;  
 	 	 m a c d T h r e s h o l d   =   ( d o u b l e ) _ e x t e r n s : : i n p 4 _ m a c d T h r e s h o l d ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) _ e x t e r n s : : i n p 4 _ P e r i o d ;  
 	 }  
 } ;  
  
 / /   B l o c k   5   ( C o n d i t i o n )  
 c l a s s   B l o c k 3 :   p u b l i c   M D L _ C o n d i t i o n < M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c , d o u b l e , s t r i n g , M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c , d o u b l e , i n t >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 3 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   3 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 5 " ;  
  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 5 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 L o . S h i f t   =   1 ;  
 	 	 R o . S h i f t   =   1 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ L o _ ( )   {  
 	 	 L o . K p e r i o d   =   _ e x t e r n s : : i n p 5 _ L o _ K p e r i o d ;  
 	 	 L o . D p e r i o d   =   _ e x t e r n s : : i n p 5 _ L o _ D p e r i o d ;  
 	 	 L o . S l o w i n g   =   _ e x t e r n s : : i n p 5 _ L o _ S l o w i n g ;  
 	 	 L o . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 L o . P r i c e F i e l d   =   S T O _ L O W H I G H ;  
 	 	 L o . M o d e   =   _ e x t e r n s : : i n p 5 _ L o _ M o d e ;  
 	 	 L o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 L o . P e r i o d   =   _ e x t e r n s : : i n p 5 _ L o _ P e r i o d ;  
  
 	 	 r e t u r n   L o . _ e x e c u t e _ ( ) ;  
 	 }  
 	 v i r t u a l   d o u b l e   _ R o _ ( )   {  
 	 	 R o . K p e r i o d   =   _ e x t e r n s : : i n p 5 _ R o _ K p e r i o d ;  
 	 	 R o . D p e r i o d   =   _ e x t e r n s : : i n p 5 _ R o _ D p e r i o d ;  
 	 	 R o . S l o w i n g   =   _ e x t e r n s : : i n p 5 _ R o _ S l o w i n g ;  
 	 	 R o . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 R o . P r i c e F i e l d   =   S T O _ L O W H I G H ;  
 	 	 R o . M o d e   =   _ e x t e r n s : : i n p 5 _ R o _ M o d e ;  
 	 	 R o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 R o . P e r i o d   =   _ e x t e r n s : : i n p 5 _ R o _ P e r i o d ;  
  
 	 	 r e t u r n   R o . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 5 ] . r u n ( 3 ) ;  
 	 	 }  
 	 }  
 } ;  
  
 / /   B l o c k   6   ( C o n d i t i o n )  
 c l a s s   B l o c k 4 :   p u b l i c   M D L _ C o n d i t i o n < M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c , d o u b l e , s t r i n g , M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c , d o u b l e , i n t >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 4 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   4 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 6 " ;  
  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 6 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 L o . S h i f t   =   1 ;  
 	 	 R o . S h i f t   =   1 ;  
 	 	 / /   B l o c k   i n p u t   p a r a m e t e r s  
 	 	 c o m p a r e   =   " < " ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ L o _ ( )   {  
 	 	 L o . K p e r i o d   =   _ e x t e r n s : : i n p 6 _ L o _ K p e r i o d ;  
 	 	 L o . D p e r i o d   =   _ e x t e r n s : : i n p 6 _ L o _ D p e r i o d ;  
 	 	 L o . S l o w i n g   =   _ e x t e r n s : : i n p 6 _ L o _ S l o w i n g ;  
 	 	 L o . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 L o . P r i c e F i e l d   =   S T O _ L O W H I G H ;  
 	 	 L o . M o d e   =   _ e x t e r n s : : i n p 6 _ L o _ M o d e ;  
 	 	 L o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 L o . P e r i o d   =   _ e x t e r n s : : i n p 6 _ L o _ P e r i o d ;  
  
 	 	 r e t u r n   L o . _ e x e c u t e _ ( ) ;  
 	 }  
 	 v i r t u a l   d o u b l e   _ R o _ ( )   {  
 	 	 R o . K p e r i o d   =   _ e x t e r n s : : i n p 6 _ R o _ K p e r i o d ;  
 	 	 R o . D p e r i o d   =   _ e x t e r n s : : i n p 6 _ R o _ D p e r i o d ;  
 	 	 R o . S l o w i n g   =   _ e x t e r n s : : i n p 6 _ R o _ S l o w i n g ;  
 	 	 R o . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 R o . P r i c e F i e l d   =   S T O _ L O W H I G H ;  
 	 	 R o . M o d e   =   _ e x t e r n s : : i n p 6 _ R o _ M o d e ;  
 	 	 R o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 R o . P e r i o d   =   _ e x t e r n s : : i n p 6 _ R o _ P e r i o d ;  
  
 	 	 r e t u r n   R o . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 6 ] . r u n ( 4 ) ;  
 	 	 }  
 	 }  
 } ;  
  
 / /   B l o c k   9   ( I n d i c a t o r   m o v e s   w i t h i n   l i m i t s )  
 c l a s s   B l o c k 5 :   p u b l i c   M D L _ I n d i c a t o r W i t h i n L i m i t s < M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c , d o u b l e , i n t , i n t , i n t , s t r i n g , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 5 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   5 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 9 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 7 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 I n d i c a t o r . S h i f t   =   1 ;  
 	 	 d U p p e r L e v e l . V a l u e   =   7 0 . 0 ;  
 	 	 d L o w e r L e v e l . V a l u e   =   3 0 . 0 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ I n d i c a t o r _ ( )   {  
 	 	 I n d i c a t o r . K p e r i o d   =   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ K p e r i o d ;  
 	 	 I n d i c a t o r . D p e r i o d   =   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ D p e r i o d ;  
 	 	 I n d i c a t o r . S l o w i n g   =   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ S l o w i n g ;  
 	 	 I n d i c a t o r . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 I n d i c a t o r . P r i c e F i e l d   =   S T O _ L O W H I G H ;  
 	 	 I n d i c a t o r . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 I n d i c a t o r . P e r i o d   =   _ e x t e r n s : : i n p 9 _ I n d i c a t o r _ P e r i o d ;  
  
 	 	 r e t u r n   I n d i c a t o r . _ e x e c u t e _ ( ) ;  
 	 }  
 	 v i r t u a l   d o u b l e   _ d U p p e r L e v e l _ ( )   { r e t u r n   d U p p e r L e v e l . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d L o w e r L e v e l _ ( )   { r e t u r n   d L o w e r L e v e l . _ e x e c u t e _ ( ) ; }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 7 ] . r u n ( 5 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 C a n d l e s S h i f t   =   ( i n t ) _ e x t e r n s : : i n p 9 _ C a n d l e s S h i f t ;  
 	 	 C a n d l e s P e r i o d   =   ( i n t ) _ e x t e r n s : : i n p 9 _ C a n d l e s P e r i o d ;  
 	 	 E x c e p t i o n C a n d l e s   =   ( i n t ) _ e x t e r n s : : i n p 9 _ E x c e p t i o n C a n d l e s ;  
 	 	 U p p e r L e v e l   =   ( d o u b l e ) _ e x t e r n s : : i n p 9 _ U p p e r L e v e l ;  
 	 	 L o w e r L e v e l   =   ( d o u b l e ) _ e x t e r n s : : i n p 9 _ L o w e r L e v e l ;  
 	 }  
 } ;  
  
 / /   B l o c k   1 0   ( I n d i c a t o r   m o v e s   w i t h i n   l i m i t s )  
 c l a s s   B l o c k 6 :   p u b l i c   M D L _ I n d i c a t o r W i t h i n L i m i t s < M D L I C _ i n d i c a t o r s _ i S t o c h a s t i c , d o u b l e , i n t , i n t , i n t , s t r i n g , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 6 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   6 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 0 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 8 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 I n d i c a t o r . S h i f t   =   1 ;  
 	 	 d U p p e r L e v e l . V a l u e   =   7 0 . 0 ;  
 	 	 d L o w e r L e v e l . V a l u e   =   3 0 . 0 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ I n d i c a t o r _ ( )   {  
 	 	 I n d i c a t o r . K p e r i o d   =   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ K p e r i o d ;  
 	 	 I n d i c a t o r . D p e r i o d   =   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ D p e r i o d ;  
 	 	 I n d i c a t o r . S l o w i n g   =   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ S l o w i n g ;  
 	 	 I n d i c a t o r . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 I n d i c a t o r . P r i c e F i e l d   =   S T O _ L O W H I G H ;  
 	 	 I n d i c a t o r . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 I n d i c a t o r . P e r i o d   =   _ e x t e r n s : : i n p 1 0 _ I n d i c a t o r _ P e r i o d ;  
  
 	 	 r e t u r n   I n d i c a t o r . _ e x e c u t e _ ( ) ;  
 	 }  
 	 v i r t u a l   d o u b l e   _ d U p p e r L e v e l _ ( )   { r e t u r n   d U p p e r L e v e l . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d L o w e r L e v e l _ ( )   { r e t u r n   d L o w e r L e v e l . _ e x e c u t e _ ( ) ; }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 8 ] . r u n ( 6 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 C a n d l e s S h i f t   =   ( i n t ) _ e x t e r n s : : i n p 1 0 _ C a n d l e s S h i f t ;  
 	 	 C a n d l e s P e r i o d   =   ( i n t ) _ e x t e r n s : : i n p 1 0 _ C a n d l e s P e r i o d ;  
 	 	 E x c e p t i o n C a n d l e s   =   ( i n t ) _ e x t e r n s : : i n p 1 0 _ E x c e p t i o n C a n d l e s ;  
 	 	 U p p e r L e v e l   =   ( d o u b l e ) _ e x t e r n s : : i n p 1 0 _ U p p e r L e v e l ;  
 	 	 L o w e r L e v e l   =   ( d o u b l e ) _ e x t e r n s : : i n p 1 0 _ L o w e r L e v e l ;  
 	 }  
 } ;  
  
 / /   B l o c k   1 4   ( A l e r t   m e s s a g e )  
 c l a s s   B l o c k 7 :   p u b l i c   M D L _ A l e r t M e s s a g e A d v a n c e d < s t r i n g , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , b o o l >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 7 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   7 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 4 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 9 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 A l e r t V a l u e 1 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 2 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 3 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 4 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 5 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 6 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 7 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 8 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 9 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 1 0 . V a l u e   =   0 . 0 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 1 _ ( )   { r e t u r n   A l e r t V a l u e 1 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 2 _ ( )   { r e t u r n   A l e r t V a l u e 2 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 3 _ ( )   { r e t u r n   A l e r t V a l u e 3 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 4 _ ( )   { r e t u r n   A l e r t V a l u e 4 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 5 _ ( )   { r e t u r n   A l e r t V a l u e 5 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 6 _ ( )   { r e t u r n   A l e r t V a l u e 6 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 7 _ ( )   { r e t u r n   A l e r t V a l u e 7 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 8 _ ( )   { r e t u r n   A l e r t V a l u e 8 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 9 _ ( )   { r e t u r n   A l e r t V a l u e 9 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 1 0 _ ( )   { r e t u r n   A l e r t V a l u e 1 0 . _ e x e c u t e _ ( ) ; }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 9 ] . r u n ( 7 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 A l e r t T i t l e   =   ( s t r i n g ) _ e x t e r n s : : i n p 1 4 _ A l e r t T i t l e ;  
 	 	 A l s o S e n d N o t i f i c a t i o n   =   ( b o o l ) _ e x t e r n s : : i n p 1 4 _ A l s o S e n d N o t i f i c a t i o n ;  
 	 }  
 } ;  
  
 / /   B l o c k   1 5   ( A l e r t   m e s s a g e )  
 c l a s s   B l o c k 8 :   p u b l i c   M D L _ A l e r t M e s s a g e A d v a n c e d < s t r i n g , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , M D L I C _ v a l u e _ v a l u e , d o u b l e , b o o l >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 8 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   8 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 5 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 1 0 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 A l e r t V a l u e 1 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 2 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 3 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 4 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 5 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 6 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 7 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 8 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 9 . V a l u e   =   0 . 0 ;  
 	 	 A l e r t V a l u e 1 0 . V a l u e   =   0 . 0 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 1 _ ( )   { r e t u r n   A l e r t V a l u e 1 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 2 _ ( )   { r e t u r n   A l e r t V a l u e 2 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 3 _ ( )   { r e t u r n   A l e r t V a l u e 3 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 4 _ ( )   { r e t u r n   A l e r t V a l u e 4 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 5 _ ( )   { r e t u r n   A l e r t V a l u e 5 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 6 _ ( )   { r e t u r n   A l e r t V a l u e 6 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 7 _ ( )   { r e t u r n   A l e r t V a l u e 7 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 8 _ ( )   { r e t u r n   A l e r t V a l u e 8 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 9 _ ( )   { r e t u r n   A l e r t V a l u e 9 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ A l e r t V a l u e 1 0 _ ( )   { r e t u r n   A l e r t V a l u e 1 0 . _ e x e c u t e _ ( ) ; }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 1 0 ] . r u n ( 8 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 A l e r t T i t l e   =   ( s t r i n g ) _ e x t e r n s : : i n p 1 5 _ A l e r t T i t l e ;  
 	 	 A l s o S e n d N o t i f i c a t i o n   =   ( b o o l ) _ e x t e r n s : : i n p 1 5 _ A l s o S e n d N o t i f i c a t i o n ;  
 	 }  
 } ;  
  
 / /   B l o c k   1 6   ( D r a w   A r r o w )  
 c l a s s   B l o c k 9 :   p u b l i c   M D L _ C h a r t D r a w A r r o w < b o o l , b o o l , s t r i n g , E N U M _ O B J E C T , i n t , M D L I C _ v a l u e _ t i m e , d a t e t i m e , M D L I C _ c a n d l e s _ c a n d l e s , d o u b l e , i n t , c o l o r , E N U M _ L I N E _ S T Y L E , i n t , b o o l , b o o l , b o o l , b o o l , i n t , s t r i n g >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 9 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   9 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 6 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 O b j T i m e 1 . M o d e T i m e   =   3 ;  
 	 	 O b j P r i c e 1 . i O H L C   =   " i L o w " ;  
 	 	 O b j P r i c e 1 . C a n d l e I D   =   1 ;  
 	 	 O b j P r i c e 1 . T i m e S t a m p   =   " " ;  
 	 	 / /   B l o c k   i n p u t   p a r a m e t e r s  
 	 	 O b j W i d t h   =   5 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d a t e t i m e   _ O b j T i m e 1 _ ( )   { r e t u r n   O b j T i m e 1 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ O b j P r i c e 1 _ ( )   {  
 	 	 O b j P r i c e 1 . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 O b j P r i c e 1 . P e r i o d   =   C u r r e n t T i m e f r a m e ( ) ;  
  
 	 	 r e t u r n   O b j P r i c e 1 . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 O b j e c t T y p e   =   ( E N U M _ O B J E C T ) O B J _ A R R O W _ U P ;  
 	 	 O b j A n c h o r   =   ( i n t ) A N C H O R _ T O P ;  
 	 	 O b j C o l o r   =   ( c o l o r ) c l r M e d i u m T u r q u o i s e ;  
 	 	 O b j S t y l e   =   ( E N U M _ L I N E _ S T Y L E ) S T Y L E _ S O L I D ;  
 	 }  
 } ;  
  
 / /   B l o c k   1 7   ( D r a w   A r r o w )  
 c l a s s   B l o c k 1 0 :   p u b l i c   M D L _ C h a r t D r a w A r r o w < b o o l , b o o l , s t r i n g , E N U M _ O B J E C T , i n t , M D L I C _ v a l u e _ t i m e , d a t e t i m e , M D L I C _ c a n d l e s _ c a n d l e s , d o u b l e , i n t , c o l o r , E N U M _ L I N E _ S T Y L E , i n t , b o o l , b o o l , b o o l , b o o l , i n t , s t r i n g >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 1 0 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   1 0 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 7 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 O b j T i m e 1 . M o d e T i m e   =   3 ;  
 	 	 O b j P r i c e 1 . i O H L C   =   " i H i g h " ;  
 	 	 O b j P r i c e 1 . C a n d l e I D   =   1 ;  
 	 	 O b j P r i c e 1 . T i m e S t a m p   =   " " ;  
 	 	 / /   B l o c k   i n p u t   p a r a m e t e r s  
 	 	 O b j W i d t h   =   5 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d a t e t i m e   _ O b j T i m e 1 _ ( )   { r e t u r n   O b j T i m e 1 . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ O b j P r i c e 1 _ ( )   {  
 	 	 O b j P r i c e 1 . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 O b j P r i c e 1 . P e r i o d   =   C u r r e n t T i m e f r a m e ( ) ;  
  
 	 	 r e t u r n   O b j P r i c e 1 . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
  
 	 	 O b j e c t T y p e   =   ( E N U M _ O B J E C T ) O B J _ A R R O W _ D O W N ;  
 	 	 O b j A n c h o r   =   ( i n t ) A N C H O R _ B O T T O M ;  
 	 	 O b j C o l o r   =   ( c o l o r ) c l r L i g h t C o r a l ;  
 	 	 O b j S t y l e   =   ( E N U M _ L I N E _ S T Y L E ) S T Y L E _ S O L I D ;  
 	 }  
 } ;  
  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                                                                                       F u n c t i o n s                                                                                                             |   / /  
 / /   |                                                                   S y s t e m   a n d   C u s t o m   f u n c t i o n s   u s e d   i n   t h e   p r o g r a m                                                                     |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
  
 d o u b l e   A c c o u n t B a l a n c e A t S t a r t ( )  
 {  
 	 / /   T h i s   f u n c t i o n   M U S T   b e   r u n   o n c e   a t   p o g r a m ' s   s t a r t  
 	 s t a t i c   d o u b l e   m e m o r y   =   0 ;  
  
 	 i f   ( m e m o r y   = =   0 )  
 	 {  
 	 	 m e m o r y   =   N o r m a l i z e D o u b l e ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ,   2 ) ;  
 	 }  
  
 	 r e t u r n   m e m o r y ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 i n t   A r r a y S e a r c h ( T   & a r r a y [ ] ,   T   v a l u e )  
 {  
 	 i n t   i n d e x   =   - 1 ;  
 	 i n t   s i z e     =   A r r a y S i z e ( a r r a y ) ;  
  
 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 {  
 	 	 i f   ( a r r a y [ i ]   = =   v a l u e )  
 	 	 {  
 	 	 	 i n d e x   =   i ;  
 	 	 	 b r e a k ;  
 	 	 }      
 	 }  
  
       r e t u r n   i n d e x ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 b o o l   A r r a y S t r i p K e y ( T   & a r r a y [ ] ,   i n t   k e y )  
 {  
 	 i n t   x         =   0 ;  
 	 i n t   s i z e   =   A r r a y S i z e ( a r r a y ) ;  
  
 	 f o r   ( i n t   i = 0 ;   i < s i z e ;   i + + )  
 	 {  
 	 	 i f   ( i   ! =   k e y )  
 	 	 {  
 	 	 	 a r r a y [ x ]   =   a r r a y [ i ] ;  
 	 	 	 x + + ;  
 	 	 }  
 	 }  
  
 	 i f   ( x   <   s i z e )  
 	 {  
 	 	 A r r a y R e s i z e ( a r r a y ,   x ) ;  
 	 	  
 	 	 r e t u r n   t r u e ;   / /   s t r i p p e d  
 	 }  
  
 	 r e t u r n   f a l s e ;   / /   n o t   s t r i p p e d  
 }  
  
 i n t   C h e c k F o r T r a d i n g E r r o r ( i n t   e r r o r _ c o d e = - 1 ,   s t r i n g   m s g _ p r e f i x = " " )  
 {  
       / /   r e t u r n   0   - >   n o   e r r o r  
       / /   r e t u r n   1   - >   o v e r c o m a b l e   e r r o r  
       / /   r e t u r n   2   - >   f a t a l   e r r o r  
        
       i n t   r e t v a l = 0 ;  
       s t a t i c   i n t   t r y o u t s = 0 ;  
        
       / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
       s w i t c h ( e r r o r _ c o d e )  
       {  
             / / - -   n o   e r r o r  
             c a s e   0 :  
                   r e t v a l = 0 ;  
                   b r e a k ;  
             / / - -   o v e r c o m a b l e   e r r o r s  
             c a s e   T R A D E _ R E T C O D E _ R E Q U O T E :  
             c a s e   T R A D E _ R E T C O D E _ R E J E C T :  
             c a s e   T R A D E _ R E T C O D E _ E R R O R :  
             c a s e   T R A D E _ R E T C O D E _ T I M E O U T :  
             c a s e   T R A D E _ R E T C O D E _ I N V A L I D _ V O L U M E :  
             c a s e   T R A D E _ R E T C O D E _ I N V A L I D _ P R I C E :  
             c a s e   T R A D E _ R E T C O D E _ I N V A L I D _ S T O P S :  
             c a s e   T R A D E _ R E T C O D E _ I N V A L I D _ E X P I R A T I O N :  
             c a s e   T R A D E _ R E T C O D E _ P R I C E _ C H A N G E D :  
             c a s e   T R A D E _ R E T C O D E _ P R I C E _ O F F :  
             c a s e   T R A D E _ R E T C O D E _ T O O _ M A N Y _ R E Q U E S T S :  
             c a s e   T R A D E _ R E T C O D E _ N O _ C H A N G E S :  
             c a s e   T R A D E _ R E T C O D E _ C O N N E C T I O N :  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             / / - -   c r i t i c a l   e r r o r s  
             d e f a u l t :  
                   r e t v a l = 2 ;  
                   b r e a k ;  
       }  
        
       i f   ( e r r o r _ c o d e   >   0 )  
       {  
             s t r i n g   m s g   =   " " ;  
             i f   ( r e t v a l   = =   1 )  
             {  
                   S t r i n g C o n c a t e n a t e ( m s g ,   m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g   i n   5   s e c o n d s . . " ) ;  
                   S l e e p ( 5 0 0 ) ;    
             }  
             e l s e   i f   ( r e t v a l   = =   2 )  
             {  
                   S t r i n g C o n c a t e n a t e ( m s g ,   m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) ) ;  
             }  
             P r i n t ( m s g ) ;  
       }  
        
       i f   ( r e t v a l = = 0 )  
       {  
             t r y o u t s = 0 ;  
       }  
       e l s e   i f   ( r e t v a l = = 1 )  
       {  
             t r y o u t s + + ;  
             i f   ( t r y o u t s > = 1 0 )  
             {  
                   t r y o u t s = 0 ;  
                   r e t v a l = 2 ;  
             }  
             e l s e  
             {  
                   P r i n t ( " r e t r y   # " + ( s t r i n g ) t r y o u t s + "   o f   1 0 " ) ;  
             }  
       }  
        
       r e t u r n ( r e t v a l ) ;  
 }  
  
 b o o l   C l o s e T r a d e ( u l o n g   t i c k e t ,   u l o n g   d e v i a t i o n   =   0 ,   c o l o r   c l r   =   c l r N O N E )  
 {  
 	 w h i l e ( t r u e )  
 	 {  
 	 	 b o o l   s u c c e s s   =   f a l s e ;  
  
 	 	 i f   ( ! P o s i t i o n S e l e c t B y T i c k e t ( t i c k e t ) )  
 	 	 {  
 	 	 	 r e t u r n   f a l s e ;  
 	 	 }  
  
 	 	 s t r i n g   s y m b o l   =   P o s i t i o n G e t S t r i n g ( P O S I T I O N _ S Y M B O L ) ;  
 	 	 l o n g   m a g i c         =   P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ M A G I C ) ;  
 	 	 d o u b l e   v o l u m e   =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ V O L U M E ) ;  
  
 	 	 / /   W i t h   s o m e   C F D   w e   c a n   o p e n   p o s i t i o n   w i t h   t h e   m a x   v o l u m e   m o r e   t h a n   o n c e ,  
 	 	 / /   s o   w e   g e t   a   p o s i t i o n   t h a t   h a s   v o l u m e   b i g g e r   t h a n   t h e   m a x i m u m .  
 	 	 / /   T h e n   w e   c a n n o t   c l o s e   t h a t   p o s i t i o n ,   b e c a u s e   t h e   v o l u m e   i s   t o o   h i g h .  
 	 	 / /   F o r   t h a t   r e a s o n   h e r e   w e   w i l l   c l o s e   i t   i n   p a r t s .  
 	 	 d o u b l e   m a x _ v o l u m e     =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ V O L U M E _ M A X ) ;  
 	 	 d o u b l e   p a r t _ v o l u m e   =   ( v o l u m e   >   m a x _ v o l u m e )   ?   m a x _ v o l u m e   :   v o l u m e ;  
  
 	 	 / / - -   c l o s e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 M q l T r a d e R e q u e s t   r e q u e s t ;  
 	 	 M q l T r a d e R e s u l t   r e s u l t ;  
 	 	 M q l T r a d e C h e c k R e s u l t   c h e c k _ r e s u l t ;  
 	 	 Z e r o M e m o r y ( r e q u e s t ) ;  
 	 	 Z e r o M e m o r y ( r e s u l t ) ;  
 	 	 Z e r o M e m o r y ( c h e c k _ r e s u l t ) ;  
  
 	 	 i f ( ( E N U M _ P O S I T I O N _ T Y P E ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E )   = =   P O S I T I O N _ T Y P E _ B U Y )  
 	 	 {  
 	 	 	 / / - - -   p r e p a r e   r e q u e s t   f o r   c l o s e   B U Y   p o s i t i o n  
 	 	 	 r e q u e s t . t y p e     =   O R D E R _ T Y P E _ S E L L ;  
 	 	 	 r e q u e s t . p r i c e   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 / / - - -   p r e p a r e   r e q u e s t   f o r   c l o s e   S E L L   p o s i t i o n  
 	 	 	 r e q u e s t . t y p e     =   O R D E R _ T Y P E _ B U Y ;  
 	 	 	 r e q u e s t . p r i c e   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 }  
  
 	 	 r e q u e s t . a c t i o n         =   T R A D E _ A C T I O N _ D E A L ;  
 	 	 r e q u e s t . s y m b o l         =   s y m b o l ;  
 	 	 r e q u e s t . v o l u m e         =   p a r t _ v o l u m e ;  
 	 	 r e q u e s t . m a g i c           =   m a g i c ;  
 	 	 r e q u e s t . d e v i a t i o n   =   ( i n t ) ( d e v i a t i o n   *   P i p V a l u e ( s y m b o l ) ) ;  
  
 	 	 / /   f o r   h e d g i n g   m o d e  
 	 	 r e q u e s t . p o s i t i o n     =   t i c k e t ;  
  
 	 	 / /   f i l l i n g   t y p e  
 	 	 i f   ( I s F i l l i n g T y p e A l l o w e d ( s y m b o l ,   S Y M B O L _ F I L L I N G _ F O K ) )  
 	 	 	 r e q u e s t . t y p e _ f i l l i n g   =   O R D E R _ F I L L I N G _ F O K ;  
 	 	 e l s e   i f   ( I s F i l l i n g T y p e A l l o w e d ( s y m b o l ,   S Y M B O L _ F I L L I N G _ I O C ) )  
 	 	 	 r e q u e s t . t y p e _ f i l l i n g   =   O R D E R _ F I L L I N G _ I O C ;  
 	 	 e l s e   i f   ( I s F i l l i n g T y p e A l l o w e d ( s y m b o l ,   O R D E R _ F I L L I N G _ R E T U R N ) )   / /   j u s t   i n   c a s e  
 	 	 	 r e q u e s t . t y p e _ f i l l i n g   =   O R D E R _ F I L L I N G _ R E T U R N ;  
 	 	 e l s e  
 	 	 	 r e q u e s t . t y p e _ f i l l i n g   =   O R D E R _ F I L L I N G _ R E T U R N ;  
  
 	 	 s u c c e s s   =   O r d e r S e n d ( r e q u e s t ,   r e s u l t ) ;  
  
 	 	 / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( ! s u c c e s s   | |   ( r e s u l t . r e t c o d e   ! =   T R A D E _ R E T C O D E _ D O N E   & &   r e s u l t . r e t c o d e   ! =   T R A D E _ R E T C O D E _ P L A C E D   & &   r e s u l t . r e t c o d e   ! =   T R A D E _ R E T C O D E _ D O N E _ P A R T I A L ) )  
 	 	 {  
 	 	 	 s t r i n g   e r r m s g p f x   =   " C l o s i n g   p o s i t i o n / t r a d e   e r r o r " ;  
  
 	 	 	 i n t   e r r a c t i o n   =   C h e c k F o r T r a d i n g E r r o r ( r e s u l t . r e t c o d e ,   e r r m s g p f x ) ;  
  
 	 	 	 s w i t c h ( e r r a c t i o n )  
 	 	 	 {  
 	 	 	 	 c a s e   0 :   b r e a k ;         / /   n o   e r r o r  
 	 	 	 	 c a s e   1 :   c o n t i n u e ;   / /   o v e r c o m a b l e   e r r o r  
 	 	 	 	 c a s e   2 :   b r e a k ;         / /   f a t a l   e r r o r  
 	 	 	 }  
  
 	 	 	 r e t u r n   f a l s e ;  
 	 	 }  
 	 	  
 	 	 / / - -   f i n i s h   w o r k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( r e s u l t . r e t c o d e   = =   T R A D E _ R E T C O D E _ D O N E   | |   r e s u l t . r e t c o d e   = =   T R A D E _ R E T C O D E _ P L A C E D )  
 	 	 {  
 	 	 	 / /   w e   a r e   c l o s i n g   t h e   p o s i t i o n   i n   p a r t s ?  
 	 	 	 i f   ( v o l u m e   ! =   p a r t _ v o l u m e )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;   / /   c o n t i n u e   t h e   " w h i l e "   l o o p ,   s o   t h a t   t h e   w h o l e   v o l u m e   c o u l d   b e   c l o s e d  
 	 	 	 }  
  
 	 	 	 w h i l e   ( t r u e )  
 	 	 	 {  
 	 	 	     	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )   | |   ! P o s i t i o n S e l e c t B y T i c k e t ( t i c k e t ) )  
 	 	 	 	 {  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
  
 	 	 	 	 S l e e p ( 1 0 ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( s u c c e s s   = =   t r u e )  
 	 	 {  
 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 	 {  
 	 	 	 	 V i r t u a l S t o p s D r i v e r ( " c l e a r " ,   t i c k e t ) ;  
 	 	 	 }  
  
 	 	 	 e x p i r a t i o n W o r k e r . R e m o v e E x p i r a t i o n ( t i c k e t ) ;  
 	 	 }  
 	 	  
 	 	 b r e a k ;  
 	 }  
 	  
 	 O n T r a d e ( ) ;  
  
 	 r e t u r n   t r u e ;  
 }  
  
 t e m p l a t e < t y p e n a m e   D T 1 ,   t y p e n a m e   D T 2 >  
 b o o l   C o m p a r e V a l u e s ( s t r i n g   s i g n ,   D T 1   v 1 ,   D T 2   v 2 )  
 {  
 	           i f   ( s i g n   = =   " > " )   r e t u r n ( v 1   >   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " < " )   r e t u r n ( v 1   <   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " > = " )   r e t u r n ( v 1   > =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " < = " )   r e t u r n ( v 1   < =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " = = " )   r e t u r n ( v 1   = =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " ! = " )   r e t u r n ( v 1   ! =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " x > " )   r e t u r n ( v 1   >   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " x < " )   r e t u r n ( v 1   <   v 2 ) ;  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 s t r i n g   C u r r e n t S y m b o l ( s t r i n g   s y m b o l   =   " " )  
 {  
       s t a t i c   s t r i n g   m e m o r y   =   " " ;  
  
 	 / /   S e t  
       i f   ( s y m b o l   ! =   " " )  
 	 {  
 	 	 m e m o r y   =   s y m b o l ;  
 	 }  
 	 / /   G e t  
 	 e l s e   i f   ( m e m o r y   = =   " " )  
 	 {  
 	 	 m e m o r y   =   S y m b o l ( ) ;  
 	 }  
  
       r e t u r n   m e m o r y ;  
 }  
  
 E N U M _ T I M E F R A M E S   C u r r e n t T i m e f r a m e ( E N U M _ T I M E F R A M E S   t f = - 1 )  
 {  
       s t a t i c   E N U M _ T I M E F R A M E S   m e m o r y = 0 ;  
       i f   ( t f > = 0 )   { m e m o r y = t f ; }  
       r e t u r n ( m e m o r y ) ;  
 }  
  
 d o u b l e   C u s t o m P o i n t ( s t r i n g   s y m b o l )  
 {  
 	 s t a t i c   s t r i n g   s y m b o l s [ ] ;  
 	 s t a t i c   d o u b l e   p o i n t s [ ] ;  
 	 s t a t i c   s t r i n g   l a s t _ s y m b o l   =   " - " ;  
 	 s t a t i c   d o u b l e   l a s t _ p o i n t     =   0 ;  
 	 s t a t i c   i n t   l a s t _ i                   =   0 ;  
 	 s t a t i c   i n t   s i z e                       =   0 ;  
  
 	 / / - -   v a r i a n t   A )   u s e   t h e   c a c h e   f o r   t h e   l a s t   u s e d   s y m b o l  
 	 i f   ( s y m b o l   = =   l a s t _ s y m b o l )  
 	 {  
 	 	 r e t u r n   l a s t _ p o i n t ;  
 	 }  
  
 	 / / - -   v a r i a n t   B )   s e a r c h   i n   t h e   a r r a y   c a c h e  
 	 i n t   i 	 	 	 =   l a s t _ i ;  
 	 i n t   s t a r t _ i 	 =   i ;  
 	 b o o l   f o u n d 	 =   f a l s e ;  
  
 	 i f   ( s i z e   >   0 )  
 	 {  
 	 	 w h i l e   ( t r u e )  
 	 	 {  
 	 	 	 i f   ( s y m b o l s [ i ]   = =   s y m b o l )  
 	 	 	 {  
 	 	 	 	 l a s t _ s y m b o l 	 =   s y m b o l ;  
 	 	 	 	 l a s t _ p o i n t 	 =   p o i n t s [ i ] ;  
 	 	 	 	 l a s t _ i 	 	 =   i ;  
  
 	 	 	 	 r e t u r n   l a s t _ p o i n t ;  
 	 	 	 }  
  
 	 	 	 i + + ;  
  
 	 	 	 i f   ( i   > =   s i z e )  
 	 	 	 {  
 	 	 	 	 i   =   0 ;  
 	 	 	 }  
 	 	 	 i f   ( i   = =   s t a r t _ i )   { b r e a k ; }  
 	 	 }  
 	 }  
  
 	 / / - -   v a r i a n t   C )   a d d   t h i s   s y m b o l   t o   t h e   c a c h e  
 	 i 	 	 =   s i z e ;  
 	 s i z e 	 =   s i z e   +   1 ;  
  
 	 A r r a y R e s i z e ( s y m b o l s ,   s i z e ) ;  
 	 A r r a y R e s i z e ( p o i n t s ,   s i z e ) ;  
  
 	 s y m b o l s [ i ] 	 =   s y m b o l ;  
 	 p o i n t s [ i ] 	 =   0 ;  
 	 l a s t _ s y m b o l 	 =   s y m b o l ;  
 	 l a s t _ i 	 	 =   i ;  
  
 	 / / - -   u n s e r i a l i z e   r u l e s   f r o m   F X D _ P O I N T _ F O R M A T _ R U L E S  
 	 s t r i n g   r u l e s [ ] ;  
 	 S t r i n g E x p l o d e ( " , " ,   P O I N T _ F O R M A T _ R U L E S ,   r u l e s ) ;  
  
 	 i n t   r u l e s _ c o u n t   =   A r r a y S i z e ( r u l e s ) ;  
  
 	 i f   ( r u l e s _ c o u n t   >   0 )  
 	 {  
 	 	 s t r i n g   r u l e [ ] ;  
  
 	 	 f o r   ( i n t   r   =   0 ;   r   <   r u l e s _ c o u n t ;   r + + )  
 	 	 {  
 	 	 	 S t r i n g E x p l o d e ( " = " ,   r u l e s [ r ] ,   r u l e ) ;  
  
 	 	 	 / / - -   a   s i n g l e   r u l e   m u s t   c o n t a i n   2   p a r t s ,   [ 0 ]   f r o m   a n d   [ 1 ]   t o  
 	 	 	 i f   ( A r r a y S i z e ( r u l e )   ! =   2 )   { c o n t i n u e ; }  
  
 	 	 	 d o u b l e   f r o m   =   S t r i n g T o D o u b l e ( r u l e [ 0 ] ) ;  
 	 	 	 d o u b l e   t o 	 =   S t r i n g T o D o u b l e ( r u l e [ 1 ] ) ;  
  
 	 	 	 / / - -   " t o "   m u s t   b e   a   p o s i t i v e   n u m b e r ,   d i f f e r e n t   t h a n   0  
 	 	 	 i f   ( t o   < =   0 )   { c o n t i n u e ; }  
  
 	 	 	 / / - -   " f r o m "   c a n   b e   a   n u m b e r   o r   a   s t r i n g  
 	 	 	 / /   a )   s t r i n g  
 	 	 	 i f   ( f r o m   = =   0   & &   S t r i n g L e n ( r u l e [ 0 ] )   >   0 )  
 	 	 	 {  
 	 	 	 	 s t r i n g   s _ f r o m   =   r u l e [ 0 ] ;  
 	 	 	 	 i n t   p o s               =   S t r i n g F i n d ( s _ f r o m ,   " ? " ) ;  
  
 	 	 	 	 i f   ( p o s   <   0 )   / /   ?   n o t   f o u n d  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( S t r i n g F i n d ( s y m b o l ,   s _ f r o m )   = =   0 )   { p o i n t s [ i ]   =   t o ; }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( p o s   = =   0 )   / /   ?   i s   t h e   f i r s t   s y m b o l   = >   m a t c h   t h e   s e c o n d   s y m b o l  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( S t r i n g F i n d ( s y m b o l ,   S t r i n g S u b s t r ( s _ f r o m ,   1 ) ,   3 )   = =   3 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p o i n t s [ i ]   =   t o ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( p o s   >   0 )   / /   ?   i s   t h e   s e c o n d   s y m b o l   = >   m a t c h   t h e   f i r s t   s y m b o l  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( S t r i n g F i n d ( s y m b o l ,   S t r i n g S u b s t r ( s _ f r o m ,   0 ,   p o s ) )   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p o i n t s [ i ]   =   t o ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 / /   b )   n u m b e r  
 	 	 	 i f   ( f r o m   = =   0 )   { c o n t i n u e ; }  
  
 	 	 	 i f   ( S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T )   = =   f r o m )  
 	 	 	 {  
 	 	 	 	 p o i n t s [ i ]   =   t o ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 i f   ( p o i n t s [ i ]   = =   0 )  
 	 {  
 	 	 p o i n t s [ i ]   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 	 }  
  
 	 l a s t _ p o i n t   =   p o i n t s [ i ] ;  
  
 	 r e t u r n   l a s t _ p o i n t ;  
 }  
  
 b o o l   D e l e t e O r d e r ( u l o n g   t i c k e t ,   c o l o r   a r r o w c o l o r = c l r N O N E )  
 {  
       w h i l e ( t r u e )  
       {  
             M q l T r a d e R e q u e s t   r e q u e s t ;  
             M q l T r a d e R e s u l t   r e s u l t ;  
             M q l T r a d e C h e c k R e s u l t   c h e c k _ r e s u l t ;  
             Z e r o M e m o r y ( r e q u e s t ) ;  
             Z e r o M e m o r y ( r e s u l t ) ;  
             Z e r o M e m o r y ( c h e c k _ r e s u l t ) ;  
        
             r e q u e s t . o r d e r = t i c k e t ;  
             r e q u e s t . a c t i o n = T R A D E _ A C T I O N _ R E M O V E ;  
             r e q u e s t . c o m m e n t = " P e n d i n g   o r d e r   c a n c e l e d " ;  
        
             i f   ( ! O r d e r C h e c k ( r e q u e s t , c h e c k _ r e s u l t ) )     {  
                   P r i n t ( " O r d e r C h e c k ( )   f a i l e d :   " + ( s t r i n g ) c h e c k _ r e s u l t . c o m m e n t + "   ( " + ( s t r i n g ) c h e c k _ r e s u l t . r e t c o d e + " ) " ) ;  
                   r e t u r n   f a l s e ;  
             }  
              
             b o o l   s u c c e s s   =   O r d e r S e n d ( r e q u e s t , r e s u l t ) ;  
              
             / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
             i f   ( ! s u c c e s s   | |   r e s u l t . r e t c o d e ! = T R A D E _ R E T C O D E _ D O N E )  
             {  
                   s t r i n g   e r r m s g p f x = " D e l e t e   o r d e r   e r r o r " ;  
                   i n t   e r r a c t i o n = C h e c k F o r T r a d i n g E r r o r ( r e s u l t . r e t c o d e ,   e r r m s g p f x ) ;  
                   s w i t c h ( e r r a c t i o n )  
                   {  
                         c a s e   0 :   b r e a k ;         / /   n o   e r r o r  
                         c a s e   1 :   c o n t i n u e ;   / /   o v e r c o m a b l e   e r r o r  
                         c a s e   2 :   b r e a k ;         / /   f a t a l   e r r o r  
                   }  
                   r e t u r n ( f a l s e ) ;  
             }  
              
             / / - -   f i n i s h   w o r k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
             i f   ( r e s u l t . r e t c o d e = = T R A D E _ R E T C O D E _ D O N E )  
             {  
                   / / = =   W a i t   u n t i l   M T 5   u p d a t e s   i t ' s   c a c h e  
                   i n t   w ;  
                   f o r   ( w = 0 ;   w < 5 0 0 0 ;   w + + )  
                   {  
                         i f   ( ! O r d e r S e l e c t ( t i c k e t ) )   { b r e a k ; }  
                         S l e e p ( 1 ) ;  
                   }  
                   i f   ( w = = 5 0 0 0 )   {  
                         P r i n t ( " C h e c k   e r r o r :   D e l e t e   o r d e r " ) ;      
                   }  
                   i f   ( O r d e r S e l e c t ( t i c k e t ) )   {  
                         P r i n t ( " S o m e t h i n g   w e n t   w r o n g   w i t h   t h e   o r d e r " ) ;  
                         r e t u r n   f a l s e ;  
                   }  
             }  
 	 	  
 	 	 i f   ( s u c c e s s = = t r u e )   {  
                   i f   ( U S E _ V I R T U A L _ S T O P S )   {  
                         V i r t u a l S t o p s D r i v e r ( " c l e a r " , t i c k e t ) ;  
                   }  
                   / / R e g i s t e r E v e n t ( " t r a d e " ) ;  
                   / / r e t u r n ( t r u e ) ;  
             }  
 	 	  
             b r e a k ;  
       }  
       O n T r a d e ( ) ;  
       r e t u r n ( t r u e ) ;  
 }  
  
 s t r i n g   D o u b l e T o S t r ( d o u b l e   d ,   i n t   d i g ) { r e t u r n ( D o u b l e T o S t r i n g ( d , d i g ) ) ; }  
  
 v o i d   D r a w S p r e a d I n f o ( )  
 {  
       s t a t i c   b o o l   a l l o w _ d r a w   =   t r u e ;  
       i f   ( a l l o w _ d r a w = = f a l s e )   { r e t u r n ; }  
       i f   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )   & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E ) )   { a l l o w _ d r a w = f a l s e ; }   / /   A l l o w e d   t o   d r a w   o n l y   o n c e   i n   t e s t i n g   m o d e  
  
       s t a t i c   b o o l   p a s s e d                   =   f a l s e ;  
       s t a t i c   d o u b l e   m a x _ s p r e a d       =   0 ;  
       s t a t i c   d o u b l e   m i n _ s p r e a d       =   E M P T Y _ V A L U E ;  
       s t a t i c   d o u b l e   a v g _ s p r e a d       =   0 ;  
       s t a t i c   d o u b l e   a v g _ a d d             =   0 ;  
       s t a t i c   d o u b l e   a v g _ c n t             =   0 ;  
  
       d o u b l e   c u s t o m _ p o i n t   =   C u s t o m P o i n t ( S y m b o l ( ) ) ;  
       d o u b l e   c u r r e n t _ s p r e a d   =   0 ;  
       i f   ( c u s t o m _ p o i n t   >   0 )   {  
             c u r r e n t _ s p r e a d   =   ( S y m b o l I n f o D o u b l e ( S y m b o l ( ) , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( S y m b o l ( ) , S Y M B O L _ B I D ) ) / c u s t o m _ p o i n t ;  
       }  
       i f   ( c u r r e n t _ s p r e a d   >   m a x _ s p r e a d )   { m a x _ s p r e a d   =   c u r r e n t _ s p r e a d ; }  
       i f   ( c u r r e n t _ s p r e a d   <   m i n _ s p r e a d )   { m i n _ s p r e a d   =   c u r r e n t _ s p r e a d ; }  
        
       a v g _ c n t + + ;  
       a v g _ a d d           =   a v g _ a d d   +   c u r r e n t _ s p r e a d ;  
       a v g _ s p r e a d     =   a v g _ a d d   /   a v g _ c n t ;  
  
       i n t   x = 0 ;   i n t   y = 0 ;  
       s t r i n g   n a m e ;  
  
       / /   c r e a t e   o b j e c t s  
       i f   ( p a s s e d   = =   f a l s e )  
       {  
             p a s s e d = t r u e ;  
              
             n a m e = " f x d _ s p r e a d _ c u r r e n t _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   1 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " S p r e a d : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m a x _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 4 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r O r a n g e R e d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " m a x : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ a v g _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 4 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 9 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " a v g : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m i n _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 4 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r G o l d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " m i n : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ c u r r e n t " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 9 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   1 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m a x " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 7 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r O r a n g e R e d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ a v g " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 7 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 9 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m i n " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 7 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r G o l d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
       }  
        
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ c u r r e n t " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( c u r r e n t _ s p r e a d , 2 ) ) ;  
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ m a x " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( m a x _ s p r e a d , 2 ) ) ;  
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ a v g " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( a v g _ s p r e a d , 2 ) ) ;  
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ m i n " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( m i n _ s p r e a d , 2 ) ) ;  
 }  
  
 s t r i n g   D r a w S t a t u s ( s t r i n g   t e x t = " " )  
 {  
       s t a t i c   s t r i n g   m e m o r y ;  
       i f   ( t e x t = = " " )   {  
             r e t u r n ( m e m o r y ) ;  
       }  
        
       s t a t i c   b o o l   p a s s e d   =   f a l s e ;  
       i n t   x = 2 1 0 ;   i n t   y = 0 ;  
       s t r i n g   n a m e ;  
  
       / / - -   d r a w   t h e   o b j e c t s   o n c e  
       i f   ( p a s s e d   = =   f a l s e )  
       {  
             p a s s e d   =   t r u e ;  
             n a m e = " f x d _ s t a t u s _ t i t l e " ;  
             O b j e c t C r e a t e ( 0 , n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ B A C K ,   f a l s e ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ X D I S T A N C E ,   x ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 7 ) ;  
             O b j e c t S e t S t r i n g ( 0 , n a m e ,   O B J P R O P _ T E X T ,   " S t a t u s " ) ;  
             O b j e c t S e t S t r i n g ( 0 , n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ C O L O R ,   c l r G r a y ) ;  
              
             n a m e = " f x d _ s t a t u s _ t e x t " ;  
             O b j e c t C r e a t e ( 0 , n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ B A C K ,   f a l s e ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 2 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
             O b j e c t S e t S t r i n g ( 0 , n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ F O N T S I Z E ,   1 2 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ C O L O R ,   c l r A q u a ) ;  
       }  
  
       / / - -   u p d a t e   t h e   t e x t   w h e n   n e e d e d  
       i f   ( t e x t   ! =   m e m o r y )   {  
             m e m o r y = t e x t ;  
             O b j e c t S e t S t r i n g ( 0 , " f x d _ s t a t u s _ t e x t " ,   O B J P R O P _ T E X T ,   t e x t ) ;  
       }  
        
       r e t u r n ( t e x t ) ;  
 }  
  
 s t r i n g   E r r o r M e s s a g e ( i n t   e r r o r _ c o d e = - 1 )  
 {  
 	 s t r i n g   e   =   " " ;  
 	 i f   ( e r r o r _ c o d e < 0 )   { e r r o r _ c o d e = G e t L a s t E r r o r ( ) ; }  
 	  
  
 	 s w i t c h ( e r r o r _ c o d e )  
 	 {  
 	 	 / / - - -   s u c c e s s  
 	 	 c a s e   0 :   r e t u r n ( " T h e   o p e r a t i o n   c o m p l e t e d   s u c c e s s f u l l y " ) ;  
 	 	  
 	 	 / / - - -   R u n t i m e  
 	 	 c a s e   4 0 0 1 :   e   =   " U n e x p e c t e d   i n t e r n a l   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 0 2 :   e   =   " W r o n g   p a r a m e t e r   i n   t h e   i n n e r   c a l l   o f   t h e   c l i e n t   t e r m i n a l   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 0 0 3 :   e   =   " W r o n g   p a r a m e t e r   w h e n   c a l l i n g   t h e   s y s t e m   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 0 0 4 :   e   =   " N o t   e n o u g h   m e m o r y   t o   p e r f o r m   t h e   s y s t e m   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 0 0 5 :   e   =   " T h e   s t r u c t u r e   c o n t a i n s   o b j e c t s   o f   s t r i n g s   a n d / o r   d y n a m i c   a r r a y s   a n d / o r   s t r u c t u r e   o f   s u c h   o b j e c t s   a n d / o r   c l a s s e s " ;   b r e a k ;  
 	 	 c a s e   4 0 0 6 :   e   =   " A r r a y   o f   a   w r o n g   t y p e ,   w r o n g   s i z e ,   o r   a   d a m a g e d   o b j e c t   o f   a   d y n a m i c   a r r a y " ;   b r e a k ;  
 	 	 c a s e   4 0 0 7 :   e   =   " N o t   e n o u g h   m e m o r y   f o r   t h e   r e l o c a t i o n   o f   a n   a r r a y ,   o r   a n   a t t e m p t   t o   c h a n g e   t h e   s i z e   o f   a   s t a t i c   a r r a y " ;   b r e a k ;  
 	 	 c a s e   4 0 0 8 :   e   =   " N o t   e n o u g h   m e m o r y   f o r   t h e   r e l o c a t i o n   o f   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 0 9 :   e   =   " N o t   i n i t i a l i z e d   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 1 0 :   e   =   " I n v a l i d   d a t e   a n d / o r   t i m e " ;   b r e a k ;  
 	 	 c a s e   4 0 1 1 :   e   =   " R e q u e s t e d   a r r a y   s i z e   e x c e e d s   2   G B " ;   b r e a k ;  
 	 	 c a s e   4 0 1 2 :   e   =   " W r o n g   p o i n t e r " ;   b r e a k ;  
 	 	 c a s e   4 0 1 3 :   e   =   " W r o n g   t y p e   o f   p o i n t e r " ;   b r e a k ;  
 	 	 c a s e   4 0 1 4 :   e   =   " S y s t e m   f u n c t i o n   i s   n o t   a l l o w e d   t o   c a l l " ;   b r e a k ;  
 	 	 c a s e   4 0 1 5 :   e   =   " T h e   n a m e s   o f   t h e   d y n a m i c   a n d   t h e   s t a t i c   r e s o u r c e   m a t c h " ;   b r e a k ;  
 	 	 c a s e   4 0 1 6 :   e   =   " R e s o u r c e   w i t h   t h i s   n a m e   h a s   n o t   b e e n   f o u n d   i n   E X 5 " ;   b r e a k ;  
 	 	 c a s e   4 0 1 7 :   e   =   " U n s u p p o r t e d   r e s o u r c e   t y p e   o r   i t s   s i z e   e x c e e d s   1 6   M b " ;   b r e a k ;  
 	 	 c a s e   4 0 1 8 :   e   =   " T h e   r e s o u r c e   n a m e   e x c e e d s   6 3   c h a r a c t e r s " ;   b r e a k ;  
 	 	  
 	 	 / / - -   C h a r t s  
 	 	 c a s e   4 1 0 1 :   e   =   " W r o n g   c h a r t   I D " ;   b r e a k ;  
 	 	 c a s e   4 1 0 2 :   e   =   " C h a r t   d o e s   n o t   r e s p o n d " ;   b r e a k ;  
 	 	 c a s e   4 1 0 3 :   e   =   " C h a r t   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 1 0 4 :   e   =   " N o   E x p e r t   A d v i s o r   i n   t h e   c h a r t   t h a t   c o u l d   h a n d l e   t h e   e v e n t " ;   b r e a k ;  
 	 	 c a s e   4 1 0 5 :   e   =   " C h a r t   o p e n i n g   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 1 0 6 :   e   =   " F a i l e d   t o   c h a n g e   c h a r t   s y m b o l   a n d   p e r i o d " ;   b r e a k ;  
 	 	 c a s e   4 1 0 7 :   e   =   " W r o n g   p a r a m e t e r   f o r   t i m e r " ;   b r e a k ;  
 	 	 c a s e   4 1 0 8 :   e   =   " F a i l e d   t o   c r e a t e   t i m e r " ;   b r e a k ;  
 	 	 c a s e   4 1 0 9 :   e   =   " W r o n g   c h a r t   p r o p e r t y   I D " ;   b r e a k ;  
 	 	 c a s e   4 1 1 0 :   e   =   " E r r o r   c r e a t i n g   s c r e e n s h o t s " ;   b r e a k ;  
 	 	 c a s e   4 1 1 1 :   e   =   " E r r o r   n a v i g a t i n g   t h r o u g h   c h a r t " ;   b r e a k ;  
 	 	 c a s e   4 1 1 2 :   e   =   " E r r o r   a p p l y i n g   t e m p l a t e " ;   b r e a k ;  
 	 	 c a s e   4 1 1 3 :   e   =   " S u b w i n d o w   c o n t a i n i n g   t h e   i n d i c a t o r   w a s   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 1 1 4 :   e   =   " E r r o r   a d d i n g   a n   i n d i c a t o r   t o   c h a r t " ;   b r e a k ;  
 	 	 c a s e   4 1 1 5 :   e   =   " E r r o r   d e l e t i n g   a n   i n d i c a t o r   f r o m   t h e   c h a r t " ;   b r e a k ;  
 	 	 c a s e   4 1 1 6 :   e   =   " I n d i c a t o r   n o t   f o u n d   o n   t h e   s p e c i f i e d   c h a r t " ;   b r e a k ;  
  
 	 	 / / - -   G r a p h i c a l   O b j e c t s  
 	 	 c a s e   4 2 0 1 :   e   =   " E r r o r   w o r k i n g   w i t h   a   g r a p h i c a l   o b j e c t " ;   b r e a k ;  
 	 	 c a s e   4 2 0 2 :   e   =   " G r a p h i c a l   o b j e c t   w a s   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 2 0 3 :   e   =   " W r o n g   I D   o f   a   g r a p h i c a l   o b j e c t   p r o p e r t y " ;   b r e a k ;  
 	 	 c a s e   4 2 0 4 :   e   =   " U n a b l e   t o   g e t   d a t e   c o r r e s p o n d i n g   t o   t h e   v a l u e " ;   b r e a k ;  
 	 	 c a s e   4 2 0 5 :   e   =   " U n a b l e   t o   g e t   v a l u e   c o r r e s p o n d i n g   t o   t h e   d a t e " ;   b r e a k ;  
  
 	 	 / / - -   M a r k e t   I n f o  
 	 	 c a s e   4 3 0 1 :   e   =   " U n k n o w n   s y m b o l " ;   b r e a k ;  
 	 	 c a s e   4 3 0 2 :   e   =   " S y m b o l   i s   n o t   s e l e c t e d   i n   M a r k e t W a t c h " ;   b r e a k ;  
 	 	 c a s e   4 3 0 3 :   e   =   " W r o n g   i d e n t i f i e r   o f   a   s y m b o l   p r o p e r t y " ;   b r e a k ;  
 	 	 c a s e   4 3 0 4 :   e   =   " T i m e   o f   t h e   l a s t   t i c k   i s   n o t   k n o w n   ( n o   t i c k s ) " ;   b r e a k ;  
 	 	 c a s e   4 3 0 5 :   e   =   " E r r o r   a d d i n g   o r   d e l e t i n g   a   s y m b o l   i n   M a r k e t W a t c h " ;   b r e a k ;  
  
 	 	 / / - -   H i s t o r y   A c c e s s  
 	 	 c a s e   4 4 0 1 :   e   =   " R e q u e s t e d   h i s t o r y   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 4 0 2 :   e   =   " W r o n g   I D   o f   t h e   h i s t o r y   p r o p e r t y " ;   b r e a k ;  
  
 	 	 / / - -   G l o b a l   V a r i a b l e s  
 	 	 c a s e   4 5 0 1 :   e   =   " G l o b a l   v a r i a b l e   o f   t h e   c l i e n t   t e r m i n a l   i s   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 5 0 2 :   e   =   " G l o b a l   v a r i a b l e   o f   t h e   c l i e n t   t e r m i n a l   w i t h   t h e   s a m e   n a m e   a l r e a d y   e x i s t s " ;   b r e a k ;  
 	 	 c a s e   4 5 1 0 :   e   =   " E m a i l   s e n d i n g   f a i l e d " ;   b r e a k ;  
 	 	 c a s e   4 5 1 1 :   e   =   " S o u n d   p l a y i n g   f a i l e d " ;   b r e a k ;  
 	 	 c a s e   4 5 1 2 :   e   =   " W r o n g   i d e n t i f i e r   o f   t h e   p r o g r a m   p r o p e r t y " ;   b r e a k ;  
 	 	 c a s e   4 5 1 3 :   e   =   " W r o n g   i d e n t i f i e r   o f   t h e   t e r m i n a l   p r o p e r t y " ;   b r e a k ;  
 	 	 c a s e   4 5 1 4 :   e   =   " F i l e   s e n d i n g   v i a   f t p   f a i l e d " ;   b r e a k ;  
 	 	 c a s e   4 5 1 5 :   e   =   " F a i l e d   t o   s e n d   a   n o t i f i c a t i o n " ;   b r e a k ;  
 	 	 c a s e   4 5 1 6 :   e   =   " I n v a l i d   p a r a m e t e r   f o r   s e n d i n g   a   n o t i f i c a t i o n   -   a n   e m p t y   s t r i n g   o r   N U L L   h a s   b e e n   p a s s e d   t o   t h e   S e n d N o t i f i c a t i o n ( )   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 5 1 7 :   e   =   " W r o n g   s e t t i n g s   o f   n o t i f i c a t i o n s   i n   t h e   t e r m i n a l   ( I D   i s   n o t   s p e c i f i e d   o r   p e r m i s s i o n   i s   n o t   s e t ) " ;   b r e a k ;  
 	 	 c a s e   4 5 1 8 :   e   =   " T o o   f r e q u e n t   s e n d i n g   o f   n o t i f i c a t i o n s " ;   b r e a k ;  
  
 	 	 / / - -   C u s t o m   I n d i c a t o r   B u f f e r s  
 	 	 c a s e   4 6 0 1 :   e   =   " N o t   e n o u g h   m e m o r y   f o r   t h e   d i s t r i b u t i o n   o f   i n d i c a t o r   b u f f e r s " ;   b r e a k ;  
 	 	 c a s e   4 6 0 2 :   e   =   " W r o n g   i n d i c a t o r   b u f f e r   i n d e x " ;   b r e a k ;  
  
 	 	 / / - -   C u s t o m   I n d i c a t o r   P r o p e r t i e s  
 	 	 c a s e   4 6 0 3 :   e   =   " W r o n g   I D   o f   t h e   c u s t o m   i n d i c a t o r   p r o p e r t y " ;   b r e a k ;  
  
 	 	 / / - -   A c c o u n t  
 	 	 c a s e   4 7 0 1 :   e   =   " W r o n g   a c c o u n t   p r o p e r t y   I D " ;   b r e a k ;  
 	 	 c a s e   4 7 5 1 :   e   =   " W r o n g   t r a d e   p r o p e r t y   I D " ;   b r e a k ;  
 	 	 c a s e   4 7 5 2 :   e   =   " T r a d i n g   b y   E x p e r t   A d v i s o r s   p r o h i b i t e d " ;   b r e a k ;  
 	 	 c a s e   4 7 5 3 :   e   =   " P o s i t i o n   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 7 5 4 :   e   =   " O r d e r   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 7 5 5 :   e   =   " D e a l   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 7 5 6 :   e   =   " T r a d e   r e q u e s t   s e n d i n g   f a i l e d " ;   b r e a k ;  
  
 	 	 / / - -   I n d i c a t o r s  
 	 	 c a s e   4 8 0 1 :   e   =   " U n k n o w n   s y m b o l " ;   b r e a k ;  
 	 	 c a s e   4 8 0 2 :   e   =   " I n d i c a t o r   c a n n o t   b e   c r e a t e d " ;   b r e a k ;  
 	 	 c a s e   4 8 0 3 :   e   =   " N o t   e n o u g h   m e m o r y   t o   a d d   t h e   i n d i c a t o r " ;   b r e a k ;  
 	 	 c a s e   4 8 0 4 :   e   =   " T h e   i n d i c a t o r   c a n n o t   b e   a p p l i e d   t o   a n o t h e r   i n d i c a t o r " ;   b r e a k ;  
 	 	 c a s e   4 8 0 5 :   e   =   " E r r o r   a p p l y i n g   a n   i n d i c a t o r   t o   c h a r t " ;   b r e a k ;  
 	 	 c a s e   4 8 0 6 :   e   =   " R e q u e s t e d   d a t a   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 8 0 7 :   e   =   " W r o n g   i n d i c a t o r   h a n d l e " ;   b r e a k ;  
 	 	 c a s e   4 8 0 8 :   e   =   " W r o n g   n u m b e r   o f   p a r a m e t e r s   w h e n   c r e a t i n g   a n   i n d i c a t o r " ;   b r e a k ;  
 	 	 c a s e   4 8 0 9 :   e   =   " N o   p a r a m e t e r s   w h e n   c r e a t i n g   a n   i n d i c a t o r " ;   b r e a k ;  
 	 	 c a s e   4 8 1 0 :   e   =   " T h e   f i r s t   p a r a m e t e r   i n   t h e   a r r a y   m u s t   b e   t h e   n a m e   o f   t h e   c u s t o m   i n d i c a t o r " ;   b r e a k ;  
 	 	 c a s e   4 8 1 1 :   e   =   " I n v a l i d   p a r a m e t e r   t y p e   i n   t h e   a r r a y   w h e n   c r e a t i n g   a n   i n d i c a t o r " ;   b r e a k ;  
 	 	 c a s e   4 8 1 2 :   e   =   " W r o n g   i n d e x   o f   t h e   r e q u e s t e d   i n d i c a t o r   b u f f e r " ;   b r e a k ;  
  
 	 	 / / - -   D e p t h   o f   M a r k e t  
 	 	 c a s e   4 9 0 1 :   e   =   " D e p t h   O f   M a r k e t   c a n   n o t   b e   a d d e d " ;   b r e a k ;  
 	 	 c a s e   4 9 0 2 :   e   =   " D e p t h   O f   M a r k e t   c a n   n o t   b e   r e m o v e d " ;   b r e a k ;  
 	 	 c a s e   4 9 0 3 :   e   =   " T h e   d a t a   f r o m   D e p t h   O f   M a r k e t   c a n   n o t   b e   o b t a i n e d " ;   b r e a k ;  
 	 	 c a s e   4 9 0 4 :   e   =   " E r r o r   i n   s u b s c r i b i n g   t o   r e c e i v e   n e w   d a t a   f r o m   D e p t h   O f   M a r k e t " ;   b r e a k ;  
  
 	 	 / / - -   F i l e   O p e r a t i o n s  
 	 	 c a s e   5 0 0 1 :   e   =   " M o r e   t h a n   6 4   f i l e s   c a n n o t   b e   o p e n e d   a t   t h e   s a m e   t i m e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 2 :   e   =   " I n v a l i d   f i l e   n a m e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 3 :   e   =   " T o o   l o n g   f i l e   n a m e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 4 :   e   =   " F i l e   o p e n i n g   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 0 5 :   e   =   " N o t   e n o u g h   m e m o r y   f o r   c a c h e   t o   r e a d " ;   b r e a k ;  
 	 	 c a s e   5 0 0 6 :   e   =   " F i l e   d e l e t i n g   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 0 7 :   e   =   " A   f i l e   w i t h   t h i s   h a n d l e   w a s   c l o s e d ,   o r   w a s   n o t   o p e n i n g   a t   a l l " ;   b r e a k ;  
 	 	 c a s e   5 0 0 8 :   e   =   " W r o n g   f i l e   h a n d l e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 9 :   e   =   " T h e   f i l e   m u s t   b e   o p e n e d   f o r   w r i t i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 0 :   e   =   " T h e   f i l e   m u s t   b e   o p e n e d   f o r   r e a d i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 1 :   e   =   " T h e   f i l e   m u s t   b e   o p e n e d   a s   a   b i n a r y   o n e " ;   b r e a k ;  
 	 	 c a s e   5 0 1 2 :   e   =   " T h e   f i l e   m u s t   b e   o p e n e d   a s   a   t e x t " ;   b r e a k ;  
 	 	 c a s e   5 0 1 3 :   e   =   " T h e   f i l e   m u s t   b e   o p e n e d   a s   a   t e x t   o r   C S V " ;   b r e a k ;  
 	 	 c a s e   5 0 1 4 :   e   =   " T h e   f i l e   m u s t   b e   o p e n e d   a s   C S V " ;   b r e a k ;  
 	 	 c a s e   5 0 1 5 :   e   =   " F i l e   r e a d i n g   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 1 6 :   e   =   " S t r i n g   s i z e   m u s t   b e   s p e c i f i e d ,   b e c a u s e   t h e   f i l e   i s   o p e n e d   a s   b i n a r y " ;   b r e a k ;  
 	 	 c a s e   5 0 1 7 :   e   =   " A   t e x t   f i l e   m u s t   b e   f o r   s t r i n g   a r r a y s ,   f o r   o t h e r   a r r a y s   -   b i n a r y " ;   b r e a k ;  
 	 	 c a s e   5 0 1 8 :   e   =   " T h i s   i s   n o t   a   f i l e ,   t h i s   i s   a   d i r e c t o r y " ;   b r e a k ;  
 	 	 c a s e   5 0 1 9 :   e   =   " F i l e   d o e s   n o t   e x i s t " ;   b r e a k ;  
 	 	 c a s e   5 0 2 0 :   e   =   " F i l e   c a n   n o t   b e   r e w r i t t e n " ;   b r e a k ;  
 	 	 c a s e   5 0 2 1 :   e   =   " W r o n g   d i r e c t o r y   n a m e " ;   b r e a k ;  
 	 	 c a s e   5 0 2 2 :   e   =   " D i r e c t o r y   d o e s   n o t   e x i s t " ;   b r e a k ;  
 	 	 c a s e   5 0 2 3 :   e   =   " T h i s   i s   a   f i l e ,   n o t   a   d i r e c t o r y " ;   b r e a k ;  
 	 	 c a s e   5 0 2 4 :   e   =   " T h e   d i r e c t o r y   c a n n o t   b e   r e m o v e d " ;   b r e a k ;  
 	 	 c a s e   5 0 2 5 :   e   =   " F a i l e d   t o   c l e a r   t h e   d i r e c t o r y   ( p r o b a b l y   o n e   o r   m o r e   f i l e s   a r e   b l o c k e d   a n d   r e m o v a l   o p e r a t i o n   f a i l e d ) " ;   b r e a k ;  
 	 	 c a s e   5 0 2 6 :   e   =   " F a i l e d   t o   w r i t e   a   r e s o u r c e   t o   a   f i l e " ;   b r e a k ;  
  
 	 	 / / - -   S t r i n g   C a s t i n g  
 	 	 c a s e   5 0 3 0 :   e   =   " N o   d a t e   i n   t h e   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 3 1 :   e   =   " W r o n g   d a t e   i n   t h e   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 3 2 :   e   =   " W r o n g   t i m e   i n   t h e   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 3 3 :   e   =   " E r r o r   c o n v e r t i n g   s t r i n g   t o   d a t e " ;   b r e a k ;  
 	 	 c a s e   5 0 3 4 :   e   =   " N o t   e n o u g h   m e m o r y   f o r   t h e   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 3 5 :   e   =   " T h e   s t r i n g   l e n g t h   i s   l e s s   t h a n   e x p e c t e d " ;   b r e a k ;  
 	 	 c a s e   5 0 3 6 :   e   =   " T o o   l a r g e   n u m b e r ,   m o r e   t h a n   U L O N G _ M A X " ;   b r e a k ;  
 	 	 c a s e   5 0 3 7 :   e   =   " I n v a l i d   f o r m a t   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 3 8 :   e   =   " A m o u n t   o f   f o r m a t   s p e c i f i e r s   m o r e   t h a n   t h e   p a r a m e t e r s " ;   b r e a k ;  
 	 	 c a s e   5 0 3 9 :   e   =   " A m o u n t   o f   p a r a m e t e r s   m o r e   t h a n   t h e   f o r m a t   s p e c i f i e r s " ;   b r e a k ;  
 	 	 c a s e   5 0 4 0 :   e   =   " D a m a g e d   p a r a m e t e r   o f   s t r i n g   t y p e " ;   b r e a k ;  
 	 	 c a s e   5 0 4 1 :   e   =   " P o s i t i o n   o u t s i d e   t h e   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 4 2 :   e   =   " 0   a d d e d   t o   t h e   s t r i n g   e n d ,   a   u s e l e s s   o p e r a t i o n " ;   b r e a k ;  
 	 	 c a s e   5 0 4 3 :   e   =   " U n k n o w n   d a t a   t y p e   w h e n   c o n v e r t i n g   t o   a   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   5 0 4 4 :   e   =   " D a m a g e d   s t r i n g   o b j e c t " ;   b r e a k ;  
  
 	 	 / / - -   O p e r a t i o n s   w i t h   A r r a y s  
 	 	 c a s e   5 0 5 0 :   e   =   " C o p y i n g   i n c o m p a t i b l e   a r r a y s .   S t r i n g   a r r a y   c a n   b e   c o p i e d   o n l y   t o   a   s t r i n g   a r r a y ,   a n d   a   n u m e r i c   a r r a y   -   i n   n u m e r i c   a r r a y   o n l y " ;   b r e a k ;  
 	 	 c a s e   5 0 5 1 :   e   =   " T h e   r e c e i v i n g   a r r a y   i s   d e c l a r e d   a s   A S _ S E R I E S ,   a n d   i t   i s   o f   i n s u f f i c i e n t   s i z e " ;   b r e a k ;  
 	 	 c a s e   5 0 5 2 :   e   =   " T o o   s m a l l   a r r a y ,   t h e   s t a r t i n g   p o s i t i o n   i s   o u t s i d e   t h e   a r r a y " ;   b r e a k ;  
 	 	 c a s e   5 0 5 3 :   e   =   " A n   a r r a y   o f   z e r o   l e n g t h " ;   b r e a k ;  
 	 	 c a s e   5 0 5 4 :   e   =   " M u s t   b e   a   n u m e r i c   a r r a y " ;   b r e a k ;  
 	 	 c a s e   5 0 5 5 :   e   =   " M u s t   b e   a   o n e - d i m e n s i o n a l   a r r a y " ;   b r e a k ;  
 	 	 c a s e   5 0 5 6 :   e   =   " T i m e s e r i e s   c a n n o t   b e   u s e d " ;   b r e a k ;  
 	 	 c a s e   5 0 5 7 :   e   =   " M u s t   b e   a n   a r r a y   o f   t y p e   d o u b l e " ;   b r e a k ;  
 	 	 c a s e   5 0 5 8 :   e   =   " M u s t   b e   a n   a r r a y   o f   t y p e   f l o a t " ;   b r e a k ;  
 	 	 c a s e   5 0 5 9 :   e   =   " M u s t   b e   a n   a r r a y   o f   t y p e   l o n g " ;   b r e a k ;  
 	 	 c a s e   5 0 6 0 :   e   =   " M u s t   b e   a n   a r r a y   o f   t y p e   i n t " ;   b r e a k ;  
 	 	 c a s e   5 0 6 1 :   e   =   " M u s t   b e   a n   a r r a y   o f   t y p e   s h o r t " ;   b r e a k ;  
 	 	 c a s e   5 0 6 2 :   e   =   " M u s t   b e   a n   a r r a y   o f   t y p e   c h a r " ;   b r e a k ;  
 	 	  
 	 	 / / - -   O p e r a t i o n s   w i t h   O p e n C L  
 	 	 c a s e   5 1 0 0 :   e   =   " O p e n C L   f u n c t i o n s   a r e   n o t   s u p p o r t e d   o n   t h i s   c o m p u t e r " ;   b r e a k ;  
 	 	 c a s e   5 1 0 1 :   e   =   " I n t e r n a l   e r r o r   o c c u r r e d   w h e n   r u n n i n g   O p e n C L " ;   b r e a k ;  
 	 	 c a s e   5 1 0 2 :   e   =   " I n v a l i d   O p e n C L   h a n d l e " ;   b r e a k ;  
 	 	 c a s e   5 1 0 3 :   e   =   " E r r o r   c r e a t i n g   t h e   O p e n C L   c o n t e x t " ;   b r e a k ;  
 	 	 c a s e   5 1 0 4 :   e   =   " F a i l e d   t o   c r e a t e   a   r u n   q u e u e   i n   O p e n C L " ;   b r e a k ;  
 	 	 c a s e   5 1 0 5 :   e   =   " E r r o r   o c c u r r e d   w h e n   c o m p i l i n g   a n   O p e n C L   p r o g r a m " ;   b r e a k ;  
 	 	 c a s e   5 1 0 6 :   e   =   " T o o   l o n g   k e r n e l   n a m e   ( O p e n C L   k e r n e l ) " ;   b r e a k ;  
 	 	 c a s e   5 1 0 7 :   e   =   " E r r o r   c r e a t i n g   a n   O p e n C L   k e r n e l " ;   b r e a k ;  
 	 	 c a s e   5 1 0 8 :   e   =   " E r r o r   o c c u r r e d   w h e n   s e t t i n g   p a r a m e t e r s   f o r   t h e   O p e n C L   k e r n e l " ;   b r e a k ;  
 	 	 c a s e   5 1 0 9 :   e   =   " O p e n C L   p r o g r a m   r u n t i m e   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 1 1 0 :   e   =   " I n v a l i d   s i z e   o f   t h e   O p e n C L   b u f f e r " ;   b r e a k ;  
 	 	 c a s e   5 1 1 1 :   e   =   " I n v a l i d   o f f s e t   i n   t h e   O p e n C L   b u f f e r " ;   b r e a k ;  
 	 	 c a s e   5 1 1 2 :   e   =   " F a i l e d   t o   c r e a t e   a n   O p e n C L   b u f f e r " ;   b r e a k ;  
 	 	  
 	 	 / / - -   O p e r a t i o n s   w i t h   W e b R e q u e s t  
 	 	 c a s e   5 2 0 0 :   e   =   " I n v a l i d   U R L " ;   b r e a k ;  
 	 	 c a s e   5 2 0 1 :   e   =   " F a i l e d   t o   c o n n e c t   t o   s p e c i f i e d   U R L " ;   b r e a k ;  
 	 	 c a s e   5 2 0 2 :   e   =   " T i m e o u t   e x c e e d e d " ;   b r e a k ;  
 	 	 c a s e   5 2 0 3 :   e   =   " H T T P   r e q u e s t   f a i l e d " ;   b r e a k ;  
  
 	 	 / / - -   t r a d i n g   e r r o r s  
 	 	 c a s e   1 0 0 0 4 :   e   =   " R e q u o t e   o c c u r e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 0 6 :   e   =   " O r d e r   i s   n o t   a c c e p t e d   b y   t h e   s e r v e r " ;   b r e a k ;  
 	 	 c a s e   1 0 0 0 7 :   e   =   " R e q u e s t   c a n c e l e d   b y   t r a d e r " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 0 :   e   =   " O n l y   p a r t   o f   t h e   r e q u e s t   w a s   c o m p l e t e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 1 :   e   =   " R e q u e s t   p r o c e s s i n g   e r r o r " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 2 :   e   =   " R e q u e s t   c a n c e l e d   b y   t i m e o u t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 3 :   e   =   " I n v a l i d   r e q u e s t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 4 :   e   =   " I n v a l i d   v o l u m e " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 5 :   e   =   " I n v a l i d   p r i c e " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 6 :   e   =   " I n v a l i d   S L   o r   T P " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 7 :   e   =   " T r a d i n g   i s   d i s a b l e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 8 :   e   =   " M a r k e t   i s   c l o s e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 1 9 :   e   =   " N o t   e n o u g h   m o n e y   t o   t r a d e " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 0 :   e   =   " P r i c e s   c h a n g e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 1 :   e   =   " T h e r e   a r e   n o   q u o t e s   t o   p r o c e s s   t h e   r e q u e s t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 2 :   e   =   " I n v a l i d   e x p i r a t i o n   d a t e   i n   t h e   o r d e r   r e q u e s t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 3 :   e   =   " O r d e r   s t a t e   c h a n g e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 4 :   e   =   " T o o   f r e q u e n t   r e q u e s t s " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 5 :   e   =   " N o   c h a n g e s   i n   r e q u e s t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 6 :   e   =   " A u t o t r a d i n g   i s   d i s a b l e d   b y   t h e   s e r v e r " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 7 :   e   =   " A u t o t r a d i n g   i s   d i s a b l e d   b y   t h e   c l i e n t   t e r m i n a l " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 8 :   e   =   " R e q u e s t   l o c k e d   f o r   p r o c e s s i n g " ;   b r e a k ;  
 	 	 c a s e   1 0 0 2 9 :   e   =   " O r d e r   o r   t r a d e   f r o z e n " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 0 :   e   =   " I n v a l i d   o r d e r   f i l l i n g   t y p e " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 1 :   e   =   " N o   c o n n e c t i o n   w i t h   t h e   t r a d e   s e r v e r " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 2 :   e   =   " O p e r a t i o n   i s   a l l o w e d   o n l y   f o r   l i v e   a c c o u n t s " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 3 :   e   =   " T h e   n u m b e r   o f   p e n d i n g   o r d e r s   h a s   r e a c h e d   t h e   l i m i t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 4 :   e   =   " T h e   v o l u m e   o f   o r d e r s   a n d   t r a d e s   f o r   t h e   s y m b o l   h a s   r e a c h e d   t h e   l i m i t " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 5 :   e   =   " I n c o r r e c t   o r   p r o h i b i t e d   o r d e r   t y p e " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 6 :   e   =   " P o s i t i o n   w i t h   t h e   s p e c i f i e d   P O S I T I O N _ I D E N T I F I E R   h a s   a l r e a d y   b e e n   c l o s e d " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 8 :   e   =   " A   c l o s e   v o l u m e   e x c e e d s   t h e   c u r r e n t   p o s i t i o n   v o l u m e " ;   b r e a k ;  
 	 	 c a s e   1 0 0 3 9 :   e   =   " A   c l o s e   o r d e r   a l r e a d y   e x i s t s   f o r   a   s p e c i f i e d   p o s i t i o n " ;   b r e a k ;  
 	 	 / / - -   U s e r - D e f i n e d   E r r o r s  
 	 	 c a s e   6 5 5 3 6 :   e   =   " U s e r   d e f i n e d   e r r o r s " ;   b r e a k ;  
 	 	 d e f a u l t : 	 e   =   " U n k n o w n   e r r o r " ;  
 	 }  
  
 	 S t r i n g C o n c a t e n a t e ( e ,   e , "   ( " , e r r o r _ c o d e , " ) " ) ;  
 	  
 	 r e t u r n   e ;  
 }  
  
 c l a s s   E x p i r a t i o n W o r k e r  
 {  
 p r i v a t e :  
 	 s t r u c t   C a c h e d I t e m s  
 	 {  
 	 	 l o n g   t i c k e t ;  
 	 	 d a t e t i m e   e x p i r a t i o n ;  
 	 } ;  
  
 	 C a c h e d I t e m s   c a c h e d I t e m s [ ] ;  
 	 l o n g   c h a r t I D ;  
 	 s t r i n g   c h a r t O b j e c t P r e f i x ;  
 	 s t r i n g   c h a r t O b j e c t S u f f i x ;  
  
 	 t e m p l a t e < t y p e n a m e   T >  
 	 v o i d   A r r a y C l o n e ( T   & d e s t [ ] ,   T   & s r c [ ] )  
 	 {  
 	 	 i n t   s i z e   =   A r r a y S i z e ( s r c ) ;  
 	 	 A r r a y R e s i z e ( d e s t ,   s i z e ) ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 {  
 	 	 	 d e s t [ i ]   =   s r c [ i ] ;  
 	 	 }  
 	 }  
  
 	 v o i d   I n i t i a l D i s c o v e r y ( )  
 	 {  
 	 	 A r r a y R e s i z e ( c a c h e d I t e m s ,   0 ) ;  
  
 	 	 i n t   t o t a l   =   P o s i t i o n s T o t a l ( ) ;  
  
 	 	 f o r   ( i n t   i n d e x   =   0 ;   i n d e x   < =   t o t a l ;   i n d e x + + )  
 	 	 {  
 	 	 	 l o n g   t i c k e t   =   G e t T i c k e t B y I n d e x ( i n d e x ) ;  
  
 	 	 	 i f   ( t i c k e t   = =   0 )   c o n t i n u e ;  
  
 	 	 	 d a t e t i m e   e x p i r a t i o n   =   G e t E x p i r a t i o n F r o m O b j e c t ( t i c k e t ) ;  
  
 	 	 	 i f   ( e x p i r a t i o n   >   0 )  
 	 	 	 {  
 	 	 	 	 S e t E x p i r a t i o n I n C a c h e ( t i c k e t ,   e x p i r a t i o n ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 l o n g   G e t T i c k e t B y I n d e x ( i n t   i n d e x )  
 	 {  
 	 	 r e t u r n   ( l o n g ) P o s i t i o n G e t T i c k e t ( i n d e x ) ;  
 	 }  
  
 	 d a t e t i m e   G e t E x p i r a t i o n F r o m O b j e c t ( l o n g   t i c k e t )  
 	 {  
 	 	 d a t e t i m e   e x p i r a t i o n   =   ( d a t e t i m e ) 0 ;  
 	 	  
 	 	 s t r i n g   o b j e c t N a m e   =   c h a r t O b j e c t P r e f i x   +   I n t e g e r T o S t r i n g ( t i c k e t )   +   c h a r t O b j e c t S u f f i x ;  
  
 	 	 i f   ( O b j e c t F i n d ( c h a r t I D ,   o b j e c t N a m e )   = =   c h a r t I D )  
 	 	 {  
 	 	 	 e x p i r a t i o n   =   ( d a t e t i m e ) O b j e c t G e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ T I M E ) ;  
 	 	 }  
  
 	 	 r e t u r n   e x p i r a t i o n ;  
 	 }  
  
 	 b o o l   R e m o v e E x p i r a t i o n O b j e c t ( l o n g   t i c k e t )  
 	 {  
 	 	 b o o l   s u c c e s s             =   f a l s e ;  
 	 	 s t r i n g   o b j e c t N a m e   =   " " ;  
  
 	 	 o b j e c t N a m e   =   c h a r t O b j e c t P r e f i x   +   I n t e g e r T o S t r i n g ( t i c k e t )   +   c h a r t O b j e c t S u f f i x ;  
 	 	 s u c c e s s         =   O b j e c t D e l e t e ( c h a r t I D ,   o b j e c t N a m e ) ;  
  
 	 	 r e t u r n   s u c c e s s ;  
 	 }  
  
 	 v o i d   R e m o v e E x p i r a t i o n F r o m C a c h e ( l o n g   t i c k e t )  
 	 {  
 	 	 i n t   s i z e   =   A r r a y S i z e ( c a c h e d I t e m s ) ;  
 	 	 C a c h e d I t e m s   n e w I t e m s [ ] ;  
 	 	 i n t   n e w S i z e   =   0 ;  
 	 	 b o o l   i t e m R e m o v e d   =   f a l s e ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 {  
 	 	 	 i f   ( c a c h e d I t e m s [ i ] . t i c k e t   = =   t i c k e t )  
 	 	 	 {  
 	 	 	 	 i t e m R e m o v e d   =   t r u e ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 n e w S i z e + + ;  
 	 	 	 	 A r r a y R e s i z e ( n e w I t e m s ,   n e w S i z e ) ;  
 	 	 	 	 n e w I t e m s [ n e w S i z e   -   1 ] . t i c k e t           =   c a c h e d I t e m s [ i ] . t i c k e t ;  
 	 	 	 	 n e w I t e m s [ n e w S i z e   -   1 ] . e x p i r a t i o n   =   c a c h e d I t e m s [ i ] . e x p i r a t i o n ;  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( i t e m R e m o v e d )   A r r a y C l o n e ( c a c h e d I t e m s ,   n e w I t e m s ) ;  
 	 }  
  
 	 v o i d   S e t E x p i r a t i o n I n C a c h e ( l o n g   t i c k e t ,   d a t e t i m e   e x p i r a t i o n )  
 	 {  
 	 	 b o o l   a l r e a d y E x i s t s   =   f a l s e ;  
 	 	 i n t   s i z e                       =   A r r a y S i z e ( c a c h e d I t e m s ) ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 {  
 	 	 	 i f   ( c a c h e d I t e m s [ i ] . t i c k e t   = =   t i c k e t )  
 	 	 	 {  
 	 	 	 	 c a c h e d I t e m s [ i ] . e x p i r a t i o n   =   e x p i r a t i o n ;  
 	 	 	 	 a l r e a d y E x i s t s   =   t r u e ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( a l r e a d y E x i s t s   = =   f a l s e )  
 	 	 {  
 	 	 	 A r r a y R e s i z e ( c a c h e d I t e m s ,   s i z e   +   1 ) ;  
 	 	 	 c a c h e d I t e m s [ s i z e ] . t i c k e t           =   t i c k e t ;  
 	 	 	 c a c h e d I t e m s [ s i z e ] . e x p i r a t i o n   =   e x p i r a t i o n ;  
 	 	 }  
 	 }  
  
 	 b o o l   S e t E x p i r a t i o n I n O b j e c t ( l o n g   t i c k e t ,   d a t e t i m e   e x p i r a t i o n )  
 	 {  
 	 	 i f   ( ! P o s i t i o n S e l e c t B y T i c k e t ( t i c k e t ) )   r e t u r n   f a l s e ;  
  
 	 	 s t r i n g   o b j e c t N a m e   =   c h a r t O b j e c t P r e f i x   +   I n t e g e r T o S t r i n g ( t i c k e t )   +   c h a r t O b j e c t S u f f i x ;  
 	 	 d o u b l e   p r i c e             =   O r d e r O p e n P r i c e ( ) ;  
  
 	 	 i f   ( O b j e c t F i n d ( c h a r t I D ,   o b j e c t N a m e )   = =   c h a r t I D )  
 	 	 {  
 	 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ T I M E ,   e x p i r a t i o n ) ;  
 	 	 	 O b j e c t S e t D o u b l e ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ P R I C E ,   p r i c e ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 O b j e c t C r e a t e ( c h a r t I D ,   o b j e c t N a m e ,   O B J _ A R R O W ,   0 ,   e x p i r a t i o n ,   p r i c e ) ;  
 	 	 }  
  
 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ A R R O W C O D E ,   7 7 ) ;  
 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ T O P ) ;  
 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ C O L O R ,   c l r R e d ) ;  
 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ S E L E C T A B L E ,   f a l s e ) ;  
 	 	 O b j e c t S e t I n t e g e r ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ T I M E F R A M E S ,   O B J _ N O _ P E R I O D S ) ;  
 	 	 O b j e c t S e t S t r i n g ( c h a r t I D ,   o b j e c t N a m e ,   O B J P R O P _ T E X T ,   T i m e T o S t r i n g ( e x p i r a t i o n ) ) ;  
  
 	 	 r e t u r n   t r u e ;  
 	 }  
 	  
 	 b o o l   T r a d e E x i s t s ( l o n g   t i c k e t )  
 	 {  
 	 	 b o o l   e x i s t s     =   f a l s e ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   P o s i t i o n s T o t a l ( ) ;   i + + )  
 	 	 {  
 	 	 	 l o n g   p o s i t i o n T i c k e t   =   ( l o n g ) P o s i t i o n G e t T i c k e t ( i ) ;  
  
 	 	 	 i f   ( ! p o s i t i o n T i c k e t )   c o n t i n u e ;  
  
 	 	 	 i f   ( p o s i t i o n T i c k e t   = =   t i c k e t )  
 	 	 	 {  
 	 	 	 	 e x i s t s   =   t r u e ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
  
 	 	 r e t u r n   e x i s t s ;  
 	 }  
  
 p u b l i c :  
 	 / /   D e f a u l t   c o n s t r u c t o r  
 	 E x p i r a t i o n W o r k e r ( )  
 	 {  
 	 	 c h a r t I D                       =   0 ;  
 	 	 c h a r t O b j e c t P r e f i x   =   " # " ;  
 	 	 c h a r t O b j e c t S u f f i x   =   "   E x p i r a t i o n   M a r k e r " ;  
  
 	 	 I n i t i a l D i s c o v e r y ( ) ;  
 	 }  
  
 	 v o i d   S e t E x p i r a t i o n ( l o n g   t i c k e t ,   d a t e t i m e   e x p i r a t i o n )  
 	 {  
 	 	 i f   ( e x p i r a t i o n   < =   0 )  
 	 	 {  
 	 	 	 R e m o v e E x p i r a t i o n ( t i c k e t ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 S e t E x p i r a t i o n I n O b j e c t ( t i c k e t ,   e x p i r a t i o n ) ;  
 	 	 	 S e t E x p i r a t i o n I n C a c h e ( t i c k e t ,   e x p i r a t i o n ) ;  
 	 	 }  
 	 }  
  
 	 d a t e t i m e   G e t E x p i r a t i o n ( l o n g   t i c k e t )  
 	 {  
 	 	 d a t e t i m e   e x p i r a t i o n   =   ( d a t e t i m e ) 0 ;  
 	 	 i n t   s i z e                         =   A r r a y S i z e ( c a c h e d I t e m s ) ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 {  
 	 	 	 i f   ( c a c h e d I t e m s [ i ] . t i c k e t   = =   t i c k e t )  
 	 	 	 {  
 	 	 	 	 e x p i r a t i o n   =   c a c h e d I t e m s [ i ] . e x p i r a t i o n ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
  
 	 	 r e t u r n   e x p i r a t i o n ;  
 	 }  
  
 	 v o i d   R e m o v e E x p i r a t i o n ( l o n g   t i c k e t )  
 	 {  
 	 	 R e m o v e E x p i r a t i o n O b j e c t ( t i c k e t ) ;  
 	 	 R e m o v e E x p i r a t i o n F r o m C a c h e ( t i c k e t ) ;  
 	 }  
  
 	 v o i d   R u n ( )  
 	 {  
 	 	 i n t   c o u n t   =   A r r a y S i z e ( c a c h e d I t e m s ) ;  
  
 	 	 i f   ( c o u n t   >   0 )  
 	 	 {  
 	 	 	 d a t e t i m e   t i m e N o w   =   T i m e C u r r e n t ( ) ;  
  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   c o u n t ;   i + + )  
 	 	 	 {  
 	 	 	 	 i f   ( t i m e N o w   > =   c a c h e d I t e m s [ i ] . e x p i r a t i o n )  
 	 	 	 	 {  
 	 	 	 	 	 l o n g   t i c k e t                       =   c a c h e d I t e m s [ i ] . t i c k e t ;  
 	 	 	 	 	 b o o l   r e m o v e E x p i r a t i o n   =   f a l s e ;  
  
 	 	 	 	 	 i f   ( T r a d e E x i s t s ( t i c k e t ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( C l o s e T r a d e ( t i c k e t ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 P r i n t ( " c l o s e   # " ,   t i c k e t ,   "   b y   e x p i r a t i o n " ) ;  
 	 	 	 	 	 	 	 r e m o v e E x p i r a t i o n   =   t r u e ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e m o v e E x p i r a t i o n   =   t r u e ;  
 	 	 	 	 	 }  
  
 	 	 	 	 	 i f   ( r e m o v e E x p i r a t i o n )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 R e m o v e E x p i r a t i o n ( t i c k e t ) ;  
  
 	 	 	 	 	 	 / /   R e m o v i n g   e x p i r a t i o n   c a u s e s   c h a n g e   i n   t h e   s i z e   o f   t h e   c a c h e ,  
 	 	 	 	 	 	 / /   s o   r e s e t   o f   t h e   s i z e   a n d   o n e   s t e p   b a c k   o f   t h e   i n d e x   i s   n e e d e d  
 	 	 	 	 	 	 c o u n t   =   A r r a y S i z e ( c a c h e d I t e m s ) ;  
 	 	 	 	 	 	 i - - ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
 } ;  
  
 E x p i r a t i o n W o r k e r   e x p i r a t i o n W o r k e r ;  
  
 v o i d   H i s t o r y T r a d e s T o t a l R e s e t ( )  
 {  
 	 i f   ( S e l e c t e d H i s t o r y T o T i m e ( )   >   0   | |   S e l e c t e d H i s t o r y F r o m T i m e ( )   >   0 )   {  
 	 	 H i s t o r y S e l e c t ( S e l e c t e d H i s t o r y F r o m T i m e ( ) ,   S e l e c t e d H i s t o r y T o T i m e ( ) ) ;  
 	 }  
 }  
  
 b o o l   I s F i l l i n g T y p e A l l o w e d ( s t r i n g   s y m b o l , i n t   f i l l _ t y p e )  
 {  
 / / - - -   O b t a i n   t h e   v a l u e   o f   t h e   p r o p e r t y   t h a t   d e s c r i b e s   a l l o w e d   f i l l i n g   m o d e s  
       i n t   f i l l i n g = ( i n t ) S y m b o l I n f o I n t e g e r ( s y m b o l , S Y M B O L _ F I L L I N G _ M O D E ) ;  
 / / - - -   R e t u r n   t r u e ,   i f   m o d e   f i l l _ t y p e   i s   a l l o w e d  
       r e t u r n ( ( f i l l i n g   &   f i l l _ t y p e ) = = f i l l _ t y p e ) ;  
 }  
  
 b o o l   L o a d P e n d i n g O r d e r ( l o n g   t i c k e t )  
 {  
 	 b o o l   s u c c e s s   =   f a l s e ;  
  
       i f   ( O r d e r S e l e c t ( t i c k e t ) )  
 	 {  
 	 	 / /   T h e   o r d e r   c o u l d   b e   f r o m   a n y   t y p e ,   s o   c h e c k   t h e   t y p e  
 	 	 / /   a n d   a l l o w   o n l y   t r u e   p e n d i n g   o r d e r s .  
 	 	 E N U M _ O R D E R _ T Y P E   t y p e   =   ( E N U M _ O R D E R _ T Y P E ) O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) ;  
  
 	 	 i f   (  
 	 	 	       t y p e   = =   O R D E R _ T Y P E _ B U Y _ L I M I T  
 	 	 	 | |   t y p e   = =   O R D E R _ T Y P E _ S E L L _ L I M I T  
 	 	 	 | |   t y p e   = =   O R D E R _ T Y P E _ B U Y _ S T O P  
 	 	 	 | |   t y p e   = =   O R D E R _ T Y P E _ S E L L _ S T O P  
 	 	 )   {  
 	 	 	 L o a d e d T y p e ( 2 ) ;  
 	 	 	 O r d e r T i c k e t ( t i c k e t ) ;  
 	 	 	 s u c c e s s   =   t r u e ;  
 	 	 }  
 	 }  
  
       r e t u r n   s u c c e s s ;  
 }  
  
 b o o l   L o a d P o s i t i o n ( u l o n g   t i c k e t )  
 {  
       b o o l   s u c c e s s   =   P o s i t i o n S e l e c t B y T i c k e t ( t i c k e t ) ;  
  
       i f   ( s u c c e s s )   {  
 	 	 L o a d e d T y p e ( 1 ) ;  
 	 	 O r d e r T i c k e t ( t i c k e t ) ;  
 	 }  
  
       r e t u r n   s u c c e s s ;  
 }  
  
 i n t   L o a d e d T y p e ( i n t   t y p e   =   0 )  
 {  
 	 / /   1   -   p o s i t i o n  
 	 / /   2   -   p e n d i n g   o r d e r  
 	 / /   3   -   h i s t o r y   p o s i t i o n  
 	 / /   4   -   h i s t o r y   p e n d i n g   o r d e r  
  
 	 s t a t i c   i n t   m e m o r y ;  
  
 	 i f   ( t y p e   >   0 )   { m e m o r y   =   t y p e ; }  
  
 	 r e t u r n   m e m o r y ;  
 }  
  
 i n t   O C O D r i v e r ( )  
 {  
 	 s t a t i c   l o n g   l a s t _ k n o w n _ t i c k e t   =   0 ;  
 	 s t a t i c   l o n g   o r d e r s 1 [ ] ;  
 	 s t a t i c   l o n g   o r d e r s 2 [ ] ;  
 	 i n t   i ,   s i z e ;  
  
 	 i n t   t o t a l   =   O r d e r s T o t a l ( ) ;  
  
 	 f o r   ( i n t   p o s = t o t a l - 1 ;   p o s > = 0 ;   p o s - - )  
 	 {  
 	 	 i f   ( L o a d P e n d i n g O r d e r ( O r d e r G e t T i c k e t ( p o s ) ) )  
 	 	 {  
 	 	 	 l o n g   t i c k e t   =   O r d e r T i c k e t ( ) ;  
  
 	 	 	 / / - -   e n d   h e r e   i f   w e   r e a c h   t h e   l a s t   k n o w n   t i c k e t  
 	 	 	 i f   ( t i c k e t   = =   l a s t _ k n o w n _ t i c k e t )   { b r e a k ; }  
  
 	 	 	 / / - -   s e t   t h e   l a s t   k n o w n   t i c k e t ,   o n l y   i f   t h i s   i s   t h e   f i r s t   i t e r a t i o n  
 	 	 	 i f   ( p o s   = =   t o t a l - 1 )   {  
 	 	 	 	 l a s t _ k n o w n _ t i c k e t   =   t i c k e t ;  
 	 	 	 }  
  
 	 	 	 / / - -   w e   a r e   s e a r c h i n g   f o r   p e n d i n g   o r d e r s ,   s k i p   t r a d e s  
 	 	 	 i f   ( O r d e r T y p e ( )   < =   O R D E R _ T Y P E _ S E L L )   { c o n t i n u e ; }  
  
 	 	 	 / / - -  
 	 	 	 i f   ( S t r i n g S u b s t r ( O r d e r C o m m e n t ( ) ,   0 ,   5 )   = =   " [ o c o : " )  
 	 	 	 {  
 	 	 	 	 i n t   t i c k e t _ o c o   =   S t r T o I n t e g e r ( S t r i n g S u b s t r ( O r d e r C o m m e n t ( ) ,   5 ,   S t r i n g L e n ( O r d e r C o m m e n t ( ) ) - 1 ) ) ;    
  
 	 	 	 	 b o o l   f o u n d   =   f a l s e ;  
 	 	 	 	 s i z e   =   A r r a y S i z e ( o r d e r s 2 ) ;  
 	 	 	 	 f o r   ( i = 0 ;   i < s i z e ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( o r d e r s 2 [ i ]   = =   t i c k e t _ o c o )   {  
 	 	 	 	 	 	 f o u n d   =   t r u e ;  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( f o u n d   = =   f a l s e )   {  
 	 	 	 	 	 A r r a y R e s i z e ( o r d e r s 1 ,   s i z e + 1 ) ;  
 	 	 	 	 	 A r r a y R e s i z e ( o r d e r s 2 ,   s i z e + 1 ) ;  
 	 	 	 	 	 o r d e r s 1 [ s i z e ]   =   t i c k e t _ o c o ;  
 	 	 	 	 	 o r d e r s 2 [ s i z e ]   =   t i c k e t ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 s i z e   =   A r r a y S i z e ( o r d e r s 1 ) ;  
 	 i n t   d b r e m o v e   =   f a l s e ;  
  
 	 f o r   ( i   =   s i z e   -   1 ;   i   > =   0 ;   i - - )  
 	 {  
 	 	 i f   ( L o a d P e n d i n g O r d e r ( o r d e r s 1 [ i ] )   = =   f a l s e   | |   O r d e r T y p e ( )   < =   O R D E R _ T Y P E _ S E L L )  
 	 	 {  
 	 	 	 i f   ( L o a d P e n d i n g O r d e r ( o r d e r s 2 [ i ] ) )   {  
 	 	 	 	 i f   ( D e l e t e O r d e r ( o r d e r s 2 [ i ] ) )  
 	 	 	 	 {  
 	 	 	 	 	 d b r e m o v e   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e   {  
 	 	 	 	 d b r e m o v e   =   t r u e ;  
 	 	 	 }  
 	 	 	  
 	 	 	 i f   ( d b r e m o v e   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 A r r a y S t r i p K e y ( o r d e r s 1 ,   i ) ;  
 	 	 	 	 A r r a y S t r i p K e y ( o r d e r s 2 ,   i ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 s i z e   =   A r r a y S i z e ( o r d e r s 2 ) ;  
 	 d b r e m o v e   =   f a l s e ;  
 	 f o r   ( i = s i z e - 1 ;   i > = 0 ;   i - - )  
 	 {  
 	 	 i f   ( L o a d P e n d i n g O r d e r ( o r d e r s 2 [ i ] )   = =   f a l s e   | |   O r d e r T y p e ( )   < =   O R D E R _ T Y P E _ S E L L )  
 	 	 {  
 	 	 	 i f   ( L o a d P e n d i n g O r d e r ( o r d e r s 1 [ i ] ) )   {  
 	 	 	 	 i f   ( D e l e t e O r d e r ( o r d e r s 1 [ i ] ) )  
 	 	 	 	 {  
 	 	 	 	 	 d b r e m o v e   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e   {  
 	 	 	 	 d b r e m o v e   =   t r u e ;  
 	 	 	 }  
 	 	 	  
 	 	 	 i f   ( d b r e m o v e   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 A r r a y S t r i p K e y ( o r d e r s 1 ,   i ) ;  
 	 	 	 	 A r r a y S t r i p K e y ( o r d e r s 2 ,   i ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 r e t u r n   t r u e ;  
 }  
  
 b o o l   O n T i m e r S e t ( d o u b l e   s e c o n d s )  
 {  
       i f   ( s e c o n d s < = 0 )   {  
             E v e n t K i l l T i m e r ( ) ;  
       }  
       e l s e   i f   ( s e c o n d s   <   1 )   {  
             r e t u r n   ( E v e n t S e t M i l l i s e c o n d T i m e r ( ( i n t ) ( s e c o n d s * 1 0 0 0 ) ) ) ;      
       }  
       e l s e   {  
             r e t u r n   ( E v e n t S e t T i m e r ( ( i n t ) s e c o n d s ) ) ;  
       }  
        
       r e t u r n   t r u e ;  
 }  
  
 c l a s s   O n T r a d e E v e n t D e t e c t o r  
 {  
 p r i v a t e :  
 	 / / - - -   s t r u c t u r e s  
 	 s t r u c t   E v e n t V a l u e s  
 	 {  
 	 	 / /   s p e c i a l   f i e l d s  
 	 	 s t r i n g       r e a s o n ,  
 	 	                   d e t a i l ;  
  
 	 	 / /   o r d e r   r e l a t e d   f i e l d s  
 	 	 l o n g           m a g i c ,  
 	 	                   t i c k e t ;  
 	 	 i n t             t y p e ;  
 	 	 d a t e t i m e   t i m e C l o s e ,  
 	 	                   t i m e O p e n ,  
 	 	                   t i m e E x p i r a t i o n ;  
 	 	 d o u b l e       c o m m i s s i o n ,  
 	 	                   p r i c e O p e n ,  
 	 	                   p r i c e C l o s e ,  
 	 	                   p r o f i t ,  
 	 	                   s t o p L o s s ,  
 	 	                   s w a p ,  
 	 	                   t a k e P r o f i t ,  
 	 	                   v o l u m e ;  
 	 	 s t r i n g       c o m m e n t ,  
 	 	                   s y m b o l ;  
 	 } ;  
  
 	 s t r u c t   P o s i t i o n  
 	 {  
 	 	 E N U M _ P O S I T I O N _ T Y P E   t y p e ;  
 	 	 E N U M _ P O S I T I O N _ R E A S O N   r e a s o n ;  
 	 	 l o n g           p o s i t i o n I d ,  
 	 	                   m a g i c ,  
 	 	                   t i c k e t ,  
 	 	                   t i m e M s ,  
 	 	                   t i m e U p d a t e M s ;  
 	 	 d a t e t i m e   t i m e ,  
 	 	 	 	 	 t i m e E x p i r a t i o n ,  
 	 	                   t i m e U p d a t e ;  
 	 	 d o u b l e       p r i c e C u r r e n t ,  
 	 	                   p r i c e O p e n ,  
 	 	                   p r o f i t ,  
 	 	                   s t o p L o s s ,  
 	 	                   s w a p ,  
 	 	                   t a k e P r o f i t ,  
 	 	                   v o l u m e ;  
 	 	 s t r i n g       e x t e r n a l I d ,  
 	 	                   c o m m e n t ,  
 	 	                   s y m b o l ;  
 	 } ;  
  
 	 s t r u c t   P e n d i n g O r d e r  
 	 {  
 	 	 E N U M _ O R D E R _ T Y P E   t y p e ;  
 	 	 E N U M _ O R D E R _ S T A T E   s t a t e ;  
 	 	 E N U M _ O R D E R _ T Y P E _ F I L L I N G   t y p e F i l l i n g ;  
 	 	 E N U M _ O R D E R _ T Y P E _ T I M E   t y p e T i m e ;  
 	 	 E N U M _ O R D E R _ R E A S O N   r e a s o n ;  
 	 	 l o n g           m a g i c ,  
 	 	                   p o s i t i o n I d ,  
 	 	                   p o s i t i o n B y I d ,  
 	 	                   t i c k e t ,  
 	 	                   t i m e S e t u p M s ,  
 	 	                   t i m e D o n e M s ;  
 	 	 d a t e t i m e   t i m e D o n e ,  
 	 	                   t i m e E x p i r a t i o n ,  
 	 	                   t i m e S e t u p ;  
 	 	 d o u b l e       p r i c e C u r r e n t ,  
 	 	                   p r i c e O p e n ,  
 	 	                   p r i c e S t o p L i m i t ,  
 	 	                   s t o p L o s s ,  
 	 	                   t a k e P r o f i t ,  
 	 	                   v o l u m e ,  
 	 	                   v o l u m e I n i t i a l ;  
 	 	 s t r i n g       e x t e r n a l I d ,  
 	 	                   c o m m e n t ,  
 	 	                   s y m b o l ;  
 	 } ;  
 	  
 	 s t r u c t   P o s i t i o n E x p i r a t i o n T i m e s  
 	 {  
 	 	 l o n g   t i c k e t ;  
 	 	 d a t e t i m e   t i m e E x p i r a t i o n ;  
 	 } ;  
  
 	 / / - - -   v a r i a b l e s   a n d   a r r a y s  
 	 b o o l   d e b u g ;  
  
 	 i n t   e v e n t V a l u e s Q u e u e I n d e x ;  
 	 E v e n t V a l u e s   e v e n t V a l u e s [ ] ;  
  
 	 P e n d i n g O r d e r   p r e v i o u s P e n d i n g O r d e r s [ ] ;  
 	 P e n d i n g O r d e r   p e n d i n g O r d e r s [ ] ;  
  
 	 P o s i t i o n   p r e v i o u s P o s i t i o n s [ ] ;  
 	 P o s i t i o n   p o s i t i o n s [ ] ;  
  
 	 P o s i t i o n E x p i r a t i o n T i m e s   p o s i t i o n E x p i r a t i o n T i m e s [ ] ;  
  
 	 / / - - -   m e t h o d s  
  
 	 / * *  
 	 *   L i k e   A r r a y C o p y ( ) ,   b u t   f o r   a n y   t y p e .  
 	 * /  
 	 t e m p l a t e < t y p e n a m e   T >  
 	 v o i d   C o p y L i s t ( T   & d e s t [ ] ,   T   & s r c [ ] )  
 	 {  
 	 	 i n t   s i z e   =   A r r a y S i z e ( s r c ) ;  
 	 	 A r r a y R e s i z e ( d e s t ,   s i z e ) ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 {  
 	 	 	 d e s t [ i ]   =   s r c [ i ] ;  
 	 	 }  
 	 }  
  
 	 / * *  
 	 *   O v e r l o a d e d   m e t h o d   1   o f   2  
 	 * /  
 	 i n t   M a k e L i s t O f ( P e n d i n g O r d e r   & l i s t [ ] )  
 	 {  
 	 	 A r r a y R e s i z e ( l i s t ,   0 ) ;  
  
 	 	 i n t   c o u n t                 =   O r d e r s T o t a l ( ) ;  
 	 	 i n t   h o w M a n y A d d e d   =   0 ;  
  
 	 	 f o r   ( i n t   i n d e x   =   0 ;   i n d e x   <   c o u n t ;   i n d e x + + )  
 	 	 {  
 	 	 	 i f   ( O r d e r G e t T i c k e t ( i n d e x )   < =   0 )   c o n t i n u e ;  
  
 	 	 	 h o w M a n y A d d e d + + ;  
 	 	 	 A r r a y R e s i z e ( l i s t ,   h o w M a n y A d d e d ) ;  
 	 	 	 i n t   i   =   h o w M a n y A d d e d   -   1 ;  
  
 	 	 	 / /   e n u m   t y p e s  
 	 	 	 l i s t [ i ] . t y p e                 =   ( E N U M _ O R D E R _ T Y P E ) O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) ;  
 	 	 	 l i s t [ i ] . s t a t e               =   ( E N U M _ O R D E R _ S T A T E ) O r d e r G e t I n t e g e r ( O R D E R _ S T A T E ) ;  
 	 	 	 l i s t [ i ] . t y p e F i l l i n g   =   ( E N U M _ O R D E R _ T Y P E _ F I L L I N G ) O r d e r G e t I n t e g e r ( O R D E R _ T Y P E _ F I L L I N G ) ;  
 	 	 	 l i s t [ i ] . t y p e T i m e         =   ( E N U M _ O R D E R _ T Y P E _ T I M E ) O r d e r G e t I n t e g e r ( O R D E R _ T Y P E _ T I M E ) ;  
 	 	 	 l i s t [ i ] . r e a s o n             =   ( E N U M _ O R D E R _ R E A S O N ) O r d e r G e t I n t e g e r ( O R D E R _ R E A S O N ) ;  
  
 	 	 	 / /   l o n g  
 	 	 	 l i s t [ i ] . m a g i c                 =   ( l o n g ) O r d e r G e t I n t e g e r ( O R D E R _ M A G I C ) ;  
 	 	 	 l i s t [ i ] . p o s i t i o n I d       =   ( l o n g ) O r d e r G e t I n t e g e r ( O R D E R _ P O S I T I O N _ I D ) ;  
 	 	 	 l i s t [ i ] . p o s i t i o n B y I d   =   ( l o n g ) O r d e r G e t I n t e g e r ( O R D E R _ P O S I T I O N _ B Y _ I D ) ;  
 	 	 	 l i s t [ i ] . t i c k e t               =   ( l o n g ) O r d e r G e t I n t e g e r ( O R D E R _ T I C K E T ) ;  
 	 	 	 l i s t [ i ] . t i m e S e t u p M s     =   ( l o n g ) O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ S E T U P _ M S C ) ;  
 	 	 	 l i s t [ i ] . t i m e D o n e M s       =   ( l o n g ) O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ D O N E _ M S C ) ;  
  
 	 	 	 / /   d a t e t i m e  
 	 	 	 l i s t [ i ] . t i m e D o n e               =   ( d a t e t i m e ) O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ D O N E ) ;  
 	 	 	 l i s t [ i ] . t i m e E x p i r a t i o n   =   ( d a t e t i m e ) O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ E X P I R A T I O N ) ;  
 	 	 	 l i s t [ i ] . t i m e S e t u p             =   ( d a t e t i m e ) O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ S E T U P ) ;  
  
 	 	 	 / /   d o u b l e  
 	 	 	 l i s t [ i ] . p r i c e C u r r e n t       =   O r d e r G e t D o u b l e ( O R D E R _ P R I C E _ C U R R E N T ) ;  
 	 	 	 l i s t [ i ] . p r i c e O p e n             =   O r d e r G e t D o u b l e ( O R D E R _ P R I C E _ O P E N ) ;  
 	 	 	 l i s t [ i ] . p r i c e S t o p L i m i t   =   O r d e r G e t D o u b l e ( O R D E R _ P R I C E _ S T O P L I M I T ) ;  
 	 	 	 l i s t [ i ] . s t o p L o s s               =   O r d e r G e t D o u b l e ( O R D E R _ S L ) ;  
 	 	 	 l i s t [ i ] . t a k e P r o f i t           =   O r d e r G e t D o u b l e ( O R D E R _ T P ) ;  
 	 	 	 l i s t [ i ] . v o l u m e                   =   O r d e r G e t D o u b l e ( O R D E R _ V O L U M E _ C U R R E N T ) ;  
 	 	 	 l i s t [ i ] . v o l u m e I n i t i a l     =   O r d e r G e t D o u b l e ( O R D E R _ V O L U M E _ I N I T I A L ) ;  
  
 	 	 	 / /   s t r i n g  
 	 	 	 l i s t [ i ] . e x t e r n a l I d   =   O r d e r G e t S t r i n g ( O R D E R _ E X T E R N A L _ I D ) ;  
 	 	 	 l i s t [ i ] . c o m m e n t         =   O r d e r G e t S t r i n g ( O R D E R _ C O M M E N T ) ;  
 	 	 	 l i s t [ i ] . s y m b o l           =   O r d e r G e t S t r i n g ( O R D E R _ S Y M B O L ) ;  
 	 	 }  
  
 	 	 r e t u r n   h o w M a n y A d d e d ;  
 	 }  
  
 	 / * *  
 	 *   O v e r l o a d e d   m e t h o d   2   o f   2  
 	 * /  
 	 i n t   M a k e L i s t O f ( P o s i t i o n   & l i s t [ ] )  
 	 {  
 	 	 A r r a y R e s i z e ( l i s t ,   0 ) ;  
  
 	 	 i n t   c o u n t                 =   P o s i t i o n s T o t a l ( ) ;  
 	 	 i n t   h o w M a n y A d d e d   =   0 ;  
  
 	 	 f o r   ( i n t   i n d e x   =   0 ;   i n d e x   <   c o u n t ;   i n d e x + + )  
 	 	 {  
 	 	 	 i f   ( P o s i t i o n G e t T i c k e t ( i n d e x )   < =   0 )   c o n t i n u e ;  
  
 	 	 	 h o w M a n y A d d e d + + ;  
 	 	 	 A r r a y R e s i z e ( l i s t ,   h o w M a n y A d d e d ) ;  
 	 	 	 i n t   i   =   h o w M a n y A d d e d   -   1 ;  
  
 	 	 	 / /   e n u m   t y p e s  
 	 	 	 l i s t [ i ] . t y p e       =   ( E N U M _ P O S I T I O N _ T Y P E ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) ;  
 	 	 	 l i s t [ i ] . r e a s o n   =   ( E N U M _ P O S I T I O N _ R E A S O N ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ R E A S O N ) ;  
  
 	 	 	 / /   l o n g  
 	 	 	 l i s t [ i ] . p o s i t i o n I d       =   ( l o n g ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ I D E N T I F I E R ) ;  
 	 	 	 l i s t [ i ] . m a g i c                 =   ( l o n g ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ M A G I C ) ;  
 	 	 	 l i s t [ i ] . t i c k e t               =   ( l o n g ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T I C K E T ) ;  
 	 	 	 l i s t [ i ] . t i m e M s               =   ( l o n g ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T I M E _ M S C ) ;  
 	 	 	 l i s t [ i ] . t i m e U p d a t e M s   =   ( l o n g ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T I M E _ U P D A T E _ M S C ) ;  
  
 	 	 	 / /   d a t e t i m e  
 	 	 	 l i s t [ i ] . t i m e                       =   ( d a t e t i m e ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T I M E ) ;  
 	 	 	 l i s t [ i ] . t i m e E x p i r a t i o n   =   ( d a t e t i m e ) 0 ;  
 	 	 	 l i s t [ i ] . t i m e U p d a t e           =   ( d a t e t i m e ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T I M E _ U P D A T E ) ;  
  
 	 	 	 / /   d o u b l e  
 	 	 	 l i s t [ i ] . p r i c e C u r r e n t   =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ P R I C E _ C U R R E N T ) ;  
 	 	 	 l i s t [ i ] . p r i c e O p e n         =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ P R I C E _ O P E N ) ;  
 	 	 	 l i s t [ i ] . p r o f i t               =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ P R O F I T ) ;  
 	 	 	 l i s t [ i ] . s t o p L o s s           =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) ;  
 	 	 	 l i s t [ i ] . s w a p                   =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S W A P ) ;  
 	 	 	 l i s t [ i ] . t a k e P r o f i t       =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ T P ) ;  
 	 	 	 l i s t [ i ] . v o l u m e               =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ V O L U M E ) ;  
  
 	 	 	 / /   s t r i n g  
 	 	 	 l i s t [ i ] . e x t e r n a l I d   =   P o s i t i o n G e t S t r i n g ( P O S I T I O N _ E X T E R N A L _ I D ) ;  
 	 	 	 l i s t [ i ] . c o m m e n t         =   P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) ;  
 	 	 	 l i s t [ i ] . s y m b o l           =   P o s i t i o n G e t S t r i n g ( P O S I T I O N _ S Y M B O L ) ;  
  
 	 	 	 / /   e x t r a c t   e x p i r a t i o n  
 	 	 	 l i s t [ i ] . t i m e E x p i r a t i o n   =   e x p i r a t i o n W o r k e r . G e t E x p i r a t i o n ( l i s t [ i ] . t i c k e t ) ;  
  
 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 	 {  
 	 	 	 	 l i s t [ i ] . s t o p L o s s       =   V i r t u a l S t o p s D r i v e r ( " g e t   s l " ,   l i s t [ i ] . t i c k e t ) ;  
 	 	 	 	 l i s t [ i ] . t a k e P r o f i t   =   V i r t u a l S t o p s D r i v e r ( " g e t   t p " ,   l i s t [ i ] . t i c k e t ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 r e t u r n   h o w M a n y A d d e d ;  
 	 }  
  
 	 / * *  
 	 *   T h i s   m e t h o d   l o o p s   t h r o u g h   2   l i s t s   o f   i t e m s   a n d   f i n d s   a   d i f f e r e n c e .   T h i s   d i f f e r e n c e   i s   t h e   e v e n t .  
 	 *   " I t e m s "   a r e   e i t h e r   p e n d i n g   o r d e r s   o r   p o s i t i o n s .  
 	 *  
 	 *   R e t u r n s   t r u e   i f   a n   e v e n t   i s   d e t e c t e d   o r   f a l s e   i f   n o t .  
 	 * /  
 	 t e m p l a t e < t y p e n a m e   I T E M S _ T Y P E >    
 	 b o o l   D e t e c t E v e n t ( I T E M S _ T Y P E   & p r e v i o u s I t e m s [ ] ,   I T E M S _ T Y P E   & c u r r e n t I t e m s [ ] )  
 	 {  
 	 	 I T E M S _ T Y P E   i t e m ;  
 	 	 s t r i n g   r e a s o n       =   " " ;  
 	 	 s t r i n g   d e t a i l       =   " " ;  
 	 	 i n t   c o u n t B e f o r e   =   A r r a y S i z e ( p r e v i o u s I t e m s ) ;  
 	 	 i n t   c o u n t N o w         =   A r r a y S i z e ( c u r r e n t I t e m s ) ;  
  
 	 	 / /   N e w  
 	 	 i f   ( c o u n t B e f o r e   <   c o u n t N o w )  
 	 	 {  
 	 	 	 i t e m       =   c u r r e n t I t e m s [ c o u n t N o w   -   1 ] ;  
 	 	 	 r e a s o n   =   " n e w " ;  
 	 	 }  
 	 	 / /   G o n e  
 	 	 e l s e   i f   ( c o u n t B e f o r e   >   c o u n t N o w )  
 	 	 {  
 	 	 	 i t e m       =   F i n d M i s s i n g I t e m ( p r e v i o u s I t e m s ,   c u r r e n t I t e m s ) ;  
 	 	 	 r e a s o n   =   " c l o s e " ;  
 	 	 }  
 	 	 / /   S a m e   = >   c h e c k   f o r   m o d i f i c a t i o n s  
 	 	 e l s e   i f   ( c o u n t B e f o r e   = =   c o u n t N o w   & &   c o u n t N o w   >   0 )  
 	 	 {  
 	 	 	 i n t   c o u n t   =   A r r a y S i z e ( c u r r e n t I t e m s ) ;  
  
 	 	 	 f o r   ( i n t   i n d e x   =   0 ;   i n d e x   <   c o u n t ;   i n d e x + + )  
 	 	 	 {  
 	 	 	 	 i t e m   =   c u r r e n t I t e m s [ i n d e x ] ;  
 	 	 	 	 I T E M S _ T Y P E   p r e v i o u s   =   p r e v i o u s I t e m s [ i n d e x ] ;  
 	 	 	 	 I T E M S _ T Y P E   c u r r e n t     =   c u r r e n t I t e m s [ i n d e x ] ;  
  
 	 	 	 	 i f   ( p r e v i o u s . t i c k e t   ! =   c u r r e n t . t i c k e t )  
 	 	 	 	 {  
 	 	 	 	 	 / /   T y p e   = >   v o l u m e   m o d i f i e d  
 	 	 	 	 	 i f   ( p r e v i o u s . p o s i t i o n I d   = =   c u r r e n t . p o s i t i o n I d )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e a s o n   =   " r e v e r s e " ;  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 P r i n t ( " P o s i t i o n s   o r d e r   m i s m a t c h " ) ;  
 	 	 	 	 	 }  
 	 	 	 	 	  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r e v i o u s . v o l u m e   ! =   c u r r e n t . v o l u m e )  
 	 	 	 	 {  
 	 	 	 	 	 / /   V o l u m e   i n c r e m e n t  
 	 	 	 	 	 i f   ( p r e v i o u s . v o l u m e   <   c u r r e n t . v o l u m e )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e a s o n   =   " i n c r e m e n t " ;  
  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 	 / /   V o l u m e   d e c r e m e n t  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e a s o n   =   " d e c r e m e n t " ;  
  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
  
 	 	 	 	 / /   S L   &   T P   m o d i f i e d  
 	 	 	 	 i f   (  
 	 	 	 	 	       p r e v i o u s . s t o p L o s s   ! =   c u r r e n t . s t o p L o s s  
 	 	 	 	 	 & &   p r e v i o u s . t a k e P r o f i t   ! =   c u r r e n t . t a k e P r o f i t  
 	 	 	 	 )   {  
 	 	 	 	 	 r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 d e t a i l   =   " s l t p " ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 	 / /   S L   m o d i f i e d  
 	 	 	 	 e l s e   i f   ( p r e v i o u s . s t o p L o s s   ! =   c u r r e n t . s t o p L o s s )  
 	 	 	 	 {  
 	 	 	 	 	 r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 d e t a i l   =   " s l " ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 	 / /   T P   m o d i f i e d  
 	 	 	 	 e l s e   i f   ( p r e v i o u s . t a k e P r o f i t   ! =   c u r r e n t . t a k e P r o f i t )  
 	 	 	 	 {  
 	 	 	 	 	 r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 d e t a i l   =   " t p " ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 	  
 	 	 	 	 i f   ( p r e v i o u s . t i m e E x p i r a t i o n   ! =   c u r r e n t . t i m e E x p i r a t i o n )  
 	 	 	 	 {  
 	 	 	 	 	 r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 d e t a i l   =   " e x p i r a t i o n " ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( r e a s o n   = =   " " )  
 	 	 {  
 	 	 	 r e t u r n   f a l s e ;  
 	 	 }  
  
 	 	 U p d a t e V a l u e s ( i t e m ,   r e a s o n ,   d e t a i l ) ;  
  
 	 	 r e t u r n   t r u e ;  
 	 }  
  
 	 / * *  
 	 *   F r o m   t h e   l i s t   o f   p r e v i o u s   o r d e r s   o r   p o s i t i o n s ,   f i n d   t h e   i t e m   t h a t   i s   m i s s i n g  
 	 *   i n   t h e   l i s t   o f   c u r r e n t   o r d e r s   o r   p o s i t i o n s .  
 	 *  
 	 *   R e t u r n   t h e   t i c k e t   n u m b e r   o r   0   i f   n o t h i n g   i s   f o u n d .  
 	 * /  
 	 t e m p l a t e < t y p e n a m e   T >    
 	 T   F i n d M i s s i n g I t e m ( T   & p r e v i o u s [ ] ,   T   & c u r r e n t [ ] )  
 	 {  
 	 	 i n t   p r e v i o u s C o u n t   =   A r r a y S i z e ( p r e v i o u s ) ;  
 	 	 i n t   c u r r e n t C o u n t     =   A r r a y S i z e ( c u r r e n t ) ;  
 	 	 T   i t e m ;  
  
 	 	 l o n g   t i c k e t   =   0 ;  
  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   p r e v i o u s C o u n t ;   i + + )  
 	 	 {  
 	 	 	 b o o l   f o u n d   =   f a l s e ;  
  
 	 	 	 f o r   ( i n t   j   =   0 ;   j   <   c u r r e n t C o u n t ;   j + + )  
 	 	 	 {  
 	 	 	 	 i f   ( p r e v i o u s [ i ] . t i c k e t   = =   c u r r e n t [ j ] . t i c k e t )  
 	 	 	 	 {  
 	 	 	 	 	 f o u n d   =   t r u e ;  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( f o u n d   = =   f a l s e )  
 	 	 	 {  
 	 	 	 	 i t e m   =   p r e v i o u s [ i ] ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
  
 	 	 r e t u r n   i t e m ;  
 	 }  
  
 	 / * *  
 	 *   O v e r l o a d e d   m e t h o d   1   o f   2  
 	 * /  
 	 v o i d   U p d a t e V a l u e s ( P o s i t i o n   & i t e m ,   s t r i n g   r e a s o n ,   s t r i n g   d e t a i l )  
 	 {  
 	 	 l o n g   t i c k e t                 =   i t e m . t i c k e t ;  
 	 	 d a t e t i m e   t i m e O p e n     =   i t e m . t i m e ;  
 	 	 d a t e t i m e   t i m e C l o s e   =   ( d a t e t i m e ) 0 ;  
 	 	 d o u b l e   p r i c e O p e n       =   i t e m . p r i c e O p e n ;  
 	 	 d o u b l e   p r i c e C l o s e     =   i t e m . p r i c e C u r r e n t ;  
 	 	 d o u b l e   p r o f i t             =   i t e m . p r o f i t ;  
 	 	 d o u b l e   s w a p                 =   i t e m . s w a p ;  
 	 	 d o u b l e   c o m m i s s i o n     =   0 . 0 ;  
 	 	 d o u b l e   v o l u m e             =   i t e m . v o l u m e ;  
  
 	 	 i f   ( r e a s o n   = =   " c l o s e "   | |   r e a s o n   = =   " d e c r e m e n t " )  
 	 	 {  
 	 	 	 i f   ( H i s t o r y S e l e c t B y P o s i t i o n ( i t e m . p o s i t i o n I d ) )  
 	 	 	 {  
 	 	 	 	 i n t   t o t a l   =   H i s t o r y D e a l s T o t a l ( ) ;  
  
 	 	 	 	 i f   ( t o t a l   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 l o n g   f i r s t T i c k e t   =   ( l o n g ) H i s t o r y D e a l G e t T i c k e t ( 0 ) ;  
 	 	 	 	 	 l o n g   l a s t T i c k e t     =   ( l o n g ) H i s t o r y D e a l G e t T i c k e t ( t o t a l   -   1 ) ;  
  
 	 	 	 	 	 / /   T i c k e t   i s   t h e   t i c k e t   o f   t h e   p r e v i o u s   d e a l ,   t h e   o n e   b e f o r e   t h e   l a s t   o n e  
 	 	 	 	 	 t i c k e t   =   ( l o n g ) H i s t o r y D e a l G e t T i c k e t ( t o t a l   -   2 ) ;  
  
 	 	 	 	 	 / /   O p e n   T i m e   a n d   O p e n   P r i c e   -   g e t   t h e m   f r o m   t h e   v e r y   f i r s t   d e a l  
 	 	 	 	 	 p r i c e O p e n   =   H i s t o r y D e a l G e t D o u b l e ( f i r s t T i c k e t ,   D E A L _ P R I C E ) ;  
 	 	 	 	 	 t i m e O p e n     =   ( d a t e t i m e ) H i s t o r y D e a l G e t I n t e g e r ( f i r s t T i c k e t ,   D E A L _ T I M E ) ;  
  
 	 	 	 	 	 / /   C l o s e   T i m e   -   g e t   i t   f r o m   t h e   v e r y   l a s t   d e a l  
 	 	 	 	 	 t i m e C l o s e     =   ( d a t e t i m e ) H i s t o r y D e a l G e t I n t e g e r ( l a s t T i c k e t ,   D E A L _ T I M E ) ;  
 	 	 	 	 	 p r i c e C l o s e   =   H i s t o r y D e a l G e t D o u b l e ( l a s t T i c k e t ,   D E A L _ P R I C E ) ;  
  
 	 	 	 	 	 p r o f i t           =   H i s t o r y D e a l G e t D o u b l e ( l a s t T i c k e t ,   D E A L _ P R O F I T ) ;  
 	 	 	 	 	 s w a p               =   H i s t o r y D e a l G e t D o u b l e ( l a s t T i c k e t ,   D E A L _ S W A P ) ;  
 	 	 	 	 	 c o m m i s s i o n   =   H i s t o r y D e a l G e t D o u b l e ( l a s t T i c k e t ,   D E A L _ C O M M I S S I O N ) ;  
  
 	 	 	 	 	 v o l u m e   =   H i s t o r y D e a l G e t D o u b l e ( l a s t T i c k e t ,   D E A L _ V O L U M E ) ;  
  
 	 	 	 	 	 / /   F i n d   w h y   t h e   p o s i t i o n   h a s   b e e n   c l o s e d  
 	 	 	 	 	 i f   ( d e t a i l   = =   " " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	 i t e m . t i m e E x p i r a t i o n   >   0  
 	 	 	 	 	 	 	 & &   i t e m . t i m e E x p i r a t i o n   < =   t i m e C l o s e  
 	 	 	 	 	 	 )   {  
 	 	 	 	 	 	 	 d e t a i l   =   " e x p i r a t i o n " ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
  
 	 	 	 	 	 i f   ( d e t a i l   = =   " " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 E N U M _ D E A L _ R E A S O N   d e a l R e a s o n   =   ( E N U M _ D E A L _ R E A S O N ) H i s t o r y D e a l G e t I n t e g e r ( l a s t T i c k e t ,   D E A L _ R E A S O N ) ;  
 	  
 	 	 	 	 	 	 s w i t c h   ( d e a l R e a s o n )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 c a s e   D E A L _ R E A S O N _ S L :   d e t a i l   =   " s l " ;   b r e a k ;  
 	 	 	 	 	 	 	 c a s e   D E A L _ R E A S O N _ T P :   d e t a i l   =   " t p " ;   b r e a k ;  
 	 	 	 	 	 	 	 c a s e   D E A L _ R E A S O N _ S O :   d e t a i l   =   " s o " ;   b r e a k ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
  
 	 	 i n t   i   =   e v e n t V a l u e s Q u e u e I n d e x ;  
  
 	 	 e v e n t V a l u e s [ i ] . r e a s o n   =   r e a s o n ;  
 	 	 e v e n t V a l u e s [ i ] . d e t a i l   =   d e t a i l ;  
  
 	 	 e v e n t V a l u e s [ i ] . p r i c e C l o s e           =   p r i c e C l o s e ;  
 	 	 e v e n t V a l u e s [ i ] . t i m e C l o s e             =   t i m e C l o s e ;  
 	 	 e v e n t V a l u e s [ i ] . c o m m e n t                 =   i t e m . c o m m e n t ;  
 	 	 e v e n t V a l u e s [ i ] . c o m m i s s i o n           =   c o m m i s s i o n ;  
 	 	 e v e n t V a l u e s [ i ] . t i m e E x p i r a t i o n   =   i t e m . t i m e E x p i r a t i o n ;  
 	 	 e v e n t V a l u e s [ i ] . v o l u m e                   =   v o l u m e ;  
 	 	 e v e n t V a l u e s [ i ] . m a g i c                     =   i t e m . m a g i c ;  
 	 	 e v e n t V a l u e s [ i ] . p r i c e O p e n             =   p r i c e O p e n ;  
 	 	 e v e n t V a l u e s [ i ] . t i m e O p e n               =   t i m e O p e n ;  
 	 	 e v e n t V a l u e s [ i ] . p r o f i t                   =   p r o f i t ;  
 	 	 e v e n t V a l u e s [ i ] . s t o p L o s s               =   i t e m . s t o p L o s s ;  
 	 	 e v e n t V a l u e s [ i ] . s w a p                       =   s w a p ;  
 	 	 e v e n t V a l u e s [ i ] . s y m b o l                   =   i t e m . s y m b o l ;  
 	 	 e v e n t V a l u e s [ i ] . t a k e P r o f i t           =   i t e m . t a k e P r o f i t ;  
 	 	 e v e n t V a l u e s [ i ] . t i c k e t                   =   t i c k e t ;  
 	 	 e v e n t V a l u e s [ i ] . t y p e                       =   i t e m . t y p e ;  
  
 	 	 i f   ( d e b u g )  
 	 	 {  
 	 	 	 P r i n t U p d a t e d V a l u e s ( ) ;  
 	 	 }  
 	 }  
  
 	 / * *  
 	 *   O v e r l o a d e d   m e t h o d   2   o f   2  
 	 * /  
 	 v o i d   U p d a t e V a l u e s ( P e n d i n g O r d e r   & i t e m ,   s t r i n g   r e a s o n ,   s t r i n g   d e t a i l )  
 	 {  
 	 	 d a t e t i m e   t i m e E x p i r a t i o n   =   i t e m . t i m e E x p i r a t i o n ;  
  
 	 	 / /   W h e n   t h e   l i f e t i m e   o f   t h e   o r d e r   i s   O R D E R _ T I M E _ D A Y ,  
 	 	 / /   t h e   e x p i r a t i o n   ( O R D E R _ T I M E _ E X P I R A T I O N )   e q u a l s   t o   t h e   t i m e   o f   o p e n i n g .  
 	 	 / /   H e r e   w e   f i x   t h i s .  
 	 	 i f   ( i t e m . t y p e T i m e   = =   O R D E R _ T I M E _ D A Y )  
 	 	 {  
 	 	 	 t i m e E x p i r a t i o n   =   ( d a t e t i m e ) ( M a t h F l o o r ( ( ( d o u b l e ) i t e m . t i m e S e t u p   +   8 6 4 0 0 . 0 )   /   8 6 4 0 0 . 0 )   *   8 6 4 0 0 . 0 ) ;  
 	 	 }  
  
 	 	 i n t   i   =   e v e n t V a l u e s Q u e u e I n d e x ;  
  
 	 	 e v e n t V a l u e s [ i ] . r e a s o n   =   r e a s o n ;  
 	 	 e v e n t V a l u e s [ i ] . d e t a i l   =   d e t a i l ;  
  
 	 	 e v e n t V a l u e s [ i ] . p r i c e C l o s e           =   i t e m . p r i c e C u r r e n t ;  
 	 	 e v e n t V a l u e s [ i ] . t i m e C l o s e             =   i t e m . t i m e D o n e ;  
 	 	 e v e n t V a l u e s [ i ] . c o m m e n t                 =   i t e m . c o m m e n t ;  
 	 	 e v e n t V a l u e s [ i ] . c o m m i s s i o n           =   0 . 0 ;  
 	 	 e v e n t V a l u e s [ i ] . t i m e E x p i r a t i o n   =   t i m e E x p i r a t i o n ;  
 	 	 e v e n t V a l u e s [ i ] . v o l u m e                   =   i t e m . v o l u m e ;  
 	 	 e v e n t V a l u e s [ i ] . m a g i c                     =   i t e m . m a g i c ;  
 	 	 e v e n t V a l u e s [ i ] . p r i c e O p e n             =   i t e m . p r i c e O p e n ;  
 	 	 e v e n t V a l u e s [ i ] . t i m e O p e n               =   i t e m . t i m e S e t u p ;  
 	 	 e v e n t V a l u e s [ i ] . p r o f i t                   =   0 . 0 ;  
 	 	 e v e n t V a l u e s [ i ] . s t o p L o s s               =   i t e m . s t o p L o s s ;  
 	 	 e v e n t V a l u e s [ i ] . s w a p                       =   0 . 0 ;  
 	 	 e v e n t V a l u e s [ i ] . s y m b o l                   =   i t e m . s y m b o l ;  
 	 	 e v e n t V a l u e s [ i ] . t a k e P r o f i t           =   i t e m . t a k e P r o f i t ;  
 	 	 e v e n t V a l u e s [ i ] . t i c k e t                   =   i t e m . t i c k e t ;  
 	 	 e v e n t V a l u e s [ i ] . t y p e                       =   i t e m . t y p e ;  
  
 	 	 i f   ( d e b u g )  
 	 	 {  
 	 	 	 P r i n t U p d a t e d V a l u e s ( ) ;  
 	 	 }  
 	 }  
  
 	 v o i d   P r i n t U p d a t e d V a l u e s ( )  
 	 {  
 	 	 P r i n t (  
 	 	 	 "   < < < \ n " ,  
 	 	 	 "   |   r e a s o n :   " ,   e _ R e a s o n ( ) ,  
 	 	 	 "   |   d e t a i l :   " ,   e _ R e a s o n D e t a i l ( ) ,  
 	 	 	 "   |   t i c k e t :   " ,   e _ a t t r T i c k e t ( ) ,  
 	 	 	 "   |   t y p e :   " ,   E n u m T o S t r i n g ( ( E N U M _ O R D E R _ T Y P E ) e _ a t t r T y p e ( ) ) ,  
 	 	 	 " \ n " ,  
 	 	 	 "   |   o p e n T i m e   :   " ,   e _ a t t r O p e n T i m e ( ) ,  
 	 	 	 "   |   o p e n P r i c e   :   " ,   e _ a t t r O p e n P r i c e ( ) ,  
 	 	 	 " \ n " ,  
 	 	 	 "   |   c l o s e T i m e :   " ,   e _ a t t r C l o s e T i m e ( ) ,  
 	 	 	 "   |   c l o s e P r i c e :   " ,   e _ a t t r C l o s e P r i c e ( ) ,  
 	 	 	 " \ n " ,  
 	 	 	 "   |   v o l u m e :   " ,   e _ a t t r L o t s ( ) ,  
 	 	 	 "   |   s l :   " ,   e _ a t t r S t o p L o s s ( ) ,  
 	 	 	 "   |   t p :   " ,   e _ a t t r T a k e P r o f i t ( ) ,  
 	 	 	 "   |   p r o f i t :   " ,   e _ a t t r P r o f i t ( ) ,  
 	 	 	 "   |   s w a p :   " ,   e _ a t t r S w a p ( ) ,  
 	 	 	 "   |   e x p :   " ,   e _ a t t r E x p i r a t i o n ( ) ,  
 	 	 	 "   |   c o m m e n t :   " ,   e _ a t t r C o m m e n t ( ) ,  
 	 	 	 " \ n   > > > "  
 	 	 ) ;  
 	 }  
  
 	 i n t   A d d E v e n t V a l u e s ( )  
 	 {  
 	 	 e v e n t V a l u e s Q u e u e I n d e x + + ;  
 	 	 A r r a y R e s i z e ( e v e n t V a l u e s ,   e v e n t V a l u e s Q u e u e I n d e x   +   1 ) ;  
  
 	 	 r e t u r n   e v e n t V a l u e s Q u e u e I n d e x ;  
 	 }  
  
 	 i n t   R e m o v e E v e n t V a l u e s ( )  
 	 {  
 	 	 i f   ( e v e n t V a l u e s Q u e u e I n d e x   = =   - 1 )  
 	 	 {  
 	 	 	 P r i n t ( " C a n n o t   r e m o v e   e v e n t   v a l u e s ,   a d d   t h e m   f i r s t .   ( i n   f u n c t i o n   " ,   _ _ F U N C T I O N _ _ ,   " ) " ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 e v e n t V a l u e s Q u e u e I n d e x - - ;  
 	 	 	 A r r a y R e s i z e ( e v e n t V a l u e s ,   e v e n t V a l u e s Q u e u e I n d e x   +   1 ) ;  
 	 	 }  
  
 	 	 r e t u r n   e v e n t V a l u e s Q u e u e I n d e x ;  
 	 }  
  
 p u b l i c :  
 	 / * *  
 	 *   D e f a u l t   c o n s t r u c t o r  
 	 * /  
 	 O n T r a d e E v e n t D e t e c t o r ( v o i d )  
 	 {  
 	 	 d e b u g   =   f a l s e ;  
 	 	 e v e n t V a l u e s Q u e u e I n d e x   =   - 1 ;  
 	 } ;  
  
 	 b o o l   S t a r t ( )  
 	 {  
 	 	 A d d E v e n t V a l u e s ( ) ;  
  
 	 	 M a k e L i s t O f ( p o s i t i o n s ) ;  
 	 	 M a k e L i s t O f ( p e n d i n g O r d e r s ) ;  
  
 	 	 b o o l   s u c c e s s   =   f a l s e ;  
  
 	 	 i f   ( ! s u c c e s s )   s u c c e s s   =   D e t e c t E v e n t ( p r e v i o u s P o s i t i o n s ,   p o s i t i o n s ) ;  
  
 	 	 i f   ( ! s u c c e s s )   s u c c e s s   =   D e t e c t E v e n t ( p r e v i o u s P e n d i n g O r d e r s ,   p e n d i n g O r d e r s ) ;  
  
 	 	 C o p y L i s t ( p r e v i o u s P o s i t i o n s ,   p o s i t i o n s ) ;  
 	 	 C o p y L i s t ( p r e v i o u s P e n d i n g O r d e r s ,   p e n d i n g O r d e r s ) ;  
  
 	 	 r e t u r n   s u c c e s s ;  
 	 }  
  
 	 v o i d   E n d ( )  
 	 {  
 	 	 R e m o v e E v e n t V a l u e s ( ) ;  
 	 }  
  
 	 s t r i n g   E v e n t V a l u e R e a s o n ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . r e a s o n ; }  
 	 s t r i n g   E v e n t V a l u e D e t a i l ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . d e t a i l ; }  
  
 	 i n t   E v e n t V a l u e T y p e ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . t y p e ; }  
  
 	 d a t e t i m e   E v e n t V a l u e T i m e C l o s e ( )             { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . t i m e C l o s e ; }  
 	 d a t e t i m e   E v e n t V a l u e T i m e O p e n ( )               { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . t i m e O p e n ; }  
 	 d a t e t i m e   E v e n t V a l u e T i m e E x p i r a t i o n ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . t i m e E x p i r a t i o n ; }  
  
 	 l o n g   E v e n t V a l u e M a g i c ( )     { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . m a g i c ; }  
 	 l o n g   E v e n t V a l u e T i c k e t ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . t i c k e t ; }  
  
 	 d o u b l e   E v e n t V a l u e C o m m i s s i o n ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . c o m m i s s i o n ; }  
 	 d o u b l e   E v e n t V a l u e P r i c e O p e n ( )     { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . p r i c e O p e n ; }  
 	 d o u b l e   E v e n t V a l u e P r i c e C l o s e ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . p r i c e C l o s e ; }  
 	 d o u b l e   E v e n t V a l u e P r o f i t ( )           { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . p r o f i t ; }  
 	 d o u b l e   E v e n t V a l u e S t o p L o s s ( )       { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . s t o p L o s s ; }  
 	 d o u b l e   E v e n t V a l u e S w a p ( )               { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . s w a p ; }  
 	 d o u b l e   E v e n t V a l u e T a k e P r o f i t ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . t a k e P r o f i t ; }  
 	 d o u b l e   E v e n t V a l u e V o l u m e ( )           { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . v o l u m e ; }  
  
 	 s t r i n g   E v e n t V a l u e C o m m e n t ( )   { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . c o m m e n t ; }  
 	 s t r i n g   E v e n t V a l u e S y m b o l ( )     { r e t u r n   e v e n t V a l u e s [ e v e n t V a l u e s Q u e u e I n d e x ] . s y m b o l ; }  
 } ;  
  
 O n T r a d e E v e n t D e t e c t o r   o n T r a d e E v e n t D e t e c t o r ;  
  
 d a t e t i m e   O r d e r C l o s e T i m e ( )  
 {  
 	 i n t   t y p e   =   L o a d e d T y p e ( ) ;  
  
 	 i f   ( t y p e   = =   1 )  
 	 {  
 	 	 r e t u r n   0 ;  
 	 }  
  
 	 i f   ( t y p e   = =   3 )  
 	 {  
 	 	 u l o n g   d e a l T i c k e t   =   O r d e r T i c k e t ( ) ;  
 	 	 E N U M _ D E A L _ E N T R Y   d e a l E n t r y   =   ( E N U M _ D E A L _ E N T R Y ) H i s t o r y D e a l G e t I n t e g e r ( d e a l T i c k e t ,   D E A L _ E N T R Y ) ;  
 	 	 l o n g   p o s i t i o n I d   =   H i s t o r y D e a l G e t I n t e g e r ( d e a l T i c k e t ,   D E A L _ P O S I T I O N _ I D ) ;  
 	 	 d a t e t i m e   t i m e   =   ( d a t e t i m e ) H i s t o r y D e a l G e t I n t e g e r ( d e a l T i c k e t ,   D E A L _ T I M E ) ;  
  
 	 	 H i s t o r y S e l e c t B y P o s i t i o n ( p o s i t i o n I d ) ;  
  
 	 	 / /   S e a r c h   f o r   t h e   f i r s t   O U T   d e a l   a f t e r   t h i s   o n e   a n d   g e t   t h e   t i m e   f r o m   i t  
  
 	 	 i n t   t o t a l   =   H i s t o r y D e a l s T o t a l ( ) ;  
  
 	 	 f o r   ( i n t   i   =   t o t a l   -   1 ;   i   > =   0 ;   i - - )   {  
 	 	 	 u l o n g   t i c k e t   =   H i s t o r y D e a l G e t T i c k e t ( i ) ;  
  
 	 	 	 i f   ( t i c k e t   = =   d e a l T i c k e t )   {  
 	 	 	 	 i f   ( i   = =   t o t a l   -   1   & &   P o s i t i o n S e l e c t B y D e a l ( t i c k e t ) )  
 	 	 	 	 {  
 	 	 	 	 	 t i m e   =   ( d a t e t i m e ) 0 ;  
 	 	 	 	 }  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
  
 	 	 	 i f   ( H i s t o r y D e a l G e t I n t e g e r ( t i c k e t ,   D E A L _ E N T R Y )   = =   D E A L _ E N T R Y _ O U T )   {  
 	 	 	 	 t i m e   =   ( d a t e t i m e ) H i s t o r y D e a l G e t I n t e g e r ( t i c k e t ,   D E A L _ T I M E ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 H i s t o r y T r a d e s T o t a l R e s e t ( ) ;  
  
 	 	 r e t u r n   t i m e ;  
 	 }  
  
 	 i f   ( t y p e   = =   4 )  
 	 {  
 	 	 r e t u r n   ( d a t e t i m e ) H i s t o r y O r d e r G e t I n t e g e r ( O r d e r T i c k e t ( ) , O R D E R _ T I M E _ D O N E ) ;  
 	 }  
 	  
 	 r e t u r n   ( d a t e t i m e ) O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ D O N E ) ;  
 }  
  
 s t r i n g   O r d e r C o m m e n t ( )  
 {  
 	 i n t   t y p e   =   L o a d e d T y p e ( ) ;  
  
 	 i f   ( t y p e   = =   1 )   { r e t u r n   P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) ; }  
 	 i f   ( t y p e   = =   3 )   { r e t u r n   H i s t o r y O r d e r G e t S t r i n g ( H i s t o r y D e a l G e t I n t e g e r ( O r d e r T i c k e t ( ) ,   D E A L _ P O S I T I O N _ I D ) ,   O R D E R _ C O M M E N T ) ; }  
 	 i f   ( t y p e   = =   4 )   { r e t u r n   H i s t o r y O r d e r G e t S t r i n g ( O r d e r T i c k e t ( ) ,   O R D E R _ C O M M E N T ) ; }  
  
 	 r e t u r n   O r d e r G e t S t r i n g ( O R D E R _ C O M M E N T ) ;  
 }  
  
 d o u b l e   O r d e r O p e n P r i c e ( )  
 {  
 	 d o u b l e   o p     =   0 . 0 ;  
 	 i n t   t y p e       =   L o a d e d T y p e ( ) ;  
 	 i n t   d i g i t s   =   ( i n t ) S y m b o l I n f o I n t e g e r ( O r d e r S y m b o l ( ) ,   S Y M B O L _ D I G I T S ) ;  
  
 	 i f   ( t y p e   = =   1 )  
 	 {  
 	 	 o p   =   P o s i t i o n G e t D o u b l e ( P O S I T I O N _ P R I C E _ O P E N ) ;  
 	 }  
 	 e l s e   i f   ( t y p e   = =   3 )  
 	 {  
 	 	 / /   G e t   t h e   v a l u e   f r o m   t h e   v e r y   f i r s t   d e a l   i n   t h e   p o s i t i o n  
  
 	 	 u l o n g   p o s i t i o n I d   =   H i s t o r y D e a l G e t I n t e g e r ( O r d e r T i c k e t ( ) ,   D E A L _ P O S I T I O N _ I D ) ;  
  
 	 	 H i s t o r y S e l e c t B y P o s i t i o n ( p o s i t i o n I d ) ;  
  
 	 	 u l o n g   t i c k e t   =   H i s t o r y D e a l G e t T i c k e t ( 0 ) ;  
  
 	 	 o p   =   H i s t o r y D e a l G e t D o u b l e ( t i c k e t ,   D E A L _ P R I C E ) ;  
  
 	 	 H i s t o r y T r a d e s T o t a l R e s e t ( ) ;  
 	 }  
 	 e l s e   i f   ( t y p e   = =   4 )  
 	 {  
 	 	 o p   =   H i s t o r y O r d e r G e t D o u b l e ( O r d e r T i c k e t ( ) ,   O R D E R _ P R I C E _ O P E N ) ;  
 	 }  
       e l s e  
       {  
       	 o p   =   O r d e r G e t D o u b l e ( O R D E R _ P R I C E _ O P E N ) ;  
       }  
  
 	 r e t u r n   N o r m a l i z e D o u b l e ( o p ,   d i g i t s ) ;  
 }  
  
 s t r i n g   O r d e r S y m b o l ( )  
 {  
 	 i n t   t y p e   =   L o a d e d T y p e ( ) ;  
  
 	 i f   ( t y p e   = =   1 )   { r e t u r n   P o s i t i o n G e t S t r i n g ( P O S I T I O N _ S Y M B O L ) ; }  
 	 i f   ( t y p e   = =   3 )   { r e t u r n   H i s t o r y D e a l G e t S t r i n g ( O r d e r T i c k e t ( ) , D E A L _ S Y M B O L ) ; }  
 	 i f   ( t y p e   = =   4 )   { r e t u r n   H i s t o r y O r d e r G e t S t r i n g ( O r d e r T i c k e t ( ) , O R D E R _ S Y M B O L ) ; }  
  
 	 r e t u r n   O r d e r G e t S t r i n g ( O R D E R _ S Y M B O L ) ;  
 }  
  
 l o n g   O r d e r T i c k e t ( l o n g   t i c k e t   =   0 )  
 {  
 	 s t a t i c   l o n g   m e m o r y   =   0 ;  
  
 	 i f   ( t i c k e t   >   0 )   { m e m o r y   =   t i c k e t ; }  
  
 	 r e t u r n   m e m o r y ;  
 }  
  
 i n t   O r d e r T y p e ( )  
 {  
 	 i n t   t y p e   =   L o a d e d T y p e ( ) ;  
  
 	 i f   ( t y p e   = =   1 )   { r e t u r n   ( i n t ) P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) ; }  
 	 i f   ( t y p e   = =   2 )   { r e t u r n   ( i n t ) O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) ; }  
 	 i f   ( t y p e   = =   3 )  
 	 {  
 	 	 u l o n g   d e a l T i c k e t   =   O r d e r T i c k e t ( ) ;  
 	 	 l o n g   p o s i t i o n I d   =   H i s t o r y D e a l G e t I n t e g e r ( d e a l T i c k e t ,   D E A L _ P O S I T I O N _ I D ) ;  
  
 	 	 H i s t o r y S e l e c t B y P o s i t i o n ( p o s i t i o n I d ) ;  
  
 	 	 u l o n g   f i r s t D e a l T i c k e t   =   H i s t o r y D e a l G e t T i c k e t ( 0 ) ;  
 	 	  
 	 	 i n t   o r d e r T y p e   =   ( i n t ) H i s t o r y D e a l G e t I n t e g e r ( f i r s t D e a l T i c k e t ,   D E A L _ T Y P E ) ;  
  
 	 	 H i s t o r y T r a d e s T o t a l R e s e t ( ) ;  
  
 	 	 r e t u r n   o r d e r T y p e ;  
 	 }  
 	 i f   ( t y p e   = =   4 )   { r e t u r n   ( i n t ) H i s t o r y O r d e r G e t I n t e g e r ( O r d e r T i c k e t ( ) , O R D E R _ T Y P E ) ; }  
  
 	 r e t u r n   ( i n t ) O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) ;  
 }  
  
 b o o l   P e n d i n g O r d e r S e l e c t B y T i c k e t ( u l o n g   t i c k e t )  
 {  
 	 b o o l   s u c c e s s   =   O r d e r S e l e c t ( t i c k e t ) ;  
  
 	 i f   ( s u c c e s s )   {  
 	 	 L o a d e d T y p e ( 2 ) ;  
 	 	 O r d e r T i c k e t ( t i c k e t ) ;  
 	 }  
  
 	 r e t u r n   s u c c e s s ;  
 }  
  
 d o u b l e   P i p V a l u e ( s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
 	 r e t u r n   C u s t o m P o i n t ( s y m b o l )   /   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 }  
  
 b o o l   P o s i t i o n S e l e c t B y D e a l ( u l o n g   d e a l T i c k e t )  
 {  
 	 b o o l   s u c c e s s   =   f a l s e ;  
 	 l o n g   p o s i t i o n I d   =   H i s t o r y D e a l G e t I n t e g e r ( d e a l T i c k e t ,   D E A L _ P O S I T I O N _ I D ) ;  
 	  
 	 i f   ( p o s i t i o n I d )  
 	 {  
 	 	 i n t   t o t a l   =   P o s i t i o n s T o t a l ( ) ;  
 	 	  
 	 	 f o r   ( i n t   i   =   t o t a l   -   1 ;   i   > =   0 ;   i - - )  
 	 	 {  
 	 	 	 i f   ( P o s i t i o n G e t T i c k e t ( i ) )  
 	 	 	 {  
 	 	 	 	 i f   ( P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ I D E N T I F I E R )   = =   p o s i t i o n I d )  
 	 	 	 	 {  
 	 	 	 	 	 s u c c e s s   =   t r u e ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 r e t u r n   s u c c e s s ;  
 }  
  
 i n t   S e c o n d s F r o m C o m p o n e n t s ( d o u b l e   d a y s ,   d o u b l e   h o u r s ,   d o u b l e   m i n u t e s ,   i n t   s e c o n d s )  
 {  
 	 i n t   r e t v a l   =  
 	 	 8 6 4 0 0   *   ( i n t ) M a t h F l o o r ( d a y s )  
 	 	 +   3 6 0 0   *   ( i n t ) ( M a t h F l o o r ( h o u r s )   +   ( 2 4   *   ( d a y s   -   M a t h F l o o r ( d a y s ) ) ) )  
 	 	 +   6 0   *   ( i n t ) ( M a t h F l o o r ( m i n u t e s )   +   ( 6 0   *   ( h o u r s   -   M a t h F l o o r ( h o u r s ) ) ) )  
 	 	 +   ( i n t ) ( ( d o u b l e ) s e c o n d s   +   ( 6 0   *   ( m i n u t e s   -   M a t h F l o o r ( m i n u t e s ) ) ) ) ;  
  
 	 r e t u r n   r e t v a l ;  
 }  
  
 d a t e t i m e   S e l e c t e d H i s t o r y F r o m T i m e ( d a t e t i m e   s e t T i m e   =   - 1 )  
 {  
 	 s t a t i c   d a t e t i m e   t i m e ;  
 	  
 	 i f   ( s e t T i m e   >   - 1 )  
 	 {  
 	 	 t i m e   =   s e t T i m e ;  
 	 }  
 	  
 	 r e t u r n   t i m e ;  
 }  
  
 d a t e t i m e   S e l e c t e d H i s t o r y T o T i m e ( d a t e t i m e   s e t T i m e   =   - 1 )  
 {  
 	 s t a t i c   d a t e t i m e   t i m e ;  
 	  
 	 i f   ( s e t T i m e   >   - 1 )  
 	 {  
 	 	 t i m e   =   s e t T i m e ;  
 	 }  
 	  
 	 r e t u r n   t i m e ;  
 }  
  
 i n t   S t r T o I n t e g e r ( s t r i n g   v a l u e )  
 {  
 	 r e t u r n   ( i n t ) S t r i n g T o I n t e g e r ( v a l u e ) ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 v o i d   S t r i n g E x p l o d e ( s t r i n g   d e l i m i t e r ,   s t r i n g   i n p u t S t r i n g ,   T   & o u t p u t [ ] )  
 {  
 	 i n t   b e g i n       =   0 ;  
 	 i n t   e n d           =   0 ;  
 	 i n t   e l e m e n t   =   0 ;  
 	 i n t   l e n g t h     =   S t r i n g L e n ( i n p u t S t r i n g ) ;  
 	 i n t   l e n g t h _ d e l i m i t e r   =   S t r i n g L e n ( d e l i m i t e r ) ;  
 	 T   e m p t y _ v a l     =   ( t y p e n a m e ( T )   = =   " s t r i n g " )   ?   ( T ) " "   :   ( T ) 0 ;  
  
 	 i f   ( l e n g t h   >   0 )  
 	 {  
 	 	 w h i l e   ( t r u e )  
 	 	 {  
 	 	 	 e n d   =   S t r i n g F i n d ( i n p u t S t r i n g ,   d e l i m i t e r ,   b e g i n ) ;  
  
 	 	 	 A r r a y R e s i z e ( o u t p u t ,   e l e m e n t   +   1 ) ;  
 	 	 	 o u t p u t [ e l e m e n t ]   =   e m p t y _ v a l ;  
 	  
 	 	 	 i f   ( e n d   ! =   - 1 )  
 	 	 	 {  
 	 	 	 	 i f   ( e n d   >   b e g i n )  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t [ e l e m e n t ]   =   ( T ) S t r i n g S u b s t r ( i n p u t S t r i n g ,   b e g i n ,   e n d   -   b e g i n ) ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 o u t p u t [ e l e m e n t ]   =   ( T ) S t r i n g S u b s t r ( i n p u t S t r i n g ,   b e g i n ,   l e n g t h   -   b e g i n ) ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 	  
 	 	 	 b e g i n   =   e n d   +   1   +   ( l e n g t h _ d e l i m i t e r   -   1 ) ;  
 	 	 	 e l e m e n t + + ;  
 	 	 }  
 	 }  
 	 e l s e  
 	 {  
 	 	 A r r a y R e s i z e ( o u t p u t ,   1 ) ;  
 	 	 o u t p u t [ e l e m e n t ]   =   e m p t y _ v a l ;  
 	 }  
 }  
  
 d a t e t i m e   S t r i n g T o T i m e E x ( s t r i n g   s t r ,   s t r i n g   m o d e = " s e r v e r " )  
 {  
 	 / /   m o d e :   s e r v e r ,   l o c a l ,   g m t  
 	 i n t   o f f s e t   =   0 ;  
  
 	 i f   ( m o d e   = =   " s e r v e r " )   { o f f s e t   =   0 ; }  
 	 e l s e   i f   ( m o d e   = =   " l o c a l " )   { o f f s e t   =   ( i n t ) ( T i m e L o c a l ( )   -   T i m e C u r r e n t ( ) ) ; }  
 	 e l s e   i f   ( m o d e   = =   " g m t " )   { o f f s e t   =   ( i n t ) ( T i m e G M T ( )   -   T i m e C u r r e n t ( ) ) ; }  
  
 	 d a t e t i m e   t i m e   =   S t r i n g T o T i m e ( s t r )   -   o f f s e t ;  
  
 	 r e t u r n   t i m e ;  
 }  
  
 d o u b l e   T i c k s D a t a ( s t r i n g   s y m b o l   =   " " ,   i n t   t y p e   =   0 ,   i n t   s h i f t   =   0 )  
 {  
 	 s t a t i c   b o o l   c o l l e c t i n g _ t i c k s   =   f a l s e ;  
 	 s t a t i c   s t r i n g   s y m b o l s [ ] ;  
 	 s t a t i c   i n t   z e r o _ s i d [ ] ;  
 	 s t a t i c   d o u b l e   m e m o r y A S K [ ] [ 1 0 0 ] ;  
 	 s t a t i c   d o u b l e   m e m o r y B I D [ ] [ 1 0 0 ] ;  
  
 	 i n t   s i d   =   0 ,   s i z e   =   0 ,   i   =   0 ,   i d   =   0 ;  
 	 d o u b l e   a s k   =   0 ,   b i d   =   0 ,   r e t v a l   =   0 ;  
 	 b o o l   e x i s t s   =   f a l s e ;  
  
 	 i f   ( A r r a y S i z e ( s y m b o l s )   = =   0 )  
 	 {  
 	 	 A r r a y R e s i z e ( s y m b o l s ,   1 ) ;  
 	 	 A r r a y R e s i z e ( z e r o _ s i d ,   1 ) ;  
 	 	 A r r a y R e s i z e ( m e m o r y A S K ,   1 ) ;  
 	 	 A r r a y R e s i z e ( m e m o r y B I D ,   1 ) ;  
  
 	 	 s y m b o l s [ 0 ]   =   _ S y m b o l ;  
 	 }  
  
 	 i f   ( t y p e   >   0   & &   s h i f t   >   0 )  
 	 {  
 	 	 c o l l e c t i n g _ t i c k s   =   t r u e ;  
 	 }  
  
 	 i f   ( c o l l e c t i n g _ t i c k s   = =   f a l s e )  
 	 {  
 	 	 i f   ( t y p e   >   0   & &   s h i f t   = =   0 )  
 	 	 {  
 	 	 	 / /   g o i n g   t o   g e t   t i c k s  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 r e t u r n   0 ;  
 	 	 }  
 	 }  
  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   _ S y m b o l ;  
  
 	 i f   ( t y p e   = =   0 )  
 	 {  
 	 	 e x i s t s   =   f a l s e ;  
 	 	 s i z e       =   A r r a y S i z e ( s y m b o l s ) ;  
  
 	 	 i f   ( s i z e   = =   0 )   { A r r a y R e s i z e ( s y m b o l s ,   1 ) ; }  
  
 	 	 f o r   ( i = 0 ;   i < s i z e ;   i + + )  
 	 	 {  
 	 	 	 i f   ( s y m b o l s [ i ]   = =   s y m b o l )  
 	 	 	 {  
 	 	 	 	 e x i s t s   =   t r u e ;  
 	 	 	 	 s i d         =   i ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( e x i s t s   = =   f a l s e )  
 	 	 {  
 	 	 	 i n t   n e w s i z e   =   A r r a y S i z e ( s y m b o l s )   +   1 ;  
  
 	 	 	 A r r a y R e s i z e ( s y m b o l s ,   n e w s i z e ) ;  
 	 	 	 s y m b o l s [ n e w s i z e - 1 ]   =   s y m b o l ;  
  
 	 	 	 A r r a y R e s i z e ( z e r o _ s i d ,   n e w s i z e ) ;  
 	 	 	 A r r a y R e s i z e ( m e m o r y A S K ,   n e w s i z e ) ;  
 	 	 	 A r r a y R e s i z e ( m e m o r y B I D ,   n e w s i z e ) ;  
  
 	 	 	 s i d = n e w s i z e ;  
 	 	 }  
  
 	 	 i f   ( s i d   > =   0 )  
 	 	 {  
 	 	 	 a s k   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 b i d   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
  
 	 	 	 i f   ( b i d   = =   0   & &   M Q L I n f o I n t e g e r ( M Q L _ T E S T E R ) )  
 	 	 	 {  
 	 	 	 	 P r i n t ( " T i c k s   d a t a   c o l l e c t o r   e r r o r :   "   +   s y m b o l   +   "   c a n n o t   b e   b a c k t e s t e d .   O n l y   t h e   c u r r e n t   s y m b o l   c a n   b e   b a c k t e s t e d .   T h e   E A   w i l l   b e   t e r m i n a t e d . " ) ;  
 	 	 	 	 E x p e r t R e m o v e ( ) ;  
 	 	 	 }  
  
 	 	 	 i f   (  
 	 	 	 	       s y m b o l   = =   _ S y m b o l  
 	 	 	 	 | |   a s k   ! =   m e m o r y A S K [ s i d ] [ 0 ]  
 	 	 	 	 | |   b i d   ! =   m e m o r y B I D [ s i d ] [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 m e m o r y A S K [ s i d ] [ z e r o _ s i d [ s i d ] ]   =   a s k ;  
 	 	 	 	 m e m o r y B I D [ s i d ] [ z e r o _ s i d [ s i d ] ]   =   b i d ;  
 	 	 	 	 z e r o _ s i d [ s i d ]                                   =   z e r o _ s i d [ s i d ]   +   1 ;  
  
 	 	 	 	 i f   ( z e r o _ s i d [ s i d ]   = =   1 0 0 )  
 	 	 	 	 {  
 	 	 	 	 	 z e r o _ s i d [ s i d ]   =   0 ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
 	 e l s e  
 	 {  
 	 	 i f   ( s h i f t   < =   0 )  
 	 	 {  
 	 	 	 i f   ( t y p e   = =   S Y M B O L _ A S K )  
 	 	 	 {  
 	 	 	 	 r e t u r n   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 }  
 	 	 	 e l s e   i f   ( t y p e   = =   S Y M B O L _ B I D )  
 	 	 	 {  
 	 	 	 	 r e t u r n   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;    
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 d o u b l e   m i d   =   ( ( S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K )   +   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) )   /   2 ) ;  
  
 	 	 	 	 r e t u r n   m i d ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 s i z e   =   A r r a y S i z e ( s y m b o l s ) ;  
  
 	 	 	 f o r   ( i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 	 {  
 	 	 	 	 i f   ( s y m b o l s [ i ]   = =   s y m b o l )  
 	 	 	 	 {  
 	 	 	 	 	 s i d   =   i ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( s h i f t   <   1 0 0 )  
 	 	 	 {  
 	 	 	 	 i d   =   z e r o _ s i d [ s i d ]   -   s h i f t   -   1 ;  
  
 	 	 	 	 i f ( i d   <   0 )   { i d   =   i d   +   1 0 0 ; }  
  
 	 	 	 	 i f   ( t y p e   = =   S Y M B O L _ A S K )  
 	 	 	 	 {  
 	 	 	 	 	 r e t v a l   =   m e m o r y A S K [ s i d ] [ i d ] ;  
  
 	 	 	 	 	 i f   ( r e t v a l   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e t v a l   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( t y p e   = =   S Y M B O L _ B I D )  
 	 	 	 	 {  
 	 	 	 	 	 r e t v a l   =   m e m o r y B I D [ s i d ] [ i d ] ;  
  
 	 	 	 	 	 i f   ( r e t v a l   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e t v a l   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 r e t u r n   r e t v a l ;  
 }  
  
 i n t   T i c k s P e r S e c o n d ( b o o l   g e t _ m a x   =   f a l s e ,   b o o l   s e t   =   f a l s e )  
 {  
 	 s t a t i c   d a t e t i m e   t i m e 0   =   0 ;  
 	 s t a t i c   i n t   t i c k s             =   0 ;  
 	 s t a t i c   i n t   t p s                 =   0 ;  
 	 s t a t i c   i n t   t p s m a x           =   0 ;  
  
 	 d a t e t i m e   t i m e 1   =   T i m e L o c a l ( ) ;  
  
 	 i f   ( s e t   = =   t r u e )  
 	 {  
 	 	 i f   ( t i m e 1   >   t i m e 0 )  
 	 	 {  
 	 	 	 i f   ( t i m e 1   -   t i m e 0   >   1 )  
 	 	 	 {  
 	 	 	 	 t p s   =   0 ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 t p s   =   t i c k s ;  
 	 	 	 }  
  
 	 	 	 t i m e 0   =   t i m e 1 ;  
 	 	 	 t i c k s   =   0 ;  
 	 	 }  
  
 	 	 t i c k s + + ;  
  
 	 	 i f   ( t p s   >   t p s m a x )   { t p s m a x   =   t p s ; }  
 	 }  
  
 	 i f   ( g e t _ m a x )  
 	 {  
 	 	 r e t u r n   t p s m a x ;  
 	 }  
  
 	 r e t u r n   t p s ;  
 }  
  
 d a t e t i m e   T i m e A t S t a r t ( s t r i n g   c m d   =   " s e r v e r " )  
 {  
 	 s t a t i c   d a t e t i m e   l o c a l     =   0 ;  
 	 s t a t i c   d a t e t i m e   s e r v e r   =   0 ;  
  
 	 i f   ( c m d   = =   " l o c a l " )  
 	 {  
 	 	 r e t u r n   l o c a l ;  
 	 }  
 	 e l s e   i f   ( c m d   = =   " s e r v e r " )  
 	 {  
 	 	 r e t u r n   s e r v e r ;  
 	 }  
 	 e l s e   i f   ( c m d   = =   " s e t " )  
 	 {  
 	 	 l o c a l     =   T i m e L o c a l ( ) ;  
 	 	 s e r v e r   =   T i m e C u r r e n t ( ) ;  
 	 }  
  
 	 r e t u r n   0 ;  
 }  
  
 i n t   T i m e D a y ( d a t e t i m e   t i m e )  
 {  
 	 M q l D a t e T i m e   t m ;  
       T i m e T o S t r u c t ( t i m e , t m ) ;  
       r e t u r n ( t m . d a y ) ;  
 }  
  
 i n t   T i m e D a y O f W e e k ( d a t e t i m e   t i m e )  
 {  
       M q l D a t e T i m e   t m ;  
       T i m e T o S t r u c t ( t i m e , t m ) ;  
       r e t u r n ( t m . d a y _ o f _ w e e k ) ;  
 }  
  
 d a t e t i m e   T i m e F r o m C o m p o n e n t s (  
 	 i n t   t i m e _ s r c   =   0 ,  
 	 i n t         y   =   0 ,  
 	 i n t         m   =   0 ,  
 	 d o u b l e   d   =   0 ,  
 	 d o u b l e   h   =   0 ,  
 	 d o u b l e   i   =   0 ,  
 	 i n t         s   =   0  
 )   {  
 	 M q l D a t e T i m e   t m ;  
 	 i n t   o f f s e t   =   0 ;  
  
 	 i f   ( t i m e _ s r c   = =   0 )   {  
 	 	 T i m e C u r r e n t ( t m ) ;  
 	 }  
 	 e l s e   i f   ( t i m e _ s r c   = =   1 )   {  
 	 	 T i m e L o c a l ( t m ) ;    
 	 	 o f f s e t   =   ( i n t ) ( T i m e L o c a l ( )   -   T i m e C u r r e n t ( ) ) ;  
 	 }  
 	 e l s e   i f   ( t i m e _ s r c   = =   2 )   {  
 	 	 T i m e G M T ( t m ) ;  
 	 	 o f f s e t   =   ( i n t ) ( T i m e G M T ( )   -   T i m e C u r r e n t ( ) ) ;  
 	 }  
  
 	 i f   ( y   >   0 )  
 	 {  
 	 	 i f   ( y   <   1 0 0 )   { y   =   2 0 0 0   +   y ; }  
 	 	 t m . y e a r   =   y ;  
 	 }  
 	 i f   ( m   >   0 )   { t m . m o n   =   m ; }  
 	 i f   ( d   >   0 )   { t m . d a y   =   ( i n t ) M a t h F l o o r ( d ) ; }  
  
 	 t m . h o u r   =   ( i n t ) ( M a t h F l o o r ( h )   +   ( 2 4   *   ( d   -   M a t h F l o o r ( d ) ) ) ) ;  
 	 t m . m i n     =   ( i n t ) ( M a t h F l o o r ( i )   +   ( 6 0   *   ( h   -   M a t h F l o o r ( h ) ) ) ) ;  
 	 t m . s e c     =   ( i n t ) ( ( d o u b l e ) s   +   ( 6 0   *   ( i   -   M a t h F l o o r ( i ) ) ) ) ;  
 	  
 	 d a t e t i m e   t i m e   =   S t r u c t T o T i m e ( t m )   -   o f f s e t ;  
  
 	 r e t u r n   t i m e ;  
 }  
  
 i n t   T i m e H o u r ( d a t e t i m e   t i m e )  
 {  
 	 M q l D a t e T i m e   t m ;  
 	 T i m e T o S t r u c t ( t i m e , t m ) ;  
  
 	 r e t u r n   t m . h o u r ;  
 }  
  
 i n t   T i m e M i n u t e ( d a t e t i m e   t i m e )  
 {  
 	 M q l D a t e T i m e   t m ;  
 	 T i m e T o S t r u c t ( t i m e , t m ) ;  
 	  
 	 r e t u r n   t m . m i n ;  
 }  
  
 i n t   T i m e M o n t h ( d a t e t i m e   t i m e )  
 {  
 	 M q l D a t e T i m e   t m ;  
 	 T i m e T o S t r u c t ( t i m e , t m ) ;  
  
 	 r e t u r n   t m . m o n ;  
 }  
  
 i n t   T i m e S e c o n d s ( d a t e t i m e   t i m e )  
 {  
 	 M q l D a t e T i m e   t m ;  
 	 T i m e T o S t r u c t ( t i m e , t m ) ;  
  
 	 r e t u r n   t m . s e c ;  
 }  
  
 i n t   T i m e Y e a r ( d a t e t i m e   t i m e )  
 {  
       M q l D a t e T i m e   t m ;  
 	 T i m e T o S t r u c t ( t i m e , t m ) ;  
  
 	 r e t u r n   t m . y e a r ;  
 }  
  
 b o o l   T r a d e S e l e c t B y T i c k e t ( u l o n g   t i c k e t )  
 {  
 	 i f   ( L o a d P o s i t i o n ( t i c k e t )   & &   O r d e r T y p e ( )   <   2 )  
 	 {  
 	 	 r e t u r n   t r u e ;  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 d o u b l e   V i r t u a l S t o p s D r i v e r (  
 	 s t r i n g   c o m m a n d   =   " " ,  
 	 u l o n g   t i               =   0 ,  
 	 d o u b l e   s l             =   0 ,  
 	 d o u b l e   t p             =   0 ,  
 	 d o u b l e   s l p           =   0 ,  
 	 d o u b l e   t p p           =   0  
 )  
 {  
 	 s t a t i c   b o o l   i n i t i a l i z e d           =   f a l s e ;  
 	 s t a t i c   s t r i n g   n a m e                     =   " " ;  
 	 s t a t i c   s t r i n g   l o o p _ n a m e [ 2 ]     =   { " s l " ,   " t p " } ;  
 	 s t a t i c   c o l o r     l o o p _ c o l o r [ 2 ]   =   { D e e p P i n k ,   D o d g e r B l u e } ;  
 	 s t a t i c   d o u b l e   l o o p _ p r i c e [ 2 ]   =   { 0 ,   0 } ;  
 	 s t a t i c   u l o n g   m e m _ t o _ t i [ ] ;   / /   t i c k e t s  
 	 s t a t i c   i n t   m e m _ t o [ ] ;             / /   t i m e o u t s  
 	 s t a t i c   b o o l   t r a d e _ p a s s   =   f a l s e ;  
 	 i n t   i   =   0 ;  
  
 	 / /   A r e   V i r t u a l   S t o p s   e v e n   e n a b l e d ?  
 	 i f   ( ! U S E _ V I R T U A L _ S T O P S )  
 	 {  
 	 	 r e t u r n   0 ;  
 	 }  
 	  
 	 i f   ( i n i t i a l i z e d   = =   f a l s e   | |   c o m m a n d   = =   " i n i t i a l i z e " )  
 	 {  
 	 	 i n i t i a l i z e d   =   t r u e ;  
 	 }  
  
 	 / /   L i s t e n  
 	 i f   ( c o m m a n d   = =   " "   | |   c o m m a n d   = =   " l i s t e n " )  
 	 {  
 	 	 i n t   t o t a l           =   O b j e c t s T o t a l ( 0 ,   - 1 ,   O B J _ H L I N E ) ;  
 	 	 i n t   l e n g t h         =   0 ;  
 	 	 c o l o r   c l r           =   c l r N O N E ;  
 	 	 i n t   s l t p             =   0 ;  
 	 	 u l o n g   t i c k e t     =   0 ;  
 	 	 d o u b l e   l e v e l     =   0 ;  
 	 	 d o u b l e   a s k b i d   =   0 ;  
 	 	 i n t   p o l a r i t y     =   0 ;  
 	 	 s t r i n g   s y m b o l   =   " " ;  
  
 	 	 f o r   ( i   =   t o t a l   -   1 ;   i   > =   0 ;   i - - )  
 	 	 {  
 	 	 	 n a m e   =   O b j e c t N a m e ( 0 ,   i ,   - 1 ,   O B J _ H L I N E ) ;   / /   f o r   e x a m p l e :   # 1   s l  
  
 	 	 	 i f   ( S t r i n g S u b s t r ( n a m e ,   0 ,   1 )   ! =   " # " )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;  
 	 	 	 }  
  
 	 	 	 l e n g t h   =   S t r i n g L e n ( n a m e ) ;  
  
 	 	 	 i f   ( l e n g t h   <   5 )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;  
 	 	 	 }  
  
 	 	 	 c l r   =   ( c o l o r ) O b j e c t G e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ) ;  
  
 	 	 	 i f   ( c l r   ! =   l o o p _ c o l o r [ 0 ]   & &   c l r   ! =   l o o p _ c o l o r [ 1 ] )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;  
 	 	 	 }  
  
 	 	 	 s t r i n g   l a s t _ s y m b o l s   =   S t r i n g S u b s t r ( n a m e ,   l e n g t h - 2 ,   2 ) ;  
  
 	 	 	 i f   ( l a s t _ s y m b o l s   = =   " s l " )  
 	 	 	 {  
 	 	 	 	 s l t p   =   - 1 ;  
 	 	 	 }  
 	 	 	 e l s e   i f   ( l a s t _ s y m b o l s   = =   " t p " )  
 	 	 	 {  
 	 	 	 	 s l t p   =   1 ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ; 	  
 	 	 	 }  
  
 	 	 	 u l o n g   t i c k e t 0   =   S t r i n g T o I n t e g e r ( S t r i n g S u b s t r ( n a m e ,   1 ,   l e n g t h   -   4 ) ) ;  
  
 	 	 	 / /   p r e v e n t   l o a d i n g   t h e   s a m e   t i c k e t   n u m b e r   t w i c e   i n   a   r o w  
 	 	 	 i f   ( t i c k e t 0   ! =   t i c k e t )  
 	 	 	 {  
 	 	 	 	 t i c k e t   =   t i c k e t 0 ;  
  
 	 	 	 	 i f   ( T r a d e S e l e c t B y T i c k e t ( t i c k e t ) )  
 	 	 	 	 {  
 	 	 	 	 	 s y m b o l           =   O r d e r S y m b o l ( ) ;  
 	 	 	 	 	 p o l a r i t y       =   ( O r d e r T y p e ( )   = =   0 )   ?   1   :   - 1 ;  
 	 	 	 	 	 a s k b i d       =   ( O r d e r T y p e ( )   = =   0 )   ?   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D )   :   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 	 	  
 	 	 	 	 	 t r a d e _ p a s s   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 t r a d e _ p a s s   =   f a l s e ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( t r a d e _ p a s s )  
 	 	 	 {  
 	 	 	 	 l e v e l         =   O b j e c t G e t D o u b l e ( 0 ,   n a m e ,   O B J P R O P _ P R I C E ,   0 ) ;  
  
 	 	 	 	 i f   ( l e v e l   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 / /   p o l a r i z e   l e v e l s  
 	 	 	 	 	 d o u b l e   l e v e l _ p     =   p o l a r i t y   *   l e v e l ;  
 	 	 	 	 	 d o u b l e   a s k b i d _ p   =   p o l a r i t y   *   a s k b i d ;  
  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       ( s l t p   = =   - 1   & &   ( l e v e l _ p   -   a s k b i d _ p )   > =   0 )   / /   s l  
 	 	 	 	 	 	 | |   ( s l t p   = =   1   & &   ( a s k b i d _ p   -   l e v e l _ p )   > =   0 )     / /   t p  
 	 	 	 	 	 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 / / - -   V i r t u a l   S t o p s   S L   T i m e o u t  
 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	       ( V I R T U A L _ S T O P S _ T I M E O U T   >   0 )  
 	 	 	 	 	 	 	 & &   ( s l t p   = =   - 1   & &   ( l e v e l _ p   -   a s k b i d _ p )   > =   0 )   / /   s l  
 	 	 	 	 	 	 )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 / /   s t a r t   t i m e o u t ?  
 	 	 	 	 	 	 	 i n t   i n d e x   =   A r r a y S e a r c h ( m e m _ t o _ t i ,   t i c k e t ) ;  
  
 	 	 	 	 	 	 	 i f   ( i n d e x   <   0 )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 i n t   s i z e   =   A r r a y S i z e ( m e m _ t o _ t i ) ;  
 	 	 	 	 	 	 	 	 A r r a y R e s i z e ( m e m _ t o _ t i ,   s i z e + 1 ) ;  
 	 	 	 	 	 	 	 	 A r r a y R e s i z e ( m e m _ t o ,   s i z e + 1 ) ;  
 	 	 	 	 	 	 	 	 m e m _ t o _ t i [ s i z e ]   =   t i c k e t ;  
 	 	 	 	 	 	 	 	 m e m _ t o [ s i z e ]         =   ( i n t ) T i m e L o c a l ( ) ;  
  
 	 	 	 	 	 	 	 	 P r i n t (  
 	 	 	 	 	 	 	 	 	 " # " ,  
 	 	 	 	 	 	 	 	 	 t i c k e t ,  
 	 	 	 	 	 	 	 	 	 "   t i m e o u t   o f   " ,  
 	 	 	 	 	 	 	 	 	 V I R T U A L _ S T O P S _ T I M E O U T ,  
 	 	 	 	 	 	 	 	 	 "   s e c o n d s   s t a r t e d "  
 	 	 	 	 	 	 	 	 ) ;  
  
 	 	 	 	 	 	 	 	 r e t u r n   0 ;  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 	 e l s e  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 i f   ( T i m e L o c a l ( )   -   m e m _ t o [ i n d e x ]   < =   V I R T U A L _ S T O P S _ T I M E O U T )  
 	 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 	 r e t u r n   0 ;  
 	 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
  
 	 	 	 	 	 	 i f   ( C l o s e T r a d e ( t i c k e t ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 / /   c h e c k   t h i s   b e f o r e   d e l e t i n g   t h e   l i n e s  
 	 	 	 	 	 	 	 / / O n T r a d e L i s t e n e r ( ) ;  
  
 	 	 	 	 	 	 	 / /   d e l e t e   o b j e c t s  
 	 	 	 	 	 	 	 O b j e c t D e l e t e ( 0 ,   " # "   +   ( s t r i n g ) t i c k e t   +   "   s l " ) ;  
 	 	 	 	 	 	 	 O b j e c t D e l e t e ( 0 ,   " # "   +   ( s t r i n g ) t i c k e t   +   "   t p " ) ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( V I R T U A L _ S T O P S _ T I M E O U T   >   0 )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 i   =   A r r a y S e a r c h ( m e m _ t o _ t i ,   t i c k e t ) ;  
  
 	 	 	 	 	 	 	 i f   ( i   > =   0 )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 A r r a y S t r i p K e y ( m e m _ t o _ t i ,   i ) ;  
 	 	 	 	 	 	 	 	 A r r a y S t r i p K e y ( m e m _ t o ,   i ) ;  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e   i f   (  
 	 	 	 	 	 ! P e n d i n g O r d e r S e l e c t B y T i c k e t ( t i c k e t )  
 	 	 	 	 | |   O r d e r C l o s e T i m e ( )   >   0   / /   i n   c a s e   t h e   o r d e r   h a s   b e e n   c l o s e d  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 O b j e c t D e l e t e ( 0 ,   n a m e ) ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 P e n d i n g O r d e r S e l e c t B y T i c k e t ( t i c k e t ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
 	 / /   G e t   S L   o r   T P  
 	 e l s e   i f   (  
 	 	 t i   >   0  
 	 	 & &   (  
 	 	 	       c o m m a n d   = =   " g e t   s l "  
 	 	 	 | |   c o m m a n d   = =   " g e t   t p "  
 	 	 )  
 	 )  
 	 {  
 	 	 d o u b l e   v a l u e   =   0 ;  
  
 	 	 n a m e   =   " # "   +   I n t e g e r T o S t r i n g ( t i )   +   "   "   +   S t r i n g S u b s t r ( c o m m a n d ,   4 ,   2 ) ;  
  
 	 	 i f   ( O b j e c t F i n d ( 0 ,   n a m e )   >   - 1 )  
 	 	 {  
 	 	 	 v a l u e   =   O b j e c t G e t D o u b l e ( 0 ,   n a m e ,   O B J P R O P _ P R I C E ,   0 ) ;  
 	 	 }  
  
 	 	 r e t u r n   v a l u e ;  
 	 }  
 	 / /   S e t   S L   a n d   T P  
 	 e l s e   i f   (  
 	 	 t i   >   0  
 	 	 & &   (  
 	 	 	       c o m m a n d   = =   " s e t "  
 	 	 	 | |   c o m m a n d   = =   " m o d i f y "  
 	 	 	 | |   c o m m a n d   = =   " c l e a r "  
 	 	 	 | |   c o m m a n d   = =   " p a r t i a l "  
 	 	 )  
 	 )  
 	 {  
 	 	 l o o p _ p r i c e [ 0 ]   =   s l ;  
 	 	 l o o p _ p r i c e [ 1 ]   =   t p ;  
  
 	 	 f o r   ( i   =   0 ;   i   <   2 ;   i + + )  
 	 	 {  
 	 	 	 n a m e   =   " # "   +   I n t e g e r T o S t r i n g ( t i )   +   "   "   +   l o o p _ n a m e [ i ] ;  
 	 	 	  
 	 	 	 i f   ( l o o p _ p r i c e [ i ]   >   0 )  
 	 	 	 {  
 	 	 	 	 / /   1 )   c r e a t e   a   n e w   l i n e  
 	 	 	 	 i f   ( O b j e c t F i n d ( 0 ,   n a m e )   = =   - 1 )  
 	 	 	 	 {  
 	 	 	 	 	 	   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ H L I N E ,   0 ,   0 ,   l o o p _ p r i c e [ i ] ) ;  
 	 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ W I D T H ,   1 ) ;  
 	 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   l o o p _ c o l o r [ i ] ) ;  
 	 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ S T Y L E ,   S T Y L E _ D O T ) ;  
 	 	 	 	 	 O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   n a m e   +   "   ( v i r t u a l ) " ) ;  
 	 	 	 	 }  
 	 	 	 	 / /   2 )   m o d i f y   e x i s t i n g   l i n e  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 O b j e c t S e t D o u b l e ( 0 ,   n a m e ,   O B J P R O P _ P R I C E ,   0 ,   l o o p _ p r i c e [ i ] ) ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 / /   3 )   d e l e t e   e x i s t i n g   l i n e  
 	 	 	 	 O b j e c t D e l e t e ( 0 ,   n a m e ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 / /   p r i n t   m e s s a g e  
 	 	 i f   ( c o m m a n d   = =   " s e t "   | |   c o m m a n d   = =   " m o d i f y " )  
 	 	 {  
 	 	 	 P r i n t (  
 	 	 	 	 c o m m a n d ,  
 	 	 	 	 "   # " ,  
 	 	 	 	 I n t e g e r T o S t r i n g ( t i ) ,  
 	 	 	 	 " :   v i r t u a l   s l   " ,  
 	 	 	 	 D o u b l e T o S t r ( s l ,   ( i n t ) S y m b o l I n f o I n t e g e r ( S y m b o l ( ) , S Y M B O L _ D I G I T S ) ) ,  
 	 	 	 	 "   t p   " ,  
 	 	 	 	 D o u b l e T o S t r ( t p , ( i n t ) S y m b o l I n f o I n t e g e r ( S y m b o l ( ) , S Y M B O L _ D I G I T S ) )  
 	 	 	 ) ;  
 	 	 }  
  
 	 	 r e t u r n   1 ;  
 	 }  
  
 	 r e t u r n   1 ;  
 }  
  
 i n t   W i n d o w F i n d V i s i b l e ( l o n g   c h a r t _ i d ,   s t r i n g   t e r m )  
 {  
       / / - -   t h e   s e a r c h   t e r m   c a n   b e   c h a r t   n a m e ,   s u c h   a s   F o r c e ( 1 3 ) ,   o r   s u b w i n d o w   i n d e x  
       i f   ( t e r m   = =   " "   | |   t e r m   = =   " 0 " )   { r e t u r n   0 ; }  
        
       i n t   s u b w i n d o w   =   ( i n t ) S t r i n g T o I n t e g e r ( t e r m ) ;  
        
       i f   ( s u b w i n d o w   = =   0   & &   S t r i n g L e n ( t e r m )   >   1 )  
       {  
             s u b w i n d o w   =   C h a r t W i n d o w F i n d ( c h a r t _ i d ,   t e r m ) ;  
       }  
        
       i f   ( s u b w i n d o w   >   0   & &   ! C h a r t G e t I n t e g e r ( c h a r t _ i d ,   C H A R T _ W I N D O W _ I S _ V I S I B L E ,   s u b w i n d o w ) )  
       {  
             r e t u r n   - 1 ;      
       }  
        
       r e t u r n   s u b w i n d o w ;  
 }  
  
 s t r i n g   e _ R e a s o n ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e R e a s o n ( ) ; }  
  
 s t r i n g   e _ R e a s o n D e t a i l ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e D e t a i l ( ) ; }  
  
 d o u b l e   e _ a t t r C l o s e P r i c e ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e P r i c e C l o s e ( ) ; }  
  
 d a t e t i m e   e _ a t t r C l o s e T i m e ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e T i m e C l o s e ( ) ; }  
  
 s t r i n g   e _ a t t r C o m m e n t ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e C o m m e n t ( ) ; }  
  
 d a t e t i m e   e _ a t t r E x p i r a t i o n ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e T i m e E x p i r a t i o n ( ) ; }  
  
 d o u b l e   e _ a t t r L o t s ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e V o l u m e ( ) ; }  
  
 d o u b l e   e _ a t t r O p e n P r i c e ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e P r i c e O p e n ( ) ; }  
  
 d a t e t i m e   e _ a t t r O p e n T i m e ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e T i m e O p e n ( ) ; }  
  
 d o u b l e   e _ a t t r P r o f i t ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e P r o f i t ( ) ; }  
  
 d o u b l e   e _ a t t r S t o p L o s s ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e S t o p L o s s ( ) ; }  
  
 d o u b l e   e _ a t t r S w a p ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e S w a p ( ) ; }  
  
 d o u b l e   e _ a t t r T a k e P r o f i t ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e T a k e P r o f i t ( ) ; }  
  
 l o n g   e _ a t t r T i c k e t ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e T i c k e t ( ) ; }  
  
 i n t   e _ a t t r T y p e ( )   { r e t u r n   o n T r a d e E v e n t D e t e c t o r . E v e n t V a l u e T y p e ( ) ; }  
  
 d o u b l e   f x d C u s t o m I n d i c a t o r ( i n t   h a n d l e ,   i n t   m o d e = 0 ,   i n t   s h i f t = 0 )  
 {  
 	 s t a t i c   d o u b l e   b u f f e r [ 1 ] ;  
  
 	 i f   ( h a n d l e   <   0 )  
 	 {  
 	 	 P r i n t ( " E r r o r :   I n d i c a t o r   n o t   h a n d l e d .   ( h a n d l e = " , h a n d l e , "   |   e r r o r   c o d e = " , G e t L a s t E r r o r ( ) , " ) " ) ;  
 	 	 r e t u r n   0 ;  
 	 }  
  
 	 i n t   t r y o u t s   =   0 ;  
  
 	 w h i l e   ( t r u e )  
 	 {  
 	 	 i f   ( B a r s C a l c u l a t e d ( h a n d l e )   >   0 )   b r e a k ;  
 	 	 e l s e  
 	 	 {  
 	 	 	 t r y o u t s + + ;  
  
 	 	 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R ) )  
 	 	 	 {  
 	 	 	 	 S l e e p ( 1 0 ) ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   ( t r y o u t s   >   1 0 0 )  
 	 	 	 	 {  
 	 	 	 	 	 P r i n t ( " E r r o r :   C u s t o m   i n d i c a t o r   c o u l d   n o t   l o a d   ( h a n d l e = " , h a n d l e , "   |   e r r o r   c o d e = " , G e t L a s t E r r o r ( ) , " ) " ) ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
  
 	 	 	 	 S l e e p ( 5 0 ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 i n t   s u c c e s s   =   C o p y B u f f e r ( h a n d l e , m o d e , s h i f t , 1 , b u f f e r ) ;  
  
 	 i f   ( s u c c e s s   <   0 )  
 	 {  
 	 	 P r i n t ( " E r r o r :   C a n n o t   g e t   v a l u e   f r o m   a   c u s t o m   i n d i c a t o r .   ( h a n d l e = " , h a n d l e , "   |   e r r o r   c o d e = " , G e t L a s t E r r o r ( ) , " ) " ) ;  
 	 	 r e t u r n   0 ;  
 	 }  
  
 	 / / A r r a y S e t A s S e r i e s ( b u f f e r , t r u e ) ;  
  
 	 r e t u r n   b u f f e r [ 0 ] ;  
 }  
  
 i n t   i C a n d l e I D ( s t r i n g   S Y M B O L ,   E N U M _ T I M E F R A M E S   T I M E F R A M E ,   d a t e t i m e   t i m e _ s t a m p )  
 {  
 	 b o o l   T i m e S t a m p P r e v D a y S h i f t   =   t r u e ;  
 	 i n t   C a n d l e I D                               =   0 ;  
  
 	 / /   g e t   t h e   t i m e   r e s o l u t i o n   o f   t h e   d e s i r e d   p e r i o d ,   i n   m i n u t e s  
 	 i n t   m i n s _ t f     =   T I M E F R A M E ;  
 	 i n t   m i n s _ t f 0   =   0 ;  
  
 	 i f   ( T I M E F R A M E   = =   P E R I O D _ C U R R E N T )  
 	 {  
 	 	 m i n s _ t f   =   ( i n t ) P e r i o d S e c o n d s ( P E R I O D _ C U R R E N T )   /   6 0 ;  
 	 }  
  
 	 / /   g e t   t h e   d i f f e r e n c e   b e t w e e n   n o w   a n d   t h e   t i m e   w e   w a n t ,   i n   m i n u t e s  
 	 i n t   d a y s _ a d j u s t   =   0 ;  
  
 	 i f   ( T i m e S t a m p P r e v D a y S h i f t )  
 	 {  
 	 	 / /   a u t o m a t i c a l l y   s h i f t   t o   t h e   p r e v i o u s   d a y  
 	 	 i f   ( t i m e _ s t a m p   >   T i m e C u r r e n t ( ) )  
 	 	 {  
 	 	 	 t i m e _ s t a m p   =   t i m e _ s t a m p   -   8 6 4 0 0 ;  
 	 	 }  
  
 	 	 / /   a l s o   s h i f t   w e e k d a y s  
 	 	 w h i l e   ( t r u e )  
 	 	 {  
 	 	 	 i n t   d o w   =   T i m e D a y O f W e e k ( t i m e _ s t a m p ) ;  
  
 	 	 	 i f   ( d o w   >   0   & &   d o w   <   6 )   { b r e a k ; }  
  
 	 	 	 t i m e _ s t a m p   =   t i m e _ s t a m p   -   8 6 4 0 0 ;  
 	 	 	 d a y s _ a d j u s t + + ;  
 	 	 }  
 	 }  
  
 	 i n t   m i n s _ d i f f   =   ( i n t ) ( T i m e C u r r e n t ( )   -   t i m e _ s t a m p ) ;  
 	 m i n s _ d i f f   =   m i n s _ d i f f   -   d a y s _ a d j u s t * 8 6 4 0 0 ;  
 	 m i n s _ d i f f   =   m i n s _ d i f f   /   6 0 ;  
  
 	 / /   t h e   d i f f e r e n c e   i s   n e g a t i v e   = >   q u i t   h e r e  
 	 i f   ( m i n s _ d i f f   <   0 )  
 	 {  
 	 	 r e t u r n   ( i n t ) E M P T Y _ V A L U E ;  
 	 }  
  
 	 / /   n o w   c a l c u l a t e   t h e   c a n d l e   I D ,   i t   i s   r e l a t i v e   t o   t h e   c u r r e n t   t i m e  
 	 i f   ( m i n s _ d i f f   >   0 )  
 	 {  
 	 	 C a n d l e I D   =   ( i n t ) M a t h C e i l ( ( d o u b l e ) m i n s _ d i f f / ( d o u b l e ) m i n s _ t f ) ;  
 	 }  
  
 	 / /   n o w ,   a f t e r   a l l   t h e   s h i f t i n g   a n d   i n   c a s e   o f   m i s s i n g   c a n d l e s ,   t h e   c a l c u l a t e d   c a n d l e   i d   c a n   b e   f e w   c a n d l e s   e a r l y  
 	 / /   s o   w e   w i l l   s e a r c h   f o r   t h e   r i g h t   c a n d l e  
 	 w h i l e ( t r u e )  
 	 {  
 	 	 i f   ( i T i m e ( S Y M B O L ,   T I M E F R A M E ,   C a n d l e I D )   > =   t i m e _ s t a m p )   { b r e a k ; }  
  
 	 	 C a n d l e I D - - ;  
  
 	 	 i f   ( C a n d l e I D   < =   0 )   { C a n d l e I D   =   0 ;   b r e a k ; }  
 	 }  
  
 	 r e t u r n   C a n d l e I D ;  
 }  
  
 d o u b l e   i M A C D (    
 	 s t r i n g                           s y m b o l ,  
 	 E N U M _ T I M E F R A M E S         t i m e f r a m e ,  
 	 i n t                                 f a s t _ e m a _ p e r i o d ,  
 	 i n t                                 s l o w _ e m a _ p e r i o d ,  
 	 i n t                                 s i g n a l _ p e r i o d ,  
 	 E N U M _ A P P L I E D _ P R I C E   a p p l i e d _ p r i c e ,  
 	 i n t                                 m o d e ,  
 	 i n t                                 s h i f t  
 )  
 {  
 	 i n t   h a n d l e   =   i M A C D ( s y m b o l ,   t i m e f r a m e ,   f a s t _ e m a _ p e r i o d ,   s l o w _ e m a _ p e r i o d ,   s i g n a l _ p e r i o d ,   a p p l i e d _ p r i c e ) ;  
 	 d o u b l e   v a l   =   f x d C u s t o m I n d i c a t o r ( h a n d l e ,   m o d e ,   s h i f t ) ;  
  
 	 r e t u r n   N o r m a l i z e D o u b l e ( v a l ,   6 ) ;  
 }  
  
 d o u b l e   i S t o c h a s t i c (    
 	 s t r i n g                           s y m b o l ,  
 	 E N U M _ T I M E F R A M E S         t i m e f r a m e ,  
 	 i n t                                 K p e r i o d ,  
 	 i n t                                 D p e r i o d ,  
 	 i n t                                 s l o w i n g ,  
 	 E N U M _ M A _ M E T H O D           m a _ m e t h o d ,  
 	 E N U M _ S T O _ P R I C E           p r i c e _ f i e l d ,  
 	 i n t                                 m o d e ,  
 	 i n t                                 s h i f t  
 )  
 {  
 	 i n t   h a n d l e   =   i S t o c h a s t i c ( s y m b o l ,   t i m e f r a m e ,   K p e r i o d ,   D p e r i o d ,   s l o w i n g ,   m a _ m e t h o d ,   p r i c e _ f i e l d ) ;  
 	 d o u b l e   v a l   =   f x d C u s t o m I n d i c a t o r ( h a n d l e ,   m o d e ,   s h i f t ) ;  
  
 	 r e t u r n   N o r m a l i z e D o u b l e ( v a l ,   2 ) ;  
 }  
  
 d o u b l e   t o P i p s ( d o u b l e   d i g i t s ,   s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
       r e t u r n   d i g i t s   /   ( P i p V a l u e ( s y m b o l )   *   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ) ;  
 }  
  
  
  
  
  
  
 c l a s s   F x d W a i t i n g  
 {  
 	 p r i v a t e :  
 	 	 i n t   b e g i n n i n g _ i d ;  
 	 	 u s h o r t   b a n k     [ ] [ 2 ] [ 2 0 ] ;   / /   2   b a n k s ,   2 0   p o s s i b l e   p a r a l l e l   w a i t i n g   b l o c k s   p e r   c h a i n   o f   b l o c k s  
 	 	 u s h o r t   s t a t e   [ ] [ 2 ] ;           / /   s e c o n d   d i m e n t i o n   v a l u e s :   0   -   c o u n t   o f   t h e   b l o c k s   p u t   o n   h o l d ,   1   -   c u r r e n t   b a n k   i d  
  
 	 p u b l i c :  
 	 	 v o i d   I n i t i a l i z e ( i n t   c o u n t )  
 	 	 {  
 	 	 	 A r r a y R e s i z e ( b a n k ,   c o u n t ) ;  
 	 	 	 A r r a y R e s i z e ( s t a t e ,   c o u n t ) ;  
 	 	 }  
  
 	 	 b o o l   R u n ( i n t   i d   =   0 )  
 	 	 {  
 	 	 	 b e g i n n i n g _ i d   =   i d ;  
  
 	 	 	 i n t   r a n g e   =   A r r a y R a n g e ( s t a t e ,   0 ) ;  
 	 	 	 i f   ( r a n g e   <   i d + 1 )   {  
 	 	 	 	 A r r a y R e s i z e ( b a n k ,   i d + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( s t a t e ,   i d + 1 ) ;  
  
 	 	 	 	 / /   s e t   v a l u e s   t o   0 ,   o t h e r w i s e   t h e y   h a v e   r a n d o m   v a l u e s  
 	 	 	 	 f o r   ( i n t   i i   =   r a n g e ;   i i   <   i d + 1 ;   i i + + )  
 	 	 	 	 {  
 	 	 	 	       s t a t e [ i i ] [ 0 ]   =   0 ;  
 	 	 	 	       s t a t e [ i i ] [ 1 ]   =   0 ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 / /   a r e   t h e r e   b l o c k s   p u t   o n   h o l d ?  
 	 	 	 i n t   c o u n t   =   s t a t e [ i d ] [ 0 ] ;  
 	 	 	 i n t   b a n k _ i d   =   s t a t e [ i d ] [ 1 ] ;  
  
 	 	 	 / /   i f   n o   b l o c k   a r e   p u t   o n   h o l d   - >   e s c a p e  
 	 	 	 i f   ( c o u n t   = =   0 )   { r e t u r n   f a l s e ; }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 s t a t e [ i d ] [ 0 ]   =   0 ;   / /   n u l l   t h e   c o u n t  
 	 	 	 	 s t a t e [ i d ] [ 1 ]   =   ( b a n k _ i d )   ?   0   :   1 ;   / /   s w i t c h   t o   t h e   o t h e r   b a n k  
 	 	 	 }  
  
 	 	 	 / / = =   n o w   w e   w i l l   r u n   t h e   b l o c k s   p u t   o n   h o l d  
  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   c o u n t ;   i + + )  
 	 	 	 {  
 	 	 	 	 i n t   b l o c k _ t o _ r u n   =   b a n k [ i d ] [ b a n k _ i d ] [ i ] ;  
 	 	 	 	 _ b l o c k s _ [ b l o c k _ t o _ r u n ] . r u n ( ) ;  
 	 	 	 }  
  
 	 	 	 r e t u r n   t r u e ;  
 	 	 }  
  
 	 	 v o i d   A c c u m u l a t e ( i n t   b l o c k _ i d   =   0 )  
 	 	 {  
 	 	 	 i n t   c o u n t       =   + + s t a t e [ b e g i n n i n g _ i d ] [ 0 ] ;  
 	 	 	 i n t   b a n k _ i d   =   s t a t e [ b e g i n n i n g _ i d ] [ 1 ] ;  
  
 	 	 	 b a n k [ b e g i n n i n g _ i d ] [ b a n k _ i d ] [ c o u n t - 1 ]   =   ( u s h o r t ) b l o c k _ i d ;  
 	 	 }  
 } ;  
 F x d W a i t i n g   f x d W a i t ;  
  
  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |   E N D                                                                                                                             |  
 / / |   C r e a t e d   w i t h   f x D r e e m a   E A   B u i l d e r                       h t t p s : / / f x d r e e m a . c o m /   |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
  
 / * < f x d r e e m a : e N r t H W t v 2 z j y r w T Z L 3 d A t 9 D b j x 4 O c J y k 7 Z 0 d 5 2 J 3 i 9 0 v g i z R M S + y q J X k p L 5 F / / s N X x K l S E 7 S q H m 0 W i x 2 Z Q 0 5 n B n O i 0 N S 8 Y a 9 4 V / p U N e H h z 6 J I u R n m E T p 4 T t v q G v D v / B Q g y e T t r C H h y u M w u D w X Q p d D o 9 P T k e f J g v 6 y x k e p m S b + I j + A D y m e J l 5 y S X K x E v n 8 N 1 X P N Q f j s 2 5 h c 0 Y H u o a Q 2 c 8 H J 1 V R 5 z N s J k P x 2 b X Y R s w b N b D s R l 1 2 C y G z W 4 J m 8 m w O Q / H N q i d B k 5 c 7 4 H o x A T W 4 O M T 0 f 8 G f F Y t P q 5 1 g 2 / A Z 9 f i 6 w G + r + z 9 M i T + F b c T m 9 o J V U V D p 4 P 0 m S V l C Q k Z m A 0 M H e a 7 z Z K E F J E 2 P B T I z 1 G C C a N G t + D X y c X H 2 b E 7 / n R x c X L G q N J h z H M v T a f e l w X e o F T M h Q 5 U p M M B H 8 f D E U o o A D A s s H 9 F H 4 G E A K f e M k S A f A k 2 z N h F X z K U c N s G 0 / 7 K O M K B q i 2 A E q e u v 0 0 z s p E d + 5 J X L g U q q F 2 a o Y 0 Y Z 0 M C F L o C D X A 2 i 3 w E b B 1 5 j C Y d h o 2 9 x N s g G B o w E 5 I E a V k G M Q a v k 5 M J M 5 T 6 X o g E M C L J x g s l 7 h R R X B l J F B 4 o P Z m X b d k r Q 0 w y i c h q d f g O M 5 Q g l 8 D L v H z U r 6 x J h j M + C p U x J f o g R s n B k p M N S A E B 4 1 g g B S Q h W m U U p 2 F T r C a g I D H 9 b d k U J T S 4 8 X A m + Q B J X n s J p l O g E A v S I N s s 3 m a p i h j D O 9 p P 5 8 Q i 8 V O j a G E Y P y 3 0 S K e a 5 / l X l w n Z R s G v P g l J I p T 5 l 6 W G j D 7 z v T b V D A G B q f 2 F / R 8 e V q A u v 9 4 g f L n O V G l Q 3 Z M a 6 4 K S J F 5 B M Z X O E i Y N J b + m 2 Y 5 L j P f j / r J W 5 Z 0 m l Q c y V 1 6 a n U x H 0 q A M 8 T o N y U 3 x 2 n C E N q b 4 M v L C O Q d I L 6 S D U D a e H y z W C U r X h J s z D K e 9 1 T T N v J d p P d J 8 b B 4 Z y w x h N o E q L 9 Q r V N m g Y q t l g U a M E u U V A z X b M F C d D 3 u M r 4 / Q q 7 F Q A 3 5 M R + P j A y A b g T e m x v o 3 S j 9 O 1 3 + / 0 1 z N X q 9 k r r r d f 3 5 7 h W 6 / n I 6 1 J z R W q z P W J z R W q 2 V j 3 Y b h q z Z W o P 9 e x t r X K 7 b q / I y 2 a j f Z q k X f Q c c J y X n M t c 6 g T 1 G A f T a j L p 5 n x F + D u m N f 6 J a K i K 7 t m M j + H e e m B / 1 t T W b G x W t p y P B 2 D r a C o 0 t p 9 5 p A P B 2 B P q 5 5 a / p z d n z i S i 8 A L J 0 n 2 E e n M u 2 m 4 p o v Z u 5 k 9 v n D x / c f h I C n o P d i M L k w + J Z 8 G e Z n v s a r r M i T O Q n j G T Q Z L z 7 O z g o x c 5 X x y Q a M Q I 7 9 T 8 H a x Q 8 s X / 3 p 5 E t B f k L S 9 A Y H 2 b q 0 e N l n G o 9 x 9 k b J Q l T X n 8 9 E 7 v q P i z d G Z Q K 4 4 8 8 F 1 + D u L 4 p B 7 F u D O L c G 6 d 0 a p F 8 e Z F A Z p B J U 7 B a C C n Q f E 9 B i W u V 5 J R G l S v L e A K K b 5 c W Z Y f V e x u r s 9 P R 4 P B p 8 S x D Z E y i c L l A 8 T 6 D 4 R x c o u k D x Y g O F 0 w W K O w O F p d v l Q G H a P 3 C g 6 H 9 L o K C m p z o y 7 k k q C P o C 6 X R U 8 l S 2 Y G c 6 S h U / c B 9 H B c O P 4 j j E K G D + S j J 9 f v F x f O K O J 7 P 5 y f 3 8 k h h N 9 U S i X V s r g m + W T + 6 z X 5 + A H u y p 9 X x 3 k f Z y b 3 d r d x u j 3 7 m + O 1 1 f r 7 K B Y f S s H 9 j 1 D Z p c H 0 + 9 g M 2 P 0 o a 7 X L m N X A 6 4 G H t R A G p z u 5 u Z w 0 q O i A O B l p M v P o q p E o t W K v m U u k 8 x y H C C r l E o m W N b u l 9 Q v v 9 Y t B A S N T U p o U C F 3 X L m O t X 3 c I t c 9 t + a 6 Z V 2 + Z u E Q 9 + e d p c 0 L B p b b + 4 g u m h R Y p j S r I L a o d n c T / M j X b J D k 1 z r X Z 0 e 8 O S 3 R g d 4 D l w / / z w b r s 4 s z 4 h v i 6 5 q z d b j 8 v o 9 O f a g h U A D b q k g 9 z P O 1 j i a 4 A 3 O 0 u 8 d d X Q q F l 2 N w o + v + 6 u i P 9 i Q a 5 Q e 3 D C W D s K c p / 2 1 / 3 4 p K p m G + W K i k u U Y T 1 j + 1 7 U u Z P 2 8 I c u k h 6 N e X c w q 8 H Z B 6 4 U G r f z U X R e 1 W o x a Z r 9 c R z I 1 + 2 c N W 3 p T 2 L J F 1 H o P Z M a K P 6 F k x + L 5 v X x W a h D c 9 c s O T C d l L K g L D J S n o + 0 u n S V z F I a p c A J L Q g s O b R Y a G K u P P 9 4 B 4 5 + R W Y z A G G Z U  
 o u l r O T C p U 8 I P Y p L e r 9 x g 2 O X E T t e d l 2 E h o 8 F 4 c H r 6 l B b S e E j Y t s R E V M 2 g V s / h / 7 + R c L t B T b G Z Q + f 4 f 0 g o u v Z W 0 6 X S F c A L n F 6 V M r 6 i r w S B O I 2 3 t k y E O A y i i 4 + i r J K s 9 C X 4 i B q A 0 k a e X W S Z g U p Z C 5 m B S V m 7 M 7 0 D L K d U P B c e K O y n C G d 1 k r H V R s c o 5 A a Q 5 7 d 0 X j e b R e I F k A I Q U l 6 o 2 x Q 2 v f w I q L E X T g i P G w p x f d 5 g u g 0 z H I e 7 W T Q h a a q e v D a 0 a o v z h K x w O R X t 8 T a j I K B D l J B w O g a V B i U c J V I v E F h r D Y Z e C d x E g 2 4 a T j O z p m x y A R l O k u Y a 6 o X 8 m e M 4 x U v S i M N g 0 j 4 G v 7 Z Z o i S 7 Q 7 B 5 u 4 Y B D U b R x F u S r b 9 G C W p G 5 5 Q b T n C a S c 3 U 3 x h v z D f W G / u N U 8 i 6 a N r E K x t 6 j v 4 8 8 l J U M 6 A u w M V U Q G 8 T h n J K v W u n w h D A p q E d a Z E 8 C a X 5 j O p F o D u s D W M 6 r v Q j w F P M D X d x X m 1 z j u O 0 5 C y o y u Z A 3 i v f k G C G Z d t y t i v N O H L F d w C m I J S N W n E M 9 9 x 0 D u J W R y 2 z t G / c o N V x V T + 2 f 1 2 3 8 K 4 Q V 6 V 8 q Q 0 D B 7 v I 2 2 C / q E C W W t 6 e e a M E 3 j P 3 g 5 q G 8 0 l F V J S A s G h W I 5 F e u a R x B O u s t E Y u A 7 n X x B q c 3 9 5 v o 8 J h s H l 1 z w 0 I P U b X 2 M v 3 f I R f v u d u m 8 V z u 2 c 4 O U G F F + 8 V 3 v d S Y z p y 0 P L I 9 1 P k H l 1 z 5 w s J o P b 9 Y i y S O n h / 7 O 3 U j L n P X n 4 g 2 y S t y p Q i w d E 2 Q 2 p 7 m v 0 C o I Y d T b K T 4 U 0 t N 4 b c 6 w X K F q J N H l k 1 u t y A 1 E e 9 V C d V j w E y b y M X Q 5 o 2 L G y D A n l l 4 e N x l Q M K m 3 r J F S p 5 9 o H a i T 6 t 6 I K i G u d Z E 7 K J S Q R G + b u 4 D i J R 9 C v w K f C 5 V h s 4 l Q Y g d R V c x U / l X 7 p G k B O Z j 8 B m o p r O l J r M E Y g 7 q J G d 6 v Y 1 G T j l L K j m Z O T e T Q I o 4 + r 0 0 w Q p B z K u S 1 C 1 6 2 e E r k p A U w F K L c x n S + 2 Z a 2 N F m n z Q W y p Z A n M h 1 I K v c E x p C s T Q M G K W U L l Q m + n T O h G O Y + 8 S V e 4 o T H c g 4 I 1 I 1 h V W R k l C b s Z 0 W Q S L a m F e f p g c M V E / c j 1 t y h J X d b U i C j x N O U N d r H D 4 9 c s a z y + u b 1 S c P q / 0 l R 2 + q P L d c v a 8 y J d 7 d 1 7 X 2 1 d g a + M a p c P K G G f k 5 n s X B G y l o K b J g i J X W C E 6 8 W w p b e z 8 u Y 1 i Q o / x e h B x Z v f W E R y t X G m z d K 2 l O o J W r i P o D 6 w j a F p f 0 2 7 d D 6 G Q F f u n o Z r A a l N h 8 L i K g t l V F L q K Q l d R 6 C o K X U W h q y h 0 F Y U f t a J g d B W F r q L Q V R S 6 i s L r r S h Y a k W B b t A L 9 + W H y Q U K u o p C U 0 W h j e + + U O Z B 4 j 9 H S a H P m b 1 X T W G g V 7 7 l Z L y Q m s J q p T 1 b T a H x U z E 8 H N F J H 4 W w N l r k p 6 i A s d / B A R 2 w 1 w d T l K b g F A 7 o I k b S y S C w t k G h X j m x w y D M 3 e p t 5 e l 3 J h o l g o x G g o z n I c h s J M h 8 H o K s R o K s 5 y H I b i T I f h 6 C n E a C n O c h q N d I U O 9 5 C O o 3 E t R / H o I G j Q Q N n o w g o + Q Y t U o t R f G M 2 l O R Z D D n n p I 5 i o I z k u E V X S K L F W x R C n r 8 3 f s i V 1 N D C U 8 d m m m o 5 k Z t f G b L k D S I s D U K r r 3 I R 8 F 3 P 8 2 s N 6 R K m p I q a c 2 p k j h / L p 5 7 y n N f e R 4 o z y z X y X + 0 e 5 C a b R i y 6 L / h Y r z 7 W K h u l g 9 O D 7 5 T 6 q U 9 O P V a r W z n K Y + F 2 g 9 N u A p p T w t p d 2 l W l 2 Z 1 a V a X Z n V p V p d m t Z t m 2 V 2 a 9 W r T L K v y Q T x z Y P y s a V b j 1 / J 0 / i c w 6 I f g l / 9 F f l Z 8 v z 4 v e K v g T z F M E a q A e w x 6 J n Z F l H M 1 v M 9 i F x d Y j v 7 l j i 4 u Z p / d T + c K Z l E d D + S V V 7 s v z A h g t B i v t 7 i B Z H Y b S C 9 l A 0 l 7 8 g 2 k u o 5 P s 3 + k h D Y e 2 0 C 1 2 b 5 I n W 5 T t 8 A v V L t + c b W + o u A 9 4 U T x 7 M N k L E w S T 8 Q + h 8 M l z p X u F E f B 0 U 5 M O J Y f K a j T 4 q r 2 7 z k 4 d 5 + / 4 d G c B X A B j C J / L Z w f j Z F n 4 w + z C 3 c x O y + s f 5 x 7 x z 7 b L 5 u i A G 8 3 i 2 3 y 5 5 b g F B U N 5 9 L n 8 a 8 r / D 4 5 c e e z C e e O t / i s f H / L  
 L v z W k c d z i u p B I 4 o T h e C / a G S o O k R d g f N A r n b n z H 3 A Q Y C i e t g f z F F X f Q D l d + 0 l 2 X y 7 / A x T x q d S + v 4 W P x Y m / j x M K / d 4 G c H H i X f D f P j 3 T m m s 8 j 3 4 2 j 0 2 N a N p K / e A l 5 T H g 5 z J / f U d z S p v r T n 2 S 0 k 8 e i v 7 K T / n r v d e Q u J h q Y n H 8 e z z W Z d 6 d K l H l 3 q 0 m H r Q 5 w / g N F 5 n 7 m H m u c f R b L G Y T e v S D 5 O l H x P q G M c k 4 f G p y z y + J f P o / b C Z h / 7 s m Y d l V S 4 K O Y O f M v P g Z / R A S B m O L j k / P U m i 5 2 f 4 G r l N K k 2 R x g m h C Y Q b y W j Z o 3 q e / 1 E f j 5 a h j G r j T K Q b D j W A G F r k f g M U 1 w 2 9 6 H I r q l b 0 a 2 / / m d j 5 P R 7 I b F w / Q S L B M S x 6 w t o w f 9 X g X 2 O h 2 U O t P 9 Q G b w e W 9 k e p C x g E X u 3 u 2 2 X j X W L f B W 1 M 5 H G p Q c + w 5 F e t r n G K Q R 3 c E C 8 T L 9 m 5 + f e J S l Z I A 7 F s y U y 1 q R 3 V Q P D l i Z s W U Q p E 5 e T f S Y s J j j I 3 2 Q o N N O X f W 5 V q t 0 q o X w i G 9 G 9 l 6 b x z R s Q L X f 4 5 1 b r G t 5 t r v I P R 2 K G + x 1 c + 7 d s U u d c 4 y b Z e C M I j + e H 9 i B S i U 6 A s J W Q 2 I u r P A 4 4 C b b j y 7 G q Q 0 D Y V u J t U v o d a 0 8 Q L g u o n U 9 E 1 J E e p K 0 / P 0 7 g h t X q Q Q / 2 d D 9 N X / r g a A 0 f U I b h p D J o Y u M y H V r 8 G K J s I l 1 Y A 6 S U G y F U y O u N r c u M W F w y q 9 5 0 u E y 9 e u y T B Q E t x Q Q B a L E i 8 I E c k Y w G B J 5 7 S s s C c c J I 3 F s 6 c R a V 4 l 0 i H w S 5 C I c C Z E A L M v Q U h F W f w A p T 6 C Y 4 r K K j j x N H V 3 t 7 w n l 4 I U j v m I R H k E G V p / q l v e h u M 3 j h T P y 6 P Z Y g W E B 4 y w e E r 3 i I g 2 2 V 4 B 6 m 2 W H I o f x n 3 a 5 M j h 7 Y e z G H Z t e d M 0 G j 1 9 f + o i 8 J m  
 : f x d r e e m a > * /  
 