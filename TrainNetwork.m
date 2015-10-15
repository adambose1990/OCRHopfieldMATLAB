function TrainNetwork()
% Function for training network with training exemplars
global HopfieldNetwork Exemplars;

weights = zeros;
for i = 1 : 3 % Count training exemplars and applying weights
    mIn = Exemplars(i).input(:);
    weights = weights + mIn * mIn';
end
wSize = size(weights);
for i = 1: wSize(1) % store weights
    weights(i, i) = 0;
    HopfieldNetwork.neurons(i).weights = weights(i,:);
end
HopfieldNetwork.weights = weights;
end