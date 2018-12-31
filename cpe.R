#******************************************************************************#
#                                                                              #
#                          Lab 2 - CPE Standard                                #
#                                                                              #
#              Arnau Sangra Rocamora - Data Driven Securty                     #
#                                                                              #
#******************************************************************************#

#install.packages("xml2")
library(xml2)

# compressed_cpes_url <- "https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip"
# cpes_filename <- "cpes.zip"
# download.file(compressed_cpes_url, cpes_filename)
# unzip(zipfile = cpes_filename)
cpe.file <- "./official-cpe-dictionary_v2.3.xml"

DownloadCPEFile <- function()
{
  compressed_cpes_url <- "https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip"
  cpes_filename <- "cpes.zip"
  download.file(compressed_cpes_url, cpes_filename)
  unzip(zipfile = cpes_filename)
}


GetCPEItems <- function(cpes) {
  #cpe <- NewCPEItem()
  #cpe.raw <- xml2::read_xml(CPE_XMLfile)
  cpe.file <- "./official-cpe-dictionary_v2.3.xml"
  cpes <- xml2::read_xml(cpe.file)
  cpe.names <- xml2::xml_attr(xml2::xml_find_all(cpes, "//cpe-item"), "name")
  cpe.titles <- xml2::xml_text(xml2::xml_find_all(cpes,"//cpe-item/title"))
  cpe.cpe23names <- xml2::xml_attr(xml2::xml_find_all(cpes, "//cpe-item/cpe-23:cpe23-item"), "name")
  cpeItems <- data.frame(CPE_Name = cpe.names, CPE_Title = cpe.titles, CPE23_name = cpe.cpe23names)

  return(cpeItems)
  # transform the list to data frame

  # return data frame
}

CleanCPEs <- function(cpes){

  # data manipulation

  return(data.frame())
}

ParseCPEData <- function(cpe.file) {

  cpe.file <- "./official-cpe-dictionary_v2.3.xml"
  # load cpes as xml file
  cpes <- xml2::read_xml(x = cpe.file)
  cpes
  #valid <- xml2::xml_validate(cpes)

  # get CPEs
  cpes <- GetCPEItems(cpes)

  # transform, clean, arrange parsed cpes as data frame
  df <- CleanCPEs(cpes)

  # return data frame
  return(df)
}
