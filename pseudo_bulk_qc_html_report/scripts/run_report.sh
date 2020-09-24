#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

R -e "rmarkdown::render('$DIR/report.Rmd',output_file = '$1',  params=list(sample_id='$2', 
mutations_per_cell_png='$3', summary_csv='$4', snvs_high_impact_csv='$5', 
snvs_all_csv='$6', trinuc_csv='$7', snv_adjacent_distance_png='$8', snv_genome_count_png='$9', 
snv_cell_counts_png='${10}', snv_alt_counts_png='${11}',destruct_rearrangement_plots_unfiltered='${12}',
destruct_rearrangement_plots_filtered='${13}', lumpy_rearrangement_plots_unfiltered='${14}',
BAFplot_png='${15}', cn_plot_png='${16}', datatype_summary_csv='${17}', 
maf='${18}'))"