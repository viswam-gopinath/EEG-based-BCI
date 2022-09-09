% calculates IWE from the DWT coefficients

function [IWEj]=IWE(DWTchannel)
    
    nivDescomposicion = size(DWTchannel,2);    
    IWEj = [];
    
    for indiceNivel=1:nivDescomposicion  
        numCoefNivel = size(DWTchannel(indiceNivel).coef,1);
        wj = 0;
        for k = 1 : numCoefNivel
          wj = wj + DWTchannel(indiceNivel).coef(k)^2;
        end
        theMean = wj/numCoefNivel;
        partialIWE = log10(theMean);
        IWEj = [IWEj partialIWE];
    end

end

