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
  #The axis that has the greatest symmetry value
  num.axisMax = 0
  #The greatest symmetry value
  num.symmetryMax = 0
  
  #Read the image
  image.face = readJPEG(filename)
  dim(image.face)
  
  image.face = ((image.face[,,1]+image.face[,,2]+image.face[,,3])/3)
  #If there is no delimiters set, default should be the entire image
  if(is.na(xmin)) xmin = 1
  if(is.na(xmax)) xmax = dim(image.face)[1]
  if(is.na(ymin)) ymin = 1
  if(is.na(ymax)) ymax = dim(image.face)[2]
  
  #Check to make sure xmax is within bounds of the image
  if(xmax > dim(image.face)[1])
    xmax = dim(image.face)[1]
  
  #Check to make sure ymax is within bounds of the image
  if(ymax > dim(image.face)[2])
    ymax = dim(image.face)[2]
  
  #Find the symmetry line
  symmetry.axis = xmin + ((xmax - xmin)/2)
  
  #Save the x axis values that will be used in the calculations
  vector.axis = (symmetry.axis - axisSearch) : (symmetry.axis + axisSearch)
  
  #Applying the equation onto the image
  for(axis in vector.axis) {
    result <- 0
  for(y in ymin:ymax) {
    for(x in xmin:xmax) {#Loop through all the values that will be tried
      
      #Get the point to the left side of the symmetry axis
      #point1 = function.intensityValue(image.face, x, y)
      point1 = image.face[x,y]
      
      #Get the point to the right side of the symmetry axis
      #point2 = function.intensityValue(image.face, (x + (axisSearch * 2)), y)
      point2 = image.face[(2 * axis) - x, y]
      
      #Calculate the symmetry
      #result = function.equation(point1, point2)
      result = (result + ((point1 - point2)^2))
      
      #DEBUG
      string.debug = paste(x, (x + (axisSearch * 2)), function.equation(point1, point2), sep = "    ")
      print(string.debug)
    }
    #DEBUG
    print("")
  }
    result = sqrt(result)
    
    #Find the greatest symmetry value
    if(num.symmetryMax < result) {
      num.symmetryMax = result
      num.axisMax = x
    }
    
    #Append the calculated value onto the vector
    vector.asymmetry <- c(vector.asymmetry, result)
  }
  #Return the results
  return (list(vector.axis, vector.asymmetry, num.axisMax, num.symmetryMax))
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
list.graphVariables <- function.faceAsymmetry("face1.jpg",10,940,1130,740,880)
print("Done")
