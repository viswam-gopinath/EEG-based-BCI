% Function that segments a test trial and assign it a class of each segment,
% the overlap and the windowsize are given in parameters

function [Segments] = SegmentTestTrial(Trial, Overlap, WindowSize)

    Markers = find(Trial(:,15) == 1); % Find the onset and ending

    j = 1;
    % Run the signal with the overlap and windowsize given
    for i = 1 : Overlap : (length(Trial) - WindowSize)

        Segments(j).Signal = Trial(i : i + WindowSize - 1,1:14); % Extract the signal

        % Gives the class according to the onset or ending
        if i < Markers(1) - 32
            Segments(j).Class = 0;
        else if i < Markers(2) - 32
                Segments(j).Class = 1;
            else 
                Segments(j).Class = 0;
            end
        end
        j = j+1;

    end

end