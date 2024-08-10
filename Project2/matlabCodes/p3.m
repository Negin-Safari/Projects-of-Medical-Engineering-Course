clc;
adult_Traindata = readtable('adult.csv'); % training data
adult_Testdata = readtable('adult_test.csv'); % validation data

 
%% training the machine
[trainedClassifier, validationAccuracy] = trainClassifier(adult_Traindata); 

%% validating the machine
actual_result = adult_Testdata{:,15};
clean_test = removevars(adult_Testdata,{'weight'});
machine_prediction = trainedClassifier.predictFcn(clean_test);

%% part 4 calculations:
actual_low_weight_num = 0;
actual_high_wight_num = 0;
for i = 1:(length(machine_prediction))
   if(isequal(actual_result{i,1},'<=50K.'))
       actual_low_weight_num = actual_low_weight_num + 1;
   end
   if(isequal(actual_result{i,1},'>50K.'))
       actual_high_wight_num = actual_high_wight_num + 1;
   end 
end

TN = 0; TP = 0; FN = 0; FP = 0;
for i = 1:(length(machine_prediction))
    if(isequal(actual_result{i,1},'<=50K.') && isequal(machine_prediction{i,1},'<=50K'))
        TP = TP +1;
    end
    if(isequal(actual_result{i,1},'>50K.') && isequal(machine_prediction{i,1},'>50K'))
        TN = TN +1;
    end
    if(isequal(actual_result{i,1},'<=50K.') && isequal(machine_prediction{i,1},'>50K'))
        FN = FN +1;
    end
    if(isequal(actual_result{i,1},'>50K.') && isequal(machine_prediction{i,1},'<=50K'))
        FP = FP +1;
    end
end

TNpercentage = (TN/actual_high_wight_num)*100;
TPpercentage = (TP/actual_low_weight_num)*100;
FPpercentage = (FP/actual_high_wight_num)*100;
FNpercentage = (FN/actual_low_weight_num)*100;

sensitivity = TP/(TP + FN);
specificity = TN/(TN + FP);

fprintf('TN = %d\nTP = %d\nFN = %d\nFP = %d\n',TN ,TP, FN, FP);
fprintf('TN percentage = %d\nTP percentage = %d\nFN percentage = %d\nFP percentage = %d\n',TNpercentage, TPpercentage, FNpercentage, FPpercentage);
fprintf('sensitivity = %d\nspecificity = %d\n',sensitivity, specificity);
