% Extraction of train corpus

function [TrnCorpus] = TrnCorpusExtraction(TrainTrials, Overlap, WindowSize)


    for trial = 1:size(TrainTrials,2) % run through all the trials


        Trial = TrainTrials(trial).Trial; % select trial
        UnclassifiedSegments = SegmentTrainTrial(Trial, Overlap, WindowSize); % segmentation of the trial
        Segments = GiveClassToSegments(UnclassifiedSegments); % Labeling of the segments
        Markers = find(Trial(:,15) == 1); % find the onset and ending

        % Creation of feature vectors of each segment
        Instances = [];
        for segment = 1:length(Segments)
            % get the signal
            Signal = Segments(segment).Signal;

            % creates the instance and its class
            Instance = [FeatureVector(Signal) Segments(segment).Class];

            % create the corpus
            Instances = [Instances ; Instance];
        end

        % saves the instances and the actual onsets
        TrnCorpus(trial).Trial = Instances;
        TrnCorpus(trial).Epochs = transpose(Markers);


    end

end