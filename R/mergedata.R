mergedata <- function(gct){
  ctl_mat <- as.data.frame(gct$ctl_gct@mat)
  pert_mat <- as.data.frame(gct$pert_gct@mat)
  #differentiate control vs pert
  colnames(ctl_mat) <- sub("^", "ctl_", colnames(ctl_mat))
  colnames(pert_mat) <- sub("^", "prt_", colnames(pert_mat))
  merged <- cbind(ctl_mat, pert_mat)
  return(merged)
}
