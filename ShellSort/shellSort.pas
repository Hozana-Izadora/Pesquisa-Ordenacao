Program ShellTest;
Uses CRT;   
Type Int_Arr = Array [1..10] Of Integer;   
Var i : Integer;       
	a : Int_Arr;
 
 
 
Procedure Shell(Var a : Int_arr; 
	n : Integer);
var gap,i,j,k,x : Integer;
 
 
Procedure Switch(var a,b : Integer);
var c : Integer;
Begin       
	c := a;       
	a := b;       
	b := c; 
End;
Begin
	gap := n div 2;
	While (gap > 0) Do Begin
		for i := (gap + 1) To n Do Begin
			j := (i - gap);
			While (j > 0) Do Begin
				k := j + gap;
				If (a[j] <= a[k]) Then
					j := 0 
				Else
					Switch(a[j],a[k]);
				j := (j - gap);
			End;
		End;
		gap := gap Div 2;
	End;
End;
 
Begin
	ClrScr;     
	a[1] := 19;     
	a[2] := 09;     
	a[3] := 32;     
	a[4] := 63;     
	a[5] := 86;     
	a[6] := 85;     
	a[7] := 87;     
	a[8] := 49;     
	a[9] := 35;     
	a[10] := 86;
 
	For i := 1 To 10 Do
		Write(a[i]:4);
	WriteLn;
 
	 Shell(a,10);
 
	 For i := 1 To 10 Do
		Write(a[i]:4); 
	 WriteLn; 
 
	 Write('Pressione ENTER...');
 
	 ReadLn;
End.
