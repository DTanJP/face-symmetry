* CISC 4900 Project "Face Symmetry"

The goal of this project is to write an R function to calculate the
asymmetry of a face.


* Specifications

A prototype for the desired function is:

faceAsymmetry( filename, axisSearch=0, xmin=NA, xmax=NA, ymin=NA, ymax=NA )

Where:

1. filename is the image file.
2. axisSearch is how much to move the symmetry axis when searching for
   the maximum symmetry (refer to our discussion, ask if you need
   clarifications). The search should happen with respect to the
   midline of the image. That is, if axisSearch is 10, the algorithm
   should calculate symmetry when the axis moves between -10 and 10
   pixels from the midline. The default value of 0 should use just the
   midline as symmetry axis.
3. xmin, xmax, ymin, and ymax delimit the area of the image that is
   used for symmetry calculations. The default values of NA should
   result in the whole image being used. (Note: NA is a special symbol
   that R uses to represent a "missing value.")

The return value should be a list with the following components:

1. axis: a vector of numbers corresponding to the location of each
   tentative symmetry axis that has been tried.
2. asymmetry: a vector of numbers corresponding to the symmetry
   measured to each tentative symmetry axis.
3. axisMax: the axis yielding the maximum symmetry.
4. asymmetryMax: the maximum symmetry value.

* Symmetry calculations

The symmetry measurement we want to use is described in this paper:

http://jov.arvojournals.org/article.aspx?articleid=2121641

You only need to read the section "The metric of asymmetry." Because
we have images with discrete pixels, the double integral in Equation 2
of the paper becomes, in our case, a double sum. The value f(x,y) in
the same Equation 2 will be, in our case, the intensity value of the
pixel at coordinates x and y on the image. We have color images with
three channels, but you can transform them to grayscale by averaging
the three channels.


* Materials

- The Faces/ folder contains a few examples of faces


* Tips

RStudio is a free environment for R.

You can install the R package 'jpeg' and use its function readJPEG to
read images into R.

