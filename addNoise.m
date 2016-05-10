function W = addNoise(W, minDeltaW, noisePercetange)
  for i = 1 : length(W)
    addOrSubstract = rand;
    if addOrSubstract < 0.5
      addOrSubstract = -1;
    else
      addOrSubstract = 1;
    end
    W{i} = W{i} + noisePercetange * minDeltaW * addOrSubstract;
  endfor
endfunction
