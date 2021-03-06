# Copyright 2019 Battelle Memorial Institute; see the LICENSE file.

#' module_aglu_batch_land_input_5_IRR_MGMT_biochar_xml
#'
#' Construct XML data structure for \code{biochar_land_input_5_IRR_MGMT.xml}.
#'
#' @param command API command to execute
#' @param ... other optional parameters, depending on command
#' @return Depends on \code{command}: either a vector of required inputs,
#' a vector of output names, or (if \code{command} is "MAKE") all
#' the generated outputs: \code{biochar_land_input_5_IRR_MGMT.xml}. The corresponding file in the
#' original data system was \code{batch_biochar_land_input_5_IRR_MGMT.xml.R} (energy XML).
module_aglu_batch_land_input_5_IRR_MGMT_biochar_xml <- function(command, ...) {
  if(command == driver.DECLARE_INPUTS) {
    return(c("L2252.LN5_Logit", # Logit is at node level, so no change
             "L2221.LN5_HistMgdAllocation_crop_biochar",
             "L2221.LN5_HistMgdAllocation_bio_biochar",
             "L2221.LN5_MgdAllocation_crop_biochar",
             "L2221.LN5_MgdAllocation_bio_biochar",
             "L2221.LN5_MgdCarbon_crop_biochar",
             "L2221.LN5_MgdCarbon_bio_biochar",
             "L2221.LN5_LeafGhostShare",
             "L2221.LN5_LeafGhostShare_bio",
             "L2252.LN5_NodeGhostShare"))

  } else if(command == driver.DECLARE_OUTPUTS) {
    return(c(XML = "biochar_land_input_5_IRR_MGMT.xml"))
  } else if(command == driver.MAKE) {

    all_data <- list(...)[[1]]

    # Load required inputs
    L2252.LN5_Logit <- get_data(all_data, "L2252.LN5_Logit")
    L2221.LN5_HistMgdAllocation_crop_biochar <- get_data(all_data, "L2221.LN5_HistMgdAllocation_crop_biochar")
    L2221.LN5_HistMgdAllocation_bio_biochar <- get_data(all_data, "L2221.LN5_HistMgdAllocation_bio_biochar")
    L2221.LN5_MgdAllocation_crop_biochar <- get_data(all_data, "L2221.LN5_MgdAllocation_crop_biochar")
    L2221.LN5_MgdAllocation_bio_biochar <- get_data(all_data, "L2221.LN5_MgdAllocation_bio_biochar")
    L2221.LN5_MgdCarbon_crop_biochar <- get_data(all_data, "L2221.LN5_MgdCarbon_crop_biochar")
    L2221.LN5_MgdCarbon_bio_biochar <- get_data(all_data, "L2221.LN5_MgdCarbon_bio_biochar")
    L2221.LN5_LeafGhostShare <- get_data(all_data, "L2221.LN5_LeafGhostShare")
    L2221.LN5_LeafGhostShare_bio <- get_data(all_data, "L2221.LN5_LeafGhostShare_bio")
    L2252.LN5_NodeGhostShare <- get_data(all_data, "L2252.LN5_NodeGhostShare")

    # ===================================================

    # Produce outputs
    create_xml("biochar_land_input_5_IRR_MGMT.xml") %>%
      add_logit_tables_xml(L2252.LN5_Logit, "LN5_Logit") %>%
      add_xml_data(L2221.LN5_HistMgdAllocation_crop_biochar, "LN5_HistMgdAllocation") %>%
      add_xml_data(L2221.LN5_HistMgdAllocation_bio_biochar, "LN5_HistMgdAllocation") %>%
      add_xml_data(L2221.LN5_MgdAllocation_crop_biochar, "LN5_MgdAllocation") %>%
      add_xml_data(L2221.LN5_MgdAllocation_bio_biochar, "LN5_MgdAllocation") %>%
      add_xml_data(L2221.LN5_MgdCarbon_crop_biochar, "LN5_MgdCarbon") %>%
      add_xml_data(L2221.LN5_MgdCarbon_bio_biochar, "LN5_MgdCarbon") %>%
      add_xml_data(L2221.LN5_LeafGhostShare, "LN5_LeafGhostShare") %>%
      add_xml_data(L2221.LN5_LeafGhostShare_bio, "LN5_LeafGhostShare") %>%
      add_xml_data(L2252.LN5_NodeGhostShare, "LN5_NodeGhostShare") %>%
      add_rename_landnode_xml() %>%
      add_precursors("L2252.LN5_Logit",
                     "L2221.LN5_HistMgdAllocation_crop_biochar",
                     "L2221.LN5_HistMgdAllocation_bio_biochar",
                     "L2221.LN5_MgdAllocation_crop_biochar",
                     "L2221.LN5_MgdAllocation_bio_biochar",
                     "L2221.LN5_MgdCarbon_crop_biochar",
                     "L2221.LN5_MgdCarbon_bio_biochar",
                     "L2221.LN5_LeafGhostShare",
                     "L2221.LN5_LeafGhostShare_bio",
                     "L2252.LN5_NodeGhostShare") ->
      biochar_land_input_5_IRR_MGMT.xml

    return_data(biochar_land_input_5_IRR_MGMT.xml)
  } else {
    stop("Unknown command")
  }
}
