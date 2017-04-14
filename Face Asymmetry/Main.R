# Project: Face Asymmetry
# Author: David Tan
# Course: CIS 4900 
# Semester: Spring 2017

#Load libraries
library('jpeg')

#Calculate the asymmetry of a face
function.faceAsymmetry <- function(filename = stop("Please provide a filename"),
                                   axisSearch=0, xmin = NA, xmax = NA, ymin = NA, ymax = NA) {
  ##Create empty vector variable
  vector.axis = c()
  ##Create empty vector variable
  vector.asymmetry = c()
  ##The axis that has the least asymmetry
  num.axisMin = Inf
  ##The least asymmetry value
  num.asymmetryMin = Inf
  
  ##Read the image
  image.face = readJPEG(filename)
  dim(image.face)
  
  ##Convert the image to grayscale
  image.face = ((image.face[,,1]+image.face[,,2]+image.face[,,3])/3)
  
  ##Decide the correct limits for xmin,xmax,ymin,ymax
  if(is.na(xmin) || xmin < 1) 
    xmin = 1
  
  if(is.na(xmax) || xmax > dim(image.face)[1])
    xmax = dim(image.face)[1]
  
  if(is.na(ymin) || ymin < 1) 
    ymin = 1
  
  if(is.na(ymax) || ymax > dim(image.face)[2]) 
    ymax = dim(image.face)[2]
  
  ##Check if axisSearch is correct
  if(is.na(axisSearch) || axisSearch < 1)
    axisSearch = 1
  
  ##Find the symmetry line(xmin inclusive)
  symmetry.axis = xmin + ((xmax - (xmin+1))/2)
  
  print(paste("X-Y boundaries:", xmin, xmax, ymin, ymax))
  
  ##Save the x axis values that will be used in the calculations
  vector.axis = (symmetry.axis - axisSearch) : (symmetry.axis + axisSearch)
  
  ##Applying the equation onto the image
  for(axis in vector.axis) {
    
    distance.x <- min( axis-xmin, xmax-axis )
    ## we do not need to calculate on the axis:
    x.values <- setdiff( (axis-distance.x):(axis+distance.x), axis )
    
    result <- 0
    ##Loop through all the values that will be tried
    for(x in x.values ) {
      ##Get points to the left side of the symmetry axis
      slice1 = image.face[axis - distance.x, ymin:ymax]
      ##Get the points to the right side of the symmetry axis
      slice2 = image.face[axis + distance.x, ymin:ymax]
      ##Calculate the mean squared distance
      result <- result + mean( (slice1 - slice2)^2 )
    }
    
    ## sqrt(result) and normalize by number of x-slices to get the global mean:
    result <- sqrt(result) / distance.x
    
    ## store result:
    vector.asymmetry <- c(vector.asymmetry, result)
    
    ##Find the axis that has the minimum asymmetry
    if( result < num.asymmetryMin ) {
      num.asymmetryMin = result
      num.axisMin = axis
    }
  }
  ##Return the results
  return (list(imageName=filename, axis=vector.axis, asymmetry=vector.asymmetry, axisMin=num.axisMin, asymmetryMin=num.asymmetryMin))
}

#function.exportData: Applies all jpeg files to function.faceAsymmetry in a directory and exports to a CSV file.
#directory: The directory containing the images to be search for. Does not go into subdirectories to search.
#axisSearch: The axisSearch to be applied to all jpeg files
function.exportData <- function(directory = stop("Specify a directory to search for images"), axisSearch = NA) {
  #DEBUG: Prints all the files in that directory
  #print(list.files(directory))
  
  ##The collection of jpeg files to be applied the function.faceAsymmetry
  list.jpeg <- list.files(directory)[grep(pattern = ".jpg", x = list.files(directory))]
  
  ##The collection of data from all the jpg files
  asymmetry.data = c()
  
  #Print the amount of jpg files found
  print(paste("Found", length(list.jpeg), "jpg files."))
  
  #DEBUG: Prints the collection of jpeg files to be used
  #print(list.jpeg)
  
  #Checks if the axisSearch is correct
  if(is.na(axisSearch) || axisSearch < 1)
    axisSearch = 1
    
  #Process all of the images
  for(i in 1:length(list.jpeg)) {
    image.name = paste(directory,list.jpeg[i], sep = "")
    print(paste(i,":", image.name), sep = NA)
    asymmetry.data <- c(asymmetry.data, c(function.faceAsymmetry(image.name, axisSearch, NA, NA, NA, NA), c("")))
  }
  
  #frame.asymmetry <- cbind(asymmetry.data)
  #print(frame.asymmetry)
  
  #DEBUG: Show the data collected from the images
  #print(asymmetry.data)
  
  #Saves the data to FaceAsymmetry.csv
  write.csv(asymmetry.data, "FaceAsymmetry.csv", row.names = FALSE, eol = "\n")
}

#I have a folder call Face in RStudio's workspace. Inside it are the face images
function.exportData("./Face/", axisSearch = 10)
print("Done")
