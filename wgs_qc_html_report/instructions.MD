

### Build 

```
docker run -it -v $PWD:$PWD -w $PWD --rm singlecellpipeline/conda_build:v0.0.1 bash -c "conda update -n base -c defaults conda -y &&  conda build wgs_qc_html -c r"
```


### Install

```
conda install -c shahcompbio wgs_qc_html
```
