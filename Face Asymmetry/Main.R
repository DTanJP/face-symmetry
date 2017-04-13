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
  
    ##Decide the correct limits
    if(is.na(xmin) || xmin < 1) 
        xmin = 1
  
    if(is.na(xmax) || xmax > dim(image.face)[1])
        xmax = dim(image.face)[1]
  
    if(is.na(ymin) || ymin < 1) 
        ymin = 1
  
    if(is.na(ymax) || ymax > dim(image.face)[2]) 
        ymax = dim(image.face)[2]
  
    ##Find the symmetry line(xmin inclusive)
    symmetry.axis = xmin + ((xmax - (xmin+1))/2)
  
    ##Save the x axis values that will be used in the calculations
    vector.axis = (symmetry.axis - axisSearch) : (symmetry.axis + axisSearch)

    message(paste("X-Y boundaries:", xmin, xmax, ymin, ymax))
    
    ##Applying the equation onto the image
    for(axis in vector.axis) {
        
        distance.x <- min( axis-xmin, xmax-axis )
        ## we do not need to calculate on the axis:
        x.values <- setdiff( (axis-distance.x):(axis+distance.x), axis )
        
        result <- 0
        for(x in x.values ) {#Loop through all the values that will be tried
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

        ##Find the axis that has the maximum symmetry
        if( result < num.asymmetryMin ) {
            num.asymmetryMin = result
            num.axisMin = axis
        }
    }
    ##Return the results
    return (list(axis=vector.axis, asymmetry=vector.asymmetry, axisMin=num.axisMin, asymmetryMin=num.asymmetryMin))
}

#List of graph data
list.graphVariables <- function.faceAsymmetry("face1.jpg",3,1,10,1,10)
#The axis vector will contain [2, 3, 4, 5, 6, 7, 8] with 5 as the the starting axis
print("Done")
