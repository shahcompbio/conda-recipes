sed -itmp 's+#\!/usr/bin/env Rscript+#\!'$CONDA_PREFIX'/bin/Rscript+' $CONDA_PREFIX/bin/hmmcopy_single_cell.R