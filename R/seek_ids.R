#' LINCS LoF and OE Sample ID Finder
#' @description seek_ids Pulls the sample id's for the desired data (as specified by inputs) + matched controls from LINCS metadata that can then be used as the cids to parse in transcriptome data from gctx
#'
#' @param metadata object for LINCS metadata (from GEO, GSE92742_Broad_LINCS_sig_info.txt)
#' @param perturbagen shRNA Loss of Function = "trt_sh", Over Expression = "trt_oe"
#' @param gene gene symbol for Loss of Function or Over Expression
#' @param cell_line desired cell line for analysis (for full list of available cell lines for perturbation and gene of interest, see ...)
#'
#' @return A list of sample ID's for the desired data (as specified by the inputs) that corresponds to cid's of gctx to parse in desired data
#' @export
#'
#' @examples
#' seek_ids(lincs_meta, "trt_sh", "NF1", "HA1E")
seek_ids <- function(metadata, perturbagen, gene, cell_line) {
  meta_subset <- metadata %>% dplyr::filter(metadata, pert_type == perturbagen & pert_iname == gene & cell_id == cell_line)
  meta_subset <- meta_subset$distil_id
  sample_ids <- meta_subset %>% stringr::str_split(meta_subset, stringr::fixed(pattern = "|"), n = 3*length(.)) %>% unlist() %>% unique()
  #pert_gct <- parse_gctx(gctx_file, cid = sample_ids)

  #find matched controls
  ctl_ids <- sample_ids %>% stringr::str_sub(sample_ids, 1, 11) %>% unique()
  ctl_subset <- metadata %>% dplyr::filter(metadata, pert_type == "ctl_untrt")

  ctl_subset <- ctl_subset[grep(ctl_ids, ctl_subset$sig_id),]
  #find individual distil_id's to use as cids for parsing gctx's
  ctl_subset <- ctl_subset$distil_id
  ctl_ids <- ctl_subset %>% stringr::str_split(ctl_subset, stringr::fixed(pattern = "|")) %>% unlist() %>% unique()

  #combine the sample id's for perturbed and controls
  cidlist <- list(pert_cids = sample_ids, ctl_cids = ctl_ids)

  return(cidlist)
}
