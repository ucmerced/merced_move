#! /bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#
#SBATCH --partition fast.q,std.q,long.q
#SBATCH --nodelist={{host}}
#SBATCH --time=0-00:01:00     # 0days 15 minutes
#
#SBATCH --output=python_job_output_{{host}}_%j.stdout
#SBATCH --output=python_job_error_{{host}}_%j.stdout
#
#SBATCH --job-name=python_job_{{host}}_%j
#SBATCH --export=ALL

module load anaconda3
python -c 'import socket; print(socket.gethostname())
