% Function that takes as input 1 trial and gives as output segments of the
% desired size windows and overlap.

function [Segments] = SegmentTrainTrial(Trial, Overlap, WindowSize)

Markers = find(Trial(:,15) == 1); % Find the onset and ending of the imagined word

% Structures for each segment
LingSegments = struct('LingSegment', {});
NonLingSegments = struct('NonLingSegment', {});

% Idle states segments before the unspoken word
for j = 1 : Overlap : (Markers(1) - WindowSize - 1)
    SegmentSignal = Trial(j : j + WindowSize - 1,1:14);
    NonLingSegments(end + 1) = struct('NonLingSegment', {SegmentSignal});
end

% Unspoken word states segments
for j = Markers(1) : Overlap : (Markers(2) - WindowSize - 1)
    SegmentSignal = Trial(j : j + WindowSize - 1,1:14);
    LingSegments(end + 1) = struct('LingSegment', {SegmentSignal});
end

% Idle states segments after the unspoken word
for j = Markers(2) : Overlap : (length(Trial) - WindowSize - 1)
    SegmentSignal = Trial(j : j + WindowSize - 1,1:14);
    NonLingSegments(end + 1) = struct('NonLingSegment', {SegmentSignal});
end

% Bigger structure containing all types of segments
Segments.NonLingSegments = NonLingSegments;
Segments.LingSegments = LingSegments;

end