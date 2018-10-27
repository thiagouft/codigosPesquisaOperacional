param n, integer, > 0;

param c;

set I := 1..n;

param l{I};

param p{I};

var x{I} binary;

maximize lucro: sum{i in I} l[i]*x[i];

s.t. capacidade: sum{i in I} p[i]*x[i] <= c;
