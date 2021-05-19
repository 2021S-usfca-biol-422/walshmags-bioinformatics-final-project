# function expects two parameters, one is a dataset with the clade info from
# https://github.com/nextstrain/ncov/blob/master/defaults/clades.tsv
# and the other is the joined metadata table that has the data from the
# processed vcf files
make_sample_snps_table <- function(clade_dataset, vcf_with_metadata_dataset) {

  # create an empty output matrix to store the data
  # rows are named by the clades and columns by the samples
  output_table <-
    matrix(nrow = length(unique(clade_dataset$clade)),
           ncol = length(unique(vcf_with_metadata_dataset$sample)),
           dimnames = list(unique(clade_dataset$clade),
                           unique(vcf_with_metadata_dataset$sample)))

  # set up the iterator for columns (samples)
  col_num <- 0

  # iterature over each of the samples (columns) in the dataset
  for (this_sample in unique(vcf_with_metadata_dataset$sample)) {

    # subset out just the snps for this sample
    this_sample_snps <- vcf_with_metadata_dataset %>%
      filter(sample == this_sample) %>%
      select(pos, alt)

    # increment sample column to next position
    col_num <- col_num + 1

    # set up the iterators (needed to store into output matrix)
    row_num <- 0

    # iterate over each clade for this sample
    for (this_clade in unique(clade_dataset$clade)) {

      # subset out just the snps for this clade
      this_clade_snps <- clade_dataset %>%
        filter(clade == this_clade) %>%
        select(site, alt)

      # calculate the number of SNP locations shared between each sample
      # and each clade
      number_of_snp_loc_in_common <-
        dplyr::full_join(this_sample_snps,
                         this_clade_snps,
                         by = c("pos" = "site"),
                         suffix = c("_sample", "_clade")) %>%
        arrange(pos) %>%
        na.omit() %>%
        nrow()

      # increment the row (clade)
      row_num <- row_num + 1

      # store output in appropriate postition
      # the value stored is the porportion of snps in common over the total
      # number in the clade. The idea is that if this is high, then this
      # sample has a good number of the snps in this clade
      output_table[row_num, col_num] <-
        number_of_snp_loc_in_common / nrow(this_clade_snps)
    }
  }

  # return completed matrix
  return(output_table)
}
