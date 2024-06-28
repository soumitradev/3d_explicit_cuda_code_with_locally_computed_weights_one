#!/bin/bash
#SBATCH -p gpu_a100_8
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --gres=gpu:1
#SBATCH --qos=qos_gpu_a100_priority
#SBATCH --mem=100G
#SBATCH -t 0-23:00 # time (D-HH:MM)
#SBATCH --job-name="3d-mfcfd-test"
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --mail-user=f20210781@hyderabad.bits-pilani.ac.in
#SBATCH --mail-type=ALL


./execname
