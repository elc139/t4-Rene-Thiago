
#!/bin/bash
N_THREADS=(1 2 3 4)
N_PESSOAS=(10 30 60)
N_TRIALS=(100 1000 3000)
N_PROBS=101

echo "|n_threads|n_pessoas|n_trials|tempo|" > tabela_virusim.md
echo "|:---:|:---:|:---:|:---:|" >> tabela_virusim.md

echo "|n_threads|n_pessoas|n_trials|tempo|" > tabela_solution_v1.md
echo "|:---:|:---:|:---:|:---:|" >> tabela_solution_v1.md

echo "|n_threads|n_pessoas|n_trials|tempo|" > tabela_solution_v2.md
echo "|:---:|:---:|:---:|:---:|" >> tabela_solution_v2.md

n_probs=${N_PROBS}
for i in {0..3}; do
    n_threads=${N_THREADS[$i]}
    for j in {0..2}; do
        n_pessoas=${N_PESSOAS[$j]}
        for k in {0..2}; do
           n_trials=${N_TRIALS[$k]}
           resultados_virusim=($(./virusim/virusim $n_pessoas $n_trials $n_probs))
           echo "|1|${n_pessoas}|${n_trials}|${resultados_virusim[0]}|" >> tabela_virusim.md

           resultados_solution_v1=($(./virusim/solution_v1 $n_pessoas $n_trials $n_probs $n_threads))
           echo "|${n_threads}|${n_pessoas}|${n_trials}|${resultados_solution_v1[0]}|" >> tabela_solution_v1.md
           
           resultados_solution_v2=($(./virusim/solution_v2 $n_pessoas $n_trials $n_probs $n_threads))
           echo "|${n_threads}|${n_pessoas}|${n_trials}|${resultados_solution_v2[0]}|" >> tabela_solution_v2.md    
        done
    done
done