
Unit Tab1_2D;
{***************************************************************************}
Interface
{***************************************************************************}
 uses bib01;
//------Declarations-----\\
Type
  tab = Array [1..500] Of Longint;
  mat = Array [1..50,1..50] Of Longint;
  t_mot = Array [1..100] Of String;
{***************************************************************************}
Procedure LECT1D( Var T:tab;Var tai:Longint);
// creer un tableau 1 dimension de taille tai
Procedure alea1d (Var t:tab;Var tai:Longint);
//remplir aleatoirement un tableau de taille tai
Procedure ecrire1d(t:tab;tai:Longint);
Function nbev(t:tab ;v:Longint): Longint;
// donne le nombre d'apparition de v dans le tableau T
Function rechdech(t:tab;tai:Longint;v:Longint): Boolean;
//faire la recherche dichotomique

Procedure ppt1d(t:tab;tai:Longint; cell:Longint;Var pp,po:Longint);
//rechercher le plus petit element dans une porion du tableau
Procedure permT1d(Var T:tab;cell1,cell2:Longint);
//permuter entre 02 cases
Procedure permut (Var A, B:Longint); {permute les contenus de A et B}
//algorithme de tri

Procedure tri_3tb (t:tab;tai:Longint;Var t_trie:tab);
Procedure tri_select(Var t:tab;tai :Longint);
Procedure tri_insertion (Var t:tab;tai:Longint);
Procedure tri_bulle (Var t:tab;tai:Longint);
//tri_comptage
Function cmpt_petit(t:tab;tai:Longint;n:Longint): Longint;
//calcule le nbr d'elements plus petits que t[n]
Procedure tab_comptage (t:tab;tai:Longint;a:tab);

//cree le tableau de comptage 	qui contient pour chaque element le nbr d'elts plus petit que celui ci
Procedure tri_1tb (Var t:tab;tai:Longint);
//matrices

Procedure lect2d (Var m:mat;Var maxl,maxc:Longint);
Procedure alea2d (Var m:mat;Var maxl,maxc:Longint);
Procedure ecrire2d (m:mat;maxl,maxc:Longint);
Function sm_col ( m:mat;maxl,c:Longint): Longint;
// calculer la somme des elemnets de la colone c
Procedure scol(m:mat;maxl,maxc:Longint;Var t:tab);
//ranger la somme des colones dans un tableau
////------------------*CONVERSION NUMERIQUE*-------------------------

Function vald(n:String;b:Longint): Boolean;
//vrai quand n est representbake dans la base b

Procedure devpol(Var n:String;b:Longint;Var res:Longint);
//convertir n de la base b vers le decimal

Function corresp_base (a:Longint): String;
//donne la valeure correpondante du nombre au chiffres ,ex 11 ===>B

Function convertir ( n,b:Longint): String;
//converit n de la base b vers la base 10

Procedure conversion_base (Var n:String;b1,b2:Longint ;Var res:String);
//effectue un conversion numerique entre les bases
//------------------***---------------------------
Function pg_l (t:mat;lign,maxc:Longint): Longint;
//renvoit le plus grand element de la ligne

Function pp_c (t:mat;maxl,col:Longint): Longint;
//renvoit le plus petit element dans la colone col

Procedure point_sel (t:mat;maxl,maxc:Longint);
// renvoit le point sel et ses coordones

Procedure copier(t:mat;nl1,nl2,nc1,nc2:Longint;Var t_cop:mat);
//donne une portion du matrice

Procedure fusion (t1:mat; nl1:Longint; t2:mat;nl2:Longint; nc:Longint;Var t_f:mat);
//fusinooer 2 matrices de meme colones

Procedure tab_sarrus(t:mat;Var t_sar:mat);
//creer le tableau de sarrus

Function determinant(t:mat): Longint;
//calculer le determinant  d'un matrice 3*3
//-----------------------------------------------
{ STRING }
Function ch_vide (p:String): Boolean;
//verifier si une chaine est vide
Procedure norm (Var p:String);
//supprimer les espaces au derniers et au debut

Function nb_mots(p:String): Longint;
//calcule le nbr de mots d'une phrase

Function mot_ph(p:String;m:Longint): String;
//donne le ieme mots dans une phrase
Procedure impurify(Var ch:String);
//supprimer ce qui n'est pas de l'alphabet ou chiffre
Procedure mot_tab(p:String;Var t:t_mot);
//range les mots d'une phrase dans un tableau
Procedure mat_tran (m:mat;maxl,maxc:Longint; Var m_tr :mat);
//creer la matrice transpose

Procedure supp_mot (mot:String ;Var p:String);
Procedure produit_mat (t1:mat;m,p:LongInt;t2:mat;n:LongInt;var t3:mat);
{***************************************************************************}

Implementation
{***************************************************************************}
Procedure LECT1D(Var T:tab;Var tai:Longint);
Var
  i: Longint;
Begin
  Write ('Entrez la taille de tableau  ');
  Readln(tai);
  For i:=1 To tai Do
    Begin
      Write(' T[',i,'] = ');
      Readln (t[i]);
      Writeln;
    End;
End;
//-------------------------------------------------
Procedure alea1d (Var t:tab;Var tai:Longint);
Var
  min,max,i: Longint;
Begin
  Randomize;
  Write('Entrez la taille de tableau: ');
  read(tai);
  Write (' [Min,Max] des valeurs aléatoires :  ' );
  read (min,max);
  For i:=1 To tai Do
    t[i] := min + Random(max-min+1);
End;
//-------------------------------------------------

Procedure ecrire1d(t:tab;tai:Longint) ;
Var
  i: Longint;
Begin
  For i:= 1 To tai Do
    Write(' ',t[i],' ');
  Writeln;
End;
//-------------------------------------------------
Function nbev(t:tab ;v:Longint): Longint;
Var
  i,res: Longint;
Begin
  res := 0;
  For i:=1 To 100 Do
    If t[i] = v Then res := res+1;
  nbev := res;
End;
//-------------------------------------------------
Function rechdech(t:tab;tai:Longint;v:Longint): Boolean;
Var
  bi,bs,centre: Longint;
  bool: Boolean;
Begin
  bool := False;
  bi := 1;
  bs := tai;
  While (bool=False) And (bi<=bs) Do
    Begin
      centre := (bi+bs) Div 2;
      If t[centre] = v Then
        bool := True
      Else If t[centre] < v Then
             bi := centre +1
      Else
        bs := centre-1;
    End;
  rechdech := bool;
End;
//-------------------------------------------------
Procedure ppt1d(t:tab;tai:Longint; cell:Longint;Var pp,po:Longint);
Var
  i,sauv: Longint;
Begin
  If tai<=cell Then
    Begin
      sauv := tai;
      tai := cell;
      cell := sauv;
    End;
  pp := t[cell];
  po := cell;
  For i:= cell+1 To tai Do
    Begin
      If t[i] < pp Then
        Begin
          pp := t[i];
          po := i;
        End;
    End;
End;
//-------------------------------------------------

Procedure permT1d(Var T:tab;cell1,cell2:Longint);
Var
  sauv: Longint;
Begin
  sauv := t[cell1];
  t[cell1] := t[cell2];
  t[cell2] := sauv;
End;
//-------------------------------------------------
Procedure permut (Var A, B:Longint);
Var
  sauve: Longint;
Begin
  sauve := A;
  A := B;
  B := sauve;
End;
//-------------------------------------------------

Procedure tri_select(Var t:tab;tai :Longint);
Var
  i,pp,po: Longint;
Begin
  For i:= 1 To tai-1 Do
    Begin
      ppt1d(t,tai,i, pp,po);
      permT1d( T,i,po);
    End;
End;
//-------------------------------------------------

Procedure tri_insertion (Var t:tab;tai:Longint);
Var
  i,j,sauv: Longint;
Begin
  For i:=2 To tai Do
    Begin
      j := i-1;
      sauv := t[i];
      While (t[j] > sauv) And (j>0) Do
        Begin
          t[j+1] := t[j];
          j := j-1;
        End;
      t[j+1] := sauv;
    End;
End;
//-------------------------------------------------

Procedure tri_bulle (Var t:tab;tai:Longint);
Var
  i,sauv: Longint;
  ordonne: Boolean;
Begin
  ordonne := False;
  While ordonne=False Do
    Begin
      ordonne := True;
      For i:= 1 To tai-1 Do
        Begin
          If t[i]>t[i+1] Then
            Begin
              sauv := t[i];
              t[i] := t[i+1];
              t[i+1] := sauv;
              ordonne := False;
            End;
        End
    End;
End;
//-------------------------------------------------
Function cmpt_petit(t:tab;tai:Longint;n:Longint): Longint;
Var
  res,i: Longint;
Begin
  res := 0;
  For i:=1 To tai Do
    Begin
      If t[i]< n Then res := res+1;
    End;
  cmpt_petit := res;
End;
//------------------------------------

Procedure tab_comptage (t:tab;tai:Longint;a:tab);
Var
  i: Longint;
Begin
  For i:=1 To tai Do
    Begin
      a[i] := cmpt_petit(t,tai,t[i]);
    End;
End;
//------------------------------------
Procedure tri_3tb (t:tab;tai:Longint;Var t_trie:tab);
Var
  i,j,y: Longint;
  t_cmpt: tab;
Begin
{Function nbev(t:tab ;v:Longint): Longint;}
  For i:=1 To tai Do
    Begin
      t_cmpt[i] := cmpt_petit(t,tai,t[i]);
    End;
  i := 0;
  Repeat
    For j:=1 To tai Do
      Begin
        If t_cmpt[j]=i Then
          Begin
            For y:=1 To nbev (t,t[j]) Do
              t_trie[i+y] := t[j];
          End;
      End;
    i := i+1;
  Until i=tai;
End;
//-------------------------------------------------
Procedure tri_1tb (Var t:tab;tai:Longint);
Var
  tcmpt: tab;
  i,indice: Longint;
  permutation: Boolean;
Begin
  Repeat
    While i<= tai Do
      Begin
        i := 1;
        permutation := False;
        indice := cmpt_petit(t,tai,t[i]);
        If ((i<Indice+1) And (T[i]>T[Indice+1])) Or ((i>Indice+1) And (T[i]<T[Indice+1])) Then
          Begin
            Permut(T[i],T[Indice+1]);
            Permutation := True;
          End;
        i := i + 1;
      End;
  Until Permutation = False;
End;
//-------------------------------------------------matrice

Procedure lect2d (Var m:mat;Var maxl,maxc:Longint);
Var
  i,j: Longint;
Begin
  Write('Entrez le nombre de lignes et colones: ');
  Readln(maxl,maxc);
  For i := 1 To maxl Do
    Begin
      For j:= 1 To maxc Do
        Begin
          Write(' M[',i,',',j,'] =  ');
          Readln (m[i,j]);
        End;
    End;
End;
//-------------------------------------------------
Procedure alea2d (Var m:mat;Var maxl,maxc:Longint);
Var
  max,min,i,j: Longint;
Begin
  Randomize;
  Write ('Entrez le nombre de lignes et colones : ');
  Read(maxl,maxc);
  Write (' [Min,Max] des valeurs aléatoires :  ' );
  read (min,max);
  For i := 1 To maxl Do
    Begin
      For j:= 1 To maxc Do
        Begin
          m[i,j] := min + Random (max-min+1);
        End;
    End;
End;
//-------------------------------------------------
Procedure ecrire2d (m:mat;maxl,maxc:Longint);
Var
  i,j: Longint;
Begin
  For i:= 1 To maxl Do
    Begin
      For j:= 1 To maxc Do
        Begin
          Write ( m[i,j],'    |   ' );
        End;
      Writeln;
    End;
End;
//-------------------------------------------------
Function sm_col ( m:mat;maxl,c:Longint): Longint;
Var
  s,j: Longint;
Begin
  s := 0;
  For j:= 1 To maxl Do
    s := s+ m[j,c];
  sm_col := s;
End;
//-------------------------------------------------
Procedure scol(m:mat;maxl,maxc:Longint;Var t:tab);
Var
  i,j: Longint;
Begin
  For i := 1 To maxc Do
    t[i] := sm_col (m,maxl,i);
End;
//------------------------------------------------- \

Function vald(n:String;b:Longint): Boolean;
Var
  i: Longint;
  bool: Boolean;
Begin
  bool := True;
  If b > 10 Then
    Begin
      For i:=1 To Length(N) Do
        Begin
          If Ord (n[i])>=58 Then
            Begin
              If Ord(Upcase(n[i]))-b > 54 Then
                bool := False;
            End ;
        End;
    End;
  vald := bool;
End;
//-------------------------------------------------

Procedure devpol(Var n:String;b:Longint;Var res:Longint);
//convertir n de base b1 vers la base 10
Var
  i,x: Longint;
Begin
  res := -2;
  Write('Entrez la valeur de nombre a convertir : ');
  Readln(n);
  Repeat
    If vald(n,b) Then
      Begin
        res := 0;
        For i:=1 To Length(n) Do
          Begin
            If Ord (n[i])>=58 Then
              x := Ord(Upcase(n[i]))-55
            Else
              x := Ord(n[i])-48;
            res := res+x*puiss(b,Length(n)-i);
          End;
      End
    Else
      Begin
        res := -2;
        Writeln(n, ' n''est pas representable sur le base ' ,b);
        Write ('Veuillez saisir un autre chiffre a convertir : ');
        Read(n);
        Readln;
      End;
  Until res>-1 ;
End;
//-------------------------------------------------

Function corresp_base (a:Longint): String;
Var
  x: String[1];
Begin
  If a<=9 Then
    Str (a,x)
  Else
    x := Chr (65+a-10);
  corresp_base := x;
End;
//-------------------------------------------------

Function convertir ( n,b:Longint): String;
Var
  res: String;
Begin
  res := '';
  Repeat
    res := Concat(corresp_base(n Mod b),res);
    n := n Div b
  Until n=0;
  convertir := res;
End;
//-------------------------------------------------
Procedure conversion_base (Var n:String;b1,b2:Longint;Var res:String) ;
Var
  x: Longint;
Begin
  devpol(n,b1,x );
  res := convertir (x,b2);
End;
//-------------------------------------------------

Function pg_l (t:mat;lign,maxc:Longint): Longint;
Var
  i,pgl: Longint;
Begin
  pgl := t[lign,1];
  For i := 1 To maxc Do
    Begin
      If t[lign,i] > pgl Then pgl := t[lign,i]
    End;
  pg_l := pgl;
End;
//-------------------------------------------------

Function pp_c (t:mat;maxl,col:Longint): Longint;
Var
  i,ppc: Longint;
Begin
  ppc := t[1,col];
  For i := 1 To maxl Do
    Begin
      If (t[i,col]< ppc) Then
        ppc := t[i,col];
    End;
  pp_c := ppc
End;
//-------------------------------------------------

Procedure point_sel (t:mat;maxl,maxc:Longint);
Var
  i,j,x,y,point_sel : Longint;
  s: Boolean;
Begin
  s := False;
  For i:=1 To maxl Do
    Begin
      For j:=1 To maxc Do
        Begin
          If pp_c (t,maxl,j)= pg_l (t ,i , maxc) Then
            Begin
              point_sel := t[i,j];
              x := i;
              y := j;
              s := True;
            End;
        End;
    End;
  If s=False Then
    Writeln('La matrice n''admet pas  un point sel ' )
  Else Write ('Le point sel est :', point_sel ,' et ses cordonnes sont :',x,' ',y);
End;
//-------------------------------------------------

Procedure copier(t:mat;nl1,nl2,nc1,nc2:Longint;Var t_cop:mat);
Var
  i,j: Longint;
Begin
  For i:= nl1 To nl2 Do
    Begin
      For j:= nc1 To nc2 Do
        Begin
          t_cop[i,j] := t[i,j];
        End;
    End;
End;
//-------------------------------------------------

Procedure fusion (t1:mat; nl1:Longint; t2:mat;nl2:Longint; nc:Longint;Var t_f:mat);
Var
  i,j: Longint;
Begin
  For i:= 1 To nl1 Do
    Begin
      For j:=1 To nc Do
        Begin
          t_f[i,j] := t1[i,j];
        End
    End;
  For i:= nl1+1 To nl1+nl2 Do
    Begin
      For j:=1 To nc Do
        Begin
          t_f[i,j] := t2[i-nl1,j];
        End
    End;
End;
//-------------------------------------------------

Procedure tab_sarrus(t:mat;Var t_sar:mat);
Var
  t1: mat;
Begin
  copier(t,1,2,1,3,t1);
  fusion(t,3,t1,2,3,t_sar);
End;
//-------------------------------------------------

Function determinant(t:mat): Longint;
Var
  t_sarus: mat;
  j,s1,s2,s3,p1,p2,p3: Longint;
Begin
  tab_sarrus(t,t_sarus);
  s1 := 1;
  s2 := 1;
  s3 := 1;
  p1 := 1;
  p2 := 1;
  p3 := 1;
  For j:=1 To 3 Do
    Begin
      s1 := s1*t_sarus[j,j];
      s2 := s2*t_sarus[j+1,j];
      s3 := s3*t_sarus[j+2,j];
      p1 := p1*t_sarus[4-j,j];
      p2 := p2*t_sarus[5-j,j];
      p3 := p3*t_sarus[6-j,j];
    End;
  determinant := s1+s2+s3-(p1+p2+p3);
End;
//-------------------------------------------------
Function ch_vide (p:String): Boolean;
Var
  i: Longint;
  bool: Boolean;
Begin
  bool := True;
  i := 1;
  While (i<= Length(P)) And( bool=True) Do
    Begin
      If (p[i] <> '' )Or ( p[i] <> ' ') Then
        bool := False;
      i := i+1;
    End;
  ch_vide := bool;
End;
//-------------------------------------------------
Procedure norm (Var p:String);
Var
  i: Longint;
Begin
  i := Length (p);
  While p[i]= ' ' Do
    i := i-1;
  Delete (p,i+1,Length(p)-i);
  i := 1;
  While p[i]= ' ' Do
    i := i+1;
  Delete (p,i-1,i-1);
End;
//-------------------------------------------------

Procedure impurify(Var ch:String);
Type
  caract = set Of Char;
Var
  t: tab;
  i,j: Longint;
  alph,chiff: caract;
Begin
  chiff := ['0'..'9'];
  alph := ['A'..'Z'];
  j := 1;
  For i:=1 To Length (ch) Do
    Begin
      If Not ((Upcase(ch[i] )In alph ) Or ( ch[i] In chiff )) Then
        Begin
          t[j] := i;
          j := j+1;
        End;
    End;
  For i:=1 To j-1 Do
    Begin
      Delete (ch,t[i],1);
      Insert(' ',ch,t[i]);
    End ;
  norm(ch);
End;
//-------------------------------------------------
Function nb_mots(p:String): Longint;
Type
  c = set Of Char;
Var
  res,i: Longint;
  alph,num: c;
Begin
  alph := ['A'..'Z'];
  num := ['0'..'9'];
  i := 1;
  res := 0;
  Repeat
    If ( Upcase(p[i]) In alph ) Or ( p[i] In num ) Then
      Begin
        res := res+1;
        Repeat
          i := i+1 ;
        Until Not (( Upcase(p[i]) In alph ) Or ( p[i] In num )) Or ( i>Length(p)) ;
      End
    Else
      Begin
        Repeat
          i := i+1;
        Until ( Upcase(p[i]) In alph ) Or ( p[i] In num ) Or ( i>Length(p));
      End;
  Until i > Length(p);
  nb_mots := res;
End;
//-------------------------------------------------

Function mot_ph(p:String;m:Longint): String;
Type
  c = set Of Char;
Var
  i,n: Longint;
  alph,num: c;
  res: String;
Begin
  res := '';
  alph := ['A'..'Z'];
  num := ['0'..'9'];
  i := 1;
  n := 0;
  Repeat
    res := '';
    If ( Upcase(p[i]) In alph ) Or ( p[i] In num ) Then
      Begin
        n := n+1;
        Repeat
          res := res+p[i];
          i := i+1 ;
        Until Not (( Upcase(p[i]) In alph ) Or ( p[i] In num )) Or ( i>Length(p)) ;
      End
    Else
      Begin
        Repeat
          i := i+1;
        Until ( Upcase(p[i]) In alph ) Or ( p[i] In num ) Or ( i>Length(p));
      End;
  Until n=m;
  mot_ph := res;
End;
//-------------------------------------------------
Procedure mot_tab(p:String;Var t:t_mot);
Var
  i,j: Longint;
  cmpt: Longint;
  sauv,mot: String;
Begin
  sauv := p;
  norm(sauv);
  impurify(sauv);
  cmpt := 0;
  i := 1;
  Repeat
    j := i;
    While sauv[i]<>' ' Do
      i := i+1;
    mot := Copy(sauv,j,i-j+1);
    t[cmpt+1] := mot;
    cmpt := cmpt+1;
    While sauv[i] =' ' Do
      i := i+1;
  Until cmpt= nb_mots(p);
End;
//-------------------------------------------------
Procedure mat_tran (m:mat;maxl,maxc:Longint;Var m_tr :mat);
Var
  i,j: Longint;
Begin
  For i:= 1 To maxl Do
    Begin
      For j:=1 To maxc Do
        Begin
          m_tr[j,i] := m[i,j];
        End;
    End;
End;
//-------------------------------------------------

Procedure supp_mot (mot:String ;Var p:String);
Type
  c = set Of Char;
Var
  sauv,i: Longint;
  res: String;
	 alph,num: c;
	 bool:Boolean;
Begin
  i := 0;
	 alph := ['A'..'Z'];
  num := ['0'..'9'];
	
  Repeat
    i := i+1;
    sauv := i;
    res := '';
		
    While Length (res) < Length (mot) Do
      Begin
        res := res+ p[sauv];
        sauv := sauv+1;
      End;
			bool:= Not (( Upcase(p[sauv]) In alph ) Or ( p[sauv] In num ));
    If (res = mot) and bool  Then
     Delete ( p, i , Length(mot)+1 );
Until i> Length (p);
End;
//-------------------------------------------------    
Procedure produit_mat (t1:mat;m,p:LongInt;t2:mat;n:LongInt;var t3:mat);
var i,j,k:LongInt;
Begin
 for i:= 1 to m Do
  Begin
	 for j:=1 to n Do
	  Begin
		 t3[i,j]:=0;
		  for k:=1 to p do
			 begin
			  t3[i,j]:=  t3[i,j]+ t1[i,p]*t2[p,j]
				End;
		 end;
	end;
end;
			




//-------------------------------------------------
End.