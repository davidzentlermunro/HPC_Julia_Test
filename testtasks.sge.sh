#$ -S /bin/bash
#$ -wd /home/uctpdtz/Status # <- working directory
#$ -o julia-test.sgelog # <- name of output file
#$ -q batch.q # <- batch processing
#$ -j y # <- joint output and error files
#$ -N julia-test # <- name appearing on HPC status
#$ -S /bin/bash # <- script language
#$ -t 1-30 # <- Number of tasks (corresponds to number of nodes, and number of minimum wage runs)
#$ -tc 10
#$ -l h_rt=24:0:0
#$ -l tmem=1G 
#$ -l h_vmem=1G 

hostname
date

# Run application
/home/uctpdtz/.julia/v0.5

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > /home/uctpdtz/Output/hosts$SGE_TASK_ID

echo "calling julia: Running Mod ${SGE_TASK_ID}"

julia --machinefile /home/uctpdtz/Output/hosts$SGE_TASK_ID /home/uctpdtz/HPC_Julia_Test/tasktest.jl > /home/uctpdtz/Output/Results$SGE_TASK_ID.log
