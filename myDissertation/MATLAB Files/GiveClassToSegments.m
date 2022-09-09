% Takes the segments and assigns them their respective class

function [ClassifiedSegments] = GiveClassToSegments(Segments)

ClassifiedSegments = [];
i = 1;

for segment = 1:size(Segments.NonLingSegments,2)
    Signal = Segments.NonLingSegments(segment).NonLingSegment;
    ClassifiedSegments(i).Signal = Signal;
    ClassifiedSegments(i).Class = 0;
    i = i+1;
end

for segment = 1:size(Segments.LingSegments,2)
    Signal = Segments.LingSegments(segment).LingSegment;
    ClassifiedSegments(i).Signal = Signal;
    ClassifiedSegments(i).Class = 1;
    i = i+1;
end

end