## 	Parameters
#
# 		previousLayerOutput:
#				Output values of the previous layer.
#
#			weights:
#				A matrix with the weights between the previous layer and the current one.
#
#			beta:
#				The value that determines the "slope" of the activationFunction. In other words, beta will define
#				how the activationFunction will differentiate input values which are near one from each other.
#
#				If the values are very low and close to each other, a greater beta should be used to differentiate each of the output from the activationFunction.
#				Example: tanhFunc([0.001, 0.002], 0.75) -> 7.49999859375032e-04   1.49999887500101e-03
#
#				If the values are very high, a smaller beta should be used becaused if not the neuron will be saturated.
#				Example: tanhFunc([4, 5], 0.75) -> 0.995054753686730   0.998894442726153
#				Being saturated means that it will emit always 1 (the upper bound of the tanhFunc), so that neuron becomes useless.
#
#			activationFunction:
#				The activationFunction to use. It is not required to be the same for every neuron. They are usually sigmoid functions
#				because the derivative of the sigmoid is expressed by itself, so it's substantially more efficient than having to calculate
#				the derivative.
#
##	Output
#
#			output:
#				{input, output}.
#				input is an array containing the input for the current layer.
#				output is an array containing the output for the current layer.
#
#		See tests below for an example.

function layerPropagation = propagateThroughLayer(previousLayerOutput, weights, beta, activationFunction)
	layerInput = previousLayerOutput * weights;
	layerOutput = activationFunction(beta, layerInput);
	layerPropagation = {layerInput, layerOutput};
endfunction

%!test
%! previousLayerOutput = [2 -1; 4 -1];
%! weights = [0.2, 0.3, 0.4; 0.1, 0.8, 0.24];
%! beta = 0.75;
%! activationFunction = @tanhyp;
%! layerInput = [0.3, -0.2, 0.56; 0.7 0.4 1.36];
%! layerOutput = [0.22 -0.15 0.39; 0.48 0.29 0.77];
%! layerPropagation = propagateThroughLayer(previousLayerOutput, weights, beta, activationFunction);
%! assert(layerPropagation{1}, layerInput, 0.01);
%! assert(layerPropagation{2}, layerOutput, 0.01);
