# Bootstrapping GloVe  
  
The word2vec model we have used is GloVe, which you may find and download here: https://github.com/stanfordnlp/GloVe  
The dataset we used to train the model could be download somewhere here: https://dumps.wikimedia.org/ , we have used the dataset from until March 20, 2019.  

After cloning the GloVe repo to the local directory, build the model by following the instructions from the repo (https://github.com/stanfordnlp/GloVe/blob/master/src/README.md) and then run demo_bootstrap.sh.
  
The reason we used bootstrap_file.py was that we cannot directly bootstrap the dataset since it is too big and partitioned, the Python script would stream through the whole dataset and decide how many times a sentence would be sampled to be part of the training dataset. In that way we can simulate the sampling process.  

