#' Create sampleclass format for GeoDE/Characteristic Direction Input
#' @description Output from seek_data is used to assign control vs perturbed factor levels for datain_format for GeoDE/Characteristic Direction differential expression analysis used in seek_DE()
#'
#' @param gct_list List of GCT objects returned from seek_data() function
#'
#' @return Factor assigning level 1 to control samples and 2 for perturbed samples to then be used with seek_DE()
#' @export
#'
#' @examples
sampleclass_format <- function(gct_list) {
  controlgct <- gct_list$ctl_gct
  pertgct <- gct_list$pert_gct
  contmat <- as.data.frame(controlgct@mat)
  pertmat <- as.data.frame(pertgct@mat)
  as.factor(c(rep("1", times = length(colnames(contmat))), rep("2", times = length(colnames(pertmat)))))
}
