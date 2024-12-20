# The Spotify Effect

## Overview
This project evaluates the impact of technology on music production, specifically focusing on the influence of Spotify. The analysis includes descriptive statistics and visualizations to understand trends and changes in music characteristics over time.

## Authors
- Raimundo Contreras
- Vedran Razmilic

## Structure
The project is organized as follows:
- `code/analysis/descriptives.do`: Stata script for generating descriptive statistics and visualizations.
- `code/building/`: Directory for additional scripts and data processing (currently empty).
- `README.md`: Project overview and instructions.

## Data
The analysis uses the Spotify dataset and metadata. Ensure the paths to the datasets are correctly set in the Stata script.

## Usage
1. **Load the Spotify dataset**: The script imports the Spotify dataset from a specified path.
2. **Data Cleaning**: The script performs data cleaning on the `artists` variable.
3. **Merge Datasets**: The script merges the Spotify dataset with metadata on artist names.
4. **Generate Descriptive Statistics**: The script calculates various descriptive statistics and visualizes trends over the years.
5. **Save Outputs**: The final dataset and visualizations are saved to specified paths.

## Running the Analysis
To run the analysis, execute the Stata script `code/analysis/descriptives.do` in Stata. Ensure all required paths are set correctly.

## Results
The results include:
- Cleaned and merged dataset.
- Descriptive statistics of various music characteristics.
- Visualizations of trends over the years.

## Contact
For any questions or issues, please contact the authors.
