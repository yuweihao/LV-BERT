# set your data_dir
# DATA_DIR=/path/to/data/dir
DATA_DIR=$1
MODEL_NAME=lv-bert_small

python3 run_finetuning.py --data-dir $DATA_DIR --model-name $MODEL_NAME \
--hparams '{"model_size": "small", "max_seq_length": 128, 
"learning_rate": 3e-4, "task_names": ["cola"], "num_trials": 1, 
"custom_layer_list": [0, 0, 1, 2, 2, 1, 0, 2, 2, 1, 0, 0, 1, 2, 0, 2, 1, 0, 2, 0, 1, 1, 2, 1]}'

# "task_names" can be set in ["cola", "mrpc", "mnli", "sst", "rte", "qnli", "qqp", "sts"]

# "num_trials" means the number of train+eval runs to perform. 
# Some of the datasets on GLUE are small, causing that the results may vary substantially for different random seeds. 
# The same as ELECTRA, we report the median of 10 fine-tuning runs from the same pre-trained model for each result. 

# In "custom_layer_list", 0, 1, and 2 denote dynamic convolution, self-attention, and feed-forward layers respectively.