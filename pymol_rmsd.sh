#!/bin/bash

# Input directory whare all the PDBs are
input_directory=/Users/nidhinthomas/Desktop/data/

cd ${input_directory}

for PDB in *.pdb;
do

    base_PDB=${PDB%.*}

    echo "load /Users/nidhinthomas/Desktop/Cyberduck_downloads/6ZHC_chAZ.pdb
    
load ${PDB}
select VHL_iter, ${base_PDB} and chain A and resi 62-205 and name ca
select VHL_6ZHC, 6ZHC_chAZ and chain A and resi 62-205 and name ca
select BCL_6ZHC, 6ZHC_chAZ and chain Z and name ca
select BCL_iter, ${base_PDB} and chain Z and name ca
align VHL_iter,  VHL_6ZHC
rms_cur BCL_iter, BCL_6ZHC, matchmaker=-1" > pymol_script.pml

    /Applications/PyMOL.app/Contents/MacOS/MacPyMOL  -c -r pymol_script.pml | tee ${base_PDB}_rmsd.log

done
