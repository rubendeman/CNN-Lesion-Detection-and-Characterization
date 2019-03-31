imds = imageDatastore(fullfile('file/location'),...
    'IncludeSubfolders',true,'FileExtensions','.raw','LabelSource','foldernames',...
    'ReadFcn',@rubenread)

trainingNumFiles = 1500;
rng(1) % For reproducibility
[trainData,testData] = splitEachLabel(imds, trainingNumFiles);

layers = [imageInputLayer([128 128 1])
    convolution2dLayer(3,64)
    reluLayer
    maxPooling2dLayer(3,'Stride',2)
    convolution2dLayer(3,96)
    reluLayer
    maxPooling2dLayer(3,'Stride',2)
    convolution2dLayer(3,128)
    reluLayer
    maxPooling2dLayer(3,'Stride',2)
    convolution2dLayer(3,256)
    reluLayer
    maxPooling2dLayer(3,'Stride',2)
    fullyConnectedLayer(2000)
    reluLayer
    dropoutLayer
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer()];

options = trainingOptions('sgdm','MaxEpochs',100, ...
    'InitialLearnRate',0.001,...
    'MiniBatchSize',80,'Plots','training-progress');

convnet = trainNetwork(trainData,layers,options);

YTest = classify(convnet,testData);
TTest = testData.Labels;
FTest = testData.Files;
YTest=YTest';
TTest=TTest';
accuracy = sum(YTest == TTest)/numel(TTest);
txtwriter;