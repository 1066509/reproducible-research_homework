# Reproducible research: version control and R

\# INSERT ANSWERS HERE #

**Question 1, 2 and 3** - link to logistic_growth repository:




**Question 4:**

a) The x and y coordinates appear to show the direction of movement. The colour of the line shows at what point in time the person walked in that direction. The line itself shows the progression of the walk through space.
<br>
In the first graph, we observe that within the first 100 minutes of the random walk, the person moves from the approximate unit (-0.5, -0.1)
In the second graph, within the first 100 minutes, the person moves from the approximate coordinate (0.8, 0.25)


b) A random seed specifies the start number for generating a set of random numbers. The seed value is the base value used by a random generator to ouput random numbers. We can use the same seed value to generate the same random numbers multiple times over - the random numbers can be reproduced. This can be used to create repeatable data sets.

c) I have have a reproducible simulation of Brownian motion, seen in the 'random_walk.R' file, in the reproducible_research_homework repository.

d) Images of the latest commit made to the 'random_walk.R' file, showing how I have changed the script to make the simulation reproducible:

  <p>
     <img src="https://github.com/amccarthykerrigan/reproducible-research_homework/blob/aced320a973bb0fe7850b3144bb01b905a31066f/Q4d_Latest_commit_1.png">
  </p> 
    
  <p>
     <img src="https://github.com/amccarthykerrigan/reproducible-research_homework/blob/a1129be13c0f0e252e451d4c1705e2e07f9e94b1/Q4d_Latest_commit_2.png">
  </p>  


**Question 5:**

a) The table of data for dsDNA viruses has 33 rows and 13 columns.

b) You can use a log transformation to fit a linear model to the data. I have done this and plotted it in the file 'viral_data_log_transformation.R' in the reproducible_research_homework repository.

c) In order to find the exponent (α) and scaling factor (β) for the relationship between virion volume (V) and genome length (L), we need to log-transform the equation, to linearise the relationship.
<br>
Initial equation: V = βL^α
<br>
Log equation: log(V) = log(β) + αlog(L)
This now shows a linear relationship between V and L, where the slope is α and the intercept is log(β).

Therefore to find α and β, we can do a linear regression on the log-transformed data. I have  back-transformed the output value for the intercept as this value is log(β) and I need to find only β.
    
Code for this linear regression can be found in the file 'viral_data_log_transformation.R' in the reproducible_research_homework repository.

α = 1.52 (p = 6.44e-10)
<br>
β = 1181.68 (p = 2.28e-10)

From the linear regression, the p value for the slope (α) is 6.44e-10 and the p value for the intercept value (β) is 2.28e-10. Since for both, P<0.05, both the intercept and slope values are statistically significant, meaning there is a strong positive correlation between genome size and virion volume. The p values are significant at the level of P<0.001.

I did find the same values as in Table 2 of the paper. They found that α = 1.52 and β = 1182.

d) 

e) Estimated volume of a 300kb dsDNA virus:

log(V) = log(β) + αlog(L)
<br>
log(V) = log(1181.68) + (1.52 x log(300))
<br>
log(V) = 3.0725 + (3.7652) = 6.8377
<br>
V = 10^(6.8377)
<br>
= 6,881,767.57 nm3



## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
