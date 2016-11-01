#!/bin/bash
#$ -wd /data/uctpdtz/Julia/Status # <- working directory
#$ -o julia-test.sgelog # <- name of output file
#$ -q batch.q # <- batch processing
#$ -j y # <- joint output and error files
#$ -N julia-test # <- name appearing on HPC status
#$ -S /bin/bash # <- script language
#$ -pe julia 4 # <- Requesting 4 processors per node
#$ -M uctpdtz@ucl.ac.uk # <- Email address to send alerts to
#$ -m beas # <- Email address to send alerts to
#$ -t 1-30 # <- Number of tasks (corresponds to number of nodes, and number of minimum wage runs)
#$ -tc 10

. /etc/profile.d/modules.sh
module load shared sge julia/0.4.0 git/1.7.6 

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > /data/uctpdtz/Julia/Output/hosts$SGE_TASK_ID

echo "calling julia again: Running Mod ${SGE_TASK_ID}"

julia --machinefile /data/uctpdtz/Julia/Output/hosts$SGE_TASK_ID /data/uctpdtz/Julia/Code/modelcentral.jl > /data/uctpdtz/Julia/Output/Results$SGE_TASK_ID.log