R/RShiny exercise

I have a dataset file from one of our clinical trials. There are 3 treatment groups: 1 placebo (n=40), 1 low dose treatment (n=80) and 1 high dose treatment (n=80). Three time points: day 0, day 30, day 60, day 90

We have the following information on the patients: 
•	Age
•	Gender
•	BMI
•	Some biomarker A
•	Some biomarker B

Create a Rmarkdown or Shiny app that enables our collaborators to explore clinical data by implementing the following:

1.	Summarize patient population/demographic 
a.	For example, how do I identify if i have any gender bias in the data, or is there an even number of males/females in each of my groups
b.	Hint: 
i.	Filterable tables with changing underlying plots
ii.	Bar plots / pie charts, etc
2.	Plot relationship between any two phenotypic variables (e.g. age, gender, BMI, biomarkers, etc).
a.	Hint: different type of plot for different underlying data
b.	Bonus: add brushing effects to select for sub-populations (i.e. only older patients)
c.	Bonus: Faceting capabilities
3.	Visualize time trajectories with respect to different treatment and their biomarker status
4.	Download feature for individual plots
