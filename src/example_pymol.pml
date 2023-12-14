load /Users/nidhinthomas/Desktop/Cyberduck_downloads/2_298_PPI.pdb
load /Users/nidhinthomas/Desktop/Cyberduck_downloads/6ZHC_chAZ.pdb
select VHL_2_298, 2_298_PPI and chain A and resi 62-205 and name ca
select VHL_6ZHC, 6ZHC_chAZ and chain A and resi 62-205 and name ca
select BCL_6ZHC, 6ZHC_chAZ and chain Z and name ca
select BCL_2_298, 2_298_PPI and chain Z and name ca
align VHL_2_298,  VHL_6ZHC
rms_cur BCL_2_298, BCL_6ZHC, matchmaker=-1
