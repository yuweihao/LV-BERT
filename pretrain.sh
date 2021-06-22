# set your data_dir
# DATA_DIR=/path/to/data/dir
DATA_DIR=$1
MODEL_NAME=lv-bert_small_trained-by-yourself

python run_pretraining.py --data-dir $DATA_DIR --model-name $MODEL_NAME \
--hparams '{"model_size": "small", "max_seq_length": 128, "train_batch_size": 128,
"custom_layer_list": [0, 0, 1, 2, 2, 1, 0, 2, 2, 1, 0, 0, 1, 2, 0, 2, 1, 0, 2, 0, 1, 1, 2, 1]}'


# In "custom_layer_list", 0, 1, and 2 denote dynamic convolution, self-attention, and feed-forward layers respectively.