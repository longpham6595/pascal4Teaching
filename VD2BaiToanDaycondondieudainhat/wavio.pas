program wavio;
 uses crt;
 var sn: array[1..10000] of integer;
    luu: array[1..10000] of string;
    sopt: array[1..10000] of integer;
 i,n,demtt,batdau,csl: integer;
 ttht: string;
 f:text;
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
procedure khoitao;
 begin
  demtt:=0;
  ttht:='None';
  batdau:=0;
 end;
procedure switch(x:string);
 begin
  if x[1]='T' then
   ttht:='G'
  else
   ttht:='T';
 end;
procedure xuat(x:integer);
 var q,r,k:integer;
     st: string;
 begin
  r:=x-batdau+1;
  inc(csl);
  sopt[csl]:=r;
  luu[csl]:='';
  for q:=batdau to x do
   begin
    str(sn[q],st);
    st:=' '+st;
    luu[csl]:=luu[csl]+st;
   end;
 end;
procedure xuly(x:integer);
 var p:integer;
 begin
  if (x=n) or (demtt=3) then
   xuat(x-1)
  else
   begin
    if (batdau=0) then
     begin
      batdau:=x;
      xuly(x+1);
      batdau:=0;
     end;
    if (batdau<>0) and (demtt<3) then
     begin
      if demtt = 0 then
       begin
        if sn[x]>sn[x-1] then
         begin
          inc(demtt);
          ttht:='T';
          xuly(x+1);
          dec(demtt);
          ttht:='None';
         end;
        if sn[x]<sn[x-1] then
         begin
          inc(demtt);
          ttht:='G';
          xuly(x+1);
          dec(demtt);
          ttht:='None';
         end;
       end;
      if (demtt > 0) and (demtt<2) then
       begin
        if ((ttht='T') and (sn[x+1]>sn[x])) or ((ttht='G') and (sn[x+1]<sn[x])) then
         xuly(x+1);
        if ((ttht='T') and (sn[x+1]<sn[x])) or ((ttht='G') and (sn[x+1]>sn[x])) then
         begin
          switch(ttht);
          inc(demtt);
          xuly(x+1);
          switch(ttht);
          dec(demtt);
         end;
       end;
      if (demtt=2) then
       begin
        if ((ttht='T') and (sn[x+1]>sn[x])) or ((ttht='G') and (sn[x+1]<sn[x])) then
          xuly(x+1);
        if ((ttht='T') and (sn[x+1]<sn[x])) or ((ttht='G') and (sn[x+1]>sn[x])) then
         begin
          inc(demtt);
          xuly(x);
         end;
       end;
     end;
   end;
 end;
begin
 clrscr;
 nhap;
 khoitao;
 for i:=1 to n-1 do
  begin
   xuly(i);
   khoitao;
  end;
 for i:=1 to csl do
  begin
   write(luu[i]:20);
   writeln(sopt[i]:3);
  end;
 readln;
end.