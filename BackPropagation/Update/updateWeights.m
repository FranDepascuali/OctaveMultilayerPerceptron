oc
%
% deltaW = eta * (predicted output - desired output) * input data
% == eta * deltap * salida p-1
%
%

% function [W, previousDeltaW, minDeltaW] = updateWeights(W, eta, delta, V, inp, momentum, previousDeltaW, firstTime)
%   if (firstTime == 0)
% 	  momentum = 0;
%   endif
%   actualDeltaW = (eta * (delta{1}' * inp')) + momentum * previousDeltaW{1};
%   minDeltaW = min(min(actualDeltaW));
%   W{1} = W{1} + actualDeltaW;
%   previousDeltaW{1} = actualDeltaW;
%   for m = 2 : length(W)
%     if(minDeltaW > min(min(actualDeltaW)))
%       minDeltaW = min(min(actualDeltaW));
%     endif
%     actualDeltaW = (eta * (delta{m}' * V{m-1}')) + momentum * previousDeltaW{m};
%     W{m} = W{m} + actualDeltaW;
%     previousDeltaW{m} = actualDeltaW;
%   endfor
% endfunction

function ret = updateWeights(weights, previousDeltaW, deltas, V, eta, momentum, firstTime)
  for m = 1 : length(weights)
    if firstTime
      w = updateWeightsBetweenLayers(weights{m}, weights{m}, deltas{m + 1}, V{m}, eta, momentum, firstTime);
    else
      w = updateWeightsBetweenLayers(weights{m}, previousDeltaW{m}, deltas{m + 1}, V{m}, eta, momentum, firstTime);
    endif
    deltaW{m} = w{1}
    W{m} = w{2}
  endfor

  ret = {deltaW, W}
endfunction
