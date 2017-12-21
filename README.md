# LFP_microcircuit

"Deciphering the contribution of oriens-lacunosum/moleculare (OLM) cells
to intrinsic theta rhythms using biophysical local field potential (LFP) computations". 

citation: TBA
License: TBA
Contact: Alexandra Chatzikalymniou - alexandra.chatzikalymniou@mail.utoronto.ca

Requirements:

-NEURON 7.4/7.5
-python 2.7/3 or earlier version
-numpy 
-scipy 
-matplotlib  
-Lfpy 1.1.3

Simulation process:

1. Run the: testfig5_basal_exc_more_electrodes.py 
for a chosen connection probability (csb) value. 

          * record from soma only 
          * record across pyramidal cell axis using multiple electrodes. 
          
2. To simulate polarity in the soma run: plot_LFP_polarity.
3. To simulate the selected/rejected regimes for a given connection probability run: plot_selected_networks_basal_exc.m 
4. To simulate the peak power of the LFP run: plot_peak_LFP_power_basal_exc.m
5. To simulate the laminar power run: plot_laminar_LFP_power_basal_exc.m

To decompose the LFP selectively eliminate OLM -PYR or PV-PYR connections within the fig-5a_basal_exc.hoc and repeat steps 2-5. 


the spatial attentuation is computed LFPy: 
the CSD : cite. 
