#' Formatting GCT's for GeoDE/Characteristic Direction Input
#' @description Output from seek_data is used to format a dataframe of merged count tables for proper input for GeoDE/Characteristic Direction differential expression analysis used in seek_DE()
#'
#' @param gct_list List of GCT objects returned from seek_data() function
#'
#' @return Dataframe of countdata to then be used with seek_DE()
#' @export
#'
#' @examples
datain_format <- function(gct_list) {
  #gct_list <- list(pert_gct = pert_gct, ctl_gct = ctl_gct)
  controlgct <- gct_list$ctl_gct
  pertgct <- gct_list$pert_gct
  contmat <- as.data.frame(controlgct@mat)
  pertmat <- as.data.frame(pertgct@mat)
  matmerged <- merge(contmat, pertmat, by = 0)
  matmerged$Row.names <- as.factor(matmerged$Row.names)
  names(matmerged)[names(matmerged) == "Row.names"] <- "genenames"
  return(matmerged)
}
