# LightThief Code

## Overview
This repository hosts the GNURadio flowgraph and MATLAB code related to the "LightThief" research, demonstrating methods to capture and analyze signal strength, and decode signals using USRP and MATLAB.

## Contents
- **Signal Capture**: Code for using USRP to collect signals.
- **Signal Processing**: MATLAB scripts for processing and analyzing the signal strength.
- **Decoding Algorithms**: Implementation of algorithms to decode the captured signals.

## Getting Started
- Ensure you have MATLAB and USRP hardware/software setup.
- Clone the repository and follow the instructions in each script for execution details.

## Usage
- Use the USRP code to collect signals under different conditions.
- Process these signals with the MATLAB scripts to analyze signal strength and perform decoding.

## Contribution
Contributions to improve or extend the codebase are welcome. Please submit pull requests for review.


# LightThief Circuit

- The greatest advantage of LightThief is its very simple circuit structure, constructed by coupling a photodiode (PD) to a tiny antenna. 
- The Circuit file contains photos of the LightThief circuit. 
- As a prototype, you can opt for a Mini PCI/PCI-E antenna (like the one found at this link: https://www.amazon.com/wlaniot-Wireless-Bluetooth-700-2600Mhz-Connector/dp/B077SVP7PN/ref=sr_1_20?dchild=1&keywords=internal+antenna&qid=1621266508&sr=8-20). 
- You can choose the PD listed in the paper or find one that best matches the wavelength of the light source you are attacking. 
- As shown in the figure, just solder the PD in the middle. 
- Remember, do not cut off the feedline.

# License
This project is for academic research and is not licensed for commercial use.