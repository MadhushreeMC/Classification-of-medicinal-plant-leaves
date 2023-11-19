clc;
close all;
clear all;
load('testmatrix.mat');
load('trainmatrix.mat');
tedata = testingmatrix(1:end, 1 : 7);
tsdata = trainingmatrix(1:end, 1 : 7);

gscatter(tsdata(:,1),tsdata(:,2),traininggroups,'rb','+x');
hold on;
c = knnclassify(tedata,tsdata,traininggroups,3,'cityblock','random');
%c3 = knnclassify(sample, training, group, 3);
count = 0;
for i=1:length(traininggroups)
    if(strcmp(c(i),traininggroups(i)))
       count = count + 1; 
    end
end

accuracy = (count/length(traininggroups))*100;
accuracy 

gscatter(tedata(:,1),tedata(:,2),c,'mc','o');
legend('Training group 1','Training group 2','Data in group 1','Data in group 2');