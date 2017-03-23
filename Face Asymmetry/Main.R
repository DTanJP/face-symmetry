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
  num.axisMax = as.numeric(0)
  #The greatest symmetry value
  num.symmetryMax = as.numeric(0)
  #The result calculated
  result = as.numeric(0)
  
  #Read the image
  image.face = readJPEG(filename)
  dim(image.face)
  
  #Conver the image to grayscale
  image.face = ((image.face[,,1]+image.face[,,2]+image.face[,,3])/3)
  
  #Decide the correct limits
  if(is.na(xmin) || xmin < 1) 
    xmin = 1
  
  if(is.na(xmax) || xmax > dim(image.face)[1])
    xmax = dim(image.face)[1]
  
  if(is.na(ymin) || ymin < 1) 
    ymin = 1
  
  if(is.na(ymax) || ymax > dim(image.face)[2]) 
    ymax = dim(image.face)[2]
  
  #Find the symmetry line(xmin inclusive)
  symmetry.axis = xmin + ((xmax - (xmin+1))/2)
  
  #Save the x axis values that will be used in the calculations
  vector.axis = (symmetry.axis - axisSearch) : (symmetry.axis + axisSearch)
  
  #Applying the equation onto the image
  for(axis in vector.axis) {
    result <- 0
  for(y in ymin:ymax) {
    for(x in xmin:xmax) {#Loop through all the values that will be tried
      
      distance.x1 = (axis - x) #The distance from x - axis(Left - midline)
      distance.x2 = (((2 * axis) - x) - axis) #The distance from axis to x2(Midline - right)
      distance.x = min(distance.x1, distance.x2) #The min distance from the axis
      
      #Pick the x values that are equal in both sides + inside the boundaries of the image
      if(distance.x > 0) {
        if((axis - distance.x) > 0 && (axis + distance.x) < dim(image.face)[1]) {
        #DEBUG
        #print(paste(distance.x1, distance.x2, distance.x, sep = "   "))
        
        #Get the point to the left side of the symmetry axis
        point1 = image.face[axis - distance.x, y]
        
        #Get the point to the right side of the symmetry axis
        point2 = image.face[axis + distance.x, y]
        
        #Calculate the symmetry
        result <- (result + ((point1 - point2)^2))
        
        #DEBUG
        #print(paste(distance.x, point1, point2, sep = "     "))
        #string.debug = paste(x, axis, ((axis * 2) - x), ((point1 - point2)^2), (" || "), sep = "  ~  ")
        #print(string.debug)
        }
      }
    }
    #DEBUG
    #print("")
  }
    #Find the axis that has the maximum symmetry
    if(num.symmetryMax < result) {
      num.symmetryMax = result
      num.axisMax = axis
    }
  }
  #Return the results
  return (list(vector.axis, vector.asymmetry, num.axisMax, num.symmetryMax))
}

#List of graph data
list.graphVariables <- function.faceAsymmetry("face1.jpg",3,1,10,1,10)
#The axis vector will contain [2, 3, 4, 5, 6, 7, 8] with 5 as the the starting axis
print("Done")
