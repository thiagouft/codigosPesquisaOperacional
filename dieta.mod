set N;
set A;
param r{N};
param v{A,N};

param c{A};

var x {a in A} >= 0;

s.t. nutrir{n in N}: sum{a in A} v[a,n] * x[a] >= r[n];

minimize custo: sum{a in A} c[a] * x[a];
