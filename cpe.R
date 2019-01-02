#******************************************************************************#
#                                                                              #
#                          Lab 2 - CPE Standard                                #
#                                                                              #
#              Arnau Sangra Rocamora - Data Driven Securty                     #
#                                                                              #
#******************************************************************************#

library(xml2)


DownloadCPEFile <- function()
{
  compressed_cpes_url <- "https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip"
  cpes_filename <- "cpes.zip"
  download.file(compressed_cpes_url, cpes_filename)
  unzip(zipfile = cpes_filename)
  return("./official-cpe-dictionary_v2.3.xml")
}


GetCPEItems <- function(cpes) {
  cpe.raw <- xml_find_all(cpes, "//d1:cpe-item")
  cpe.titles <- xml_text(xml_find_all(cpe.raw, "./d1:title[@xml:lang='en-US']/text()"))
  cpe.names <- xml_text(xml_find_all(cpe.raw, "./@name"))
  cpe.cpe23names <- xml_text(xml_find_all(cpe.raw, "./cpe-23:cpe23-item/@name"))

  # transform the list to data frame
  cpeItems <- data.frame(CPE_Name = cpe.names, CPE_Title = cpe.titles, CPE23_name = cpe.cpe23names)

  # return data frame
  return(cpeItems)

}

CleanCPEs <- function(cpes){

  # data manipulation

  return(data.frame())
}

ParseCPEData <- function(cpe.file) {

  # load cpes as xml file
  cpes_fromfile <- xml2::read_xml(x = cpe.file)
  #valid <- xml2::xml_validate(cpes)

  # get CPEs
  cpes <- GetCPEItems(cpes_fromfile)


  # transform, clean, arrange parsed cpes as data frame
  #df <- CleanCPEs(cpes)

  # return data frame
  df <- cpes
  return(df)
}

### Main ---------------------------------------------------------------------------------------
file <- DownloadCPEFile()
ParseCPEData(file)
