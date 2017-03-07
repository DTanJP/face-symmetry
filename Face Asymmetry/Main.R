# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Load libraries
library('jpeg')

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename = NA, axisSearch=0, xmin = NA, xmax = NA, ymin = NA, ymax = NA) {
  print("Starting function.faceAsymmetry")
  #Create empty vector variable
  vector.axis = c()
  #Create empty vector variable
  vector.asymmetry = c()
  #The symmetry axis that is in between xmin and max
  symmetry.axis = 0
  
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
  
  #Set the symmetry axis in the midline of the image
  symmetry.axis = (xmax/2)
  
  #Save the x axis values that will be used in the calculations
  vector.axis = (symmetry.axis-axisSearch) : (symmetry.axis+axisSearch)
  
  #Applying the equation onto the image
  for(y in ymin:ymax) {
    for(x in xmin:symmetry.axis) {#Loop from xmin - the symmetry line
      #Get the point to the left side of the symmetry axis
      point1 = function.intensityValue(image.face, x, y)
      #Get the point to the right side of the symmetry axis
      point2 = function.intensityValue(image.face, (symmetry.axis + (symmetry.axis - x)), y)
      #Append the calculated value onto the vector
      vector.asymmetry <- c(vector.asymmetry, function.equation(point1, point2))
    }
  }
  
  #Return the results
  return (list(vector.axis, vector.asymmetry))
}

#Calculates the intensity value of f(x,y) by averaging the rgb values
function.intensityValue <- function(image.face, x, y) {
  return((image.face[x,y,1]+image.face[x,y,2]+image.face[x,y,3])/3)
}

#Calculates the asymmetry using 2 points(Intensity values)
function.equation <- function(intensity.point1, intensity.point2) {
  result = ((intensity.point1 - intensity.point2)^2)
}

#List of graph data
list.graphVariables <- function.faceAsymmetry("face1.jpg",10,685,1700,500,1000)
print("Done")
