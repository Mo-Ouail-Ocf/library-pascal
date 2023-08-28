Unit Bib_T1D;

Interface

Uses bib_fun;

//Initialization
Const max = 100;
Type
 Tind = 1..max;
 Tab1D = Array [Tind] Of LongInt;
 Tab1Dr = Array [Tind] Of Real;
 Tab1Ds = Array [Tind] Of String;
 Tab1Dsb = Array [0..max] Of String;
//Initialization


//Lire les valeurs d'un tableau 1D d'un taille tai
Procedure lect1d(Var t : tab1d; Var tai :tind);

//Ecrire les valeurs d'un tableau 1D d'un taille tai
Procedure EcrT1D(Var t :tab1d;Var tai :tind);

//Calculer le nombre d'apparition d'un nombre v dans un tableau 1D d'un taille tai
Function nbeV(v : LongInt; t : tab1d; tai : tind ): LongInt;

//Calculer le plus grand nombre d'un tableau 1D d'un taille tai
Function MaxT1d(t : tab1d; tai : tind): LongInt;

//Calculer le plus petit nombre d'un tableau 1D d'un taille tai
Function MinT1d(t : tab1d; tai : tind): LongInt;

//Calculer le tind de le plus petit nombre d'un tableau 1D d'un taille tai
Function iMinT1d(t : tab1d; tai : tind): LongInt;

//Calculer le tind de le plus petit nombre d'un tableau 1D d'un taille [m1,m2]
Function IntMinT1d(t : tab1d; m1,m2 : tind): LongInt;

//Genere des nombres aleatoires dans un tableau 1D d'un taille tai
Procedure AleaT1D(Var t : tab1d; Var tai : tind);

//Copier un tableau 1D d'un taille tai
Procedure CpT1D(t : tab1d; Var tc : tab1d; tai : tind);

//Inverser les elements d'un tableau 1D d'un taille tai
Procedure InvT1D(Var t : tab1d; tai : tind);

//Calculer la moyene des elements d'un tableau 1D d'un taille tai
Function MoynT1D(t : tab1d; tai : tind) : LongInt;

//Tri un tableau 1D d'un taille tai
Procedure TriTrnsT1D(Var t : tab1d; tai : tind);

//Tri un tableau 1D d'un taille tai dans un nouvelle tableau
Procedure TriPan(Var tt : tab1d; t : tab1d; tai : tind);

Implementation

//BEGIN LECTD1
Procedure lect1d(Var t : tab1d; Var tai :tind);
Var i : LongInt;
Begin
Write('Donne la taille du tableau : ');
Read(tai);
For i := 1 To tai Do
 Begin
  Write('t[',i,'] = ');
	Read(t[i]);
 End;
End;
//END LECTD1

//BEGIN ECRT1D
Procedure EcrT1D(Var t :tab1d;Var tai :tind);
Var i : LongInt;
Begin
Write('Donne la taille du tableau : ');
Read(tai);
For i := 1 To tai Do
 Begin
  WriteLn('t[',i,'] = ',t[i]);
 End;
End;
//END ECRT1D

//BEGIN NBEV
Function nbeV(v : LongInt; t : tab1d; tai : tind ): LongInt;
Var i,res : LongInt;
Begin
res := 0;
For i :=1 To tai Do
 Begin
  If v = t[i] Then
	 Begin
	  res := res+1;
	 End;
 End;
nbev := res;
End;
//END NBEV

//BEGIN MAXT1D
Function MaxT1d(t : tab1d; tai : tind): LongInt;
Var i,res : LongInt;
Begin
res := t[1];
For i := 2 To tai Do
 Begin
  If t[i]>res Then
	 Begin
	  res := t[i];
	 End;
 End;
maxt1d := res;
End;
//END MAXT1D

//BEGIN MINT1D
Function MinT1d(t : tab1d; tai : tind): LongInt;
Var i,res : LongInt;
Begin
res := t[1];
For i := 2 To tai Do
 Begin
  If t[i]<res Then
	 Begin
	  res := t[i];
	 End;
 End;
mint1d := res;
End;
//END MINT1D

//BEGIN IMINT1D
Function iMinT1d(t : tab1d; tai : tind): LongInt;
Var i,res,max,min : LongInt;
Begin
min := t[1];
For i := 2 To tai Do
 Begin
  If t[i]<min Then
	 Begin
	  min := t[i];
		res := i;
	 End;
 End;
imint1d := res;
End;
//END IMINT1D

//BEGIN INTMINT1D
Function IntMinT1d(t : tab1d; m1,m2 : tind): LongInt;
Var i,ind : LongInt;
Begin
ind := m1;
For i := m1+1 To m2 Do
 Begin
  If t[i]<t[ind] Then
	 Begin
	  ind := i;
	 End;
 End;
intmint1d := ind;
End;
//END INTMINT1D

//BEGIN ALEAT1D
Procedure AleaT1D(Var t : tab1d; Var tai : tind);
Var i,min,max : LongInt;
Begin
Randomize;
Write('Donne la taille de tableau : ');
Read(tai);
WriteLn('Donne les valeurs de l intervale [min,max] : ');
Readln(min,max);
For i := 1 To tai Do
 Begin
  t[i] :=  min + (Random(max-min)+1);
 End;
End;
//END ALEAT1D

//BEGIN CPT1D
Procedure CpT1D(t : tab1d; Var tc : tab1d; tai : tind);
Var i : LongInt;
Begin
For i := 1 To tai Do
 Begin
  tc[i] := t[i];
 End;
End;
//END CP1TD

//BEGIN INVT1D
Procedure InvT1D(Var t : tab1d; tai : tind);
Var i : LongInt;
Begin
For i := 1 To (tai Div 2) Do
 Begin
  permut(t[i],t[tai-i+1]);
 End;
End;
//END INVT1D

//BEGIN MOYNT1D
Function MoynT1D(t : tab1d; tai : tind) : LongInt;
Var res,i : LongInt;
Begin
res := 0;
For i := 1 To tai Do
 Begin
  res := res+t[i];
 End;
res := res Div tai;
MoynT1D := res;
End;//END MOYNT1D

//BEGIM TRIBULT1D
Procedure TriTrnsT1D(Var t : tab1d; tai : tind);
Var
 i : LongInt;
Begin
For i := 1 To tai Do
 Begin
  permut(t[intmint1d(t,i,tai)],t[i]);
 End;
End;
//END TRIBULT1D

//BEGIN TRIPAN
Procedure TriPan(Var tt : tab1d; t : tab1d; tai : tind);
Var
 minn,maxx,i,j,k : LongInt;
 tc : tab1d;

Begin
minn := MinT1d(t,tai);
maxx := MaxT1d(t,tai);
For i := minn To maxx Do
 Begin
  tc[i] := nbeV(i,t,tai);
 End;

j := 1;
For i := minn To maxx Do
 Begin
  k := 0;
  While (tc[i]<>k) Do
	 Begin
		tt[j] := i;
		j := j+1;
		k := k+1;
	 End;
 End;
End;
//END TRIPAN

End.