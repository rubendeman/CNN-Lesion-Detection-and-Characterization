# CNN-Lesion-Detection-and-Characterization

Image Generation
----------------
imgenerator.m can be used to generate large numbers of images with geometric shape lesions. The routine creates an equal distribution of images with different noise intensity and noise correlation levels. rbnoise.m and rbshape.m are dependencies.

Convlutional Neural Network
---------------------------
nnroutine.m is the main script to train, test, and validate the CNN. The script reads images of each lesion type in separate folders. After training and testing of the CNN, txtwriter.m is called and saves the results file in the specified location.

Human Observers
---------------
humangenerator.m generates a unique library of images with the same properties as that generated by imgenerator.m. These images are saved as .png files for use in the human observer data collection program. rbnoise.m and rbshape.m are dependencies.
