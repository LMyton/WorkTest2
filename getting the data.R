# using library ROracle, MASS
library(ROracle)


# set the driver for Oracle
drv <-dbDriver("Oracle")

# set the connection (for ENGUA at the moment)
con <-dbConnect(drv, username ="app_owner", password = "lifted2343thoroughfare", dbname = "ENGUA")

#save the query results to july_cx_data
july_cx_datab <- dbGetQuery(con, "SELECT FLYDATA.REFDATE,DEP,CASE WHEN delay_code IN ('RTECH', 'TECH') THEN 'TECH' WHEN delay_code = 'WEAT' THEN 'WEAT' WHEN delay_code IN ('CREW', 'CABC', 'PILO') THEN 'CREW' ELSE 'OTHER'  END        delay_grouping  FROM FLYDATA, DELAY_DETAIL WHERE     FLYDATA.FLYDATA_ID = DELAY_DETAIL.FLYDATA_ID(+)       AND FLYDATA.REFDATE BETWEEN '01-jul-2015' AND '15-jul-2015'       AND FLYDATA.LEGTYPE = 'CX'       AND FLYDATA.LEGTYPE IS NOT NULL       AND FLYDATA.stc = 'J'       AND FLYDATA.AIRLINE = 'BE'")
