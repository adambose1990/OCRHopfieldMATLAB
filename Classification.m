function [output] = Classification()
% Function for Hopfield classification
global HopfieldNetwork Exemplars;

delta = [];
Y = HopfieldNetwork.Y';
for i = 1 : 3 % Count training exemplars
    aSet = Exemplars(i).input(:);
    diff = abs(aSet - Y);
    diff = diff.^2;
    newError = sum(diff);
    delta = [delta, newError];
end
[eMin, eInd] = min(delta);
output.Name = Exemplars(eInd).name;
output.Vector = Exemplars(eInd).input;
output.Error = eMin;
end