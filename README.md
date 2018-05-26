# LFP_microcircuit

"Deciphering the contribution of oriens-lacunosum/moleculare (OLM) cells
to intrinsic theta rhythms using biophysical local field potential (LFP) models". 

citation: TBA
License: GNU GENERAL PUBLIC LICENSE
Contact: Alexandra Chatzikalymniou - alexandra.chatzikalymniou@mail.utoronto.ca

Requirements:

1. NEURON 7.4/7.5 
2. python 2.7/3 
3. numpy
4. scipy 
5. matplotlib  
6. Lfpy 1.1.3

Simulation process:

Here we have provided all neccessary code to reproduce the Figures in the submitted manuscript.

1. Download the spike times for a given set of connection probability (csb) with the full range of synaptic conductance values (gsb,gbs) from OSF (osf.io/vw3jh). Then run the following scripts for the chosen set of connection probability (csb). 

Here we have provided the complete repository for the connection probability c=0.21 and explain how to re-produce Figures in the submitted manuscript. To use the code for the rest of the connections probabilities the code needs to be modified as follows: 

         a. line 6 in "fig-5a_basal_exc.hoc" change the path to the local directory containing the spike times of the connection                                          probability of choice. 

Simulation steps for csb=0.21

1. Run the: testfig5_basal_exc_more_electrodes.py followed by the chosen connection probability (csb) value and the synaptic conductance values (gsb and gbs) as arguemnts. 
For example run: "python testfig5_basal_exc_more_electrodes.py 0.21 0.00 0.00"
and obtain the mat files with the laminal LFP traces for every parameter combination and the pdf plot.

In the "example_sup_more_electrodes_exc.py" you have the option to choose the number and location of electrodes to record from.

Once the mat files are available:
2. To simulate polarity in the soma run: plot_LFP_polarity.
3. To simulate the selected/rejected regimes for a given connection probability run: plot_selected_networks_basal_exc.m 
4. To simulate the peak power of the LFP run: plot_peak_LFP_power_basal_exc.m
5. To simulate the laminar power run: plot_laminar_LFP_power_basal_exc.m

To decompose the LFP selectively eliminate OLM -PYR or PV-PYR connections within the fig-5a_basal_exc.hoc and repeat steps 2-5. 

