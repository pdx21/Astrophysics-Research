Joey Vollert
B.S. in Engineering Physics, Santa Clara University (Class of 2025)
Mentored by Dr. BG Andersson & Dr. Kristin Kulas

This repository contains the code and data analysis tools developed during my astrophysics research on Asymptotic Giant Branch (AGB) stars in Summer 2024. The focus of this project was to investigate unexpected dust grain alignment in the astrosheaths—transition regions where the stellar wind from an AGB star interacts with the surrounding interstellar medium (ISM).
AGB stars, the evolved descendants of medium-mass stars, are key contributors to the dust content of the galaxy. As these stars expel matter through stellar winds, dust grains condense in their outer envelopes and are pushed outward by radiation pressure. When this outflow reaches the ISM, it forms a boundary region known as the astrosheath.

Surprisingly, observational data suggest that dust grains in these chaotic and high-density regions become more polarized, contradicting expectations from standard shock and grain-alignment theory. This project aimed to investigate and quantify that phenomenon through telescope data analysis and curve fitting.

**Research Goals**
- Quantify polarization behavior in AGB star astrosheaths by analyzing telescope data from Keck and SALT.
- Extract Serkowski-curve parameters — including p_max, λ_max, and K — to characterize dust grain size and alignment.
- Calculate polarization position angles to further constrain magnetic field orientation and grain alignment mechanisms.
- Compare polarization per unit extinction (P / A₀) across different distances from the central star.
- Evaluate whether traditional models for grain alignment can explain the enhanced polarization observed in astrosheaths.

**Repository Structure**
This repo contains the tools used to process raw polarization data and extract meaningful physical parameters from it:

**Sample matlab_binning_code/**
- Scripts for binning raw stokes parameter data from spectropolarimetry observations.
- Averages polarization (P) and intensity values across spatial bins.
- Propagates and computes error metrics.
- Ensures consistency across multiple data files.

**PAo_vs_distance**
- MATLAB script for plotting polarization per unit extinction (P / A₀) as a function of distance from the AGB star.
- Helps visualize how alignment changes across spatial scales.
- Includes constants and distance values for each observed star.

**Sample curve_fitting/**
- Python code using symfit, scipy, and custom functions to perform curve fitting of:
  - The Serkowski law for interstellar polarization,
  - A Rayleigh scattering model, and a combined model to isolate polarization mechanisms.
  - Outputs:
    - Best-fit parameters (p_max, λ_max, K, etc.)
    - χ² and reduced χ² values
    - Diagnostic plots with observational data and fit curves.

