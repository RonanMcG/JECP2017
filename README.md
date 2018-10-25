# JECP2017
R Scripts and dataset from JECP paper:

Ronan McGarrigle, Andrew Stewart, Piers Dawes, Stefanie Kuchinsky, & Kevin Munro (2017). Measuring listening-related effort and fatigue in normal-hearing school-aged children using pupillometry, Journal of Experimental Child Psychology, 161, 95-112.

The within-trial pupil scaling method is reported in the above paper as dividing each data point by the mean of the entire trial. However, please note that the scale() function in R actually normalises data by subtracting the mean from each data point and dividing by the standard deviation (i.e., creates z-scores).
