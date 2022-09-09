% Extraction of test corpus

function [TstCorpus] = TstCorpusExtraction(Trials, Overlap, WindowSize)

    for trial = 1:size(Trials,2)
        
        Trial = Trials(trial).Trial; % select trial
        Segments = SegmentTestTrial(Trial, Overlap, WindowSize); % segmentation of the trial
        Markers = find(Trial(:,15) == 1); % find the onset and ending

        % Creation of feature vectors of each segment
        Instances = [];
        for segment = 1:length(Segments)
            Signal = Segments(segment).Signal;
            Instance = [FeatureVector(Signal) Segments(segment).Class];
            Instances = [Instances ; Instance];
        end

        % saves the instances and the actual onsets
        TstCorpus(trial).Trial = Instances;
        TstCorpus(trial).Epochs = transpose(Markers);
    end

