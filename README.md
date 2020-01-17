# Code and Script for the Paper: **Artificial mental phenomena: Psychophysics as a framework to detect perception biases in AI models**
  
Lizhen Liang and Daniel E. Acuna  
School of Information Studies      
Syracuse University  
Science of Science & Computational Discovery Lab  
Syracuse, New York  
  
[Link to the paper](https://arxiv.org/abs/1912.10818)


## 2AFC  
  
In the 2AFC folder, /bootstrap/ inncludes the script we have used to bootstrap the GloVe model.  
Two_Alternative_Forced_Choice.ipynb includes the script we used to load the bootstrapped GloVe models, the script for two alternative forced choice and the script we used to detect biases in GloVe models using two alternative forced choice.  
  
## MCMC  
  
The MCMC folder includes the script we used to train a classifier that classifies between positive movie reviews and negative movie reviews. The ipynb file also includes the script we used to build the MCMC sampler based on the classifer we build previously. The generated samples given different condition for the MCMC sampler are also included in the folder. The notebook also includes the script we used to detect biases from the samples.
  
## data  
The data folder includes data we used to build classifiers and validates our experiments. 