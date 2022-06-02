
apt update -y
apt install build-essential -y
apt install g++-multilib -y
conda install conda-build anaconda-client -y
conda config --add channels 'bioconda'
conda build .
anaconda -t $CONDA_UPLOAD_TOKEN upload /opt/conda/conda-bld/linux-64/shapeit4-*.tar.bz2
