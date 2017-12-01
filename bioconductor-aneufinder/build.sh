
#!/bin/bash
mv DESCRIPTION DESCRIPTION.old
conda install -c biobuilds r-cowplot
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
$R CMD INSTALL --build .
# 
