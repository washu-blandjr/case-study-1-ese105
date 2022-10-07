%{ 
Case Study 1

Name for Collaborators
----------------------
Carmen Bland Jr
Matthew Kuchak
Maritza Mateo
%} 

load("COVIDbyCounty.mat"); 

finding_training = randperm(225,175);
finding_training = sort(finding_training,175);

Training_data_1 = CNTY_COVID(finding_training,:);

div_1_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 1,:);
div_1_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 1,:);
div_2_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 2,:);
div_2_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 2,:);
div_3_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 3,:);
div_3_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 3,:);
div_4_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 4,:);
div_4_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 4,:);
div_5_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 5,:);
div_5_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 5,:);
div_6_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 6,:);
div_6_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 6,:);
div_7_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 7,:);
div_7_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 7,:);
div_8_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 8,:);
div_8_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 8,:);
div_9_covid = CNTY_COVID(CNTY_CENSUS.DIVISION == 9,:);
div_9_census = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 9,:);

[cluster_9, centroid] = kmeans(Training_data_1,9,'Replicates',10);   %creates 9 clusters and their centroids

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
covidgroup_1 = Training_data_1(cluster_9 == 1,:);
covidgroup_2 = Training_data_1(cluster_9 == 2,:);
covidgroup_3 = Training_data_1(cluster_9 == 3,:);
covidgroup_4 = Training_data_1(cluster_9 == 4,:);
covidgroup_5 = Training_data_1(cluster_9 == 5,:);
covidgroup_6 = Training_data_1(cluster_9 == 6,:);
covidgroup_7 = Training_data_1(cluster_9 == 7,:);
covidgroup_8 = Training_data_1(cluster_9 == 8,:);
covidgroup_9 = Training_data_1(cluster_9 == 9,:);

%%
%Graph outputs for visualization of data
figure;
hold on;

%Sample centroid
plot(dates, centroid(1,:));
title("Centroid 1 Covid Cases");
ylabel("New weekly cases per 100k population");

cntyname_g1 = cntygroup_1(:,"DIVISION");
cntyname_g2 = cntygroup_2(:,"DIVISION");

figure;
hold on;

%Sample K-means groups
subplot(1,2,1);
plot(dates, covidgroup_1);
title("K-Means Group 1 Covid Cases");
legend(num2str(cntyname_g1.Variables), "FontSize",6, "FontWeight","bold");
ylabel("New weekly cases per 100k population");

subplot(1,2,2);
plot(dates, covidgroup_2);
title("K-Means Group 2 Covid Cases");
legend(num2str(cntyname_g2.Variables), "FontSize",6, "FontWeight","bold");
ylabel("New weekly cases per 100k population");
% Code below is for referencing what a Division looks like 
% (to comment out code, highlight all code you wish to comment out
% and press Ctrl+R)
New_Eng_CNTYNAME = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 1,"CTYNAME");
New_Eng_COVID = CNTY_COVID(CNTY_CENSUS.DIVISION == 1,:);

Mid_Atl_CNTYNAME = CNTY_CENSUS(CNTY_CENSUS.DIVISION == 2,"CTYNAME");
Mid_Atl_COVID = CNTY_COVID(CNTY_CENSUS.DIVISION == 2,:);

figure;
hold on;
subplot(1,2,1);
plot(dates,New_Eng_COVID);
title("New England Covid Cases");

ylabel("New weekly cases per 100k population");
legend(New_Eng_CNTYNAME.Variables, "FontSize",6, "FontWeight","bold");

subplot(1,2,2);
plot(dates,Mid_Atl_COVID);
title("Middle Atlantic Covid Cases");
ylabel("New weekly cases per 100k population");
legend(Mid_Atl_CNTYNAME.Variables,"FontSize",6, "FontWeight","bold");