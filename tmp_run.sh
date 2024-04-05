#!/bin/bash

export MIMIR_CACHE_PATH="$HOME/.cache"
export MIMIR_DATA_SOURCE="$HOME/data"

# with-proxy bash scripts/run_mia_suite_olmo.sh

# version="unified_mia_v5_gpt_neo_github_redo"
# baselines_only=$1
# skip_baselines=$2
# ngram=13
# model="gpt-neo-125m"
# subset="github"

# # --baselines_only true

# with-proxy python run.py \
#     --config "configs/mi.json" \
#     --base_model "EleutherAI/${model}" \
#     --specific_source ${subset}_ngram_${ngram}_\<0.8_truncated \
#     --output_name $version \
#     --n_samples 1000

# with-proxy python run.py \
#     --config "configs/mi.json" \
#     --base_model "EleutherAI/gpt-neo-125m" \
#     --specific_source "github_ngram_13_<0.8_truncated" \
#     --output_name "unified_mia_v5_gpt_neo_github_redo" \
#     --n_samples 1000

# --device "cuda:7" --device_aux "cuda:7"

# SUBSET="temporal_arxiv_2023_06"
# SUBSET="temporal_wiki"
MODEL="meta-llama/Llama-2-13b-hf"
for SUBSET in "temporal_arxiv_2023_06" "temporal_wiki"
do
    OUTPUT_NAME="Llama-2-70b_$SUBSET"
    CUDA_VISIBLE_DEVICES=7 with-proxy python run.py \
        --config "configs/mi.json" \
        --base_model $MODEL \
        --specific_source "${SUBSET}" \
        --output_name $OUTPUT_NAME \
        --n_samples 1000
done
echo "Finished."
exit 0

# for MONTH in '2020_08' '2021_01' '2021_06' '2022_01' '2022_06' '2023_01' '2023_06'
# do

# done

SUBSET="github"
MODEL="meta-llama/Llama-2-70b-hf"
OUTPUT_NAME="Llama-2-70b_$SUBSET"
# MODEL="EleutherAI/pythia-160m-deduped"
# OUTPUT_NAME="pythia-160m-deduped_$SUBSET"

# CUDA_VISIBLE_DEVICES=0,1,2,3 with-proxy python run.py \
#     --config "configs/mi.json" \
#     --base_model $MODEL \
#     --specific_source "${SUBSET}_ngram_13_<0.8_truncated" \
#     --output_name $OUTPUT_NAME \
#     --n_samples 1000

for SUBSET in "wikipedia_(en)" "pile_cc" "pubmed_central" "arxiv" "dm_mathematics" "hackernews"
do
    OUTPUT_NAME="Llama-2-70b_$SUBSET"
    CUDA_VISIBLE_DEVICES=0,1,2,3 with-proxy python run.py \
        --config "configs/mi.json" \
        --base_model $MODEL \
        --specific_source "${SUBSET}_ngram_13_<0.8_truncated" \
        --output_name $OUTPUT_NAME \
        --n_samples 1000
done

echo "Finished."
exit 0
