load /Users/nidhinthomas/Desktop/Cyberduck_downloads/6ZHC_chAZ.pdb
load 8_80_PPI.pdb
select VHL_iter, 8_80_PPI and chain A and resi 62-205 and name ca
select VHL_6ZHC, 6ZHC_chAZ and chain A and resi 62-205 and name ca
select BCL_6ZHC, 6ZHC_chAZ and chain Z and name ca
select BCL_iter, 8_80_PPI and chain Z and name ca
align VHL_iter,  VHL_6ZHC
rms_cur BCL_iter, BCL_6ZHC, matchmaker=-1
