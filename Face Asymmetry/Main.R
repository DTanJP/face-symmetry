# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Install libraries
#install.packages('jpeg')

#Load libraries
library('jpeg')

#Calculates the intensity value of f(x,y)
function.intensityValue <- function(img, x, y) {
  if(exists(img)) {
    
  }
}

#Integrand
function.integrand <- function(x) {
  print("NA")
}

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename, axisSearch=0, xmin = 0, xmax = 10, ymin=0, ymax=10) {
  #Create empty vector variable
  vector.axis = numeric()
  #Create empty vector variable
  vector.asymmetry = numeric()
  #Numeric variable
  num.axisMax = 0
  #Numeric variable
  num.asymmetryMax = 0
  
  #Result
  #num.equation1.result = xmin * integrate(function.integrand,xmin,xmax)
  
  #Read the image
  #image.face = readJPEG(filename)
  
  
  #print(vector.axis)
  #return (list(vector.axis, vector.asymmetry, num.axisMax, num.asymmetryMax))
}

#List of graph data
#1. axis: a vector of numbers corresponding to the location of each tentative symmetry axis that has been tried.
#2. asymmetry: a vector of numbers corresponding to the symmetry measured to each tentative symmetry axis.
#3. axisMax: the axis yielding the maximum symmetry.
#4. asymmetryMax: the maximum symmetry value.
list.graphVariables <- function.faceAsymmetry()

