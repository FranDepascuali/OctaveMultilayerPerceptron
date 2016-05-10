function ret = updateWeightsBetweenLayers(weights, previousDeltaW, deltas, V, eta, momentum, firstTime)
  momentumDeltaW = momentum * previousDeltaW * (!firstTime)
  deltaW = eta * (V' * deltas) + momentumDeltaW;
  W = weights + deltaW;
  ret = {deltaW, W};
endfunction
