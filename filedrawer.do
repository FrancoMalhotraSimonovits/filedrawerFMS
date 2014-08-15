********************************************
********************************************
* Publication Bias in the Social Sciences: Unlocking the File Drawer
* (Annie Franco, Neil Malhotra, Gabor Simonovits)
*********************************************
*********************************************
* REPLICATION CODE
**********************
**********************
* MAIN TEXT
**********************

** Table 1: Distribution of studies across years and disciplines

tab year discipline2

** Table 2. Cross-tabulation between statistical results of TESS studies and their publication status (full sample)

tab IV_all DV_all

** Table 3. Cross-tabulation between statistical results of TESS studies and their publication status (analysis sample)

tab DV IV, nof col chi


**********************
* SUPPLEMENTARY MATERIAL
**********************

** (see R-code for Figure 1 in filedrawer.R)

** Table S1: Distribution of published TESS experiments across disciplines

bysort journal_field: tab journal

** Table S2. Cross-tabulation between statistical results of TESS studies and their publication status conditional on existence of a written report

tab DV IV if written==1, nof col chi

** Table S3. Multinomial probit regressions predicting publication status as a function of strength of results, age of study, researcher quality, and discipline

xi: mprobit DV_tri   i.mixed i.null, base(1) r

prvalue , x (_Imixed_1=0 _Inull_1=0 ) 
prvalue , x (_Imixed_1=0 _Inull_1=1 ) 

xi: mprobit DV_tri  i.mixed i.null age_months max_h_current max_pub_attime POL PSY SOC, base(1) r

prvalue , x (_Imixed_1=0 _Inull_1=0 POL=1) rest (median)
prvalue , x (_Imixed_1=0 _Inull_1=1 POL=1) rest (median)


generate age_day_100 = age_day/100

** Table S4. Multinomial probit regressions predicting publication status and testing for conditional effects of strength of results by age of study and researcher quality

xi: mprobit DV_tri  i.mixed*age_day_100 i.null*age_day_100 max_h_current max_pub_attime POL PSY SOC, base(1) r
xi: mprobit DV_tri  i.mixed*max_h_current i.null*max_h_current age_day_100 max_pub_attime POL PSY SOC, base(1) r
xi: mprobit DV_tri  i.mixed*max_pub_attime i.null*max_pub_attime age_day_100 max_h_current POL PSY SOC, base(1) r

** Table S5. Cross-tabulation between statistical results of TESS studies and their publication status (by discipline).

tab DV IV if POL==1, nof col chi
tab DV IV if PSY==1, nof col chi
tab DV IV if SOC==1, nof col chi
tab DV IV if OTHER==1, nof col chi


** Table S7. Cross-tabulation between statistical results of TESS studies and their publication status (including book chapters)

tab DV_book_separate IV_all if IV_all!="Missing", nof col chi
tab DV_book_unpub IV_all if IV_all!="Missing", nof col chi
tab DV_book_nontop IV_all if IV_all!="Missing", nof col chi
tab DV_book_top IV_all if IV_all!="Missing", nof col chi





