# README For Bioinformatics Final Project
## Developed by Maggie Walsh
## On April 19, 2021
## mcwalsh@dons.usfca.edu

### Overview
My plan for this project was to explore SARS-CoV-2 sequence data from New York City in the early stages of the Pandemic. I to used transportation data and other municipal data resources to track how the shelter in place order and other restrictions may have had an impact on the types of variants that were detected in the city around that time.

### SRA Bioproject ID
Acession: PRJNA721724 
ID number: 721724

### Outline of Analysis Steps
1. Sequence Analysis and Variant Calling 
 * do a sequence analysis and call variants (pipeline steps can be found in code folder)
 * organize variant data by date, look at rate of variants, different types, etc (R funcions in code/functions)
2. Analysis of Tabular Data
 * use tabular data to visualize the time line for corona virus restrictions, case numbers, and mobility data. (code in Rmd)
3. Compare Variant and Restriction Data
 * create figures that demonstrate how corona virus restrictions impacted variant data in New York (Rmd)

## Change Log
2021-05-05: Started report manuscript, finalized figures and added references.
2021-05-03: Started code to identify samples by clade, started report write up and generated tables to visualise mobility and variant data.
2021-04-30: Created plot of mobility data in New York
2021-04-28: Used `COVID19` package data to create figures showing nationwide Covid-19 case numbers and case numbers in New York City.
2021-04-26: Finished variant calling analysis of New York SARS-CoV-2 sequences. Added vcf data to report Rmd and started using NY covid data to create figures.
2021-04-19: Forked and cloned template repo, and updated README to include plan for final project. 
