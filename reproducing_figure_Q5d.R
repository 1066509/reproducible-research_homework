#Script to reproduce the figure in Q5d

library(ggplot2)

#Read in data and change column names
viral_data <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")
colnames(viral_data)[c(3,4,6,8,9,10,12,13)] <- c("Type_species", "GenBank_accession_number", "Virion_type", "Virion_diameter_nm", "Virion_length_nm", "Virion_volume_nm3", "Genome_length_kb", "Protein_number")
viral_data


#Log transformation applied to data
viral_data$log_Genome_length_kb <- log(viral_data$Genome_length_kb)
viral_data$log_Virion_volume_nm3 <- log(viral_data$Virion_volume_nm3)


ggplot(aes(x = log_Genome_length_kb, y = log_Virion_volume_nm3), data = viral_data) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, colour = 'blue') +
  xlab("log [Genome length (kb)]") +
  ylab("log [Virion volume (nm3)]") +
  theme_bw() +
  theme(axis.title.x = element_text(face = "bold"),
        axis.title.y = element_text(face = "bold"))
