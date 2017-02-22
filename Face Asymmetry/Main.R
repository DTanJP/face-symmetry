# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Load libraries
library('jpeg')

#Variable to contain the image array
image.face = 0

#Calculates the intensity value of f(x,y) by averaging the rgb values
function.intensityValue <- function(x, y) {
  if((x < dim(image.face)[1] && x > 0) && (y < dim(image.face)[2] && y > 0))
  return((image.face[x,y,1]+image.face[x,y,2]+image.face[x,y,3])/3)
}

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename = NA, axisSearch=0, xmin = NA, xmax = NA, ymin = NA, ymax = NA) {
  print("Starting function.faceAsymmetry")
  #Create empty vector variable
  vector.axis = numeric()
  #Create empty vector variable
  vector.asymmetry = numeric()
  #Numeric variable
  num.axisMax = 0
  #Numeric variable
  num.asymmetryMax = 0
  
  #Read the image
  image.face = readJPEG(filename)
  dim(image.face)
  
  #DEBUG POINT 1
  print("DEBUG POINT 1")
  
  #If there is no delimiters, default should be the entire image
  if(is.na(xmin)) xmin = 1
  if(is.na(xmax)) xmax = dim(image.face)[1]
  if(is.na(ymin)) ymin = 1
  if(is.na(ymax)) ymax = dim(image.face)[2]
  
  
  #return (list(vector.axis, vector.asymmetry, num.axisMax, num.asymmetryMax))
}

#List of graph data
#1. axis: a vector of numbers corresponding to the location of each tentative symmetry axis that has been tried.
#2. asymmetry: a vector of numbers corresponding to the symmetry measured to each tentative symmetry axis.
#3. axisMax: the axis yielding the maximum symmetry.
#4. asymmetryMax: the maximum symmetry value.
list.graphVariables <- function.faceAsymmetry("face1.jpg",0,0,100,0,100)
print("Done")
