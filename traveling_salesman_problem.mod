/** Universidade Federal do Tocantins
  * Pesquisa Operacional
  * Problema do Caixeiro Viajante
  * Acadêmicos: Fernando Noleto e Thiago Silva
  */


param n, integer, >= 3;

/* Conjunto de nós */
set V := 1..n;

/* Conjunto de arestas */
set E, within V cross V;

/* Distancia do nó i ao nó j */
param c{(i,j) in E};

/* x[i,j] = 1 Marcar a visita do caixeiro do nó i ao nó j */
var x{(i,j) in E}, binary;

/* O objetivo é minimizar o caminho percorrido pelo caixeiro */
minimize total: sum{(i,j) in E} c[i,j] * x[i,j];

/* O caixeiro deixa o nó i exatamente uma vez */
s.t. leave{i in V}: sum{(i,j) in E} x[i,j] = 1;

/* O caixeiro visita o nó i exatamente uma vez */
s.t. enter{j in V}: sum{(i,j) in E} x[i,j] = 1;

var y{(i,j) in E}, >= 0;

s.t. cap{(i,j) in E}: y[i,j] <= (n-1) * x[i,j];

s.t. node{i in V}:

      sum{(j,i) in E} y[j,i]
      + (if i = 1 then n)
      = 
      sum{(i,j) in E} y[i,j]
      + 1;
solve;

printf "Tamanho do caminho ótimo %d\n",
   sum{(i,j) in E} c[i,j] * x[i,j];
printf("Do nó    Para o nó    Distancia\n");
printf{(i,j) in E: x[i,j]} "%3d       %3d       %8g\n",
   i, j, c[i,j];

# data;

# param n := 6;
# /*Número de nós*/

# param : E : c :=
#     1  2   509
#     1  4   1024
#     1  6   604
#     2  3   203
#     2  5   712
#     3  4   308
#     3  6   913
#     4  5   334
#     5  6   229
#     6  1   604
# ;

# end;