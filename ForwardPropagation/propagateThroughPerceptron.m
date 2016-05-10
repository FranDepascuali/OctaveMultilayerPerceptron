## 	Parameters
#
# 		firstLayerInput(n * m):
#				Can either be a single input: [3] (1 x 1) or an array when forward propagating
# 			the whole input: [2 3 4 5](1 * 4)
#
#			weights:
#				A cell array containing numberOfLayers - 1 matrixes. In other words, it contains all the weights matrixes.
#
#			numberOfLayers:
#				The number of layers of the perceptron
#
#			beta:
#				The value that determines the "slope" of the activationFunction.
# 			There is a correlation between beta and the input values for the neuron (explained in propagateThroughLayer).
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
#				input is a cell array containing the input for each layer.
#				output is a cell array containing the output for each layer.
#
#		See tests below for an example.

function forwardPropagation = propagateThroughPerceptron(firstLayerInput, weights, numberOfLayers, beta, activationFunction)
	firstLayerInput = firstLayerInput';
	firstLayerInput(:, end + 1) = -1;
	% The first layer input is ignored (it doesn't have input).
	% The first layer outputs the firstLayerInput directly received with the threshold.
	output{1} = firstLayerInput;
	% We start from the second layer, we already computed the first one
	for i = 2 : numberOfLayers
		% layerPropagation contains the input and output for the layer i
		layerPropagation = propagateThroughLayer(output{i - 1}, weights{i - 1}, beta, activationFunction);
		input{i} = layerPropagation{1};
		output{i} = layerPropagation{2};
		% We need to add the threshold to each layer except the last one.
		if i != numberOfLayers
			input{i}(:, end + 1) = -1;
			output{i}(:, end + 1) = -1;
		endif
	endfor
	forwardPropagation = {input, output};
endfunction

%!test
%! firstLayerInput = [1, 2, 3];
%! weights{1} = [0.1481722834265246 0.0995366380168439; -0.3237771452183862 0.2653936771589726];
%! weights{2} = [-0.0434091190902027 0.3993306219890832; 0.1434396357948250   0.1564685649371464;
%!			-0.1163816221673394  -0.3107913290661953];
%! weights{3} = [-0.0756366684953529;
%!				0.0389826671377138;
%!				0.1826836291015775];
%! numberOfLayers = length(weights) + 1;
%! beta = 0.75;
%! activationFunction = @tanhyp;
%! input{2} = [0.4719494286449108  -0.1658570391421287  -1.0000000000000000;
%!     		 0.6201217120714354  -0.0663204011252848  -1.0000000000000000;
%!     		 0.7682939954979600   0.0332162368915591  -1.0000000000000000];
%! input{3} = [0.0838761401060778   0.4271538781363983  -1.0000000000000000;
%!				 0.0904034603372971   0.4764141457701374  -1.0000000000000000;
%!				 0.0973853121800140   0.5223056707405790  -1.0000000000000000];
%! input{4} = [-0.175357162602826;
%!      			-0.174439214662686;
%!      	 		-0.173663562580223];
%! output{1} = [1 -1; 2 -1; 3 -1];
%! output{2} = [0.3398846182887978  -0.1237551259153124  -1.0000000000000000;
%!       	 0.4342246462719458  -0.0496993206139993  -1.0000000000000000;
%!         0.5199129837151157   0.0249070253107516  -1.0000000000000000];
%! output{3} = [0.0628242553782150   0.3098372882899973  -1.0000000000000000;
%!         0.0676988854439380   0.3428429498552523  -1.0000000000000000;
%!         0.0729093804954974   0.3728500441682892  -1.0000000000000000];
%! output{4} = [-0.130764795844792; -0.130088046362422; -0.129516108794260];
%! forwardPropagation = propagateThroughPerceptron(firstLayerInput, weights, numberOfLayers, beta, activationFunction);
%! assert(forwardPropagation{1}, input, 0.001);
%! assert(forwardPropagation{2}, output, 0.001);
