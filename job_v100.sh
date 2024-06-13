#!/bin/bash
#SBATCH -p gpu_v100_2
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --gres=gpu:1
#SBATCH --mem=5G
#SBATCH -t 0-10:00 # time (D-HH:MM)
#SBATCH --job-name="3d-mfcfd-test"
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --mail-user=f20210781@hyderabad.bits-pilani.ac.in
#SBATCH --mail-type=ALL

./execname
