#$ -S /bin/bash
#$ -wd /home/uctpdtz/Status # <- working directory
#$ -o julia-test.sgelog # <- name of output file
#$ -j y # <- joint output and error file
#$ -N julia-test # <- name appearing on HPC status
#$ -S /bin/bash # <- script language
#$ -t 1-30 # <- Number of tasks (corresponds to number of nodes, and number of minimum wage runs)
#$ -l h_rt=24:0:0
#$ -l tmem=4G 
#$ -l h_vmem=4G 
#$ -l hostname=burns*
rm -r /home/uctpdtz/Output/*
rm -r /home/uctpdtz/Status/*
export JULIA_PKGDIR=/share/apps/julia-pkg
export LD_LIBRARY_PATH=/share/apps/gcc-6.2.0/lib64:/share/apps/gcc-6.2.0/lib:/share/apps/julia-0.5/lib:$LD_LIBRARY_PATH
echo "calling julia: Running Mod ${SGE_TASK_ID}"
/share/apps/julia-0.5.0/bin/julia /home/uctpdtz/HPC_Julia_Test/tasktest.jl > /home/uctpdtz/Output/Results$SGE_TASK_ID.log
