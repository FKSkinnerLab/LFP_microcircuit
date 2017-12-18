#!/usr/bin/env python
'''
################################################################################
#
# This is from hoc to Python for the simplistic LFP to biophysical LFP model
################################################################################
'''
# importing some modules, setting some matplotlib values for pl.plot.
import LFPy
import numpy as np
import scipy.io
import nrn
import neuron
from neuron import h
from itertools import chain
import matplotlib.pyplot as plt
import sys
import os
import string
plt.rcParams.update({'font.size' : 12,
                     'figure.facecolor' : '1',
                     'figure.subplot.wspace' : 0.5,
                     'figure.subplot.hspace' : 0.5})
#seed for random generation
np.random.seed(1234)

#h('load_file("fig-5a.hoc")')

#########################################
##### SOM/BSC connection parameters
csb_str=sys.argv[1]     #string
#c_sb=decimal.Decimal('csb_str')
#Decimal(csb_str)
c_sb=float(csb_str)
c_bs=0.64*c_sb
cbs_str=str(c_bs)

gsb_str=sys.argv[2]
gbs_str=sys.argv[3]
print gsb_str
print gbs_str
gsb_raw=float(gsb_str)
gbs_raw=float(gbs_str)
g_sb=gsb_raw#*nS
g_bs=gbs_raw#*nS


################################################################################
# Main simulation procedure
################################################################################

#s1='csb='+ str(c_sb) 
#s2='gsb='+ str(g_sb) 
#s3='gbs='+ str(g_bs)


#with open('fig-5a.hoc', 'r+') as f:
#   lines = f.readlines()
#   for i, line in enumerate(lines):
#       if i == 119:
#           new_str = line.replace(s1, 'gsb=', 'Hello,')# inserts "somedata" above the current line
#       if i == 120:   
#          lines.insert(i+1,s2)
#       if i == 121:
#          lines.insert(i+2,s3)
#         
#   f.truncate(0)         # truncates the file
#   f.seek(0)             # moves the pointer to the start of the file
#   f.writelines(lines)
#f.close()

h('csb='+ str(c_sb))
h('gsb='+ str(g_sb))
h('gbs='+ str(g_bs))

#h('csb=s1, gsb=s2, gsb=s3')
cellParameters = {
	'morphology' :'fig-5a_basal_exc.hoc',
#    	'rm' : 20000,               # membrane resistance
#    	'cm' : 1.9 ,                 # membrane capacitance
#    	'Ra' : 80,                 # axial resistance
    	'v_init' : -70,             # initial crossmembrane potential
	'e_pas' : -70,              # reversal potential passive mechs
    	'passive' : True,           # switch on passive mechs
 	'nsegs_method' : 'lambda_f',# method for setting number of segments,
 	'lambda_f' : 100,           # segments are isopotential at this frequency
    	'timeres_NEURON' : 2**-4,   # dt of LFP and NEURON simulation.
 	'timeres_python' : 2**-4,
 	'tstartms' : -100,          #start time, recorders start at t=0
  	'tstopms' : 5000,            #stop time of simulation
  	#'custom_code'  : ['active_declarations_example3.hoc'], # will run this file
	}	

cell = LFPy.Cell(**cellParameters)
cell.set_rotation(x=20, y=0, z=-15.5)

## create a synapse using hoc syntax
#neuron.h('''
#         objref syn
#         dend11[23] syn = new AlphaSynapse(0.5)
#         syn.onset = 10
#         syn.tau = 1
#         syn.gmax = 0.05
#         syn.e = 0
#         ''')

#create recording array for synapse current
#isyn = neuron.h.Vector()
#isyn.record(neuron.h.syn._ref_i)



# Define electrode geometry corresponding to a laminar electrode, where contact
# points have a radius r, surface normal vectors N, and LFP calculated as the
# average LFP in n random points on each contact:
N = np.empty((16, 3))
for i in range(N.shape[0]): N[i,] = [1, 0, 0] #normal unit vec. to contacts

# put parameters in dictionary
electrodeParameters = {
    'sigma' : 0.3,              # Extracellular potential
    'x' : np.zeros(15) ,      # x,y,z-coordinates of electrode contacts
    'y' : np.zeros(15),
    'z' : np.linspace(-130, 470, 15),# standard is -100,500,6
    'n' : 20,
    'r' : 10,
    'N' : N,
}

# Parameters for the cell.simulate() call, recording membrane- and syn.-currents
simulationParameters = {
    'rec_imem' : True,  # Record Membrane currents during simulation
    'rec_isyn' : True,  # Record synaptic currents
}

#synapse = LFPy.Synapse(cell)

#######################################################


#Initialize cell instance, using the LFPy.Cell class
#cell = LFPy.Cell(**cellParameters)

#perform NEURON simulation, results saved as attributes in the cell instance
cell.simulate(**simulationParameters)
# Initialize electrode geometry, then calculate the LFP, using the
# LFPy.RecExtElectrode class. Note that now cell is given as input to electrode
# and created after the NEURON simulations are finished

electrode = LFPy.RecExtElectrode(cell, **electrodeParameters)
print('simulating LFPs....')
electrode.calc_lfp()
print('done')

#creating dictionary for the mat files 
a={}
a['electrodes']=(electrode.LFP[0],electrode.LFP[1],electrode.LFP[2],electrode.LFP[3],electrode.LFP[4],electrode.LFP[5],electrode.LFP[6],electrode.LFP[7],electrode.LFP[8],electrode.LFP[9],electrode.LFP[10],electrode.LFP[11],electrode.LFP[12],electrode.LFP[13],electrode.LFP[14])

#printing the vector of results
#np.savetxt("somatic_LFP_power_only"+"_gsb=%0.2f_gbs=%0.2f_csb=%0.2f" % (g_sb, g_bs, c_sb)+".txt", electrode.LFP[0],delimiter=' ')
scipy.io.savemat("basal_exc_many_electrodes_LFP_power_only"+"_gsb=%0.2f_gbs=%0.2f_csb=%0.2f" % (g_sb, g_bs, c_sb)+".mat", a, appendmat=True, format='5', long_field_names=False, do_compression=False, oned_as='row')

#filename_PV_SOM="BC-"+str(N_bc)+"-BSC-"+str(N_bsc)+"gi-"+gi_mean_str+"-gi_SD-"+gi_SD_str+"-"+PV_EPSC_filename+"-dSD"+str(delaySD_pv)+"ms-gnSD"+str(gainSD_pv)+"-gpv-"+str(g_pv*10**9)+"-gsb"+str(g_sb*10**9)+"-csb"+c_som_bsc_str+"-gbs"+str(g_bs*10**9)+"-cbs"+c_bsc_som_str+"-SOM-"+str(N_som)+"-"+SOM_EPSC_filename+"-dSD"+str(delaySD_som)+"ms-shift"+str(shift)+"ms-gnSD"+str(gainSD_som)+""



#np.savetxt('somatic_LFP_power_and_time',(cell.tvec, electrode.LFP[0]),delimiter=' ', header='time, somatic LFP (mV)')

#np.savetxt('somatic_LFP_power_and_time', np.c_[cell.tvec, electrode.LFP[0]],delimiter=' ', header='time, somatic LFP (mV)')

#np.savetxt('myfile.txt', np.c_[x,y,z]) to save in columns versus lines


#plotting some variables and geometry, saving output to .pdf.
from example_sup_more_electrodes_exc import plot_ex3
fig = plot_ex3(cell, electrode)
fig.savefig("basal_exc_gsb=%0.2f_gbs=%0.2f_csb=%0.2f" % (g_sb, g_bs, c_sb)+"_LFP_and_somatic_potential_many_electrodes"+".pdf", dpi=300)

#fig.savefig("gsb-"+str(g_sb)+"_gbs-"+str(g_bs)+"_csb-"+str(c_sb)+"LFP_and_somatic_potential_one_electrode"+".pdf", dpi=300)

#plt.show()
