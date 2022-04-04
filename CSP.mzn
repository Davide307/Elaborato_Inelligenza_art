int: n;   % no. negozi  
int: m;   % no. magazzini
array[1..m] of int : A ; % prezzo acqisto magazzini
array[1..m] of int : V ; % prezzo vendita magazzini
array[1..m] of int : S ; % capacità magazzini
array[1..n,1..m] of int: c ; % costo magazzino-negozio
array[1..n,1..m] of var 0..1: associazione; % matrice per associare i negozi ai magazzini
array[1..m] of var 0..1: MagUsati; % magazzini utilizzati

constraint forall(j in 1..m)( % vincolo capacità magazzino
                 sum(i in 1..n)(associazione[i,j]) <= S[j] /\
                 S[j]>=1 /\ S[j] <= n);
                 
constraint forall(i in 1..n)( % vincolo per garantire l'assegnazione per tutti i negozi 
                 sum(j in 1..m)(associazione[i,j])==1);
                 
constraint forall(j in 1..m)( % vincolo per il riconoscimento dei magazzini usati
                 if(sum(i in 1..n)(associazione[i,j])>0) then MagUsati[j]=1 else MagUsati[j] = 0 endif);
                    
var int: exp=sum(i in 1..n)(sum(j in 1..m)(c[i,j]*associazione[i,j]))+sum(j in 1..m)(MagUsati[j]*(A[j]-V[j])); % minmizzazione costi 
                                                                                                             %( rifornimento negozi e prezzo acquisto-vendita magazzini)
solve minimize exp;

output [" Costo minimo operazione \(exp) \n"]; 
output[" Magazzini usati :\n"];  
output[if fix(MagUsati[j]) == 1 then " Magazzino \(j) \n" endif| j in 1..m];
output[" Associazioni :\n" ];
output[if fix(associazione[i,j]) == 1 then " Magazzino \(j) -> Negozio \(i)\n" endif| j in 1..m, i in 1..n];
output[" Corrispettiva tabella delle associazioni :\n" ];
output[ if j=1 then " Negozio \(i)  " endif ++ show(associazione[i,j]) ++ if j = m then "\n" else " "  endif | i in 1..n, j in 1..m];