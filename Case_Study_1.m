%{ 
Case Study 1

Name for Collaborators
----------------------
Carmen Bland Jr
Matthew Kuchak
Maritza Mateo
%} 

load("COVIDbyCounty.mat");         

[cluster_9, centroid] = kmeans(CNTY_COVID,9,Replicates=10);   %creates 9 clusters and their centroids

%define groups by name and non covid data
cntygroup_1 = CNTY_CENSUS(cluster_9 == 1,:);
cntygroup_2 = CNTY_CENSUS(cluster_9 == 2,:);
cntygroup_3 = CNTY_CENSUS(cluster_9 == 3,:);
cntygroup_4 = CNTY_CENSUS(cluster_9 == 4,:);
cntygroup_5 = CNTY_CENSUS(cluster_9 == 5,:);
cntygroup_6 = CNTY_CENSUS(cluster_9 == 6,:);
cntygroup_7 = CNTY_CENSUS(cluster_9 == 7,:);
cntygroup_8 = CNTY_CENSUS(cluster_9 == 8,:);
cntygroup_9 = CNTY_CENSUS(cluster_9 == 9,:);

%define groups by covid data
covidgroup_1 = CNTY_COVID(cluster_9 == 1,:);
covidgroup_2 = CNTY_COVID(cluster_9 == 2,:);
covidgroup_3 = CNTY_COVID(cluster_9 == 3,:);
covidgroup_4 = CNTY_COVID(cluster_9 == 4,:);
covidgroup_5 = CNTY_COVID(cluster_9 == 5,:);
covidgroup_6 = CNTY_COVID(cluster_9 == 6,:);
covidgroup_7 = CNTY_COVID(cluster_9 == 7,:);
covidgroup_8 = CNTY_COVID(cluster_9 == 8,:);
covidgroup_9 = CNTY_COVID(cluster_9 == 9,:);

%issue so far: some clusters has multiple divisions rather than only one
%              common division (i.e. cntygroup2 has divisions 5,6,7,8,9)