#Script to plot the data of virion volume (V) against genome size (L), and then find the exponent and scaling factor in the allometric  equation describing their relationship

library(ggplot2)


## Plotting the virion volume against genome size

#Read in the data
viral_data <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")

#Change column names to make them computer-readable
colnames(viral_data)[c(3,4,6,8,9,10,12,13)] <- c("Type_species", "GenBank_accession_number", "Virion_type", "Virion_diameter_nm", "Virion_length_nm", "Virion_volume_nm3", "Genome_length_kb", "Protein_number")
viral_data

#Initial plot of the data (not transformed)
ggplot(aes(x = Genome_length_kb, y = Virion_volume_nm3), data = viral_data) +
  geom_point() +
  ggtitle("Virion volume and genome length relationship in dsDNA viruses") +
  xlab("Genome length (kb)") +
  ylab("Virion volume (nm3)") +
  theme_bw()


#Log transformation applied, to fit a linear model to the data
viral_data$log_Genome_length_kb <- log10(viral_data$Genome_length_kb)
viral_data$log_Virion_volume_nm3 <- log10(viral_data$Virion_volume_nm3)

#Plot the log-transformed data
ggplot(aes(x = log_Genome_length_kb, y = log_Virion_volume_nm3), data = viral_data) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, colour = 'blue') +
  ggtitle("Virion volume and genome length relationship in dsDNA viruses") +
  xlab("log [Genome length (kb)]") +
  ylab("log [Virion volume (nm3)]") +
  theme_bw()


## Finding the exponent (α) and scaling factor (β) in the equation describing the relationship between V and L 

#The relationship is modelled by allometric equation: V = βL^α

#When we log-transform the equation, it gives us a linear relationship between the variables
#We can perform a linear regression of this equation to find α and β


#Perform the linear regression, using the log-transformed data
linear_regression <- lm(log_Virion_volume_nm3 ~ log_Genome_length_kb, data = viral_data)

#Summary of the linear regression model
summary(linear_regression)

#Intercept (log(β)) is 3.0725. We will need to back-transform this value to get β.
#Slope (α) is 1.5152.

#Back transformation of log(β)
beta <- 10^(3.0725)
beta

#Back-transformation is 1181.68 This is the value for β.


