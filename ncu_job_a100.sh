#!/bin/bash
#SBATCH -p gpu_a100_8
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --gres=gpu:1
#SBATCH --qos=qos_gpu_a100_priority
#SBATCH --mem=100G
#SBATCH -t 0-10:00 # time (D-HH:MM)
#SBATCH --job-name="3d-mfcfd-ncu-profiling"
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --mail-user=f20210781@hyderabad.bits-pilani.ac.in
#SBATCH --mail-type=ALL

spack load nvhpc@23.3/gq4uoop
ncu --import-source on --set full -o "/home/anil/soumitra/3d_explicit_cuda_code_with_locally_computed_weights_one/profile_ncu_$SLURM_JOB_ID" ./execname
nsys profile --trace=cuda --stats=true -o "/home/anil/soumitra/3d_explicit_cuda_code_with_locally_computed_weights_one/profile_nsys_$SLURM_JOB_ID" ./execname
