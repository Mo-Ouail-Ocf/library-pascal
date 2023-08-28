Unit Bib_T2D;

Interface

Uses bib_fun;

//Initialization
Const
 MaxL = 100;
 MaxC = 100;
Type
 TindL = 1..MaxL;
 TindC = 1..MaxC;
 Tab2D = Array [TindL,TindC] Of LongInt;
 Tab2Dr = Array [TindL,TindC] Of Real;
 Tab2Dc = Array [TindL,TindC] Of String;
 Tab2Ds = Array [TindL,TindC] Of String;
//Initialization

//Lire les valeurs d'un tableau 2D
Procedure LecT2D(Var t : tab2d; Var tail : tindl ; Var taic : tindc);

//Ecrire les valeurs d'un tableau 2D
Procedure EcrT2D(Var t : tab2d; Var tail : tindl ; Var taic : tindc);

//Genere des nombres aleatoires dans un tableau 2D
Procedure AleaT2D(Var t : tab2d; Var tail : tindl ; Var taic : tindc);

//Calculer la frequence de nombre v dans un tableau 2D 
Function freqVt2d(v : LongInt; t : tab2d; tail : tindl; taic : tindc):LongInt;

Implementation
//BEGIN LECT2D
Procedure LecT2D(Var t : tab2d; Var tail : tindl ; Var taic : tindc);
Var i,j : LongInt;
Begin
Write('Donne le nombre de lignes de tableau :');
Read(tail);
Write('Donne le nombre de colonnes de tableau :');
Read(taic);
For i := 1 To tail Do
 Begin
  For j := 1 To taic Do
	 Begin
	  Write('T[',i,',',j,']=');
		Read(T[i,j]);
	 End;
 End;
End; //END LECT2D

//BEGIN ECRT2D
Procedure EcrT2D(Var t : tab2d; Var tail : tindl ; Var taic : tindc);
Var i,j : LongInt;
Begin
Write('Donne le nombre de lignes de tableau :');
Read(tail);
Write('Donne le nombre de colonnes de tableau :');
Read(taic);
For i := 1 To tail Do
 Begin
  For j := 1 To taic Do
	 Begin
	  Write('T[',i,',',j,']=',T[i,j],' | ');
	 End;
	WriteLn; 
 End;
End;//END ECRT2D

//BEGIN ALEAT2D
Procedure AleaT2D(Var t : tab2d; Var tail : tindl ; Var taic : tindc);
Var i,j,min,max : LongInt;
Begin
Randomize;
Write('Donne le nombre de lignes de tableau :');
Read(tail);
Write('Donne le nombre de colonnes de tableau :');
Read(taic);
WriteLn('Donne les valeurs de l intervale [min,max] :');
Readln(min,max);
For i := 1 To tail Do
 Begin
  For j := 1 To taic Do
	 Begin
		T[i,j] := min + (Random(max-min)+1);
	 End;
 End;
End; //END ALEAT2D

//BEGIN FREQVT2D
Function freqVt2d(v : LongInt; t : tab2d; tail : tindl; taic : tindc):LongInt;
Var i,j,nb : LongInt;
Begin
nb := 0;
For i := 1 To tail Do
 Begin
  For j := 1 To taic Do
	 Begin
	  If t[i,j]=v Then
		 Begin
		  nb := nb+1;
		 End;
	 End;
 End;
freqVt2d := nb;
End;
//END FREQT2D


End.