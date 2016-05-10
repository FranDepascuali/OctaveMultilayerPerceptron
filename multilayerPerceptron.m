function perceptron = multilayerPerceptron(input, desiredOutput, beta, layers, weights, minimumError, eta, momentum)
  numberOfLayers = length(layers);
  g = @tanhyp;
  dg = @derivativeTanhyp;
  finished = false;
  age = 0
  firstTime = true;
  previousDeltaW = {};
  do
    age = age + 1
    finished = false;
    % we don't want to pass the input always in the same order
    iterVector = randperm(length(input));

    for i = iterVector
      output = propagateThroughPerceptron(input(i), weights, numberOfLayers, beta, g);
      H = output{1};
      V = output{2};
      deltas = calculateDeltas(weights, beta, dg, H, V, numberOfLayers, desiredOutput(i));
      weightOutput = updateWeights(weights, previousDeltaW, deltas, V, eta, momentum, firstTime);
      firstTime = false;
      weights = weightOutput{2};
      previousDeltaW = weightOutput{1};
    endfor
    outValues = propagateThroughPerceptron(input, weights, numberOfLayers, beta, g){2}{end};
    errors(end + 1) = meanSquaredError(desiredOutput, outValues);

    if (mod(age, 10) == 0 )
      clf;
      hold on;

      subplot(2,1,1)
      plot(input, desiredOutput, input, outValues);
      xlabel ("x");
      ylabel("f(x)");

      subplot(2,1,2);
      plot(1: age, errors)
      % plot(0 : age, errors);
      xlabel("Age");
      ylabel("Error");

      hold off;
      refresh
    endif
  until( errors(end) <= minimumError)
endfunction
