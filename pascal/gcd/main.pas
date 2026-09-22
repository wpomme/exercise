program gcd(Input, Output);
  var m: integer;
  var n: integer;
  var r : integer;
begin
    Writeln('gcd:');
    Write('m:'); readln(m);
    Write('n:'); readln(n);
    repeat
        r := m mod n;
        m := n;
        n := r;
    until r = 0;
    Writeln(m);
end.
