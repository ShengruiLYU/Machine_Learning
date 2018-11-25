I use Weka 3.8 for this assignment, so there is no code in this folder.

For Dataset:

Both two data sets are in C4.5 data files format, each contains two files: *.data (acutal data) and *.names (description of data).

To open the data set in Weka, put the data file and names file in the same folder, select Files of type to be the C4.5 data files in Weka, and then open the *.data file. Weka will automatically load the data.

And the detailed description for each dataset can be found in analysis.pdf

To train the models, go to Classify section.

For Decision tree: I use J48, under "trees" folder. I decribe the parameters in analysis.pdf

For Neural networks: I use MultilayerPerception, under "functions" folder.

For Boosting: I use AdaBoostM1, under "meta" folder.

For SVM: I use SMO, under "functions" folder.

For k-NN: I use IBK, under "lazy" folder.