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
  image.face = readJPEG(filename, native = TRUE)
  
  #Get the dimension of the jpeg
  dimension.image.face = dim(image.face)
  
  # Assign RGB channels to data frame
  RGB.image.face <- data.frame(
    x = rep(1:dimension.image.face[2], each = dimension.image.face[1]),
    y = rep(dimension.image.face[1]:1, dimension.image.face[2]),
    R = as.vector(image.face[1][1][1]),
    G = as.vector(image.face[1][1][2]),
    B = as.vector(image.face[1][1][3])
  )
  
  print(RGB.image.face$B)
  
  #Create a plot
  plot(1, type="n", xlim=c(100, 200), ylim=c(300, 350))
  
  #Draw the image onto the plot
  rasterImage(image.face, 100, 300, 160, 350)
  
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
