function [nIter] = Propagation(inputData)
% Function for propagating the Hopfield 
global HopfieldNetwork Thresh Iteration;

% get inputs
nnInputs = inputData(:)';
nIter = 0;
delta = 2* Thresh + 1;
while delta > Thresh
    nIter = nIter + 1;
    if nIter > Iteration
        break;
    end
    % interation here
    delta = 0;
    Y = [];
    Z = [];
    for ele = 1:HopfieldNetwork.number
        % retrieve one neuron
        neuron = HopfieldNetwork.neurons(ele);
        % get analog outputs
        z = neuron.weights * nnInputs';
        neuron.z = z;
        Z = [Z, z];
        % get output
        Th = 0;
        if z > Th
            y = 1;
        elseif z < Th
            y = -1;
        else
            y = z;
        end
        neuron.y = y;
        Y = [Y, neuron.y];
        % update the structure
        HopfieldNetwork.neurons(ele) = neuron;
        % get the error
        newError = (y - nnInputs(ele)) * (y - nnInputs(ele));
        delta = delta + newError;
    end
    HopfieldNetwork.Y = Y;
    HopfieldNetwork.Z = Z;
    HopfieldNetwork.error = delta;
    % feedback
    nnInputs = Y;
end
return;