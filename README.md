# Poetic_Lego
This repo contains R code and data files for data analysis for the research project - poetic lego

# Structural Complexity Analysis

## Introduction

The R code is designed for the analysis of structural complexity, Lego description transcription, and self-reported creativity results in the context of a user study involving Lego and artificial intelligence (AI). The study assesses the impact of AI and LEGO play on participants' creative aesthetic experiences.

## Data Setup

Before running the scripts, download all the files from this repo and run the "HCIproject.R" file in R Studio The provided code uses four CSV files: "ParticipantTrackerSheet5.csv" for structural complexity data, "QualitativeData.csv" for transcriptions, "G1_11_30.csv" for survey results in the session 1 for Lego-only group and "G2_11_30.csv" for AI group. 

## Structural Complexity Analysis

1. **Data Loading and Visualization**
   - Load the structural complexity data using `ParticipantTrackerSheet5.csv`.
   - Transpose the data for plotting, creating bar plots and box plots to visualize participant scores across sessions.

2. **Statistical Analysis**
   - Use the Wilcoxon rank sum test for mean comparison between Lego and AI groups across sessions.
   - Fit regression models to assess the trajectory of structural complexity for each group.

## Qualitative Data Analysis

1. **Qualitative Data Loading**
   - Load the qualitative from the "QualitativeData.csv" file.
   - Reshape the data for further analysis.

2. **Data Visualization with ggplot2**
   - Create box plots using ggplot2 to visualize the total words used and the frequency of the pronoun "I" across sessions.

3. **Statistical Analysis**
   - Conduct Wilcoxon rank sum tests to compare differences in the total words used and the frequency of "I" between Lego and AI groups.

## Survey Data Analysis

1. **Survey Data Loading**
   - Load survey data for both control and AI groups from "G1_11_30.csv" and "G2_11_30.csv"

2. **Descriptive Statistics**
   - Calculate means for survey questions related to aesthetic appreciation, creative behavior, and interest in aesthetic experiences.

3. **Data Visualization**
   - Create box plots to visually compare pre- and post-survey scores for creativity metrics in both control and AI groups.

## Conclusion

These scripts provide a comprehensive analysis of structural complexity, qualitative data, and survey responses in the context of the user study. For further details on individual analyses and results, refer to the comments within the code.

Feel free to adapt the scripts according to your specific dataset and research questions.

