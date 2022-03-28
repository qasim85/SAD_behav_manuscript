#!/bin/bash

#SBATCH --job-name=pydra-ml-sad
#SBATCH --output=logs/array_%A_%a.out
#SBATCH --error=logs/array_%A_%a.err
#SBATCH --array=0-1
#SBATCH --time=1-0
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=5G


# Print the task id.
specfiles=(../specs/shap_sad_*.json)
SPEC=${specfiles[${SLURM_ARRAY_TASK_ID}]}
echo "My SLURM_ARRAY_TASK_ID: " ${SLURM_ARRAY_TASK_ID} "SPEC: " $SPEC

# Add lines here to run your computations.
pydraml -s $SPEC -p cf "n_procs=8" -c /nobackup/scratch/Mon/satra/cache-wf-shap/${SLURM_ARRAY_TASK_ID}
