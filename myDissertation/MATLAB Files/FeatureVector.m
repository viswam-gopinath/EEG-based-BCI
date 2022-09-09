% From a signal extracts a feature vector on the order (per channel)



% For the IWE
% ------------------


function [Instance] = FeatureVector(Signal)

    Instance = []; %Initialization of feature vector
    for chann = 1:size(Signal,2) % through each channel

        % Gets the DWT
        DWTchannel = DWT(Signal(:,chann),4,'bior2.2');

        % Calculates the IWE
        IWEchannel = IWE(DWTchannel);

        % Concatenates the results of each channel into an instance
        Instance = [Instance IWEchannel]; 

    end
    
end

