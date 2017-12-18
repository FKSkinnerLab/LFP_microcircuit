# this is a file changed with respects to the original suppl.py used by example7.py, The difference is that I only use ex3 as it  
#last update: April 25th CHANGE: line 184

#!/usr/bin/env python
'''some plottin' functions used by the example scripts'''
import numpy as np
import matplotlib.pyplot as plt
import neuron



def plot_ex3(cell, electrode):
    '''plotting function used by example3/4'''
    fig = plt.figure(figsize=[24, 10]) #instead of 12x8
            
    #plot the somatic trace
    ax = fig.add_axes([0.1, 0.9, 0.5, 0.08])
    ax.plot(cell.tvec, cell.somav)
    #plt.yticks(np.arange(min(y), max(y)+1, 2.0))
    ax.set_xlabel('Time [ms]')
    ax.set_ylabel('Sompot[mV]')
    plt.locator_params(nbins=5)
    
    #plot the synaptic current
    #ax = fig.add_axes([0.1, 0.4, 0.5, 0.2])
    #for i in xrange(len(cell.synapses)):
    #    ax.plot(cell.tvec, cell.stimulus.i) #color=cell.synapses[i].color)
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('Syn. i [nA]')
    
    #plot the LFP as graph
    #plt.matshow(electrode.z)
    ax = fig.add_axes([0.1, 0.1, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[0])
    #plt.yticks(np.arange(min(electrode.LFP[0]), max(electrode.LFP[0])+1, 2.0))
    ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 1')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 0.2, 0.5, 0.07])
    #ax.plot(cell.tvec, electrode.LFP[1])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.2, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[2])
    #plt.yticks(np.arange(min(electrode.LFP[2]), max(electrode.LFP[2]+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 3')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 0.4, 0.5, 0.07])
    #ax.plot(cell.tvec, electrode.LFP[3])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.3, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[4])
    #plt.yticks(np.arange(min(electrode.LFP[4]), max(electrode.LFP[4])+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 5')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 0.6, 0.5, 0.07])
    #ax.plot(cell.tvec, electrode.LFP[5])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.4, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[6])
    #plt.yticks(np.arange(min(electrode.LFP[6]), max(electrode.LFP[6])+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 7')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 0.8, 0.5, 0.07])
    #ax.plot(cell.tvec, electrode.LFP[7])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.5, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[8])
    #plt.yticks(np.arange(min(electrode.LFP[8]), max(electrode.LFP[8])+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 9')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 1, 0.5, 0.09])
    #ax.plot(cell.tvec, electrode.LFP[9])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.6, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[10])
    #plt.yticks(np.arange(min(electrode.LFP[10]), max(electrode.LFP[10])+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 11')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 1, 0.5, 0.09])
    #ax.plot(cell.tvec, electrode.LFP[11])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.7, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[12])
    #plt.yticks(np.arange(min(electrode.LFP[12]), max(electrode.LFP[12])+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 3')
    plt.locator_params(nbins=5)

    #ax = fig.add_axes([0.1, 1, 0.5, 0.09])
    #ax.plot(cell.tvec, electrode.LFP[13])
    #ax.set_xlabel('Time [ms]')
    #ax.set_ylabel('LFP near soma. [mV]')

    ax = fig.add_axes([0.1, 0.8, 0.5, 0.08])
    ax.plot(cell.tvec, electrode.LFP[14])
    #plt.yticks(np.arange(min(electrode.LFP[14]), max(electrode.LFP[14])+1, 2.0))
    #plt.tick_params(
    #axis='x',          # changes apply to the x-axis
    #labelbottom='off')
    #ax.set_xlabel('Time [ms]')
    ax.set_ylabel('LFP 15')
    plt.locator_params(nbins=5)

    #plot the LFP as image plot
    # CHANGE: I changed it into electrode.x here instead of electrode.z that was before 
    # ax = fig.add_axes([0.1, 0.1, 0.5, 0.2])
    # absmaxLFP = abs(np.array([electrode.LFP.max(), electrode.LFP.min()])).max()
    # im = ax.pcolormesh(cell.tvec, electrode.x, electrode.LFP,
    #            vmax=absmaxLFP, vmin=-absmaxLFP,
    #       cmap='spectral_r')
    
    # rect = np.array(ax.get_position().bounds)
    # rect[0] += rect[2] + 0.01
    # rect[2] = 0.02
    # cax = fig.add_axes(rect)
    # cbar = plt.colorbar(im, cax=cax)
    # cbar.set_label('LFP (mV)')
    # ax.axis(ax.axis('tight'))
    # ax.set_xlabel('Time [ms]')
    # ax.set_ylabel('z [$\mu$m]') 


    
    #plot the morphology, electrode contacts and synapses
    ax = fig.add_axes([0.65, 0.1, 0.25, 0.8], frameon=False)
    for sec in neuron.h.allsec():
        idx = cell.get_idx(sec.name())
        ax.plot(np.r_[cell.xstart[idx], cell.xend[idx][-1]],
                np.r_[cell.zstart[idx], cell.zend[idx][-1]],
                color='k')
    for i in xrange(len(cell.synapses)):
        ax.plot([cell.synapses[i].x], [cell.synapses[i].z], \
            color=cell.synapses[i].color, marker=cell.synapses[i].marker)
    for i in xrange(electrode.x.size):
        ax.plot(electrode.x[i], electrode.z[i], color='g', marker='o')
    plt.axis('equal')
    plt.axis(np.array(plt.axis())*0.8)
    ax.set_xticks([])
    ax.set_yticks([])
    
    return fig

