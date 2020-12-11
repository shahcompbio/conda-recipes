#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"



R -e "rmarkdown::render('$DIR/cohort_qc_report.Rmd',output_file = '$1', intermediates_dir= '$2', params=list(label='$3', oncoplot='$4', somatic_plot='$5', summary='$6', burden_plot='$7'))"

