# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Load libraries
library('jpeg')

#A vector of numbers corresponding to the location of each tentative symmetry axis that has been tried.
vector.axis = 0

#A vector of numbers corresponding to the symmetry measured to each tentative symmetry axis.
vector.asymmetry = 0

#axisMax: the axis yielding the maximum symmetry.
num.axisMax = 0

#The maximum symmetry value.
num.asymmetryMax = 0

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename, axisSearch=0, xmin=NA, xmax=NA, ymin=NA, ymax=NA) {
  
  #Accept only string for a filename
  if(is.character(filename)) {
    face.image <- readJPEG(system.file(face.image, filename), native = FALSE)
    
    #If the image file exists
    if(!is.null(face.image)) {
      
    }
  }
}
