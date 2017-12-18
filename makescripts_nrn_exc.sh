#!/bin/bash

	# start creating the submission script
sed -e "s/@@MEAN@@/${g_sb}/" submit-template-begin-nrn.sh > submit_testfig.sh #${subdir}/submit.sh

c_sb="0.01"

for g_sb in $( seq 0.00 0.25 6.00)
do
	for g_bs in $( seq 0.00 0.25 6.00)
	do
		echo " python testfig5_basal_exc_more_electrodes.py $c_sb $g_sb $g_bs" >> submit_testfig_exc.sh  #${subdir}/submit.sh
	done
done
cat submit-template-end.sh >> submit_testfig.sh  #${subdir}/submit.sh
#cd ${subdir}
#qsub submit.sh
#	cd ..
#done
