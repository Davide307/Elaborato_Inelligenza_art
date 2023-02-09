# Elaborato_Inelligenza_artificiale
Elaborato per l'esame di intelligenza artificiale - Constraint Satisfaction Problems 
Martini Davide 7008535
Il progetto e costituito da 3 files :
CSP.mzn : è il codice in MiniZinc che esegue l'ottimizzazione del problema.
Quest'ultimo necessita da input: 
- il numero di negozi n
- il numero di magazzini m
- la matrice con i costi di rifornimento per ciascun negozio-magazzino c
- il vettore dei costi di acquisto dei magazzini A
- il vettore dei costi di vendita dei magazzini V
- il vettore della quantità dei negozi che i magazzini possono fornire S
Dadi-1.dzn : che contiene il primo set di dati su cui è stato testato CSP
Dati-2.dzn : che contiene il secondo set di dati su cui è stato testato CSP

Fonti utilizzate :
Handbook di MiniZinc : https://www.minizinc.org/doc-2.5.5/en/index.html
