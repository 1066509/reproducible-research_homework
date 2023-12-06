#Script to simulate and plot two random walks

#Load packages
if (!require("gridExtra", character.only = TRUE)) {
  install.packages("gridExtra")
  library("gridExtra")
} else {
  library("gridExtra")
}

if (!require("ggplot2", character.only = TRUE)) {
  install.packages("ggplot2")
  library("ggplot2")
} else {
  library("ggplot2")
}



#Generate a function to simulate a random walk
random_walk  <- function (n_steps, seed = NULL) {
  
  if (!is.null(seed)) set.seed(seed)
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1)
  
  for (i in 2:n_steps) {
    
    h <- 0.25
    
    angle <- runif(1, min = 0, max = 2*pi)
    
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    df[i,2] <- df[i-1,2] + sin(angle)*h
    
    df[i,3] <- i
    
  }
  
  return(df)
  
}


#Set the seed for the first random walk, to ensure reproducibility of the data
#I have chosen 400 as the seed value for the first walk
set.seed(400)

#Generate the data set for the first random walk
data1 <- random_walk(500)

#Plot this first data set
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")


#Set the seed for the second random walk
#I have chosen 300 as the seed value for the second walk
set.seed(300)

#Generate the data set for the second random walk
data2 <- random_walk(500)

#Plot this second data set
plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

grid.arrange(plot1, plot2, ncol=2)
