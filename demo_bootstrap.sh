#!/bin/bash
set -e

# Makes programs, downloads sample data, trains a GloVe model, and then evaluates it.
# One optional argument can specify the language used for eval script: matlab, octave or [default] python


SEED=$1
N=$2
CORPUS=wiki.en.text
VOCAB_FILE=vocab.txt
COOCCURRENCE_FILE=cooccurrence.bin
COOCCURRENCE_SHUF_FILE=cooccurrence.shuf.bin
BUILDDIR=build
SAVE_FILE=vectors_$SEED
VERBOSE=2
MEMORY=32.0
VOCAB_MIN_COUNT=5
VECTOR_SIZE=50
MAX_ITER=15
WINDOW_SIZE=15
BINARY=2
NUM_THREADS=8
X_MAX=10
CORPUSGENERATOR="/home/tozeng/anaconda3/bin/python bootstrap_file.py $CORPUS $SEED $N"

echo
echo "$ $CORPUSGENERATOR | $BUILDDIR/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE > $VOCAB_FILE"
$CORPUSGENERATOR | $BUILDDIR/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE > $VOCAB_FILE
echo "$ $CORPUSGENERATOR | $BUILDDIR/cooccur -memory $MEMORY -vocab-file $VOCAB_FILE -verbose $VERBOSE -window-size $WINDOW_SIZE > $COOCCURRENCE_FILE"
$CORPUSGENERATOR | $BUILDDIR/cooccur -memory $MEMORY -vocab-file $VOCAB_FILE -verbose $VERBOSE -window-size $WINDOW_SIZE > $COOCCURRENCE_FILE
echo "$ $BUILDDIR/shuffle -memory $MEMORY -verbose $VERBOSE < $COOCCURRENCE_FILE > $COOCCURRENCE_SHUF_FILE"
$BUILDDIR/shuffle -memory $MEMORY -verbose $VERBOSE < $COOCCURRENCE_FILE > $COOCCURRENCE_SHUF_FILE
echo "$ $BUILDDIR/glove -save-file $SAVE_FILE -threads $NUM_THREADS -input-file $COOCCURRENCE_SHUF_FILE -x-max $X_MAX -iter $MAX_ITER -vector-size $VECTOR_SIZE -binary $BINARY -vocab-file $VOCAB_FILE -verbose $VERBOSE"
$BUILDDIR/glove -save-file $SAVE_FILE -threads $NUM_THREADS -input-file $COOCCURRENCE_SHUF_FILE -x-max $X_MAX -iter $MAX_ITER -vector-size $VECTOR_SIZE -binary $BINARY -vocab-file $VOCAB_FILE -verbose $VERBOSE
