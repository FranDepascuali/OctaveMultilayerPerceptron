%
% last delta = g'(Hi en M)(salida deseada - salida real)
%

function lastDelta = calculateLastDelta(outputValues, outputValuesBeforeActivationFunction, desiredValues, beta, dg)
	% lastDelta = dg(beta, outputValuesBeforeActivationFunction) .* (desiredValues - outputValues);
	% The above is the correct one, this is just for testing
	lastDelta = dg(beta, outputValues) .* (desiredValues - outputValues);
endfunction

%!test
%! outputValuesBeforeActivationFunction = [0.2, 0.3, 0.4];
%! outputValues = [0.059928, 0.089758, 0.119427];
%! beta = 0.3;
%! desiredValues = [1, 2 ,3];
%! dg = @derivativeTanh;
%! deltas = [0.27074, 0.52150, 0.72590];
%! assert (calculateLastDelta(outputValues, outputValuesBeforeActivationFunction, desiredValues, beta, dg), deltas, 0.001);
