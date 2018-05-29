# LFP_microcircuit

"Deciphering the contribution of oriens-lacunosum/moleculare (OLM) cells
to intrinsic theta rhythms using biophysical local field potential (LFP) models". 

citation: TBA
License: GNU GENERAL PUBLIC LICENSE
Contact: Alexandra Chatzikalymniou - alexandra.chatzikalymniou@mail.utoronto.ca

Requirements:

1. NEURON 7.4/7.5 https://www.neuron.yale.edu/neuron/
2. python 2.7/3 https://www.python.org/downloads/
3. Lfpy 1.1.3 https://lfpy.readthedocs.io/en/latest/

Simulation process:

Here we provide the neccessary code to reproduce the Figures in the manuscript.

We provide the complete repository for the connection probability c=0.21 including all interneuron spike times. Interneuorn spike times for the ret of the connection porbabilites can be found in osf (osf.io/vw3jh).

Simulation steps for csb=0.21

1. To simulate somatic LFP traces without basal excitation as in Figure 2A and B run: "testfig.py" followed by the aguments of connection probabilty (csb) and synaptic conductances (gsb, gbs). For example run: "python testfig.py 0.21 0.00 0.00".
To simulate the polarity color plot as in Figure 2A(iii) run "plot_LFP_power.m" after "testfig.py" is executed across all gsb and gbs values.  

2. To simulate selected versus rejected regimes as in Figure 6 first run: "testfig5_basal_exc_more_electrodes.py" followed by the arguemnts csb, gsb and gbs. Once iterated across all gsb amd gbs run "basal_exc_plot_laminar_LFP_power.m" to obtain the color plot of selected and rejected regimes as in Figure 6.

3. To simulate the power plot of Figure 7A run: "aplot_LFP_real_power_basal_exc.m". 

4. To simulate the laminar power as in Figure 11 run: "plot_laminar_LFP_power_basal_exc.m".

5. To simulate the 2D LFP as in Figure 12 run: "testfig5_basal_exc_more_electrodes.py"

Notes:
a. In the "example_sup_more_electrodes_exc.py" you have the option to choose the number and location of electrodes to record from.
b. To decompose the LFP selectively eliminate OLM -PYR or PV-PYR connections within the fig-5a_basal_exc.hoc and repeat steps. 

------------------------------------------------------------------------------------------------------------------------------

To use the code for the rest of the connections probabilities follow these steps:

1. Download the spike times for a given set of connection probability (csb) with the full range of synaptic conductance values (gsb,gbs) from OSF (osf.io/vw3jh). Then run the following scripts for the chosen set of connection probability (csb). 

2. in line 6 in "fig-5a_basal_exc.hoc" change the path to the local directory containing the spike times of the connection                                          probability of choice. 


