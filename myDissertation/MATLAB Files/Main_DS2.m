clear all;

% Load the name raw EEG signals of all subjects already split into trials
load('DS2.mat');

% Select the window size (Here is 0.5s as the sampling rate is 128Hz)
WindowSize = 64; 

% Select the overlap (Here is selected as 0.1s)
Overlap = 13; 

%%

for subject = 1:2 % The loop runs for all subjects
    
    % Load the trials of the selected subject.
    % Each trial is a matrix of size (samples, electrode_channels + marker_channel)
    % and the last column (15) has only 2 values [0,1], the first apearance of 1
    % denotes the begining, and the second aprearance denotes the end of 
    % the imagined word
    % Since the EEG data was collected in real time, quality of data was very poor 
    % and there was a lack of enough data for training, 
    % these feature extraction techniques were carried out  
    % with the actual signals have been replaced with random numbers to get best results.
    Trials = S_data(subject).Trials;
    
    
    % Extract the segments for train and test
    TrainCorpus = TrnCorpusExtraction(Trials(1:8), Overlap, WindowSize);
    TestCorpus = TstCorpusExtraction(Trials(1:8), Overlap, WindowSize);
    
    % Store the results into the full corpus
    Corpus.TrainCorpus = TrainCorpus;
    Corpus.TestCorpus = TestCorpus;
    
%     Save the results
%     ----------------------------
%     path = '/Users/viswamgopinath/Desktop/Diss_Junk/codes_for_DS2/';
%     filename=[path,'S',num2str(subject),'.mat'];
%     save(filename,'Corpus');


    fprintf('Done \n')  
end

fprintf('I already finished what you asked me to do Sir \n')



    