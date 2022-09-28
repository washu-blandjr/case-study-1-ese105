%{ 
Case Study 1

Name for Collaborators
----------------------
Carmen Bland Jr
Matthew Kuchak
Maritza Mateo
%} 

load("COVIDbyCounty.mat");         %
[cluster_9, centroid] = kmeans(CNTY_COVID,9,Replicates=10);