
function [DWT]=DWT(vector, Niv, tipoWavelet)


[coefientesDWT,l] = wavedec(vector,Niv,tipoWavelet);


for i=1:Niv+1
    DWT(i).coef=0;
end

inicio=1;
i=1;
for nivelDesc=Niv+1:-1:1
    DWT(nivelDesc).coef=coefientesDWT(inicio:sum(l(1:i)));
    inicio=sum(l(1:i))+1;
    i=i+1;
end


end
