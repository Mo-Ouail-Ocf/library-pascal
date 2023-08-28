Unit BIB01;

{*******************************************************************************************************}
Interface

{*******************************************************************************************************}
Function nb_pos (n:Integer): Integer ;
//CALCULE LE NBR DE POSITION DE N
Function nb_div(n:Integer): Integer;
//NB DIVISEURS DE N
Function mm_ch(a,b:Longint): Boolean;
//  VERIFIER SI DEUX NOMBRES ONT LES MEMES CHIFFRES
Function perfect (n:Integer): Boolean;
//VERIFIER SI N EST PARFAIT
Function abd(n:Longint): Boolean;
// n est abondnat ou non
Function adm(n:Longint): Boolean;
// n est admirable ou non
Function comp(a,b:Integer): Longint;
//compose un chiffre compose de a b fois }
Function conc(n,m:Longint): Longint;
//concatener a et b
Function ext_pos(n,po,nc:Longint): Longint;
// extraire de n un nombre compose de nc chiffre a partir de la position po
Function freq(n,m:Longint): Longint;
//donner la freqeunce de m dans n
Function ins_pos(n,p,c:Longint): Longint;
//inserer un chiffre c dans n dnas la position p
Function inv(n:Longint): Longint;
//inverser n
Function permut(a,po1,po2:Longint): Longint;
//permuter entre deux positions dand n
Function pgcd(a,b:Longint): Longint;
//pgcd
Procedure permut_2(Var a,b:Longint);
//permuter entre deux nombres
Function prem(n:Longint): Boolean;
//si n premier ou nn
Function puiss(n,e:Longint): Longint;
//calculer n puissance e
Function sm_div(n:Integer): Integer;
//calculer la somme des diviseurs propres
Function som_ch(n:Longint): Longint;
//calculer la somme des chiffres
Procedure code_gray(n:Longint);
// convertir n de decimal vers code gray
{Function convert_dec(n,b:Longint ): Longint;
//convertir n de base b vers ba se decimal
Function convert(n,b:Longint): Longint;
//convertir de base 10 vers base b
Function convert_bs(n,a,b:Longint): Longint;
//convertir de base a vers base b }
Function decroissant(n:Longint): Longint;

Function croissant(n:Longint): Longint;
Function max(a,b:Longint): Longint;
// donne le max entre 02 chiffres
Function ad_bin(a,b:Longint): Longint;
//additionner 02 nbrs en binaire

Function dec_dr(n:Longint): Longint;
//effectuer un dec drtoite sur n

Function dec_dr_m(n,c:Longint): Longint;
//effectuer c decalages droites sur n

Function chiff_diff(n:Longint): Boolean;
//vaut 1 quand n ne contient pas des chiffres qui se repetent
function complement(a,b:LongInt):LongInt;
// donne le comp de a par rapport a b
{*******************************************************************************************************}
Implementation

{*******************************************************************************************************}
//-------------------------
Function nb_pos (n:Integer): Integer ;
Var
  nb,i: Integer;
Begin
  nb := 0;
  While n<> 0 Do
    Begin
      n := n Div 10;
      nb := nb + 1;
    End;
  nb_pos := nb;
End;
//--------------------------
Function nb_div(n:Integer): Integer;
Var
  i,NBd: Integer;
Begin
  NBd := 0;
  For i:= 1 To n Div 2 Do
    Begin
      If n Mod i = 0 Then
        Begin
          NBd := NBd+1;
        End;
    End ;
  nb_div := NBd;
End;
//------------------------------------
Function mm_ch(a,b:Longint): Boolean;
Var
  i: Integer;
  bool: Boolean;
Begin
  bool := True;
  I := 0;
  Repeat
    If freq (a,i)>=1 Then
      bool := (freq (b,i)>=1);
    i := i+1;
  Until (bool=False) Or( i=10);
  mm_ch := bool;
End;
//-------------------------------------
Function perfect (n:Integer): Boolean;
Var
  d,i: Integer;
  bool: Boolean;
Begin
  perfect := (sm_div(n)=n) ;
End;
//--------------------------------------------------------------
Function abd(n:Longint): Boolean;
Begin
  abd := (sm_div(n)>n);
End;
//--------------------------------------------------------------
Function adm(n:Longint): Boolean;
Var
  i: Integer;
  b: Boolean;
Begin
  b := False;
  i := 1;
  While (i<= n Div 2) And (b=False) Do
    Begin
      If n Mod i =0 Then
        Begin
          If sm_div(n)-2*i=n Then
            b := True;
        End;
      i := i+1;
    End;
  adm := b;
End;
//--------------------------------------

Function comp(a,b:Integer): Longint;
Var
  i,c: Integer;
Begin
  c := 0;
  For i:=0 To b-1 Do
    c := a*puiss(10,i*nb_pos(a))+c;
  comp := c;
End;
//-------------------------------------------------------------------
Function conc(n,m:Longint): Longint;
Begin
  conc := n*puiss(10,nb_pos(m))+m;
End;
//-------------------------------------------------------------------
Function ext_pos(n,po,nc:Longint): Longint;
Var
  c: Longint;
Begin
  ext_pos := n Div puiss(10,po-1) Mod puiss(10,nc);
End;
//-------------------------------------------------------------------
Function freq(n,m:Longint): Longint;
Var
  fr: Longint;
Begin
  fr := 0;
  While n<>0 Do
    Begin
      If n Mod 10 =m Then
        fr := fr+1 ;
      n := n Div 10 ;
    End;
  freq := fr;
End;
//---------------------------------------------------
Function ins_pos(n,p,c:Longint): Longint;
Var
  x,y: Longint;
Begin
  x := puiss(10,p);
  y := puiss(10,p+1);
  ins_pos := ( n Div x)*y+c*x+ (n Mod x);
End;
//-------------------------------------------------
Function inv(n:Longint): Longint;
Var
  ni,nbp,i,c: Integer;
Begin
  ni := 0;
  While n<>0 Do
    Begin
      ni := ni*10+n Mod 10;
      n := n Div 10;
    End;
  inv := ni;
End;
//-------------------------------------------------
Function permut(a,po1,po2:Longint): Longint;
Var
  c: Integer;
Begin
  c := ext_pos(a,po1,1)-ext_pos(a,po2,1);
  permut := a+ c*puiss(10,po2-1)- c*puiss(10,po1-1);
End;
//-------------------------------------------------
Function pgcd(a,b:Longint): Longint;
Var
  r: Longint;
Begin
  a := Abs (a);
  b := Abs (b);
  If a<b Then permut_2(a,b);
  Repeat
    r := a Mod b;
    a := b;
    b := r;
  Until b=0;
  pgcd := a;
End;
//-------------------------------------------------
Procedure permut_2(Var a,b:Longint);
Begin
  a := a+b;
  b := a-b;
  a := a-b;
End;
//------------------------------------
//------------
Function prem(n:Longint): Boolean;
Var
  i: Longint;
Begin
  i := 2;
  While (n Mod i <> 0) And (i <= n Div 2) Do
    Begin
      i := i+1;
    End;
  prem := (n=2) Or (i > n Div 2)
End;
//-------------------------------------------
Function puiss(n,e:Longint): Longint;
Var
  i,p : Integer;
Begin
  p := 1;
  For i:=1 To e Do
    Begin
      p := p*n;
    End;
  puiss := p;
End;
//----------------------------------
Function sm_div(n:Integer): Integer;
Var
  i,s: Integer;
Begin
  s := 0;
  For i :=1 To n Div 2 Do
    Begin
      If n Mod i =0 Then
        s := s+i;
    End;
  sm_div := s;
End;
//----------------------------------
Function som_ch(n:Longint): Longint;
Var
  i,s: Longint;
Begin
  s := 0;
  For i:=0 To 9 Do
    s := s+i*freq(n,i);
  som_ch := s;
End;
//----------------------------------
Procedure code_gray(n:Longint);
Var
  a,i,po: Integer;
Function comp_1(n,po:Integer): Integer;
//-----------------
Begin
  If ext_pos(n,po,1) Mod 2 =0 Then
    n := n +puiss(10,po-1)
  Else n := n -puiss(10,po-1);
  comp_1 := n;
End;
//----------------

Function p_occur (n:Integer): Integer;
//-----
Var
  i,po: Integer;
Begin
  po := 1;
  While n Mod 10 <>1 Do
    Begin
      po := po+1 ;
      n := n Div 10 ;
    End;
  p_occur := po;
End;
//--------------------
Begin
  //programme principale
  a := 1;
	 Write( ' 1 | ');
  For i:=1 To n-1 Do
    Begin
      po := 1 ;

      If freq(a,1) Mod 2 =1 Then
        po := p_occur(a)+1;
      a := comp_1(a,po);
			  Write ( a,' | ');
    End;

End;
//----------------------------------
{Function convert(n,b:Longint ): Longint;
Var
  s,x: Longint;
Begin
  x := 1;
  s := 0;
  Repeat
    s := s+ (n Mod b)*x;
    n := n Div b;
    x := x*10;
  Until n=0;
  convert := s;
End;
//----------------------------------
Function convert_dec(n,b:Longint): Longint;
Var
  i,s: Longint;
Begin
  s := 0;
  For i:=1 To nb_pos(n) Do
    Begin
      s := s+ ext_pos(n,i,1)*puiss(b,i-1);
    End;
  convert_dec := s;
End;
//----------------------------------
Function convert_bs(n,a,b:Longint): Longint;
Begin
  convert_bs := convert(convert_dec(n,a),b);
End;
//---------------------------------- }
Function decroissant(n:Longint): Longint;
Var
  ni,m,i,x: Longint;
Begin
  x := 0;
  ni := 0;
  For i:=0 To 9 Do
    Begin
      m := comp(i,freq(n,i));
      ni := ni +m*puiss(10,x);
      x := x+freq(n,i);
    End;
  decroissant := ni;
End;
//----------------------------------

Function croissant(n:Longint): Longint;
Begin
  croissant := inv(decroissant(N));
End;
//-----------------------

Function max(a,b:Longint): Longint;
// donne le max entre 02 chiffre
Var
  m: Longint;
Begin
  max := a;
  If b>a Then max := b;
End;
//----------------------------------
Function ad_bin(a,b:Longint): Longint;
Var
  res,i,x,c,d,r,s: Longint;
Begin
  r := 0;
  res := 0;
  x := 1;
  For i := 1 To max(nb_pos(a)+1,nb_pos(b)+1) Do
    Begin
      c := ext_pos(a,i,1);
      d := ext_pos(b,i,1);
      s := c+d+r;
      res := res+ (s Mod 2)*x;
      r := s Div 2;
      x := x*10;
    End;
  ad_bin := res;
End;
//-----------------------------

Function dec_dr(n:Longint): Longint;
Begin
  dec_dr := ext_pos(n,nb_pos(n),1) +10* ext_pos(n,1,nb_pos(n)-1);
End;
//-----------------------

Function dec_dr_m(n,c:Longint): Longint;
Var
  i: Longint;
Begin
  For i:= 1 To c Do
    n := dec_dr(n);
  dec_dr_m := n;
End;
//-----------------------

Function chiff_diff(n:Longint): Boolean;
Var
  i: Longint;
  bool: Boolean;
Begin
  i := 1;
  bool := True;
  While (i<=9) And bool=True Do
    Begin
      bool := freq(n,i)<2;
      i := i+1;
    End;
  chiff_diff := bool;
End;
//----------------------------
function complement(a,b:LongInt):LongInt;
var i,res,x,c:LongInt;
Begin
res:=0;
x:=1;
for i:=1 to nb_pos(a) Do
 Begin
    c:=ext_pos(a,i,1);
	 if c < b Then
	  Begin
		 if c=0 then res:=res+(b-1)*x
		 Else
	  res:=res+(b-c)*x;
		end;
	 x:=x*10;
	 end;
	complement:=res;
end;
//----------------------------
End.         