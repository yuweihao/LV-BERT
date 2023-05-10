# LV-BERT

## Introduction

In this repo, we introduce **LV-BERT** by exploiting layer variety for BERT. For detailed description and experimental results, please refer to our paper [LV-BERT: Exploiting Layer Variety for BERT (Findings of ACL 2021)](https://arxiv.org/abs/2106.11740).


## Requirements
* Python 3.6
* TensorFlow 1.15
* numpy
* scikit-learn


## Experiments
Firstly, **set your data dir (absolute)** to place datasets and models by
```bash
DATA_DIR=/path/to/data/dir
```

### Fine-tining
We give the instruction to fine-tune a pre-trained LV-BERT-small (13M parameters) on GLUE. You can refer to this [Google Colab notebook](https://colab.research.google.com/drive/1q1Exfs4kg8aRzewLH_imMF1eLdJm__e8?usp=sharing) for a quick example. All models are provided in [Google Drive](https://drive.google.com/drive/folders/1R4HVVAXhIaLn-w9o6CQ3WfaWWAwtE7bo?usp=sharing), [Huggingface](https://huggingface.co/whyu/LV-BERT_models/tree/main) and [GitHub release](https://github.com/yuweihao/LV-BERT/releases/tag/model). The models are pre-trained 1M steps with sequence length 128 to save compute. `*_seq512` named models are trained for more 100K steps with sequence length 512 whichs are used for long-sequence tasks like SQuAD. See our paper for more details on model performance. 

1. Create your data directory.
```bash
mkdir -p $DATA_DIR/models && cp vocab.txt $DATA_DIR/
```

Put the pre-trained model in the corresponding directory
```bash
mv lv-bert_small $DATA_DIR/models/
```

2. Download the GLUE data by running
```bash
python3 download_glue_data.py
```

3. Set up the data by running 
```bash
cd glue_data && mv CoLA cola && mv MNLI mnli && mv MRPC mrpc && mv QNLI qnli && mv QQP qqp && mv RTE rte && mv SST-2 sst && mv STS-B sts && mv diagnostic/diagnostic.tsv mnli && mkdir -p $DATA_DIR/finetuning_data && mv * $DATA_DIR/finetuning_data && cd ..
```

4. Fine-tune the model by running
```bash
bash finetune.sh $DATA_DIR
```

PS: (a) You can test different tasks by changing configs in `finetune.sh`. (b) Some of the datasets on GLUE are small, causing that the results may vary substantially for different random seeds. The same as ELECTRA, we report the median of 10 fine-tuning runs from the same pre-trained model for each result. 



### Pre-training

We give the instruction to pre-train LV-BERT-small (13M parameters) using the [OpenWebText](https://skylion007.github.io/OpenWebTextCorpus/) corpus.

1. First download the [OpenWebText](https://skylion007.github.io/OpenWebTextCorpus/) pre-traing corpus (12G).

2. After downloading the pre-training corpus, build the pre-training dataset tf-record by running
```bash
bash build_data.sh $DATA_DIR
```

3. Then, pre-train the model by running

```bash
bash pretrain.sh $DATA_DIR
```



## Bibtex
```
@inproceedings{yu2021lv-bert,
        author = {Yu, Weihao and Jiang, Zihang and Chen, Fei, Hou, Qibin and Feng, Jiashi},
        title = {LV-BERT: Exploiting Layer Variety for BERT},
        booktitle = {Findings of ACL},
        month = {August},
        year = {2021}
}
```

### Reference

This repo is based on the repo [ELECTRA](https://github.com/google-research/electra).

## Acknowledgment
Weihao Yu would like to thank TPU Research Cloud (TRC) program for the support of partial computational resources.
