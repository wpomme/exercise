{ n >= 8 以上で間違った解答が出力される }
{ n, i, ret がinteger のためか }
program Factorial(Output);
    var n: integer;
    var i: integer;
    var ret: integer;
begin
    Write('n = '); readln(n);
    ret := 1;
    for i := 1 to n do begin
        ret := ret * i;
    end;
    Writeln(ret);
end.
