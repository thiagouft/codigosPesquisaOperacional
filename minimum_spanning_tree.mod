/** Universidade Federal do Tocantins
  * Pesquisa Operacional
  * Problema do Caixeiro Viajante
  * Acadêmicos: Fernando Noleto e Thiago Silva
  */

param n, integer, >= 2;

/* Conjunto de nós */
set V:={1..n};

/* Conjunto de arestas */
set E within V cross V;


set A :=E union setof{(i,j) in E} (j,i);


param c{(i,j) in E}, >= 0;
/* Custo da aresta do nó i ao nó j */

var f{(i,j) in A, k in V diff {1}} >=0;

var y{(i,j) in A} >=0;


minimize custo: sum{(i,j) in E} c[i,j]*(y[i,j]+y[j,i]);


s.t. source{k in V diff {1}}:
     sum{(j,1) in A} f[j,1,k]-sum{(1,j) in A} f[1,j,k]= -1;

s.t. balance1{k in V diff {1},i in V diff {1} : k <> i}:
     sum{(j,i) in A} f[j,i,k]-sum{(i,j) in A} f[i,j,k]= 0;

s.t. sinks{k in V diff {1}}:
     sum{(j,k) in A} f[j,k,k]-sum{(k,j) in A} f[k,j,k]= 1;

s.t. capacity{k in V diff {1}, (i,j) in A}:
     f[i,j,k] <= y[i,j];

s.t. tree: sum{(i,j) in A} y[i,j]=n-1; 


solve;



printf("\n-------------------------------\n");
printf "Árvore Geradora Mínima\n";

printf("Arestas ativadas:\n");
display {(i,j) in A: y[i,j]!=0 }: y[i,j];


printf "O custo total da árvore geradora mínima: %d\n\n",  sum{(i,j) in E} c[i,j]*(y[i,j]+y[j,i]);

