# Transfer-Function-Estimation-Using-Time-Frequency-Analysis
## by Corinne Rachel Ilvedson

### Submitted to the Department of Aeronautics and Astronautics on August 21, 1998, in Partial Fulfillment of the Requirements for the Degree of Master of Science in Aeronautics and Astronautics

# Abstract
Given limited and noisy data, identifying the transfer function of a complex aerospace system may prove difficult. In order to obtain a clean transfer function estimate despite noisy data, a time-frequency analysis approach to system identification has been developed. The method is based on the observation that for a linear system, an input at a given frequency should result in a response at the same frequency, and a time localized frequency input should result in a response that is nearby in time to the input. Using these principles, the noise in the response can be separated from the physical dynamics. In addition, the impulse response of the system can be restricted to be causal and of limited duration, thereby reducing the number of degrees of freedom in the estimation problem. The estimation method consists of finding a rough estimate of the impulse response from the sampled input and output data. The impulse response estimate is then transformed to a two dimensional time-frequency mapping. The mapping provides a clear graphical method for distinguishing the noise from the system dynamics. The information believed to correspond to noise is discarded and a cleaner estimate of the impulse response is obtained from the remaining information. The new impulse response estimate is then used to obtain the transfer function estimate. The results indicate that the time-frequency transfer function estimation method can provide estimates that are often less noisy than those obtained from other methods such as the Empirical Transfer Function Estimate and Welch's Averaged Periodogram Method.

**The Thesis Supervisor:** Steven R. Hall, Associate Professor

Files include the retyped Matlab code to Empirical Transfer Function Estimate and Welch's Averaged Periodogram Method.

- `mainnum.m` : single input numerical example
- `mainsiso.m` : single input experimental data
- `mainmiso.m` : multi-input experimental data

The information matrix and vector were stored in a `.mat` file and then loaded by the tool. The code for the tool is:
- `tvf_tool.m` : single input numerical example or experimental data
- `tvf_toolmiso.m` : multi-input experimental data
 However, these files are not present in this repositority.