% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/seek_ids.R
\name{seek_ids}
\alias{seek_ids}
\title{LINCS LoF and OE Sample ID Finder}
\usage{
seek_ids(metadata, perturbagen, gene, cell_line)
}
\arguments{
\item{metadata}{object for LINCS metadata (from GEO, GSE92742_Broad_LINCS_sig_info.txt)}

\item{perturbagen}{shRNA Loss of Function = "trt_sh", Over Expression = "trt_oe"}

\item{gene}{gene symbol for Loss of Function or Over Expression}

\item{cell_line}{desired cell line for analysis (for full list of available cell lines for perturbation and gene of interest, see ...)}
}
\value{
A list of sample ID's for the desired data (as specified by the inputs) that corresponds to cid's of gctx to parse in desired data
}
\description{
seek_ids Pulls the sample id's for the desired data (as specified by inputs) + matched controls from LINCS metadata that can then be used as the cids to parse in transcriptome data from gctx
}
\examples{
seek_ids(lincs_meta, "trt_sh", "NF1", "HA1E")
}
