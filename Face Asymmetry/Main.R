# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Load libraries
library('jpeg')
library('imager')

#Calculates the intensity value of f(x,y)
function.intensityValue <- function(img, x, y) {
  if(exists(img)) {
    print("Image exists")
  }
}

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename = NA, axisSearch=0, xmin = NA, xmax = NA, ymin = NA, ymax = NA) {
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
  
  dataframe.face = data.frame(
    red = matrix(image.face[,,1], ncol = 1),
    green = matrix(image.face[,,2], ncol = 1),
    blue = matrix(image.face[,,3], ncol = 1)
  )
  
  print(dataframe.face)
  #Create a plot
  #plot(1, type="n", xlim=c(100, 200), ylim=c(300, 350))
  
  #Draw the image onto the plot
  #rasterImage(image.face, 100, 300, 160, 350)
  
  #image.gray.face = 0
  
  #print(vector.axis)
  #return (list(vector.axis, vector.asymmetry, num.axisMax, num.asymmetryMax))
}

#List of graph data
#1. axis: a vector of numbers corresponding to the location of each tentative symmetry axis that has been tried.
#2. asymmetry: a vector of numbers corresponding to the symmetry measured to each tentative symmetry axis.
#3. axisMax: the axis yielding the maximum symmetry.
#4. asymmetryMax: the maximum symmetry value.
list.graphVariables <- function.faceAsymmetry("face1.jpg",0,0,100,0,100)
print("Done")
