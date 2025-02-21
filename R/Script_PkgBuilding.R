library(devtools)
library(usethis)
library(broom)
library(tidyverse)
library(dplyr)
library(stringr)
library(signatureSearch)

#connect github
#usethis::use_git()
#usethis::use_github()

#first check
#devtools::check()

#add license, MIT license that's standard recommendation
#usethis::use_mit_license("Elizabeth Ramsey")

#crete seek_ids function
usethis::use_r("seek_ids")
devtools::load_all()

#read in metadata
lincs_meta <- read.delim("/Users/eramsey/Documents/CPAM_Phase2/CPAM_phase2/Input_Data/GSE92742_Broad_LINCS_sig_info.txt")
ids <- seek_ids(lincs_meta, "trt_sh", "NF1", "HA1E")
devtools::document()

#dependencies for seek_ids()
usethis::use_package("dplyr")
usethis::use_package("stringr")
usethis::use_pipe()  #for %>% pipe, creates utila-pipe.R
devtools::document()

#devtools::check()

#create seek_data function
usethis::use_r("seek_data")
usethis::use_package("signatureSearch")
gct <- seek_data(ids, "/Users/eramsey/Documents/CPAM_Phase2/CPAM_phase2/Input_Data/GSE92742_Broad_LINCS_Level3_INF_mlr12k_n1319138x12328.gctx")

#create datain function
usethis::use_r("datain_format")
#need to test out

#create sampleclass function
usethis::use_r("sampleclass_format")
#need to test out
devtools::load_all()
devtools::check()
