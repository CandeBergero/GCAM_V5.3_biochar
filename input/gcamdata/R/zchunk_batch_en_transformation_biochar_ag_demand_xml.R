# Copyright 2019 Battelle Memorial Institute; see the LICENSE file.

#' module_energy_batch_en_transformation_biochar_ag_demand_xml
#'
#' Construct XML data structure for \code{biochar_ag_demand.xml}.
#'
#' @param command API command to execute
#' @param ... other optional parameters, depending on command
#' @return Depends on \code{command}: either a vector of required inputs,
#' a vector of output names, or (if \code{command} is "MAKE") all
#' the generated outputs: \code{biochar_ag_demand.xml}. The corresponding file in the
#' original data system was \code{batch_biochar_ag_demand.xml.R} (energy XML).
module_energy_batch_en_transformation_biochar_ag_demand_xml <- function(command, ...) {
  if(command == driver.DECLARE_INPUTS) {
    return(c("L2221.AgCoef_Biochar_ag_irr_mgmt",
             "L2221.AgCost_Biochar_irr_mgmt_adj",
             "L2221.AgCoef_Biochar_bio_irr_mgmt",
             "L2221.AgCost_Biochar_irr_mgmt_adj_bio",
             "L2221.CarbonCoef"))

  } else if(command == driver.DECLARE_OUTPUTS) {
    return(c(XML = "biochar_ag_demand.xml"))
  } else if(command == driver.MAKE) {

    all_data <- list(...)[[1]]

    # Load required inputs
    L2221.AgCoef_Biochar_ag_irr_mgmt <- get_data(all_data, "L2221.AgCoef_Biochar_ag_irr_mgmt")
    L2221.AgCost_Biochar_irr_mgmt_adj <- get_data(all_data, "L2221.AgCost_Biochar_irr_mgmt_adj")
    L2221.AgCoef_Biochar_bio_irr_mgmt <- get_data(all_data, "L2221.AgCoef_Biochar_bio_irr_mgmt")
    L2221.AgCost_Biochar_irr_mgmt_adj_bio <- get_data(all_data, "L2221.AgCost_Biochar_irr_mgmt_adj_bio")
    L2221.CarbonCoef <- get_data(all_data, "L2221.CarbonCoef")

    # ===================================================

    # Produce outputs
    create_xml("biochar_ag_demand.xml") %>%
      add_xml_data(L2221.AgCoef_Biochar_ag_irr_mgmt, "AgCoef") %>%
      add_xml_data(L2221.AgCost_Biochar_irr_mgmt_adj, "AgCost") %>%
      add_xml_data(L2221.AgCoef_Biochar_bio_irr_mgmt, "AgCoef") %>%
      add_xml_data(L2221.AgCost_Biochar_irr_mgmt_adj_bio, "AgCost") %>%
      add_xml_data(L2221.CarbonCoef, "CarbonCoef") %>%
      add_precursors("L2221.AgCoef_Biochar_ag_irr_mgmt",
                     "L2221.AgCost_Biochar_irr_mgmt_adj",
                     "L2221.AgCoef_Biochar_bio_irr_mgmt",
                     "L2221.AgCost_Biochar_irr_mgmt_adj_bio",
                     "L2221.CarbonCoef") ->
      biochar_ag_demand.xml

    return_data(biochar_ag_demand.xml)
  } else {
    stop("Unknown command")
  }
}
