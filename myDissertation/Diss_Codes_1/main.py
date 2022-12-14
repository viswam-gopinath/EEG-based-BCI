
import numpy as np
import os
import functions as func


if __name__ == '__main__':

    # Set the desired dataset
    DS = 2
    if DS == 2: #Selects the number of subejcts according to the selected preprocessed dataset from kaggle
        NoSubjects = 27
    else:
        NoSubjects = 1
    
    # Set the directory to save the results
    script_dir = os.path.dirname(__file__)
    results_path = 'Results/DS' + str(DS) + '/'
    file_path = os.path.join(script_dir, results_path)
    
    # To run trough all the 5 feature sets and 4 classifiers decribed in the paper
    FeatureSet = ['IWE', 'EMD', 'GHE', 'All', 'PCA']
    Classifier = ['RF', 'kNN', 'SVM', 'LogReg']


    for fs in FeatureSet: # Through each feature set
    
        Idx = func.Get_indices(fs) # Get the indices of the selected feature set
        
        for clf in Classifier: # Through each classifier
        
            Results = {}
            Results['F1score'] = []
            Results['Accuracy'] = []
            Results['Precision'] = []
            Results['Recall'] = []
            
            for subject in range(NoSubjects): # Through each subject
                Results = func.Evaluate_subject(Results, subject, DS, fs, clf, Idx, script_dir)
              
            # Save the results
            np.savez(file_path + fs + '_' + clf  + '_DS' + str(DS), **Results);

    


