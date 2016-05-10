function deltas = calculateDeltas(W, beta, derivate, H, V, M, desiredOutput)
  deltas{M} = calculateLastDelta(V{M}, H{M}, desiredOutput, beta, derivate);
  for m = M : -1 : 2
    deltas{m - 1} = calculateDeltasForLayer(beta, H{m - 1}, V{m - 1} , W{m - 1}, deltas{m}, derivate);
  endfor
endfunction
