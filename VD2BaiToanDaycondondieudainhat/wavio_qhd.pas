program ct;
 uses crt;
 var i,n,csl: integer;
       f: text;
       sn,s1,s2,s: array [0..10000] of longint;
       s1luu,s2luu,sluu: array [0..10000] of string;


procedure nhap;
 begin
  assign(f,'wavio.inp');
  reset(f);
  read(f,n);
  for i:=1 to n do
   read(f,sn[i]);
  close(f);
  csl:=0;
 end;
procedure xulymang_1;
 var max,csltam,p:integer;
 begin
  for i:=1 to n do
   begin
    s1[i]:=1;
    str(sn[i],s1luu[i]);
   end;
  i:=1;
  repeat
    inc(i);
    max:=1;
    for p:=1 to i-1 do
     if (sn[p]<sn[i]) and (max<(s1[p]+1)) then
      begin
       max:=s1[p]+1;
       csltam:=p;
      end;
    if csltam>0 then
     begin
      s1luu[i]:=s1luu[csltam]+' '+s1luu[i];
      s1[i]:=s1[csltam]+1;
      csltam:=0;
     end
    else
     csltam:=0;
  until i>n;
 end;
procedure xulymang_2;
 var p,max,csltam:integer;
 begin
  for p:=1 to n do
   begin
    s2[p]:=1;
    str(sn[p],s2luu[p]);
   end;
  i:=n;
  csltam:=0;
  while i>0 do
   begin
    dec(i);
    max:=1;
    for p:=n downto (i+1) do
     if (sn[p]<sn[i]) and (max<(s2[p]+1)) then
      begin
       csltam:=p;
       max:=s2[p]+1;
      end;
    if csltam <> 0 then
     begin
      s2[i]:=max;
      s2luu[i]:=s2luu[i]+' '+s2luu[csltam];
     end;
    csltam:=0;
   end;
 end;
procedure xuly;
 var p,t,csm:integer;
 begin
  for p:=1 to n do
   begin
    t:=pos(' ',s2luu[p]);
    if t=0 then
     s2luu[p]:=''
    else
     delete(s2luu[p],1,t-1);
   end;
  for p:=1 to n do
   begin
    s[p]:=s1[p]+s2[p]-1;
    sluu[p]:=s1luu[p]+s2luu[p];
   end;
  csm:=1;
  for p:=2 to n do
   if s[csm]<s[p] then
    csm:=p;
  writeln(s[csm]);
  write(sluu[csm]);
 end;
begin
 clrscr;
 nhap;
 xulymang_1;
 xulymang_2;
 xuly;
 readln;
end.
