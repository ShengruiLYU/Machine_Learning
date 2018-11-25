Instructions for running the code:
.m files are run in MATLAB R2017a

PART 1: 
use the first three algorithms to find good weights for a neural network.
Go to neural_nets/MATLAB/nnet

gannet.m : for genetic algorithm
hillnnet.m : for randomized hill search
sannet2.m : for simulated annealing
sannet.m : for simulated annealling with restarts
backpropnnet.m : nnet solution using nnet

data for neural_nets:
Go to neural_nets/data

pima.csv : contains the whole data set
pimatest.csv : is the validation/test data set
pimatrain.csv : is the training data set
pimatrain-1.csv : a subset of the training set, for variation of 2 fold cv
pimatrain-2.csv : a subset of the training set, for variation of 2 fold cv


PART 2:
3 self-proposed problems 

Codes for the Rastrigin function:
GA,SA,RHC: self_proposed_problems_without_MIMIC\solveRas.m
MIMIC : ABAGAIL\src\opt\test\RasTest.java


Codes for the TSP :
GA,SA,RHC: self_proposed_problems_without_MIMIC\solveTSP.m
MIMIC : ABAGAIL\src\opt\test\TravelingSalesmanTest.java


Codes for One-Max problem:
ABAGAIL\src\opt\test\CountOnesTest.java
