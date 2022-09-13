#!/bin/bash

input_folder=path_to_the_database

cd ${input_folder}

for complex_PDB in *.pdb;
do

	complex=${complex_PDB%.*}

	mkdir ${complex}

	cd ${complex}

	mv ../${complex_PDB} ./

	mv ../${complex}_rmsd.log ./

	mv ../${complex//PPI}ligand.sdf ./

	python3 rosetta/main/tools/protein_tools/scripts/clean_pdb.py ${complex_PDB} AZ 

	relax.static.linuxgccrelease -s ${complex}_AZ.pdb -out:suffix _relaxed -nstruct 1 -relax:default_repeats 1 > relaxation.log

	InterfaceAnalyzer.static.linuxgccrelease -s ${complex}_AZ_relaxed_0001.pdb  -compute_packstat true -tracer_data_print true -out:file:score_only pack_score.sc -pack_input true -pack_separated true -add_regular_scores_to_scorefile true -atomic_burial_cutoff 0.01 -sasa_calculator_probe_radius 1.4 -pose_metrics::interface_cutoff 8.0 -use_input_sc -overwrite > interface.log

	residue_energy_breakdown.static.linuxgccrelease  -in:file:s  ${complex}_AZ_relaxed_0001.pdb -out:file:silent relaxed_per_residue.out -overwrite

	cd ${input_folder}

	python3 residueEnergy.py --in ${input_folder} --out ${input_folder} 

done
