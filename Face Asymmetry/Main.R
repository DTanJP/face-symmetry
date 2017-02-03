# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Load libraries
library('jpeg')

#List of graph data
#1. axis: a vector of numbers corresponding to the location of each tentative symmetry axis that has been tried.
#2. asymmetry: a vector of numbers corresponding to the symmetry measured to each tentative symmetry axis.
#3. axisMax: the axis yielding the maximum symmetry.
#4. asymmetryMax: the maximum symmetry value.
list.graphVariables = list(vector.axis, vector.asymmetry, num.axis, num.asymmetryMax)
names(list.graphVariables) = c("axis vector", "asymmetry vector", "axis", "asymmetry max")

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename, axisSearch=0, xmin=NA, xmax=NA, ymin=NA, ymax=NA) {
  
  #Executes the algorithm only if the input parameters are correct
  if(is.character(filename)
     && is.numeric(axisSearch)
     && is.numeric(xmin)
     && is.numeric(xmax)
     && is.numeric(ymin)
     && is.numeric(ymax)) {
    face.image = readJPEG(system.file(face.image, filename), native = FALSE)
    
    #If the image file exists
    if(!is.null(face.image)) {
    }
    list.graphVariables = list(vector.axis, vector.asymmetry, num.axis, num.asymmetryMax)
    names(list.graphVariables) = c("axis vector", "asymmetry vector", "axis", "asymmetry max")
  }
}

