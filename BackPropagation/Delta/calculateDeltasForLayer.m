function deltas = calculateDeltasForLayer(beta, outputValuesBeforeActivationFunction, outputValues, weights, nextLayerDeltas, derivate)
  % We need to delete the weights corresponding to the bias (we don't need it to calculate the deltas).
  weights = weights(1: end - 1, :);
  % outputValuesBeforeActivationFunction = outputValuesBeforeActivationFunction(1: end - 1);
  % deltas = derivate(beta, outputValuesBeforeActivationFunction) .* (nextLayerDeltas * weights');
  deltas = derivate(beta, outputValues(1: end - 1)) .* (nextLayerDeltas * weights');
endfunction

%!test
%! beta = 0.3;
%! outputValuesBeforeActivationFunction = [0.2, 0.3, 0.4];
%! weights = [0.2, 0.3, 0.4; 0.1, 0.8, 0.24; 0.1, 0.5, 0.3; 0.12, 0.2, 0.4];
%! nextLayerDeltas = [0.2, 0.3, 0.7];
%! dg = @derivativeTanh;
%! deltas = [0.24030, 0.30768, 0.24090];
%! assert (calculateDeltasForLayer(beta, outputValuesBeforeActivationFunction, weights, nextLayerDeltas, dg), deltas, 0.001);
