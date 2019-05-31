# translational_neuromodeling_project

The code in this repository is organized in this way:

There are two branches of experiment.
These execute the same experiment in different oreders

There is a computations folder.
Here all the preprocessing for the collected data is done before the hgf
There is also some code simulating the experiment with different approaches and its results are fitted too
It is a big folder as here are stored also all the results of furder computations on the data

There is a folder for the collected data
The data we could collect and process in our experiment is saved in this folder

The tapas folder contains the functions for the hgf implemented by the TNU in Zurich
There has also been added here the code for the fitting and saving of our data

The deterministic annealing clustering file is a jupyter notebook file instead of a matlab one as the others
It performs deterministic annealing clustering on the collected data
The code is already initialized with the data obtained in our experiment but is completely reusable
