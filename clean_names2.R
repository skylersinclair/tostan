clean_names2 <- function(data){
  
  # Hacky fix until I think of something better?
  names(data)[names(data)=="carateristiques_enfants.tranche_age_fille.moins_de_5"] <- "age_fille_moins_de_5"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_fille.de_5_et_10"] <- "age_fille_de_5_et_10"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_fille.de_11_et_15"] <- "age_fille_de_11_et_15"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_fille.de_16_a_18"] <- "age_fille_de_16_a_18"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_fille.plus_de_18"] <- "age_fille_plus_de_18"
  
  names(data)[names(data)=="carateristiques_enfants.tranche_age_garcon.moins_de_5"] <- "age_garcon_moins_de_5"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_garcon.de_5_et_10"] <- "age_garcon_de_5_et_10"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_garcon.de_11_et_15"] <- "age_garcon_de_11_et_15"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_garcon.de_16_a_18"] <- "age_garcon_de_16_a_18"
  names(data)[names(data)=="carateristiques_enfants.tranche_age_garcon.plus_de_18"] <- "age_garcon_plus_de_18"
  
  names(data)[names(data)=="fixture_localization.departement"] <- "fixture_localization_department"
  names(data)[names(data)=="departement"] <- "department"
  
  names(data)[names(data)=="espacement_naissance.pratique_espacement.preciser_autre"] <- "pratique_espacement_preciser_autre"
  names(data)[names(data)=="classe_cgc.satisfaction_cgc.preciser_autre"] <- "satisfaction_cgc_preciser_autre"
  
  names(data)[names(data)=="hygiene_environnement.question53.other_give_details"] <- "question53_other_give_details"
  names(data)[names(data)=="hygiene_environnement.usage_of_latrines.other_give_details"] <- "usage_of_latrines_other_give_details"
  
  names(data)[names(data)=="caracteristiques_demographiques.niveau_etude_enquete.other"] <- "niveau_etude_enquete_other"
  names(data)[names(data)=="hygiene_environnement.question53.other"] <- "question53_other"
  names(data)[names(data)=="classe_cgc.education_part4.other"] <- "education_part4_other"
  names(data)[names(data)=="health.health_part21.other"] <- "health_part21_other"
  
  
  # Now we can remove all of the unecessary words before the last period of each variable name
  # Here .* means any number of characters and \\. means a period, so this says take all the characters
  # before the last period and change them to "" (delete them)
  names(data) <-  sub(".*\\.", "", names(data))
  names(data) <- make.names(names(data))
  
  # Note returns names(data), the variable assigned to on the last line of code
  
  #If want underscores rather than periods like make.names will do
  #names(data) <- sapply(str_extract_all(names(data),"[a-zA-Z0-9]{1,}"),paste,collapse='_')

  
}