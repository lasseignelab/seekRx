#' Parse LINCS level 3 LoF or OE Data
#' @description List of sample ID's from seek_ids() output is used to parse LINCS level 3 data for transcriptomic data and returns perturbation and control data as a list of two GCT objects
#'
#' @param ids output from seek_ids(), list of sample ID's for parsing gctx
#' @param gctx filepath to LINCS level 3 gctx (from GEO, GSE92742_Broad_LINCS_Level3_INF_mlr12k_n1319138x12328.gctx)
#'
#' @return perturbation and control data as a list of two GCT objects
#' @export
#'
#' @examples
seek_data <- function(ids, gctx) {
  pert_cids <- ids$pert_cids
  ctl_cids <- ids$ctl_cids
  #parse pert data
  pert_gct <- signatureSearch::parse_gctx(gctx, cid = pert_cids)
  ctl_gct <- signatureSearch::parse_gctx(gctx, cid = ctl_cids)
  gct_list <- list(pert_gct = pert_gct, ctl_gct = ctl_gct)
}
