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

Here we have provided the neccessary code to reproduce the Figures in the manuscript.

We provide the complete repository for the connection probability c=0.21 including all interneuron spike times and explain how to reproduce the Figures in the  manuscript.  

Simulation steps for csb=0.21

1. Execute the "testfig.py" followed by the aguments of connection probabilty (csb) and synaptic conductances (gsb, gbs) to reproduce the polarity profile as in Figure 2A(iii). For example run: "python testfig.py 0.21 0.00 0.00".
Once testfig.py is executed for all gsb and gbs values run "plot_LFP_power.m" to simulate the polarity color plot as in Figure 2A(iii).  

2. Run the "testfig5_basal_exc_more_electrodes.py" followed by the arguemnts of csb, gsb and gbs to reproduce selected versus rejected regimes as in Figure 6. Once iterated across all gsb amd gbs run "basal_exc_plot_laminar_LFP_power.m" to obtain the color plot of selected and rejected regimes as in Figure 6.

Execute the "aplot_LFP_real_power_basal_exc.m" to generate the power plot of Figure 7A. 

Run: "plot_laminar_LFP_power_basal_exc.m" to simulate the laminar power as in Figure 11.

Notes:
In the "example_sup_more_electrodes_exc.py" you have the option to choose the number and location of electrodes to record from.

In summary:
2. To simulate polarity in the soma as in Figure 2A(ii) run: plot_LFP_polarity.
3. To simulate the selected/rejected regimes as in Figure6 run : plot_selected_networks_basal_exc.m 
4. To simulate the peak power of the LFP as in Figure7A run: plot_peak_LFP_power_basal_exc.m
5. To simulate the laminar power as in Figure 11 run: plot_laminar_LFP_power_basal_exc.m

To decompose the LFP selectively eliminate OLM -PYR or PV-PYR connections within the fig-5a_basal_exc.hoc and repeat steps 2-5. 

------------------------------------------------------------------------------------------------------------------------------

To use the code for the rest of the connections probabilities the code needs to be modified as follows:

1. Download the spike times for a given set of connection probability (csb) with the full range of synaptic conductance values (gsb,gbs) from OSF (osf.io/vw3jh). Then run the following scripts for the chosen set of connection probability (csb). 

2. line 6 in "fig-5a_basal_exc.hoc" change the path to the local directory containing the spike times of the connection                                          probability of choice. 


