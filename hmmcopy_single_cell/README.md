## Build


```
docker run -it -v $PWD:$PWD -w $PWD singlecellpipeline/conda_build:v0.0.1 bash
conda build hmmcopy_single_cell
```
