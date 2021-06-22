# set your data_dir
# DATA_DIR=/path/to/data/dir
DATA_DIR=$1
# extract data
tar xf openwebtext.tar.xz
# move to data_dir
mv openwebtext $DATA_DIR/openwebtext
# copy vocab dir
cp vocab.txt $DATA_DIR/vocab.txt
# build pre-train tf-record 
python3 build_openwebtext_pretraining_dataset.py --data-dir $DATA_DIR --num-processes 8
