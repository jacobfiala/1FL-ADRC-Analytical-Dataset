setwd("D:/OneDrive - University of Florida/School/Research/NACC Analytical Dataset/")
getwd()

################################################################################
######################## NACC Center Frozen Data ###############################
################################################################################
#Read in Data
NACC_FROZEN=read.csv("NACC Frozen.csv")

#Add labels
library(haven)
library(labelled)

#-------------------------------------------------------------------------------
### Core UDS and NACC Derived Variables (Researcher's Data Dictionary-UDS)
#-------------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
  ### Form Header
  #-----------------------------------------------------------------------------
  NACC_FROZEN$PTID=labelled_spss(NACC_FROZEN$PTID,label="Subject ID number")

  NACC_FROZEN$ADCID=labelled_spss(NACC_FROZEN$ADCID,c(
    "Boston University"=2,
    "Case Western University"=3,
    "Columbia University"=4,
    "Duke University"=5,
    "Emory University"=6,
    "Massachusetts ADRC"=7,
    "Indiana University"=8,
    "Johns Hopkins University"=9,
    "Mayo Clinic"=10,
    "Mount Sinai"=11,
    "New York University"=12,
    "Northwestern University"=13,
    "Oregon Health & Science University"=14,
    "Rush University"=15,
    "University of California, Davis"=16,
    "University of California, Los Angeles"=17,
    "University of California, San Diego"=18,
    "University of Kentucky"=19,
    "University of Michigan"=20,
    "University of Pennsylvania"=21,
    "University of Pittsburgh"=22,
    "University of Texas Southwestern"=25,
    "University of Washington"=26,
    "Washington University in St. Louis"=27,
    "University of Alabama"=28,
    "University of Southern California"=30,
    "University of California, Irvine"=31,
    "Stanford University"=32,
    "Arizona ADC"=33,
    "University of Arkansas"=34,
    "University of California, San Francisco"=35,
    "Florida ADC"=36,
    "University of Wisconsin"=37,
    "University of Kansas"=38,
    "Stanford University #2"=39,
    "Yale University"=40,
    "1Florida ADRC"=41,
    "Wake Forest University"=42,
    "University of Michigan ADC"=43
  ), label="ADC at which subject was seen")
  
  NACC_FROZEN$PACKET=factor(
    NACC_FROZEN$PACKET,
    levels = c("I","F","T"),
    labels=c("Initial Visit Packet", "Follow-up Visit Packet", "Telephone Visit Packet"),
    ordered = FALSE)
  
  table(NACC_FROZEN$PACKET)
  
  NACC_FROZEN$PACKET=labelled_spss(NACC_FROZEN$PACKET,c(
    "Initial Visit Packet"=1,
    "Follow-up Visit Packet"=2,
    "Telephone Visit Packet"=3
  ),label="Packet code")
  
  NACC_FROZEN$FORMVER=labelled_spss(NACC_FROZEN$FORMVER,c(
    "v1.2"=1,
    "v2"=2,
    "v3"=3
  ),label="Form version number")
  
  NACC_FROZEN$VISITMO=labelled_spss(NACC_FROZEN$VISITMO, label="Form date - month")
  
  NACC_FROZEN$VISITDAY=labelled_spss(NACC_FROZEN$VISITDAY, label="Form date - day")
  
  NACC_FROZEN$VISITYR=labelled_spss(NACC_FROZEN$VISITYR, label="Form date - year")
  
  NACC_FROZEN$NACCVNUM=labelled_spss(NACC_FROZEN$NACCVNUM, label="UDS visit number (order)")
  
  NACC_FROZEN$NACCAVST=labelled_spss(NACC_FROZEN$NACCAVST, label="Total number of all UDS visits made")
  
  NACC_FROZEN$NACCNVST=labelled_spss(NACC_FROZEN$NACCNVST, label="Total number of in-person UDS visits made")
  
  NACC_FROZEN$NACCDAYS=labelled_spss(NACC_FROZEN$NACCDAYS, label="Days from initial visit to most recent visit")
  
  NACC_FROZEN$NACCFDYS=labelled_spss(NACC_FROZEN$NACCFDYS, label="Days from initial visit to each follow-up visit")
  
  #-----------------------------------------------------------------------------
  ### Milestones
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$NACCDIED=labelled_spss(NACC_FROZEN$NACCDIED,c(
    "Not deceased/unknown"=0,
    "Deceased"=1
  ), label="Subject is known to be deceased")
  
  NACC_FROZEN$NACCMOD=labelled_spss(NACC_FROZEN$NACCMOD,c(
    "Not applicable, subject not deceased"=88,
    "Unknown"=99
  ), label="Month of death")
  
  NACC_FROZEN$NACCYOD=labelled_spss(NACC_FROZEN$NACCYOD,c(
    "Not applicable, subject not deceased"=8888,
    "Unknown"=9999
  ), label="Year of death")
  
  NACC_FROZEN$NACCACTV=labelled_spss(NACC_FROZEN$NACCACTV,c(
    "Died, discontinued, lost to follow-up"=0,
    "Annual follow-up (no discontinuation/loss to follow-up or minimal contact)"=1,
    "Minimal contact with Center, no annual follow-up"=2
  ), label="Follow-up status at the Alzheimer's Disease Center (ADC)")
  
  NACC_FROZEN$NACCNOVS=labelled_spss(NACC_FROZEN$NACCNOVS,c(
    "Still receiving annual follow-up in person or by telephone"=0,
    "No longer receiving annual follow-up in person or by telephone"=1,
    "Not applicable, enrolled for initial visit only"=8
  ), label="No longer followed annually in person or by telephone")
  
  NACC_FROZEN$NACCDSMO=labelled_spss(NACC_FROZEN$NACCDSMO,c(
    "Not applicable, still followed annually in person or by telephone"=88
  ), label="Month of discontinuation from annual follow-up")
  
  NACC_FROZEN$NACCDSDY=labelled_spss(NACC_FROZEN$NACCDSDY,c(
    "Not applicable, still followed annually in person or by telephone"=88
  ), label="Day of discontinuation from annual follow-up")
  
  NACC_FROZEN$NACCDSYR=labelled_spss(NACC_FROZEN$NACCDSYR,c(
    "Not applicable, still followed annually in person or by telephone"=8888
  ), label="Year of discontinuation from annual follow-up")
  
  NACC_FROZEN$NACCNURP=labelled_spss(NACC_FROZEN$NACCNURP,c(
    "Did not report permanent move to a nursing home"=0,
    "Permanently moved to a nursing home"=1
  ), label="Permanently moved to a nursing home")
  
  NACC_FROZEN$NACCNRMO=labelled_spss(NACC_FROZEN$NACCNRMO,c(
    "Not applicable, no permanent move to a nursing home"=88,
    "Unknown"=99
  ), label="Month permanently moved to nursing home")
  
  NACC_FROZEN$NACCNRDY=labelled_spss(NACC_FROZEN$NACCNRDY,c(
    "Not applicable, no permanent move to a nursing home"=88,
    "Unknown"=99
  ), label="Day permanently moved to nursing home")
  
  NACC_FROZEN$NACCNRYR=labelled_spss(NACC_FROZEN$NACCNRYR,c(
    "Not applicable, no permanent move to a nursing home"=8888,
    "Unknown"=9999
  ), label="Year permanently moved to nursing home")
  
  NACC_FROZEN$NACCMDSS=labelled_spss(NACC_FROZEN$NACCMDSS,c(
    "In the UDS and MDS"=1,
    "In the MDS only"=2,
    "In the UDS only"=3
  ), label="Subject's status in the Minimal Data Set (MDS) and Uniform Data Set (UDS)")
  
  NACC_FROZEN$NACCPAFF=labelled_spss(NACC_FROZEN$NACCPAFF,c(
    "Not previously affiliated subject"=0,
    "Previously affiliated subject"=1
  ), label="Previously affiliated subject")

  #-----------------------------------------------------------------------------
  ### A1 Subject Demographics
  #-----------------------------------------------------------------------------  
  
  NACC_FROZEN$NACCREAS=labelled_spss(NACC_FROZEN$NACCREAS,c(
    "To participate in a research study"=1,
    "To have a clinical evaluation"=2,
    "Both to participate in a research study and to have a clinical evaluation, or another reason"=7,
    "Unknown"=9,
    "Not available"=-4
  ), label="Primary reason for coming to ADC")
  
  NACC_FROZEN$NACCREFR=labelled_spss(NACC_FROZEN$NACCREFR,labels=c(
    'Non-professional contact: self,relative, or friend'=1,
    'Professional contact: clinician, nurse, doctor, other health care provider, or other staff (ADC and non-ADC)'=2,
    'Other'=8,
    'Unknown'=9,
    'Not available'=-4),label="Principal referral source")
  
  NACC_FROZEN$BIRTHMO=labelled_spss(NACC_FROZEN$BIRTHMO, label="Subject's month of birth")
  
  NACC_FROZEN$BIRTHYR=labelled_spss(NACC_FROZEN$BIRTHYR, label="Subject's year of birth")
  
  NACC_FROZEN$SEX=labelled_spss(NACC_FROZEN$SEX,c(
    "Male"=1,
    "Female"=2
  ), label="Subject's sex")
  
  NACC_FROZEN$HISPANIC=labelled_spss(NACC_FROZEN$HISPANIC,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Hispanic/Latino ethnicity")
  
  NACC_FROZEN$HISPOR=labelled_spss(NACC_FROZEN$HISPOR,c(
    "Mexican, Chicano, or Mexican-American"=1,
    "Puerto Rican"=2,
    "Cuban"=3,
    "Dominican"=4,
    "Central American"=5,
    "South American"=6,
    "Other (specify)"=50,
    "Not applicable; subject is not Hispanic"=88,
    "Unknown"=99,
    "Not available"=-4
  ), label="Hispanic origins")
  
  NACC_FROZEN$HISPORX=labelled_spss(NACC_FROZEN$HISPORX, label="Hispanic origins, other €“ specify")
  
  NACC_FROZEN$RACE=labelled_spss(NACC_FROZEN$RACE,c(
    "White"=1,
    "Black or African American"=2,
    "American Indian or Alaska Native"=3,
    "Native Hawaiian or Other Pacific Islander"=4,
    "Asian"=5,
    "Other (specify)"=50,
    "Unknown"=99
  ), label="Race")
  
  NACC_FROZEN$RACEX=labelled_spss(NACC_FROZEN$RACEX, label="Race, other - specify")
  
  NACC_FROZEN$RACESEC=labelled_spss(NACC_FROZEN$RACESEC,c(
    "White"=1,
    "Black or African American"=2,
    "American Indian or Alaska Native"=3,
    "Native Hawaiian or Other Pacific Islander"=4,
    "Asian"=5,
    "Other (specify)"=50,
    "None reported"=88,
    "Unknown"=99
  ), label="Second race")
  
  NACC_FROZEN$RACESECX=labelled_spss(NACC_FROZEN$RACESECX, label="Second race, other- specify")
  
  NACC_FROZEN$RACETER=labelled_spss(NACC_FROZEN$RACETER,c(
    "White"=1,
    "Black or African American"=2,
    "American Indian or Alaska Native"=3,
    "Native Hawaiian or Other Pacific Islander"=4,
    "Asian"=5,
    "Other (specify)"=50,
    "None reported"=88,
    "Unknown"=99
  ), label="Third race")
  
  NACC_FROZEN$RACETERX=as.character(NACC_FROZEN$RACETERX)
  NACC_FROZEN$RACETERX=labelled_spss(NACC_FROZEN$RACETERX, label="Third race, other- specify")
  
  NACC_FROZEN$PRIMLANG=labelled_spss(NACC_FROZEN$PRIMLANG,c(
    "English"=1,
    "Spanish"=2,
    "Mandarin"=3,
    "Cantonese"=4,
    "Russian"=5,
    "Japanese"=6,
    "Other primary language (specify)"=8,
    "Unknown"=9
  ), label="Primary language")
  
  NACC_FROZEN$PRIMLANX=labelled_spss(NACC_FROZEN$PRIMLANX, label="Primary language, other- specify")
  
  NACC_FROZEN$EDUC=labelled_spss(NACC_FROZEN$EDUC,c(
    "Unknown"=99
  ), label="Years of education")
  
  NACC_FROZEN$MARISTAT=labelled_spss(NACC_FROZEN$MARISTAT,c(
    "Married"=1,
    "Widowed"=2,
    "Divorced"=3,
    "Separated"=4,
    "Never married (or marriage was annulled)"=5,
    "Living as married/domestic partner"=6,
    "Other or unknown"=9
  ), label="Marital status")
  
  NACC_FROZEN$NACCLIVS=labelled_spss(NACC_FROZEN$NACCLIVS,c(
    "Lives alone"=1,
    "Lives with spouse or partner"=2,
    "Lives with relative or friend"=3,
    "Lives with group"=4,
    "Other"=5,
    "Unknown"=9
  ), label="Living situation")
  
  NACC_FROZEN$INDEPEND=labelled_spss(NACC_FROZEN$INDEPEND,c(
    "Able to live independently"=1,
    "Requires some assistance with complex activities"=2,
    "Requires some assistance with basic activities"=3,
    "Completely dependent"=4,
    "Unknown"=9
  ), label="Level of independence")
  
  NACC_FROZEN$RESIDENC=labelled_spss(NACC_FROZEN$RESIDENC,c(
    "Single- or multi-family private residence (apartment, condo, house)"=1,
    "Retirement community or independent group living"=2,
    "Assisted living, adult family home, or boarding home"=3,
    "Skilled nursing facility, nursing home, hospital, or hospice"=4,
    "Other or unknown"=9
  ), label="Type of residence")
  
  NACC_FROZEN$HANDED=labelled_spss(NACC_FROZEN$HANDED,c(
    "Left-handed"=1,
    "Right-handed"=2,
    "Ambidextrous"=3,
    "Unknown"=9
  ), label="Is the subject left- or right-handed?")
  
  
  NACC_FROZEN$MARISTAX=labelled_spss(NACC_FROZEN$MARISTAX,label="Marital status, other- specify")
  
  NACC_FROZEN$RESIDENX=labelled_spss(NACC_FROZEN$RESIDENX, label="Type of residence, other- specify")
  
  NACC_FROZEN$NACCAGE=labelled_spss(NACC_FROZEN$NACCAGE, label="Subject's age at visit")
  
  NACC_FROZEN$NACCAGEB=labelled_spss(NACC_FROZEN$NACCAGEB, label="Subject's age at initial visit")
  
  
  NACC_FROZEN$NACCNINR=labelled_spss(NACC_FROZEN$NACCNINR,c(
    "White"=1,
    "Black or African American"=2,
    "American Indian or Alaska Native"=3,
    "Native Hawaiian or Pacific Islander"=4,
    "Asian"=5,
    "Multiracial"=6,
    "Unknown or ambiguous"=99,
    "Not Available"=-4
  ), label="Derived NIH race definitions")

  #-----------------------------------------------------------------------------
  ### A2 Co-participant Demographics
  #----------------------------------------------------------------------------- 
  
  NACC_FROZEN$INBIRMO=labelled_spss(NACC_FROZEN$INBIRMO,c(
    "Unknown"=99,
    "Not available"=-4
  ), label="Co-participant's month of birth")
  
  NACC_FROZEN$INBIRYR=labelled_spss(NACC_FROZEN$INBIRYR,c(
  "Unknown"=9999,
  "Not available"=-4
  ), label="Co-participant's year of birth")
    
    NACC_FROZEN$INSEX=labelled_spss(NACC_FROZEN$INSEX,c(
      "Male"=1,
      "Female"=2,
      "Not available"=-4
    ), label="Co-participant's sex")
  
  NACC_FROZEN$NEWINF=labelled_spss(NACC_FROZEN$NEWINF,c(
  "No"=0,
  "Yes"=1,
  "Not available"=-4
  ), label="Is this a new co-participant - i.e., one who was not a co-participant at any past UDS visit?")
    
    NACC_FROZEN$INHISP=labelled_spss(NACC_FROZEN$INHISP,c(
      "No"=0,
      "Yes"=1,
      "Unknown"=9,
      "Not available"=-4
    ), label="Co-participant Hispanic/Latino ethnicity")
  
  NACC_FROZEN$INHISPOR=labelled_spss(NACC_FROZEN$INHISPOR,c(
  "Mexican, Chicano, or Mexican-American"=1,
  "Puerto Rican"=2,
  "Cuban"=3,
  "Dominican"=4,
  "Central American"=5,
  "South American"=6,
  "Other (specify)"=50,
  "Not applicable, co-participant is not Hispanic"=88,
  "Unknown"=99,
  "Not available"=-4
  ), label="Co-participant's Hispanic origins")
    
  NACC_FROZEN$INHISPOX=labelled_spss(NACC_FROZEN$INHISPOX, label="Co-participant of Hispanic origins, other (specify)")
  
  NACC_FROZEN$INRACE=labelled_spss(NACC_FROZEN$INRACE,c(
  "White"=1,
  "Black or African American"=2,
  "American Indian or Alaska Native"=3,
  "Native Hawaiian or Other Pacific Islander"=4,
  "Asian"=5,
  "Other"=50,
  "None reported"=88,
  "Unknown"=99,
  "Not available"=-4
  ), label="Co-participant race")
    
  NACC_FROZEN$INRACEX=labelled_spss(NACC_FROZEN$INRACEX, label="Co-participant race, other (specify)")
  
  NACC_FROZEN$INRASEC=labelled_spss(NACC_FROZEN$INRASEC,c(
  "White"=1,
  "Black or African American"=2,
  "American Indian or Alaska Native"=3,
  "Native Hawaiian or Other Pacific Islander"=4,
  "Asian"=5,
  "Other"=50,
  "None reported"=88,
  "Unknown"=99,
  "Not available"=-4
  ), label="Co-participant second race")
    
  NACC_FROZEN$INRASECX=as.character(NACC_FROZEN$INRASECX)
  NACC_FROZEN$INRASECX=labelled_spss(NACC_FROZEN$INRASECX, label="Co-participant second race, other (specify)")
  
  NACC_FROZEN$INRATER=labelled_spss(NACC_FROZEN$INRATER,c(
  "White"=1,
  "Black or African American"=2,
  "American Indian or Alaska Native"=3,
  "Native Hawaiian or Other Pacific Islander"=4,
  "Asian"=5,
  "Other"=50,
  "None reported"=88,
  "Unknown"=99,
  "Not available"=-4
  ), label="Co-participant third race")
    
  NACC_FROZEN$INRATERX=as.character(NACC_FROZEN$INRATERX)
  NACC_FROZEN$INRATERX=labelled_spss(NACC_FROZEN$INRATERX, label="Co-participant third race, other (specify)")
  
  NACC_FROZEN$INEDUC=labelled_spss(NACC_FROZEN$INEDUC,c(
  "Unknown"=99,
  "Not available"=-4
  ), label="Co-participant's years of education")
    
  NACC_FROZEN$INRELTO=labelled_spss(NACC_FROZEN$INRELTO,c(
    "Spouse, partner, or companion"=1,
    "Child"=2,
    "Sibling"=3,
    "Other relative"=4,
    "Friend, neighbor, or someone known through family, friends, work, or community"=5,
    "Paid caregiver, health care provider, or clinician"=6,
    "Other"=7,
    "Not available"=-4
  ), label="Co-participant's relationship to subject")
  
  NACC_FROZEN$INRELTOX=labelled_spss(NACC_FROZEN$INRELTOX, label="Co-participant relationship, other (specify)")
    
  NACC_FROZEN$INKNOWN=labelled_spss(NACC_FROZEN$INKNOWN,c(
    "Unknown"=999,
    "Not available"=-4
  ), label="How long has the co-participant known the subject?")
  
  NACC_FROZEN$INLIVWTH=labelled_spss(NACC_FROZEN$INLIVWTH,c(
  "No"=0,
  "Yes"=1,
  "Not available"=-4
  ), label="Does the co-participant live with the subject?")
    
  NACC_FROZEN$INVISITS=labelled_spss(NACC_FROZEN$INVISITS,c(
    "Daily"=1,
    "At least 3 times per week"=2,
    "Weekly"=3,
    "At least 3 times per month"=4,
    "Monthly"=5,
    "Less than once a month"=6,
    "Not applicable, co-participant lives with subject"=8,
    "Not available"=-4
  ), label="If no, approximate frequency of in-person visits?")
  
  NACC_FROZEN$INCALLS=labelled_spss(NACC_FROZEN$INCALLS,c(
  "Daily"=1,
  "At least 3 times per week"=2,
  "Weekly"=3,
  "At least 3 times per month"=4,
  "Monthly"=5,
  "Less than once a month"=6,
  "Not applicable, co-participant lives with subject"=8,
  "Not available"=-4
  ), label="If no, approximate frequency of telephone contact?")
    
  NACC_FROZEN$INRELY=labelled_spss(NACC_FROZEN$INRELY,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Is there a question about the co-participant's reliability?")
  
  NACC_FROZEN$NACCNIHR=labelled_spss(NACC_FROZEN$NACCNIHR,c(
  "White"=1,
  "Black or African American"=2,
  "American Indian or Alaska Native"=3,
  "Native Hawaiian or Pacific Islander"=4,
  "Asian"=5,
  "Multiracial"=6,
  "Unknown or ambiguous"=99,
  "Not available"=-4
  ), label="Derived NIH race definitions Indicator of first-degree family member")

  #-----------------------------------------------------------------------------
  ### A3 Subject Family History
  #----------------------------------------------------------------------------- 
  
  NACC_FROZEN$NACCFAM=labelled_spss(NACC_FROZEN$NACCFAM,c(
    "No report of a first-degree family member with cognitive impairment"=0,
    "Report of at least one first-degree family member with cognitive impairment"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Indicator of first-degree family member with cognitive impairment")
  
  NACC_FROZEN$NACCMOM=labelled_spss(NACC_FROZEN$NACCMOM,c(
    "No report of mother with cognitive  impairment"=0,
    "Mother was reported to have cognitive impairment"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Indicator of mother with cognitive impairment")
  
  NACC_FROZEN$NACCDAD=labelled_spss(NACC_FROZEN$NACCDAD,c(
    "No report of father with cognitive impairment"=0,
    "Father was reported to have cognitive impairment"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Indicator of father with cognitive impairment")
  
  NACC_FROZEN$NACCFADM=labelled_spss(NACC_FROZEN$NACCFADM,c(
    "No/unknown"=0,
    "Yes"=1
  ), label="In this family, is there evidence of adominantly inherited AD mutation?")
  
  NACC_FROZEN$NACCAM=labelled_spss(NACC_FROZEN$NACCAM,c(
    "No"=0,
    "Yes, APP"=1,
    "Yes, PS-1 (PSEN-1)"=2,
    "Yes, PS-2 (PSEN-2)"=3,
    "Yes, other (specify)"=8,
    "Unknown whether mutation exists"=9,
    "Not available"=-4
  ), label="In this family, is there evidence for an AD mutation (from list of specific mutations)?")
  
  NACC_FROZEN$NACCAMX=labelled_spss(NACC_FROZEN$NACCAMX, label="If yes, Other (specify)")
  
  NACC_FROZEN$NACCAMS=labelled_spss(NACC_FROZEN$NACCAMS,c(
    "Family report (no test documentation  available)"=1,
    "Commercial test documentation"=2,
    "Research lab test documentation"=3,
    "Other (specify)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Source of evidence for AD mutation")
  
  NACC_FROZEN$NACCAMSX=labelled_spss(NACC_FROZEN$NACCAMSX, label="If other, specify")
  
  NACC_FROZEN$NACCFFTD=labelled_spss(NACC_FROZEN$NACCFFTD,c(
    "No/unknown"=0,
    "Yes"=1
  ), label="In this family, is there evidence for an FTLD mutation?")
  
  NACC_FROZEN$NACCFM=labelled_spss(NACC_FROZEN$NACCFM,c(
    "No"=0,
    "Yes, MAPT"=1,
    "Yes, PGRN"=2,
    "Yes, C9orf72"=3,
    "Yes, FUS"=4,
    "Yes, Other (specify)"=8,
    "Unknown whether mutation exists"=9,
    "Not available"=-4
  ), label="In this family, is there evidence for an FTLD mutation (from list of specific mutations)?")
  
  NACC_FROZEN$NACCFMX=labelled_spss(NACC_FROZEN$NACCFMX, label="If yes, Other (specify)")
  
  NACC_FROZEN$NACCFMS=labelled_spss(NACC_FROZEN$NACCFMS,c(
    "Family report (no test documentation available)"=1,
    "Commercial test documentation"=2,
    "Research lab test documentation"=3,
    "Other (specify)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Source of evidence for FTLD mutation")
  
  NACC_FROZEN$NACCFMSX=labelled_spss(NACC_FROZEN$NACCFMSX, label="If other, specify")
  
  NACC_FROZEN$NACCOM=labelled_spss(NACC_FROZEN$NACCOM,c(
    "No"=0,
    "Yes (specify)"=1,
    "Unknown whether mutation exists"=9,
    "Not available"=-4
  ), label="In this family, is there evidence for a mutation other than an AD or FTLD mutation?")
  
  NACC_FROZEN$NACCOMX=labelled_spss(NACC_FROZEN$NACCOMX, label="Specified other mutation")
  
  NACC_FROZEN$NACCOMS=labelled_spss(NACC_FROZEN$NACCOMS,c(
    "Family report (no test documentation  available)"=1,
    "Commercial test documentation"=2,
    "Research lab test documentation"=3,
    "Other (specify)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Source of evidence for other mutation")
  
  NACC_FROZEN$NACCOMSX=labelled_spss(NACC_FROZEN$NACCOMSX, label="If other, specify")

  #-----------------------------------------------------------------------------
  ### A4 Subject Medications
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$ANYMEDS=labelled_spss(NACC_FROZEN$ANYMEDS,labels=c(
    "No"= 0,
    "Yes"= 1,
    "Did not complete medications form"= -4
  ),label="Subject taking any medications")
  
  NACC_FROZEN$DRUG1=as.character(NACC_FROZEN$DRUG1)
  NACC_FROZEN$DRUG2=as.character(NACC_FROZEN$DRUG2)
  NACC_FROZEN$DRUG3=as.character(NACC_FROZEN$DRUG3)
  NACC_FROZEN$DRUG4=as.character(NACC_FROZEN$DRUG4)
  NACC_FROZEN$DRUG5=as.character(NACC_FROZEN$DRUG5)
  NACC_FROZEN$DRUG6=as.character(NACC_FROZEN$DRUG6)
  NACC_FROZEN$DRUG7=as.character(NACC_FROZEN$DRUG7)
  NACC_FROZEN$DRUG8=as.character(NACC_FROZEN$DRUG8)
  NACC_FROZEN$DRUG9=as.character(NACC_FROZEN$DRUG9)
  NACC_FROZEN$DRUG10=as.character(NACC_FROZEN$DRUG10)
  NACC_FROZEN$DRUG11=as.character(NACC_FROZEN$DRUG11)
  NACC_FROZEN$DRUG12=as.character(NACC_FROZEN$DRUG12)
  NACC_FROZEN$DRUG13=as.character(NACC_FROZEN$DRUG13)
  NACC_FROZEN$DRUG14=as.character(NACC_FROZEN$DRUG14)
  NACC_FROZEN$DRUG15=as.character(NACC_FROZEN$DRUG15)
  NACC_FROZEN$DRUG16=as.character(NACC_FROZEN$DRUG16)
  NACC_FROZEN$DRUG17=as.character(NACC_FROZEN$DRUG17)
  NACC_FROZEN$DRUG18=as.character(NACC_FROZEN$DRUG18)
  NACC_FROZEN$DRUG19=as.character(NACC_FROZEN$DRUG19)
  NACC_FROZEN$DRUG20=as.character(NACC_FROZEN$DRUG20)
  NACC_FROZEN$DRUG21=as.character(NACC_FROZEN$DRUG21)
  NACC_FROZEN$DRUG22=as.character(NACC_FROZEN$DRUG22)
  NACC_FROZEN$DRUG23=as.character(NACC_FROZEN$DRUG23)
  NACC_FROZEN$DRUG24=as.character(NACC_FROZEN$DRUG24)
  NACC_FROZEN$DRUG25=as.character(NACC_FROZEN$DRUG25)
  NACC_FROZEN$DRUG26=as.character(NACC_FROZEN$DRUG26)
  NACC_FROZEN$DRUG27=as.character(NACC_FROZEN$DRUG27)
  NACC_FROZEN$DRUG28=as.character(NACC_FROZEN$DRUG28)
  NACC_FROZEN$DRUG29=as.character(NACC_FROZEN$DRUG29)
  NACC_FROZEN$DRUG30=as.character(NACC_FROZEN$DRUG30)
  NACC_FROZEN$DRUG31=as.character(NACC_FROZEN$DRUG31)
  NACC_FROZEN$DRUG32=as.character(NACC_FROZEN$DRUG32)
  NACC_FROZEN$DRUG33=as.character(NACC_FROZEN$DRUG33)
  NACC_FROZEN$DRUG34=as.character(NACC_FROZEN$DRUG34)
  NACC_FROZEN$DRUG35=as.character(NACC_FROZEN$DRUG35)
  NACC_FROZEN$DRUG36=as.character(NACC_FROZEN$DRUG36)
  NACC_FROZEN$DRUG37=as.character(NACC_FROZEN$DRUG37)
  NACC_FROZEN$DRUG38=as.character(NACC_FROZEN$DRUG38)
  NACC_FROZEN$DRUG39=as.character(NACC_FROZEN$DRUG39)
  NACC_FROZEN$DRUG40=as.character(NACC_FROZEN$DRUG40)
  
  NACC_FROZEN$DRUG1=labelled_spss(NACC_FROZEN$DRUG1, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG2=labelled_spss(NACC_FROZEN$DRUG2, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG3=labelled_spss(NACC_FROZEN$DRUG3, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG4=labelled_spss(NACC_FROZEN$DRUG4, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG5=labelled_spss(NACC_FROZEN$DRUG5, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG6=labelled_spss(NACC_FROZEN$DRUG6, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG7=labelled_spss(NACC_FROZEN$DRUG7, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG8=labelled_spss(NACC_FROZEN$DRUG8, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG9=labelled_spss(NACC_FROZEN$DRUG9, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG10=labelled_spss(NACC_FROZEN$DRUG10, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG11=labelled_spss(NACC_FROZEN$DRUG11, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG12=labelled_spss(NACC_FROZEN$DRUG12, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG13=labelled_spss(NACC_FROZEN$DRUG13, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG14=labelled_spss(NACC_FROZEN$DRUG14, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG15=labelled_spss(NACC_FROZEN$DRUG15, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG16=labelled_spss(NACC_FROZEN$DRUG16, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG17=labelled_spss(NACC_FROZEN$DRUG17, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG18=labelled_spss(NACC_FROZEN$DRUG18, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG19=labelled_spss(NACC_FROZEN$DRUG19, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG20=labelled_spss(NACC_FROZEN$DRUG20, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG21=labelled_spss(NACC_FROZEN$DRUG21, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG22=labelled_spss(NACC_FROZEN$DRUG22, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG23=labelled_spss(NACC_FROZEN$DRUG23, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG24=labelled_spss(NACC_FROZEN$DRUG24, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG25=labelled_spss(NACC_FROZEN$DRUG25, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG26=labelled_spss(NACC_FROZEN$DRUG26, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG27=labelled_spss(NACC_FROZEN$DRUG27, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG28=labelled_spss(NACC_FROZEN$DRUG28, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG29=labelled_spss(NACC_FROZEN$DRUG29, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG30=labelled_spss(NACC_FROZEN$DRUG30, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG31=labelled_spss(NACC_FROZEN$DRUG31, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG32=labelled_spss(NACC_FROZEN$DRUG32, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG33=labelled_spss(NACC_FROZEN$DRUG33, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG34=labelled_spss(NACC_FROZEN$DRUG34, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG35=labelled_spss(NACC_FROZEN$DRUG35, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG36=labelled_spss(NACC_FROZEN$DRUG36, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG37=labelled_spss(NACC_FROZEN$DRUG37, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG38=labelled_spss(NACC_FROZEN$DRUG38, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG39=labelled_spss(NACC_FROZEN$DRUG39, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$DRUG40=labelled_spss(NACC_FROZEN$DRUG40, label="Name of medications used within two weeks of UDS visit")
  
  NACC_FROZEN$NACCAMD=labelled_spss(NACC_FROZEN$NACCAMD,c(
    "Did not complete medications form"=-4
  ), label="Total number of medications reported at each visit")
  
  NACC_FROZEN$NACCAHTN=labelled_spss(NACC_FROZEN$NACCAHTN,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of any type of antihypertensive or blood pressure medication")
  
  NACC_FROZEN$NACCHTNC=labelled_spss(NACC_FROZEN$NACCHTNC,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an antihypertensive combination therapy")
  
  NACC_FROZEN$NACCACEI=labelled_spss(NACC_FROZEN$NACCACEI,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an angiotensin converting enzyme (ACE) inhibitor")
  
  NACC_FROZEN$NACCAAAS=labelled_spss(NACC_FROZEN$NACCAAAS,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an antiadrenergic agent")
  
  NACC_FROZEN$NACCBETA=labelled_spss(NACC_FROZEN$NACCBETA,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of a beta-adrenergic blocking agent (Beta-Blocker)")
  
  NACC_FROZEN$NACCCCBS=labelled_spss(NACC_FROZEN$NACCCCBS,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of a calcium channel blocking agent")
  
  NACC_FROZEN$NACCDIUR=labelled_spss(NACC_FROZEN$NACCDIUR,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of a diuretic")
  
  NACC_FROZEN$NACCVASD=labelled_spss(NACC_FROZEN$NACCVASD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of a vasodilator")
  
  NACC_FROZEN$NACCANGI=labelled_spss(NACC_FROZEN$NACCANGI,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an angiotensin II inhibitor")
  
  NACC_FROZEN$NACCLIPL=labelled_spss(NACC_FROZEN$NACCLIPL,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of lipid lowering medication")
  
  NACC_FROZEN$NACCNSD=labelled_spss(NACC_FROZEN$NACCNSD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of nonsteroidal anti-inflammatory medication")
  
  NACC_FROZEN$NACCAC=labelled_spss(NACC_FROZEN$NACCAC,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an anticoagulant or antiplatelet agent")
  
  NACC_FROZEN$NACCADEP=labelled_spss(NACC_FROZEN$NACCADEP,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an antidepressant")
  
  NACC_FROZEN$NACCAPSY=labelled_spss(NACC_FROZEN$NACCAPSY,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an antipsychotic agent")
  
  NACC_FROZEN$NACCAANX=labelled_spss(NACC_FROZEN$NACCAANX,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an anxiolytic, sedative, or hypnotic agent")
  
  NACC_FROZEN$NACCADMD=labelled_spss(NACC_FROZEN$NACCADMD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of a FDA-approved medication for Alzheimer's disease symptoms")
  
  NACC_FROZEN$NACCPDMD=labelled_spss(NACC_FROZEN$NACCPDMD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of an antiparkinson agent")
  
  NACC_FROZEN$NACCEMD=labelled_spss(NACC_FROZEN$NACCEMD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of estrogen hormone therapy")
  
  NACC_FROZEN$NACCEPMD=labelled_spss(NACC_FROZEN$NACCEPMD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of estrogen + progestin hormone therapy")
  
  NACC_FROZEN$NACCDBMD=labelled_spss(NACC_FROZEN$NACCDBMD,c(
    "Did not report use at visit"=0,
    "Reported use at visit"=1,
    "Did not complete medications form"=-4
  ), label="Reported current use of a diabetes medication")
  
  #-----------------------------------------------------------------------------
  ### A5 Subject Health History
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$TOBAC30=labelled_spss(NACC_FROZEN$TOBAC30,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Smoked cigarettes in last 30 days")
  
  NACC_FROZEN$TOBAC100=labelled_spss(NACC_FROZEN$TOBAC100,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Smoked more than 100 cigarettes in life")
  
  NACC_FROZEN$SMOKYRS=labelled_spss(NACC_FROZEN$SMOKYRS,c(
    "Not applicable"=88,
    "Unknown"=99,
    "Not available"=-4
  ), label="Total years smoked cigarettes")
  
  NACC_FROZEN$PACKSPER=labelled_spss(NACC_FROZEN$PACKSPER,c(
    "No reported cigarette use"=0,
    "1 cigarette to less than 1/2 pack"=1,
    "½ pack to less than 1 pack"=2,
    "1 pack to 1½ packs"=3,
    "1½ packs to 2 packs"=4,
    "More than two packs"=5,
    "Not applicable"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Average number of packs smoked per day")
  
  NACC_FROZEN$QUITSMOK=labelled_spss(NACC_FROZEN$QUITSMOK,c(
    "Not applicable, no significant smoking history"=888,
    "Unknown"=999,
    "Not available"=-4
  ), label="If the subject quit smoking, age at which he/she last smoked (i.e., quit)")
  
  NACC_FROZEN$ALCOCCAS=labelled_spss(NACC_FROZEN$ALCOCCAS,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past three months, has the subject consumed any alcohol?")
  
  NACC_FROZEN$ALCFREQ=labelled_spss(NACC_FROZEN$ALCFREQ,c(
    "Less than once a month"=0,
    "About once a month"=1,
    "About once a week"=2,
    "A few times a week"=3,
    "Daily or almost daily"=4,
    "Not applicable, no alcohol consumption in last three months"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="During the past three months, how often did the subject have at least one drink of any alcoholic beverage such as wine, beer, malt liquor, or spirits?")
  
  NACC_FROZEN$CVHATT=labelled_spss(NACC_FROZEN$CVHATT,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Heart attack/cardiac arrest")
  
  NACC_FROZEN$HATTMULT=labelled_spss(NACC_FROZEN$HATTMULT,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no reported history of heart attack"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="More than one heart attack/cardiac arrest?")
  
  NACC_FROZEN$HATTYEAR=labelled_spss(NACC_FROZEN$HATTYEAR,c(
    "Not applicable, no reported history  of heart attack"=8888,
    "Unknown"=9999,
    "Not available"=-4
  ), label="Year of most recent heart attack")
  
  NACC_FROZEN$CVAFIB=labelled_spss(NACC_FROZEN$CVAFIB,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Atrial fibrillation")
  
  NACC_FROZEN$CVANGIO=labelled_spss(NACC_FROZEN$CVANGIO,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Angioplasty/endarterectomy/stent")
  
  NACC_FROZEN$CVBYPASS=labelled_spss(NACC_FROZEN$CVBYPASS,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Cardiac bypass procedure")
  
  NACC_FROZEN$CVPACDEF=labelled_spss(NACC_FROZEN$CVPACDEF,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Pacemaker and/or defibrillator")
  
  NACC_FROZEN$CVPACE=labelled_spss(NACC_FROZEN$CVPACE,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Pacemaker")
  
  NACC_FROZEN$CVCHF=labelled_spss(NACC_FROZEN$CVCHF,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Congestive heart failure")
  
  NACC_FROZEN$CVANGINA=labelled_spss(NACC_FROZEN$CVANGINA,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Angina")
  
  NACC_FROZEN$CVHVALVE=labelled_spss(NACC_FROZEN$CVHVALVE,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Heart valve replacement or repair")
  
  NACC_FROZEN$CVOTHR=labelled_spss(NACC_FROZEN$CVOTHR,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Other cardiovascular disease")
  
  NACC_FROZEN$CVOTHRX=labelled_spss(NACC_FROZEN$CVOTHRX, label="Specification for other cardiovascular disease")
  
  NACC_FROZEN$CBSTROKE=labelled_spss(NACC_FROZEN$CBSTROKE,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Stroke")
  
  NACC_FROZEN$STROKMUL=labelled_spss(NACC_FROZEN$STROKMUL,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no reported history of stroke as of the Initial Visit"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="More than one stroke reported as of the Initial Visit")
  
  NACC_FROZEN$NACCSTYR=labelled_spss(NACC_FROZEN$NACCSTYR,c(
    "Not applicable, no reported history  of stroke at the Initial Visit"=8888,
    "Unknown"=9999,
    "Not available"=-4
  ), label="Most recently reported year of stroke as of the Initial Visit")
  
  NACC_FROZEN$CBTIA=labelled_spss(NACC_FROZEN$CBTIA,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Transient ischemic attack (TIA)")
  
  NACC_FROZEN$TIAMULT=labelled_spss(NACC_FROZEN$TIAMULT,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no reported history of TIA as of the Initial Visit"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="More than one TIA reported as of the Initial Visit")
  
  NACC_FROZEN$NACCTIYR=labelled_spss(NACC_FROZEN$NACCTIYR,c(
    "Not applicable, no reported history  of TIA"=8888,
    "Unknown"=9999,
    "Not available"=-4
  ), label="Most recently reported year of TIA as of the Initial Visit")
  
  NACC_FROZEN$PD=labelled_spss(NACC_FROZEN$PD,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Parkinson's disease (PD)")
  
  NACC_FROZEN$PDYR=labelled_spss(NACC_FROZEN$PDYR,c(
    "Not applicable, no reported PD"=8888,
    "Unknown"=9999,
    "Not available"=-4
  ), label="Year of PD diagnosis")
  
  NACC_FROZEN$PDOTHR=labelled_spss(NACC_FROZEN$PDOTHR,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Other parkinsonian disorder")
  
  NACC_FROZEN$PDOTHRYR=labelled_spss(NACC_FROZEN$PDOTHRYR,c(
    "Not applicable, other parkinsonian  disorder not reported"=8888,
    "Unknown"=9999,
    "Not available"=-4
  ), label="Year of parkinsonian disorder diagnosis")
  
  NACC_FROZEN$SEIZURES=labelled_spss(NACC_FROZEN$SEIZURES,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Seizures")
  
  NACC_FROZEN$TBI=labelled_spss(NACC_FROZEN$TBI,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Traumatic brain injury (TBI)")
  
  NACC_FROZEN$TBIBRIEF=labelled_spss(NACC_FROZEN$TBIBRIEF,c(
    "No"=0,
    "Single"=1,
    "Repeated/multiple"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Traumatic brain injury (TBI) with brief loss of consciousness")
  
  NACC_FROZEN$TRAUMBRF=labelled_spss(NACC_FROZEN$TRAUMBRF,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Brain trauma - brief unconsciousness TBI with extended loss of consciousness")
  
  NACC_FROZEN$TBIEXTEN=labelled_spss(NACC_FROZEN$TBIEXTEN,c(
    "No"=0,
    "Single"=1,
    "Repeated/multiple"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="TBI with extended loss of consciousness - 5 minutes of longer")
  
  NACC_FROZEN$TRAUMEXT=labelled_spss(NACC_FROZEN$TRAUMEXT,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Brain trauma - extended unconsciousness")
  
  NACC_FROZEN$TBIWOLOS=labelled_spss(NACC_FROZEN$TBIWOLOS,c(
    "No"=0,
    "Single"=1,
    "Repeated/multiple"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="TBI without loss of consciousness - as might result from military detonations or sports injury")
  
  NACC_FROZEN$TRAUMCHR=labelled_spss(NACC_FROZEN$TRAUMCHR,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Brain trauma - chronic deficit")
  
  NACC_FROZEN$TBIYEAR=labelled_spss(NACC_FROZEN$TBIYEAR,c(
    "Not applicable, no reported TBI"=8888,
    "Unknown"=9999,
    "Not available"=-4
  ), label="Year of most recent TBI")
  
  NACC_FROZEN$NCOTHR=labelled_spss(NACC_FROZEN$NCOTHR,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Other neurological condition")
  
  NACC_FROZEN$NCOTHRX=labelled_spss(NACC_FROZEN$NCOTHRX, label="Other neurological condition (specify)")
  
  NACC_FROZEN$DIABETES=labelled_spss(NACC_FROZEN$DIABETES,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Diabetes")
  
  NACC_FROZEN$DIABTYPE=labelled_spss(NACC_FROZEN$DIABTYPE,c(
    "Type 1"=1,
    "Type 2"=2,
    "Other type (diabetes insipidus, latent autoimmune diabetes/type 1.5, gestational diabetes)"=3,
    "Not applicable, no diabetes reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="If Recent/active or Remote/inactive diabetes, which type?")
  
  NACC_FROZEN$HYPERTEN=labelled_spss(NACC_FROZEN$HYPERTEN,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Hypertension")
  
  NACC_FROZEN$HYPERCHO=labelled_spss(NACC_FROZEN$HYPERCHO,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Hypercholesterolemia")
  
  NACC_FROZEN$B12DEF=labelled_spss(NACC_FROZEN$B12DEF,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Vitamin B12 deficiency")
  
  NACC_FROZEN$THYROID=labelled_spss(NACC_FROZEN$THYROID,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Thyroid disease")
  
  NACC_FROZEN$ARTHRIT=labelled_spss(NACC_FROZEN$ARTHRIT,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Arthritis")
  
  NACC_FROZEN$ARTHTYPE=labelled_spss(NACC_FROZEN$ARTHTYPE,c(
    "Rheumatoid"=1,
    "Osteoarthritis"=2,
    "Other"=3,
    "Not applicable, no reported arthritis"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Type of arthritis")
  
  NACC_FROZEN$ARTHTYPX=labelled_spss(NACC_FROZEN$ARTHTYPX, label="Other arthritis (specify)")
  
  NACC_FROZEN$ARTHUPEX=labelled_spss(NACC_FROZEN$ARTHUPEX,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis, region affected - upper extremity")
  
  NACC_FROZEN$ARTHLOEX=labelled_spss(NACC_FROZEN$ARTHLOEX,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis, region affected - lower extremity")
  
  NACC_FROZEN$ARTHSPIN=labelled_spss(NACC_FROZEN$ARTHSPIN,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis, region affected - spine")
  
  NACC_FROZEN$ARTHUNK=labelled_spss(NACC_FROZEN$ARTHUNK,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no arthritis reported"=8,
    "Not available"=-4
  ), label="Region affected - unknown")
  
  NACC_FROZEN$INCONTU=labelled_spss(NACC_FROZEN$INCONTU,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Incontinence - urinary")
  
  NACC_FROZEN$INCONTF=labelled_spss(NACC_FROZEN$INCONTF,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Incontinence - bowel")
  
  NACC_FROZEN$APNEA=labelled_spss(NACC_FROZEN$APNEA,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Sleep apnea history reported at Initial Visit")
  
  NACC_FROZEN$RBD=labelled_spss(NACC_FROZEN$RBD,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="REM sleep behavior disorder (RBD) history reported at Initial Visit")
  
  NACC_FROZEN$INSOMN=labelled_spss(NACC_FROZEN$INSOMN,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Hyposomnia/insomnia history reported at Initial Visit")
  
  NACC_FROZEN$OTHSLEEP=labelled_spss(NACC_FROZEN$OTHSLEEP,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Other sleep disorder history reported at Initial Visit")
  
  NACC_FROZEN$OTHSLEEX=labelled_spss(NACC_FROZEN$OTHSLEEX, label="Other sleep disorder (specify)")
  
  NACC_FROZEN$ALCOHOL=labelled_spss(NACC_FROZEN$ALCOHOL,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Alcohol abuse - clinically significant occurring over a 12-month period manifested in one of the following areas: work, driving, legal, or social")
  
  NACC_FROZEN$ABUSOTHR=labelled_spss(NACC_FROZEN$ABUSOTHR,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Other abused substances - clinically significant impairment occurring over a 12-month period manifested in one of the following areas: work, driving, legal, or social")
  
  NACC_FROZEN$ABUSX=labelled_spss(NACC_FROZEN$ABUSX, label="If reported other abused substances, specify abused substance(s)")
  
  NACC_FROZEN$PTSD=labelled_spss(NACC_FROZEN$PTSD,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Post-traumatic stress disorder (PTSD)")
  
  NACC_FROZEN$BIPOLAR=labelled_spss(NACC_FROZEN$BIPOLAR,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Bipolar disorder")
  
  NACC_FROZEN$SCHIZ=labelled_spss(NACC_FROZEN$SCHIZ,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Schizophrenia")
  
  NACC_FROZEN$DEP2YRS=labelled_spss(NACC_FROZEN$DEP2YRS,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Active depression in the last two years")
  
  NACC_FROZEN$DEPOTHR=labelled_spss(NACC_FROZEN$DEPOTHR,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Depression episodes more than two years ago")
  
  NACC_FROZEN$ANXIETY=labelled_spss(NACC_FROZEN$ANXIETY,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Anxiety")
  
  NACC_FROZEN$OCD=labelled_spss(NACC_FROZEN$OCD,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Obsessive-compulsive disorder (OCD)")
  
  NACC_FROZEN$NPSYDEV=labelled_spss(NACC_FROZEN$NPSYDEV,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Developmental neuropsychiatric disorders (e.g., autism spectrum disorder [ASD], attention-deficit hyperactivity disorder [ADHD], dyslexia)")
  
  NACC_FROZEN$PSYCDIS=labelled_spss(NACC_FROZEN$PSYCDIS,c(
    "Absent"=0,
    "Recent/Active"=1,
    "Remote/Inactive"=2,
    "Unknown"=9,
    "Not available"=-4
  ), label="Other psychiatric disorder")
  
  NACC_FROZEN$PSYCDISX=labelled_spss(NACC_FROZEN$PSYCDISX, label="If recent/active or remote/inactive psychiatric disorder, specify disorder")
  
  NACC_FROZEN$NACCTBI=labelled_spss(NACC_FROZEN$NACCTBI,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="History of traumatic brain injury (TBI)")
  
  #-----------------------------------------------------------------------------
  ### B1 Physical
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$HEIGHT=labelled_spss(NACC_FROZEN$HEIGHT,c(
    "Unknown or not assessed"=88.8,
    "Not available"=-4
  ), label="Subject's height (inches)")
  
  NACC_FROZEN$WEIGHT=labelled_spss(NACC_FROZEN$WEIGHT,c(
    "Unknown or not assessed"=888,
    "Not available"=-4
  ), label="Subject's weight (lbs)")
  
  NACC_FROZEN$NACCBMI=labelled_spss(NACC_FROZEN$NACCBMI,c(
    "Unknown or not assessed"=888.8,
    "Not available"=-4
  ), label="Body mass index (BMI)")
  
  NACC_FROZEN$BPSYS=labelled_spss(NACC_FROZEN$BPSYS,c(
    "Unknown or not assessed"=888,
    "Not available"=-4
  ), label="Subject blood pressure (sitting), systolic")
  
  NACC_FROZEN$BPDIAS=labelled_spss(NACC_FROZEN$BPDIAS,c(
    "Unknown or not assessed"=888,
    "Not available"=-4
  ), label="Subject blood pressure (sitting), diastolic")
  
  NACC_FROZEN$HRATE=labelled_spss(NACC_FROZEN$HRATE,c(
    "Unknown or not assessed"=888,
    "Not available"=-4
  ), label="Subject resting heart rate (pulse)")
  
  NACC_FROZEN$VISION=labelled_spss(NACC_FROZEN$VISION,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Without corrective lenses, is the subject's vision functionally normal?")
  
  NACC_FROZEN$VISCORR=labelled_spss(NACC_FROZEN$VISCORR,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Does the subject usually wear corrective lenses?")
  
  NACC_FROZEN$VISWCORR=labelled_spss(NACC_FROZEN$VISWCORR,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, does not wear corrective lenses"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="If the subject usually wears corrective lenses, is the subject's vision functionally normal with corrective lenses?")
  
  NACC_FROZEN$HEARING=labelled_spss(NACC_FROZEN$HEARING,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Without a hearing aid(s), is the subject's hearing functionally normal?")
  
  NACC_FROZEN$HEARAID=labelled_spss(NACC_FROZEN$HEARAID,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Does the subject usually wear a hearing aid(s)?")
  
  NACC_FROZEN$HEARWAID=labelled_spss(NACC_FROZEN$HEARWAID,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, does not wear hearing aid(s)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="If the subject usually wears a hearing aid(s), is the subject's hearing functionally normal with a hearing aid(s)?")
  
  #-----------------------------------------------------------------------------
  ### B2 HIS and CVD
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$ABRUPT=labelled_spss(NACC_FROZEN$ABRUPT,c(
    "Absent"=0,
    "Present"=2,
    "Not available"=-4
  ), label="Abrupt onset (re: cognitive status)")
  
  NACC_FROZEN$STEPWISE=labelled_spss(NACC_FROZEN$STEPWISE,c(
    "Absent"=0,
    "Present"=1,
    "Not available"=-4
  ), label="Stepwise deterioration (re: cognitive status)")
  
  NACC_FROZEN$SOMATIC=labelled_spss(NACC_FROZEN$SOMATIC,c(
    "Absent"=0,
    "Present"=1,
    "Not available"=-4
  ), label="Somatic complaints")
  
  NACC_FROZEN$EMOT=labelled_spss(NACC_FROZEN$EMOT,c(
    "Absent"=0,
    "Present"=1,
    "Not available"=-4
  ), label="Emotional incontinence")
  
  NACC_FROZEN$HXHYPER=labelled_spss(NACC_FROZEN$HXHYPER,c(
    "Absent"=0,
    "Present"=1,
    "Not available"=-4
  ), label="History or presence of hypertension")
  
  NACC_FROZEN$HXSTROKE=labelled_spss(NACC_FROZEN$HXSTROKE,c(
    "Absent"=0,
    "Present"=2,
    "Not available"=-4
  ), label="History of stroke")
  
  NACC_FROZEN$FOCLSYM=labelled_spss(NACC_FROZEN$FOCLSYM,c(
    "Absent"=0,
    "Present"=2,
    "Not available"=-4
  ), label="Focal neurological symptoms")
  
  NACC_FROZEN$FOCLSIGN=labelled_spss(NACC_FROZEN$FOCLSIGN,c(
    "Absent"=0,
    "Present"=2,
    "Not available"=-4
  ), label="Focal neurological signs")
  
  NACC_FROZEN$HACHIN=labelled_spss(NACC_FROZEN$HACHIN,c(
    "Not available"=-4
  ), label="Hachinski ischemic score")
  
  NACC_FROZEN$CVDCOG=labelled_spss(NACC_FROZEN$CVDCOG,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Cerebrovascular disease contributing to cognitive impairment")
  
  NACC_FROZEN$STROKCOG=labelled_spss(NACC_FROZEN$STROKCOG,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Relationship between stroke and cognitive impairment")
  
  NACC_FROZEN$CVDIMAG=labelled_spss(NACC_FROZEN$CVDIMAG,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Imaging evidence")
  
  NACC_FROZEN$CVDIMAG1=labelled_spss(NACC_FROZEN$CVDIMAG1,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Single strategic infarct")
  
  NACC_FROZEN$CVDIMAG2=labelled_spss(NACC_FROZEN$CVDIMAG2,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Multiple infarcts")
  
  NACC_FROZEN$CVDIMAG3=labelled_spss(NACC_FROZEN$CVDIMAG3,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Extensive white matter hyperintensity")
  
  NACC_FROZEN$CVDIMAG4=labelled_spss(NACC_FROZEN$CVDIMAG4,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=8,
    "Not available"=-4
  ), label="Other imaging evidence")
  
  NACC_FROZEN$CVDIMAGX=labelled_spss(NACC_FROZEN$CVDIMAGX, label="Other imaging evidence - specify")

  #-----------------------------------------------------------------------------
  ### B3 Unified Parkinson's Disease Rating Scale (UPDRS)
  #-----------------------------------------------------------------------------

  NACC_FROZEN$PDNORMAL=labelled_spss(NACC_FROZEN$PDNORMAL,c(
    "No, not normal"=0,
    "Yes, normal"=1,
    "Unknown"=8,
    "Not available"=-4
  ), label="UPDRS normal")

  NACC_FROZEN$SPEECH=labelled_spss(NACC_FROZEN$SPEECH,c(
  "Normal"=0,
  "Slight loss of expression, diction, and/or volume"=1,
  "Monotone, slurred but understandable; moderately impaired"=2,
  "Marked impairment, difficult to understand"=3,
  "Unintelligible"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Speech ")
  
  NACC_FROZEN$SPEECHX=as.character(NACC_FROZEN$SPEECHX)  
  NACC_FROZEN$SPEECHX=labelled_spss(NACC_FROZEN$SPEECHX, label="Speech; untestable - specify reason ")
  
  NACC_FROZEN$FACEXP=labelled_spss(NACC_FROZEN$FACEXP,c(
  "Normal"=0,
  "Minimal hypomimia, could be normal poker face"=1,
  "Slight but definitely abnormal diminution of facial expression"=2,
  "Moderate hypomimia; lips parted some of the time"=3,
  "Masked or fixed facies with severe or complete loss of facial expression; lips parted one-quarter inch or more"=4,
  "Untestable"=8,
  "Not available"=-4
    ), label="Facial expression ")
  
  NACC_FROZEN$FACEXPX=as.character(NACC_FROZEN$FACEXPX)
  NACC_FROZEN$FACEXPX=labelled_spss(NACC_FROZEN$FACEXPX, label="Facial expression; untestable - specify reason")
  
  NACC_FROZEN$TRESTFAC=labelled_spss(NACC_FROZEN$TRESTFAC,c(
  "Absent"=0,
  "Slight and infrequently present"=1,
  "Mild in amplitude and persistent; or moderate in amplitude, but only intermittently present"=2,
  "Moderate in amplitude and present most of the time"=3,
  "Marked in amplitude and present most of the time"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Tremor at rest - face, lips, chin ")
  
  NACC_FROZEN$TRESTFAX=as.character(NACC_FROZEN$TRESTFAX)
  NACC_FROZEN$TRESTFAX=labelled_spss(NACC_FROZEN$TRESTFAX, label="Tremor at rest - face, lips, chin; untestable - specify reason")
  
  NACC_FROZEN$TRESTRHD=labelled_spss(NACC_FROZEN$TRESTRHD,c(
    "Absent"=0,
    "Slight and infrequently present"=1,
    "Mild in amplitude and persistent; or moderate in amplitude, but only intermittently present"=2,
    "Moderate in amplitude and present most of the time"=3,
    "Marked in amplitude and present most of the time"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Tremor at rest - right hand ")
  
  NACC_FROZEN$TRESTRHX=as.character(NACC_FROZEN$TRESTRHX)
  NACC_FROZEN$TRESTRHX=labelled_spss(NACC_FROZEN$TRESTRHX, label="Tremor at rest - right hand; untestable - specify reason")
  
  NACC_FROZEN$TRESTLHD=labelled_spss(NACC_FROZEN$TRESTLHD,c(
  "Absent"=0,
  "Slight and infrequently present"=1,
  "Mild in amplitude and persistent; or moderate in amplitude, but only intermittently present"=2,
  "Moderate in amplitude and present most of the time"=3,
  "Marked in amplitude and present most of the time"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Tremor at rest - left hand ")
  
  NACC_FROZEN$TRESTLHX=as.character(NACC_FROZEN$TRESTLHX)
  NACC_FROZEN$TRESTLHX=labelled_spss(NACC_FROZEN$TRESTLHX, label="Tremor at rest - left hand; untestable - specify reason")
  
  NACC_FROZEN$TRESTRFT=labelled_spss(NACC_FROZEN$TRESTRFT,c(
    "Absent"=0,
    "Slight and infrequently present"=1,
    "Mild in amplitude and persistent; or moderate in amplitude, but only intermittently present"=2,
    "Moderate in amplitude and present most of the time"=3,
    "Marked in amplitude and present most of the time"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Tremor at rest - right foot ")
  
  NACC_FROZEN$TRESTRFX=as.character(NACC_FROZEN$TRESTRFX)
  NACC_FROZEN$TRESTRFX=labelled_spss(NACC_FROZEN$TRESTRFX, label="Tremor at rest - right foot; untestable - specify reason")
  
  NACC_FROZEN$TRESTLFT=labelled_spss(NACC_FROZEN$TRESTLFT,c(
  "Absent"=0,
  "Slight and infrequently present"=1,
  "Mild in amplitude and persistent; or moderate in amplitude, but only intermittently present"=2,
  "Moderate in amplitude and present most of the time"=3,
  "Marked in amplitude and present most of the time"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Tremor at rest - left foot ")
  
  NACC_FROZEN$TRESTLFX=as.character(NACC_FROZEN$TRESTLFX)
  NACC_FROZEN$TRESTLFX=labelled_spss(NACC_FROZEN$TRESTLFX, label="Tremor at rest - left foot; untestable - specify reason")
  
  NACC_FROZEN$TRACTRHD=labelled_spss(NACC_FROZEN$TRACTRHD,c(
    "Absent"=0,
    "Slight; present with action"=1,
    "Moderate in amplitude, present with action"=2,
    "Moderate in amplitude with posture holding as well as action"=3,
    "Marked in amplitude; interferes with feeding"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Action or postural tremor - right hand ")
  
  NACC_FROZEN$TRACTRHX=as.character(NACC_FROZEN$TRACTRHX)
  NACC_FROZEN$TRACTRHX=labelled_spss(NACC_FROZEN$TRACTRHX, label="Action or postural tremor - right hand; untestable - specify reason")
  
  NACC_FROZEN$TRACTLHD=labelled_spss(NACC_FROZEN$TRACTLHD,c(
  "Absent"=0,
  "Slight; present with action"=1,
  "Moderate in amplitude, present with action"=2,
  "Moderate in amplitude with posture holding as well as action"=3,
  "Marked in amplitude; interferes with feeding"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Action or postural tremor - left hand ")
  
  NACC_FROZEN$TRACTLHX=as.character(NACC_FROZEN$TRACTLHX)
  NACC_FROZEN$TRACTLHX=labelled_spss(NACC_FROZEN$TRACTLHX, label="Action or postural tremor - left hand; untestable - specify reason")
  
  NACC_FROZEN$RIGDNECK=labelled_spss(NACC_FROZEN$RIGDNECK,c(
    "Absent"=0,
    "Slight or detectable only when activated by mirror or other movements"=1,
    "Mild to moderate"=2,
    "Marked, but full range of motion easily achieved"=3,
    "Severe; range of motion achieved with difficulty"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Rigidity - neck ")
  
  NACC_FROZEN$RIGDNEX=as.character(NACC_FROZEN$RIGDNEX)
  NACC_FROZEN$RIGDNEX=labelled_spss(NACC_FROZEN$RIGDNEX, label="Rigidity - neck; untestable - specify reason")
  
  NACC_FROZEN$RIGDUPRT=labelled_spss(NACC_FROZEN$RIGDUPRT,c(
  "Absent"=0,
  "Slight or detectable only when activated by mirror or other movements"=1,
  "Mild to moderate"=2,
  "Marked, but full range of motion easily achieved"=3,
  "Severe; range of motion achieved with difficulty"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Rigidity - right upper extremity ")
  
  NACC_FROZEN$RIGDUPRX=as.character(NACC_FROZEN$RIGDUPRX)
  NACC_FROZEN$RIGDUPRX=labelled_spss(NACC_FROZEN$RIGDUPRX, label="Rigidity - right upper extremity; untestable - specify reason")
  
  NACC_FROZEN$RIGDUPLF=labelled_spss(NACC_FROZEN$RIGDUPLF,c(
    "Absent"=0,
    "Slight or detectable only when activated by mirror or other movements"=1,
    "Mild to moderate"=2,
    "Marked, but full range of motion easily achieved"=3,
    "Severe; range of motion achieved with difficulty"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Rigidity - left upper extremity ")
  
  NACC_FROZEN$RIGDUPLX=as.character(NACC_FROZEN$RIGDUPLX)
  NACC_FROZEN$RIGDUPLX=labelled_spss(NACC_FROZEN$RIGDUPLX, label="Rigidity - left upper extremity; untestable - specify reason")
  
  NACC_FROZEN$RIGDLORT=labelled_spss(NACC_FROZEN$RIGDLORT,c(
  "Absent"=0,
  "Slight or detectable only when activated by mirror or other movements"=1,
  "Mild to moderate"=2,
  "Marked, but full range of motion easily achieved"=3,
  "Severe; range of motion achieved with difficulty"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Rigidity - right lower extremity ")
  
  NACC_FROZEN$RIGDLORX=as.character(NACC_FROZEN$RIGDLORX)
  NACC_FROZEN$RIGDLORX=labelled_spss(NACC_FROZEN$RIGDLORX, label="Rigidity - right lower extremity; untestable - specify reason")
  
  NACC_FROZEN$RIGDLOLF=labelled_spss(NACC_FROZEN$RIGDLOLF,c(
    "Absent"=0,
    "Slight or detectable only when activated by mirror or other movements"=1,
    "Mild to moderate"=2,
    "Marked, but full range of motion easily achieved"=3,
    "Severe; range of motion achieved with difficulty"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Rigidity - left lower extremity ")
  
  NACC_FROZEN$RIGDLOLX=as.character(NACC_FROZEN$RIGDLOLX)
  NACC_FROZEN$RIGDLOLX=labelled_spss(NACC_FROZEN$RIGDLOLX, label="Rigidity - left lower extremity; untestable - specify reason")
  
  NACC_FROZEN$TAPSRT=labelled_spss(NACC_FROZEN$TAPSRT,c(
  "Normal"=0,
  "Mild slowing and/or reduction in amplitude"=1,
  "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
  "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
  "Can barely perform the task"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Finger taps - right hand ")
  
  NACC_FROZEN$TAPSRTX=as.character(NACC_FROZEN$TAPSRTX)
  NACC_FROZEN$TAPSRTX=labelled_spss(NACC_FROZEN$TAPSRTX, label="Finger taps - right hand; untestable - specify reason")
  
  NACC_FROZEN$TAPSLF=labelled_spss(NACC_FROZEN$TAPSLF,c(
    "Normal"=0,
    "Mild slowing and/or reduction in amplitude"=1,
    "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
    "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
    "Can barely perform the task"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Finger taps - left hand ")
  
  NACC_FROZEN$TAPSLFX=as.character(NACC_FROZEN$TAPSLFX)
  NACC_FROZEN$TAPSLFX=labelled_spss(NACC_FROZEN$TAPSLFX, label="Finger taps - left hand; untestable - specify reason")
  
  NACC_FROZEN$HANDMOVR=labelled_spss(NACC_FROZEN$HANDMOVR,c(
  "Normal"=0,
  "Mild slowing and/or reduction in amplitude"=1,
  "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
  "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
  "Can barely perform the task"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Hand movements - right hand ")
  
  NACC_FROZEN$HANDMVRX=as.character(NACC_FROZEN$HANDMVRX)
  NACC_FROZEN$HANDMVRX=labelled_spss(NACC_FROZEN$HANDMVRX, label="Hand movements - right hand; untestable - specify reason")
  
  NACC_FROZEN$HANDMOVL=labelled_spss(NACC_FROZEN$HANDMOVL,c(
    "Normal"=0,
    "Mild slowing and/or reduction in amplitude"=1,
    "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
    "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
    "Can barely perform the task"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Hand movements - left hand ")
  
  NACC_FROZEN$HANDMVLX=as.character(NACC_FROZEN$HANDMVLX)
  NACC_FROZEN$HANDMVLX=labelled_spss(NACC_FROZEN$HANDMVLX, label="Hand movements - left hand; untestable - specify reason")
  
  NACC_FROZEN$HANDALTR=labelled_spss(NACC_FROZEN$HANDALTR,c(
  "Normal"=0,
  "Mild slowing and/or reduction in amplitude"=1,
  "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
  "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
  "Can barely perform the task"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Alternating movement - right hand ")
  
  NACC_FROZEN$HANDATRX=as.character(NACC_FROZEN$HANDATRX)
  NACC_FROZEN$HANDATRX=labelled_spss(NACC_FROZEN$HANDATRX, label="Alternating movement - right hand; untestable - specify reason")
  
  NACC_FROZEN$HANDALTL=labelled_spss(NACC_FROZEN$HANDALTL,c(
    "Normal"=0,
    "Mild slowing and/or reduction in amplitude"=1,
    "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
    "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
    "Can barely perform the task"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Alternating movement - left hand ")
  
  NACC_FROZEN$HANDATLX=as.character(NACC_FROZEN$HANDATLX)
  NACC_FROZEN$HANDATLX=labelled_spss(NACC_FROZEN$HANDATLX, label="Alternating movement - left hand; untestable - specify reason")
  
  NACC_FROZEN$LEGRT=labelled_spss(NACC_FROZEN$LEGRT,c(
  "Normal"=0,
  "Mild slowing and/or reduction in amplitude"=1,
  "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
  "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
  "Can barely perform the task"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Leg agility - right leg ")
  
  NACC_FROZEN$LEGRTX=as.character(NACC_FROZEN$LEGRTX)
  NACC_FROZEN$LEGRTX=labelled_spss(NACC_FROZEN$LEGRTX, label="Leg agility - right leg; untestable - specify reason")
  
  NACC_FROZEN$LEGLF=labelled_spss(NACC_FROZEN$LEGLF,c(
    "Normal"=0,
    "Mild slowing and/or reduction in amplitude"=1,
    "Moderately impaired; definite and early fatiguing; may have occasional arrests in movement"=2,
    "Severely impaired; frequent hesitation in initiating movements or arrests in ongoing movement"=3,
    "Can barely perform the task"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Leg agility - left leg ")
  
  NACC_FROZEN$LEGLFX=as.character(NACC_FROZEN$LEGLFX)
  NACC_FROZEN$LEGLFX=labelled_spss(NACC_FROZEN$LEGLFX, label="Leg agility - left leg; untestable - specify reason")
  
  NACC_FROZEN$ARISING=labelled_spss(NACC_FROZEN$ARISING,c(
  "Normal"=0,
  "Slow; or may need more than one attempt"=1,
  "Pushes self up from arms of seat"=2,
  "Tends to fall back and may have to try more than one time, but can get up without help"=3,
  "Unable to arise without help"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Arising from chair ")
  
  NACC_FROZEN$ARISINGX=as.character(NACC_FROZEN$ARISINGX)
  NACC_FROZEN$ARISINGX=labelled_spss(NACC_FROZEN$ARISINGX, label="Arising from chair; untestable - specify reason")
  
  NACC_FROZEN$POSTURE=labelled_spss(NACC_FROZEN$POSTURE,c(
    "Normal"=0,
    "Not quite erect, slightly stooped posture; could be normal for older person"=1,
    "Moderately stooped posture, definitely abnormal; can be slightly leaning to one side"=2,
    "Severely stooped posture with kyphosis; can be moderately leaning to one side"=3,
    "Marked flexion with extreme abnormality of posture"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Posture ")
  
  NACC_FROZEN$POSTUREX=as.character(NACC_FROZEN$POSTUREX)
  NACC_FROZEN$POSTUREX=labelled_spss(NACC_FROZEN$POSTUREX, label="Posture; untestable - specify reason ")
  
  NACC_FROZEN$GAIT=labelled_spss(NACC_FROZEN$GAIT,c(
    "Normal"=0,
    "Walks slowly; may shuffle with short steps, but no festination (hastening steps) or propulsion"=1,
    "Walks with difficulty, but requires little or no assistance; may have some festination, short steps, or propulsion"=2,
    "Severe disturbance of gait requiring assistance"=3,
    "Cannot walk at all, even with assistance"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Gait ")
  
  NACC_FROZEN$GAITX=as.character(NACC_FROZEN$GAITX)
  NACC_FROZEN$GAITX=labelled_spss(NACC_FROZEN$GAITX, label="Gait; untestable - specify reason ")
  
  NACC_FROZEN$POSSTAB=labelled_spss(NACC_FROZEN$POSSTAB,c(
    "Normal erect"=0,
    "Retropulsion, but recovers unaided"=1,
    "Absence of postural response; would fall if not caught by examiner"=2,
    "Very unstable, tends to lose balance spontaneously"=3,
    "Unable to stand without assistance"=4,
    "Untestable"=8,
    "Not available"=-4
  ), label="Posture stability ")
  
  NACC_FROZEN$POSSTABX=as.character(NACC_FROZEN$POSSTABX)
  NACC_FROZEN$POSSTABX=labelled_spss(NACC_FROZEN$POSSTABX, label="Posture stability; untestable - specify reason")
  
  NACC_FROZEN$BRADYKIN=labelled_spss(NACC_FROZEN$BRADYKIN,c(
  "None"=0,
  "Minimal slowness, giving movement a deliberate character; could be normal for some persons; possibly reduced amplitude"=1,
  "Mild degree of slowness and poverty of movement which is definitely abnormal. Alternatively, some reduced amplitude"=2,
  "Moderate slowness, poverty or small amplitude of movement"=3,
  "Marked slowness, poverty or small amplitude of movement"=4,
  "Untestable"=8,
  "Not available"=-4
  ), label="Body bradykinesia and hypokinesia ")
  
  NACC_FROZEN$BRADYKIX=as.character(NACC_FROZEN$BRADYKIX)
  NACC_FROZEN$BRADYKIX=labelled_spss(NACC_FROZEN$BRADYKIX, label="Body bradykinesia and hypokinesia; untestable - specify reason")

  #-----------------------------------------------------------------------------
  ### B4 CDR Plus NACC FTLD
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$MEMORY=labelled_spss(NACC_FROZEN$MEMORY,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Memory")
  
  NACC_FROZEN$ORIENT=labelled_spss(NACC_FROZEN$ORIENT,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Orientation")
  
  NACC_FROZEN$JUDGMENT=labelled_spss(NACC_FROZEN$JUDGMENT,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Judgment and problem-solving")
  
  NACC_FROZEN$COMMUN=labelled_spss(NACC_FROZEN$COMMUN,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Community affairs")
  
  NACC_FROZEN$HOMEHOBB=labelled_spss(NACC_FROZEN$HOMEHOBB,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Home and hobbies")
  
  NACC_FROZEN$PERSCARE=labelled_spss(NACC_FROZEN$PERSCARE,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Personal care")
  
  NACC_FROZEN$CDRSUM=labelled_spss(NACC_FROZEN$CDRSUM, label="CDR® sum of boxes")
  
  NACC_FROZEN$CDRGLOB=labelled_spss(NACC_FROZEN$CDRGLOB,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3
  ), label="Global CDR®")
  
  NACC_FROZEN$COMPORT=labelled_spss(NACC_FROZEN$COMPORT,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3,
    "Not available"=-4
  ), label="Behavior, comportment, and personality")
  
  NACC_FROZEN$CDRLANG=labelled_spss(NACC_FROZEN$CDRLANG,c(
    "No impairment"=0,
    "Questionable impairment"=0.5,
    "Mild impairment"=1,
    "Moderate impairment"=2,
    "Severe impairment"=3,
    "Not available"=-4
  ), label="Language")

  #-----------------------------------------------------------------------------
  ### B5 Neuropsychiatric Inventory Questionnaire (NPI-Q)
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$NPIQINF=labelled_spss(NACC_FROZEN$NPIQINF,c(
    "Spouse"=1,
    "Child"=2,
    "Other"=3,
    "Not available"=-4
  ), label="NPI-Q co-participant")
  
  NACC_FROZEN$NPIQINFX=labelled_spss(NACC_FROZEN$NPIQINFX, label="NPI-Q co-participant, other - specify")
  
  NACC_FROZEN$DEL=labelled_spss(NACC_FROZEN$DEL,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Delusions in the last month")
  
  NACC_FROZEN$DELSEV=labelled_spss(NACC_FROZEN$DELSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no delusions reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Delusions severity")
  
  NACC_FROZEN$HALL=labelled_spss(NACC_FROZEN$HALL,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Hallucinations in the last month")
  
  NACC_FROZEN$HALLSEV=labelled_spss(NACC_FROZEN$HALLSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no hallucinations reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Hallucinations severity")
  
  NACC_FROZEN$AGIT=labelled_spss(NACC_FROZEN$AGIT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Agitation or aggression in the last month")
  
  NACC_FROZEN$AGITSEV=labelled_spss(NACC_FROZEN$AGITSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no agitation or aggression reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Agitation or aggression severity")
  
  NACC_FROZEN$DEPD=labelled_spss(NACC_FROZEN$DEPD,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Depression or dysphoria in the last month")
  
  NACC_FROZEN$DEPDSEV=labelled_spss(NACC_FROZEN$DEPDSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no depression or dysphoria reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Depression or dysphoria severity")
  
  NACC_FROZEN$ANX=labelled_spss(NACC_FROZEN$ANX,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Anxiety in the last month")
  
  NACC_FROZEN$ANXSEV=labelled_spss(NACC_FROZEN$ANXSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no anxiety reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Anxiety severity")
  
  NACC_FROZEN$ELAT=labelled_spss(NACC_FROZEN$ELAT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Elation or euphoria in the last month")
  
  NACC_FROZEN$ELATSEV=labelled_spss(NACC_FROZEN$ELATSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no elation or euphoria reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Elation or euphoria severity")
  
  NACC_FROZEN$APA=labelled_spss(NACC_FROZEN$APA,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Apathy or indifference in the last month")
  
  NACC_FROZEN$APASEV=labelled_spss(NACC_FROZEN$APASEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no apathy or indifference reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Apathy or indifference severity")
  
  NACC_FROZEN$DISN=labelled_spss(NACC_FROZEN$DISN,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Disinhibition in the last month")
  
  NACC_FROZEN$DISNSEV=labelled_spss(NACC_FROZEN$DISNSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no disinhibition reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Disinhibition severity")
  
  NACC_FROZEN$IRR=labelled_spss(NACC_FROZEN$IRR,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Irritability or lability in the last month")
  
  NACC_FROZEN$IRRSEV=labelled_spss(NACC_FROZEN$IRRSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no irritability or lability reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Irritability or lability severity")
  
  NACC_FROZEN$MOT=labelled_spss(NACC_FROZEN$MOT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Motor disturbance in the last month")
  
  NACC_FROZEN$MOTSEV=labelled_spss(NACC_FROZEN$MOTSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no motor disturbance reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Motor disturbance severity")
  
  NACC_FROZEN$NITE=labelled_spss(NACC_FROZEN$NITE,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Nighttime behaviors in the last month")
  
  NACC_FROZEN$NITESEV=labelled_spss(NACC_FROZEN$NITESEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no nighttime behaviors reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Nighttime behaviors severity")
  
  NACC_FROZEN$APP=labelled_spss(NACC_FROZEN$APP,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Appetite and eating problems in the last month")
  
  NACC_FROZEN$APPSEV=labelled_spss(NACC_FROZEN$APPSEV,c(
    "Mild (noticeable, but not a significant change)"=1,
    "Moderate (significant, but not a dramatic change)"=2,
    "Severe (very marked or prominent; a dramatic change)"=3,
    "Not applicable, no appetite or eating problems reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Appetite and eating severity")
  
  #-----------------------------------------------------------------------------
  ### B6 Geriatric Depression Scale (GDS)
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$NOGDS=labelled_spss(NACC_FROZEN$NOGDS,c(
    "Able to complete the GDS"=0,
    "Not able to complete the GDS"=1,
    "Not available"=-4
  ), label="Is the subject able to complete the GDS, based on the clinician's best judgment?")
  
  NACC_FROZEN$SATIS=labelled_spss(NACC_FROZEN$SATIS,c(
    "Yes"=0,
    "No"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Are you basically satisfied with your life?")
  
  NACC_FROZEN$DROPACT=labelled_spss(NACC_FROZEN$DROPACT,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Have you dropped many of your activities and interests?")
  
  NACC_FROZEN$EMPTY=labelled_spss(NACC_FROZEN$EMPTY,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you feel that your life is empty?")
  
  NACC_FROZEN$BORED=labelled_spss(NACC_FROZEN$BORED,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you often get bored?")
  
  NACC_FROZEN$SPIRITS=labelled_spss(NACC_FROZEN$SPIRITS,c(
    "Yes"=0,
    "No"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Are you in good spirits most of the time?")
  
  NACC_FROZEN$AFRAID=labelled_spss(NACC_FROZEN$AFRAID,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Are you afraid that something bad is going to happen to you?")
  
  NACC_FROZEN$HAPPY=labelled_spss(NACC_FROZEN$HAPPY,c(
    "Yes"=0,
    "No"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you feel happy most of the time?")
  
  NACC_FROZEN$HELPLESS=labelled_spss(NACC_FROZEN$HELPLESS,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you often feel helpless?")
  
  NACC_FROZEN$STAYHOME=labelled_spss(NACC_FROZEN$STAYHOME,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you prefer to stay at home, rather than going out and doing new things?")
  
  NACC_FROZEN$MEMPROB=labelled_spss(NACC_FROZEN$MEMPROB,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you feel you have more problems with memory than most?")
  
  NACC_FROZEN$WONDRFUL=labelled_spss(NACC_FROZEN$WONDRFUL,c(
    "Yes"=0,
    "No"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you think it is wonderful to be alive now?")
  
  NACC_FROZEN$WRTHLESS=labelled_spss(NACC_FROZEN$WRTHLESS,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you feel pretty worthless the way you are now?")
  
  NACC_FROZEN$ENERGY=labelled_spss(NACC_FROZEN$ENERGY,c(
    "Yes"=0,
    "No"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you feel full of energy?")
  
  NACC_FROZEN$HOPELESS=labelled_spss(NACC_FROZEN$HOPELESS,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you feel that your situation is hopeless?")
  
  NACC_FROZEN$BETTER=labelled_spss(NACC_FROZEN$BETTER,c(
    "No"=0,
    "Yes"=1,
    "Did not answer"=9,
    "Not available"=-4
  ), label="Do you think that most people are better off than you are?")
  
  NACC_FROZEN$NACCGDS=labelled_spss(NACC_FROZEN$NACCGDS,c(
    "Could not be calculated"=88,
    "Not available"=-4
  ), label="Total GDS Score")
  
  #-----------------------------------------------------------------------------
  ### B7 Functional Activities Questionnaire (FAQ)
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$BILLS=labelled_spss(NACC_FROZEN$BILLS,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Writing checks, paying bills, or balancing a checkbook")
  
  NACC_FROZEN$TAXES=labelled_spss(NACC_FROZEN$TAXES,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Assembling tax records, business affairs, or other paper")
  
  NACC_FROZEN$SHOPPING=labelled_spss(NACC_FROZEN$SHOPPING,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Shopping alone for clothes, household necessities, or groceries")
  
  NACC_FROZEN$GAMES=labelled_spss(NACC_FROZEN$GAMES,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Playing a game of skill such as bridge or chess, working on a hobby")
  
  NACC_FROZEN$STOVE=labelled_spss(NACC_FROZEN$STOVE,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Heating water, making a cup of coffee, turning off the stove")
  
  NACC_FROZEN$MEALPREP=labelled_spss(NACC_FROZEN$MEALPREP,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Preparing a balanced meal")
  
  NACC_FROZEN$EVENTS=labelled_spss(NACC_FROZEN$EVENTS,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Keeping track of current events")
  
  NACC_FROZEN$PAYATTN=labelled_spss(NACC_FROZEN$PAYATTN,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Paying attention to and understanding a TV program, book, or magazine")
  
  NACC_FROZEN$REMDATES=labelled_spss(NACC_FROZEN$REMDATES,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Remembering appointments, family occasions, holidays, medications")
  
  NACC_FROZEN$TRAVEL=labelled_spss(NACC_FROZEN$TRAVEL,c(
    "Normal"=0,
    "Has difficulty, but does by self"=1,
    "Requires assistance"=2,
    "Dependent"=3,
    "Not applicable (e.g., never did)"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="In the past four weeks, did the subject have any difficulty or need help with: Traveling out of the neighborhood, driving, or arranging to take public transportation")
  
  #-----------------------------------------------------------------------------
  ### B8 Physical/Neurological Exam Findings
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$NACCNREX=labelled_spss(NACC_FROZEN$NACCNREX,c(
    "Abnormal findings"=0,
    "No abnormal findings or findings normal for age"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Were all findings unremarkable?")
  
  NACC_FROZEN$NORMEXAM=labelled_spss(NACC_FROZEN$NORMEXAM,c(
    "No abnormal findings"=0,
    "Yes - abnormal findings were consistent with syndromes listed in Questions 2-8"=1,
    "Yes - abnormal findings were consistent with age-associated changes or irrelevant to dementing disorders (e.g., Bell's palsy)"=2,
    "Not available"=-4
  ), label="Were there abnormal neurological exam findings?")
  
  NACC_FROZEN$FOCLDEF=labelled_spss(NACC_FROZEN$FOCLDEF,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Are focal deficits present indicative of central nervous system disorder?")
  
  NACC_FROZEN$GAITDIS=labelled_spss(NACC_FROZEN$GAITDIS,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Is gait disorder present indicative of central nervous system disorder?")
  
  NACC_FROZEN$EYEMOVE=labelled_spss(NACC_FROZEN$EYEMOVE,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Are there eye movement abnormalities present indicative of central nervous system disorder?")
  
  NACC_FROZEN$PARKSIGN=labelled_spss(NACC_FROZEN$PARKSIGN,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Parkinsonian signs ")
  
  NACC_FROZEN$RESTTRL=labelled_spss(NACC_FROZEN$RESTTRL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Resting tremor - left arm")
  
  NACC_FROZEN$RESTTRR=labelled_spss(NACC_FROZEN$RESTTRR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Resting tremor - right arm")
  
  NACC_FROZEN$SLOWINGL=labelled_spss(NACC_FROZEN$SLOWINGL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Slowing of fine motor movements - left side")
  
  NACC_FROZEN$SLOWINGR=labelled_spss(NACC_FROZEN$SLOWINGR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Slowing of fine motor movements - right side")
  
  NACC_FROZEN$RIGIDL=labelled_spss(NACC_FROZEN$RIGIDL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Rigidity - left arm ")
  
  NACC_FROZEN$RIGIDR=labelled_spss(NACC_FROZEN$RIGIDR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Rigidity - right arm")
  
  NACC_FROZEN$BRADY=labelled_spss(NACC_FROZEN$BRADY,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Bradykinesia")
  
  NACC_FROZEN$PARKGAIT=labelled_spss(NACC_FROZEN$PARKGAIT,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Parkinsonian gait disorder")
  
  NACC_FROZEN$POSTINST=labelled_spss(NACC_FROZEN$POSTINST,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Postural instability")
  
  NACC_FROZEN$CVDSIGNS=labelled_spss(NACC_FROZEN$CVDSIGNS,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Neurological sign considered by examiner to be most likely consistent with cerebrovascular disease")
  
  NACC_FROZEN$CORTDEF=labelled_spss(NACC_FROZEN$CORTDEF,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Cortical cognitive deficit (e.g., aphasia, apraxia, neglect)")
  
  NACC_FROZEN$SIVDFIND=labelled_spss(NACC_FROZEN$SIVDFIND,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Focal or other neurological findings consistent with SIVD (subcortical ischemic vascular dementia)")
  
  NACC_FROZEN$CVDMOTL=labelled_spss(NACC_FROZEN$CVDMOTL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Motor (may include weakness of combination of face, arm, and leg; reflex changes, etc.) - left side")
  
  NACC_FROZEN$CVDMOTR=labelled_spss(NACC_FROZEN$CVDMOTR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Motor (may include weakness of combination of face, arm, and leg; reflex changes, etc.) - right side")
  
  NACC_FROZEN$CORTVISL=labelled_spss(NACC_FROZEN$CORTVISL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Cortical visual field loss - left side ")
  
  NACC_FROZEN$CORTVISR=labelled_spss(NACC_FROZEN$CORTVISR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Cortical visual field loss - right side")
  
  NACC_FROZEN$SOMATL=labelled_spss(NACC_FROZEN$SOMATL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Somatosensory loss - left side")
  
  NACC_FROZEN$SOMATR=labelled_spss(NACC_FROZEN$SOMATR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Somatosensory loss - right side")
  
  NACC_FROZEN$POSTCORT=labelled_spss(NACC_FROZEN$POSTCORT,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Higher cortical visual problem suggesting posterior cortical atrophy (e.g., prosopagnosia, simultagnosia, Balint's syndrome) or apraxia of gaze")
  
  NACC_FROZEN$PSPCBS=labelled_spss(NACC_FROZEN$PSPCBS,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Findings suggestive of progressive supranuclear palsy (PSP), corticobasal syndrome (CBS), or other related disorders")
  
  NACC_FROZEN$EYEPSP=labelled_spss(NACC_FROZEN$EYEPSP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Eye movement changes consistent with PSP")
  
  NACC_FROZEN$DYSPSP=labelled_spss(NACC_FROZEN$DYSPSP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Dysarthria consistent with PSP")
  
  NACC_FROZEN$AXIALPSP=labelled_spss(NACC_FROZEN$AXIALPSP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Axial rigidity consistent with PSP")
  
  NACC_FROZEN$GAITPSP=labelled_spss(NACC_FROZEN$GAITPSP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Gait disorder consistent with PSP")
  
  NACC_FROZEN$APRAXSP=labelled_spss(NACC_FROZEN$APRAXSP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Apraxia of speech")
  
  NACC_FROZEN$APRAXL=labelled_spss(NACC_FROZEN$APRAXL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Apraxia consistent with CBS - left side")
  
  NACC_FROZEN$APRAXR=labelled_spss(NACC_FROZEN$APRAXR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Apraxia consistent with CBS - right side")
  
  NACC_FROZEN$CORTSENL=labelled_spss(NACC_FROZEN$CORTSENL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Cortical sensory deficits consistent with CBS - left side")
  
  NACC_FROZEN$CORTSENR=labelled_spss(NACC_FROZEN$CORTSENR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Cortical sensory deficits consistent with CBS - right side")
  
  NACC_FROZEN$ATAXL=labelled_spss(NACC_FROZEN$ATAXL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Ataxia consistent with CBS - left side ")
  
  NACC_FROZEN$ATAXR=labelled_spss(NACC_FROZEN$ATAXR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Ataxia consistent with CBS - right side ")
  
  NACC_FROZEN$ALIENLML=labelled_spss(NACC_FROZEN$ALIENLML,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Alien limb consistent with CBS - left side")
  
  NACC_FROZEN$ALIENLMR=labelled_spss(NACC_FROZEN$ALIENLMR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Alien limb consistent with CBS - right side")
  
  NACC_FROZEN$DYSTONL=labelled_spss(NACC_FROZEN$DYSTONL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Dystonia consistent with CBS, PSP, or related disorder - left side")
  
  NACC_FROZEN$DYSTONR=labelled_spss(NACC_FROZEN$DYSTONR,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Dystonia consistent with CBS, PSP, or related disorder - right side")
  
  NACC_FROZEN$MYOCLLT=labelled_spss(NACC_FROZEN$MYOCLLT,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Myoclonus consistent with CBS - left side")
  
  NACC_FROZEN$MYOCLRT=labelled_spss(NACC_FROZEN$MYOCLRT,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Myoclonus consistent with CBS - right side")
  
  NACC_FROZEN$ALSFIND=labelled_spss(NACC_FROZEN$ALSFIND,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Findings suggesting ALS (e.g., muscle wasting, fasciculations, upper motor and/ or lower motor neuron signs)")
  
  NACC_FROZEN$GAITNPH=labelled_spss(NACC_FROZEN$GAITNPH,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Normal pressure hydrocephalus - gait apraxia")
  
  NACC_FROZEN$OTHNEUR=labelled_spss(NACC_FROZEN$OTHNEUR,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Other findings (e.g., cerebella ataxia, chorea, myoclonus)")
  
  NACC_FROZEN$OTHNEURX=labelled_spss(NACC_FROZEN$OTHNEURX, label="Other findings (specify)")
  
  #-----------------------------------------------------------------------------
  ### B9 Clinician Judgment of Symptoms
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$B9CHG=labelled_spss(NACC_FROZEN$B9CHG,c(
    "There have been no meaningful changes in the subject's cognition, behavior, or motor function since the previous UDS visit"=1,
    "At the previous UDS visit, the clinician DID NOT report a decline in the subject's memory, non-memory cognitive abilities, behavior, or motor function. However, there have been meaningful changes since then"=2,
    "At the previous UDS visit, the clinician DID report a decline in the subject's memory, non-memory cognitive abilities, behavior, or motor function. Since then, there have been additional meaningful changes"=3,
    "Not available"=-4
  ), label="Indicate changes in information reported at previous visit")
  
  NACC_FROZEN$DECSUB=labelled_spss(NACC_FROZEN$DECSUB,c(
    "No"=0,
    "Yes"=1,
    "Could not be assessed/subject too impaired"=8,
    "Unknown"=9
  ), label="Does the subject report a decline in memory (relative to previously attained abilities)?")
  
  NACC_FROZEN$DECIN=labelled_spss(NACC_FROZEN$DECIN,c(
    "No"=0,
    "Yes"=1,
    "There is no co-participant"=8,
    "Unknown"=9
  ), label="Does the co-participant report a decline in subject's memory (relative to previously attained abilities)?")
  
  NACC_FROZEN$DECCLIN=labelled_spss(NACC_FROZEN$DECCLIN,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Clinician believes there is a meaningful decline in memory, non-memory cognitive abilities, behavior, ability to manage his/her affairs, or there are motor/movement changes")
  
  NACC_FROZEN$DECCLCOG=labelled_spss(NACC_FROZEN$DECCLCOG,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Based on the clinician's judgment, is the subject currently experiencing meaningful impairment in cognition?")
  
  NACC_FROZEN$COGMEM=labelled_spss(NACC_FROZEN$COGMEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Indicate whether the subject currently is meaningfully impaired, relative to previously attained abilities, in memory")
  
  NACC_FROZEN$COGORI=labelled_spss(NACC_FROZEN$COGORI,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Indicate whether the subject is meaningfully impaired, relative to previously attained abilities, in orientation")
  
  NACC_FROZEN$COGJUDG=labelled_spss(NACC_FROZEN$COGJUDG,c(
    "No"=0,
    "Yes"=1,
    "Unknown "=9 
  ), label="Indicate whether the subject currently is meaningfully impaired, relative to previously attained abilities, in executive function - judgment, planning, or problem-solving")
  
  NACC_FROZEN$COGLANG=labelled_spss(NACC_FROZEN$COGLANG,c(
    "No"=0,
    "Yes"=1,
    "Unknown "=9
  ), label="Indicate whether the subject currently is meaningfully impaired, relative to previously attained abilities, in language")
  
  NACC_FROZEN$COGVIS=labelled_spss(NACC_FROZEN$COGVIS,c(
    "No"=0,
    "Yes"=1,
    "Unknown "=9
  ), label="Indicate whether the subject currently is meaningfully impaired, relative to previously attained abilities, in visuospatial function")
  
  NACC_FROZEN$COGATTN=labelled_spss(NACC_FROZEN$COGATTN,c(
    "No"=0,
    "Yes"=1,
    "Unknown "=9
  ), label="Indicate whether the subject currently is meaningfully impaired, relative to previously attained abilities, in attention or concentration")
  
  NACC_FROZEN$COGFLUC=labelled_spss(NACC_FROZEN$COGFLUC,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Indicate whether the subject currently has fluctuating cognition")
  
  NACC_FROZEN$COGFLAGO=labelled_spss(NACC_FROZEN$COGFLAGO,c(
    "Not applicable, no or unknown fluctuating cognition"=888,
    "Age unknown"=999,
    "Not available"=-4
  ), label="At what age did the fluctuating cognition begin?")
  
  NACC_FROZEN$COGOTHR=labelled_spss(NACC_FROZEN$COGOTHR,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Indicate whether the subject currently is meaningfully impaired, relative to previously attained abilities, in other cognitive domains")
  
  NACC_FROZEN$COGOTHRX=as.character(NACC_FROZEN$COGOTHRX)
  NACC_FROZEN$COGOTHRX=labelled_spss(NACC_FROZEN$COGOTHRX, label="Specification of other cognitive impairment")
  
  NACC_FROZEN$NACCCOGF=labelled_spss(NACC_FROZEN$NACCCOGF,c(
    "No impairment in cognition"=0,
    "Memory"=1,
    "Orientation"=2,
    "Executive function - judgment, planning, problem-solving"=3,
    "Language"=4,
    "Visuospatial function"=5,
    "Attention/concentration"=6,
    "Fluctuating cognition"=7,
    "Other (specify)"=8,
    "Unknown"=99
  ), label="Indicate the predominant symptom that was first recognized as a decline in the subject's cognition")
  
  NACC_FROZEN$NACCCGFX=labelled_spss(NACC_FROZEN$NACCCGFX, label="Specification for other predominant symptom first recognized as a decline in the subject's cognition")
  
  NACC_FROZEN$COGMODE=labelled_spss(NACC_FROZEN$COGMODE,c(
    "No impairment in cognition"=0,
    "Gradual"=1,
    "Subacute"=2,
    "Abrupt"=3,
    "Other (specify)"=4,
    "Unknown"=99
  ), label="Mode of onset of cognitive symptoms")
  
  NACC_FROZEN$COGMODEX=labelled_spss(NACC_FROZEN$COGMODEX, label="Specification for other mode of onset of cognitive symptoms")
  
  NACC_FROZEN$DECAGE=labelled_spss(NACC_FROZEN$DECAGE,c(
    "No impairment in cognition"=888,
    "Age unknown"=999
  ), label="Based on clinician's assessment, at what age did the cognitive decline begin?")
  
  NACC_FROZEN$DECCLBE=labelled_spss(NACC_FROZEN$DECCLBE,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Based on clinician's judgment, is the subject currently experiencing any kind of behavioral symptoms?")
  
  NACC_FROZEN$BEAPATHY=labelled_spss(NACC_FROZEN$BEAPATHY,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Apathy, withdrawal")
  
  NACC_FROZEN$BEDEP=labelled_spss(NACC_FROZEN$BEDEP,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Depressed mood")
  
  NACC_FROZEN$BEVHALL=labelled_spss(NACC_FROZEN$BEVHALL,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Psychosis - Visual hallucinations")
  
  NACC_FROZEN$BEVWELL=labelled_spss(NACC_FROZEN$BEVWELL,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no visual hallucinations"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="If yes, are the hallucinations well-formed and detailed?")
  
  NACC_FROZEN$BEVHAGO=labelled_spss(NACC_FROZEN$BEVHAGO,c(
    "Not applicable, no well-formed visual hallucinations"=888,
    "Not available"=-4
  ), label="If well-formed, clear-cut visual hallucinations, at what age did these hallucinations begin?")
  
  NACC_FROZEN$BEAHALL=labelled_spss(NACC_FROZEN$BEAHALL,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Psychosis - Auditory hallucinations")
  
  NACC_FROZEN$BEDEL=labelled_spss(NACC_FROZEN$BEDEL,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Psychosis - Abnormal, false, or delusional beliefs")
  
  NACC_FROZEN$BEDISIN=labelled_spss(NACC_FROZEN$BEDISIN,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Disinhibition")
  
  NACC_FROZEN$BEIRRIT=labelled_spss(NACC_FROZEN$BEIRRIT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Irritability")
  
  NACC_FROZEN$BEAGIT=labelled_spss(NACC_FROZEN$BEAGIT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Agitation")
  
  NACC_FROZEN$BEPERCH=labelled_spss(NACC_FROZEN$BEPERCH,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Subject currently manifests meaningful change in behavior - Personality change")
  
  NACC_FROZEN$BEREM=labelled_spss(NACC_FROZEN$BEREM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
    
  ), label="Subject currently manifests meaningful change in behavior - REM sleep behavior disorder")
  
  NACC_FROZEN$BEREMAGO=labelled_spss(NACC_FROZEN$BEREMAGO,c(
    "Not applicable, no REM sleep behavior disorder"=888,
    "Not available"=-4
  ), label="If yes, at what age did the REM sleep behavior disorder begin?")
  
  NACC_FROZEN$BEANX=labelled_spss(NACC_FROZEN$BEANX,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "Not available"=-4
  ), label="Subject currently manifests meaningful change in behavior - Anxiety")
  
  NACC_FROZEN$BEOTHR=labelled_spss(NACC_FROZEN$BEOTHR,c(
    "No/unknown"=0,
    "Yes"=1
  ), label="Subject currently manifests meaningful change in behavior - Other")
  
  NACC_FROZEN$BEOTHRX=labelled_spss(NACC_FROZEN$BEOTHRX, label="Subject currently manifests meaningful change in behavior - Other, specify")
  
  NACC_FROZEN$NACCBEHF=labelled_spss(NACC_FROZEN$NACCBEHF,c(
    "No behavioral symptoms"=0,
    "Apathy/withdrawal"=1,
    "Depressed mood"=2,
    "Psychosis"=3,
    "Disinhibition"=4,
    "Irritability"=5,
    "Agitation"=6,
    "Personality change"=7,
    "REM sleep behavior disorder"=8,
    "Anxiety"=9,
    "Other (specify)"=10,
    "Unknown"=99
  ), label="Indicate the predominant symptom that was first recognized as a decline in the subject's behavior")
  
  NACC_FROZEN$NACCBEFX=labelled_spss(NACC_FROZEN$NACCBEFX, label="Specification of other predominant symptom that was first recognized as a decline in the subject's behavior")
  
  NACC_FROZEN$BEMODE=labelled_spss(NACC_FROZEN$BEMODE,c(
    "No behavioral symptoms"=0,
    "Gradual"=1,
    "Subacute"=2,
    "Abrupt"=3,
    "Other (specify)"=4,
    "Unknown"=99
  ), label="Mode of onset of behavioral symptoms")
  
  NACC_FROZEN$BEMODEX=labelled_spss(NACC_FROZEN$BEMODEX, label="Specification of other mode of onset of behavioral symptoms")
  
  NACC_FROZEN$BEAGE=labelled_spss(NACC_FROZEN$BEAGE,c(
    "Not applicable, no behavioral symptoms"=888,
    "Age unknown"=999,
    "Not available"=-4
  ), label="Based on the clinician's assessment, at what age did the behavioral symptoms begin?")
  
  NACC_FROZEN$DECCLMOT=labelled_spss(NACC_FROZEN$DECCLMOT,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Based on the clinician's judgment, is the subject currently experiencing any motor symptoms?")
  
  NACC_FROZEN$MOGAIT=labelled_spss(NACC_FROZEN$MOGAIT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Indicate whether the subject currently has meaningful changes in motor function - Gait disorder")
  
  NACC_FROZEN$MOFALLS=labelled_spss(NACC_FROZEN$MOFALLS,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Indicate whether the subject currently has meaningful changes in motor function - Falls")
  
  NACC_FROZEN$MOTREM=labelled_spss(NACC_FROZEN$MOTREM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Indicate whether the subject currently has meaningful changes in motor function - Tremor")
  
  NACC_FROZEN$MOSLOW=labelled_spss(NACC_FROZEN$MOSLOW,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Indicate whether the subject currently has meaningful changes in motor function - Slowness")
  
  NACC_FROZEN$NACCMOTF=labelled_spss(NACC_FROZEN$NACCMOTF,c(
    "No motor symptoms"=0,
    "Gait disorder"=1,
    "Falls"=2,
    "Tremor"=3,
    "Slowness"=4,
    "Unknown"=99
  ), label="Indicate the predominant symptom that was first recognized as a decline in the subject's motor function")
  
  NACC_FROZEN$MOMODE=labelled_spss(NACC_FROZEN$MOMODE,c(
    "No motor symptoms"=0,
    "Gradual"=1,
    "Subacute"=2,
    "Abrupt"=3,
    "Other"=4,
    "unknown"=99 
  ), label="Mode of onset of motor symptoms")
  
  NACC_FROZEN$MOMODEX=labelled_spss(NACC_FROZEN$MOMODEX, label="Specification for other mode of onset of motor symptoms")
  
  NACC_FROZEN$MOMOPARK=labelled_spss(NACC_FROZEN$MOMOPARK,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no motor changes"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Were changes in motor function suggestive of Parkinsonism?")
  
  NACC_FROZEN$PARKAGE=labelled_spss(NACC_FROZEN$PARKAGE,c(
    "Not applicable, no Parkinsonism"=888,
    "Age unknown"=999,
    "Not available"=-4
  ), label="If yes, at what age did the motor symptoms suggestive of Parkinsonism begin?")
  
  NACC_FROZEN$MOMOALS=labelled_spss(NACC_FROZEN$MOMOALS,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no motor function changes"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Were changes in motor function suggestive of amyotrophic lateral sclerosis?")
  
  NACC_FROZEN$ALSAGE=labelled_spss(NACC_FROZEN$ALSAGE,c(
    "Not applicable, No ALS"=888,
    "Not available"=-4
  ), label="If yes, at what age did the motor symptoms suggestive of ALS begin?")
  
  NACC_FROZEN$MOAGE=labelled_spss(NACC_FROZEN$MOAGE,c(
    "No motor symptoms"=888,
    "Not available"=-4
  ), label="Based on the clinician's assessment, at what age did the motor changes begin?")
  
  NACC_FROZEN$COURSE=labelled_spss(NACC_FROZEN$COURSE,c(
    "Gradually progressive"=1,
    "Stepwise"=2,
    "Static"=3,
    "Fluctuating"=4,
    "Improved"=5,
    "Not applicable"=8,
    "Unknown"=9
  ), label="Overall course of decline of cognitive/ behavioral/motor syndrome")
  
  NACC_FROZEN$FRSTCHG=labelled_spss(NACC_FROZEN$FRSTCHG,c(
    "Cognition"=1,
    "Behavior"=2,
    "Motor function"=3,
    "Not applicable"=8,
    "Unknown"=9
  ), label="Indicate the predominant domain that was first recognized as changed in the subject")
  
  NACC_FROZEN$LBDEVAL=labelled_spss(NACC_FROZEN$LBDEVAL,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Is the subject a potential candidate for further evaluation for Lewy body disease?")
  
  NACC_FROZEN$FTLDEVAL=labelled_spss(NACC_FROZEN$FTLDEVAL,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Is the subject a potential candidate for further evaluation for frontotemporal lobar degeneration?")
  
  #-----------------------------------------------------------------------------
  ### C1 Neuropsychological Battery Summary Scores
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$MMSECOMP=labelled_spss(NACC_FROZEN$MMSECOMP,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Was any part of the MMSE completed? ")
  
  NACC_FROZEN$MMSELOC=labelled_spss(NACC_FROZEN$MMSELOC,c(
    "In ADC/clinic"=1,
    "In home"=2,
    "In person - other"=3,
    "Not available"=-4
  ), label="Administration of the MMSE was:")
  
  NACC_FROZEN$MMSELAN=labelled_spss(NACC_FROZEN$MMSELAN,c(
    "English"=1,
    "Spanish"=2,
    "Other"=3,
    "Not available"=-4
  ), label="Language of MMSE administration")
  
  NACC_FROZEN$MMSELANX=as.character(NACC_FROZEN$MMSELANX)
  NACC_FROZEN$MMSELANX=labelled_spss(NACC_FROZEN$MMSELANX, label="Language of MMSE administration - Other (specify)")
  
  NACC_FROZEN$MMSEVIS=labelled_spss(NACC_FROZEN$MMSEVIS,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Subject was unable to complete one or more sections due to visual impairment")
  
  NACC_FROZEN$MMSEHEAR=labelled_spss(NACC_FROZEN$MMSEHEAR,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Subject was unable to complete one or more sections due to hearing impairment")
  
  NACC_FROZEN$MMSEORDA=labelled_spss(NACC_FROZEN$MMSEORDA,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Orientation subscale score - Time")
  
  NACC_FROZEN$MMSEORLO=labelled_spss(NACC_FROZEN$MMSEORLO,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Orientation subscale score - Place")
  
  NACC_FROZEN$PENTAGON=labelled_spss(NACC_FROZEN$PENTAGON,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Intersecting pentagon subscale score")
  
  NACC_FROZEN$NACCMMSE=labelled_spss(NACC_FROZEN$NACCMMSE,c(
    "Score not calculated; missing at least one MMSE item"=88,
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total MMSE score (using D-L-R-O-W)")
  
  NACC_FROZEN$NPSYCLOC=labelled_spss(NACC_FROZEN$NPSYCLOC,c(
    "In ADC/clinic"=1,
    "In home"=2,
    "In person - other"=3,
    "Not available"=-4
  ), label="The remainder of the battery was administered:")
  
  NACC_FROZEN$NPSYLAN=labelled_spss(NACC_FROZEN$NPSYLAN,c(
    "English"=1,
    "Spanish"=2,
    "Other"=3,
    "Not available"=-4
  ), label="Language of test administration")
  
  NACC_FROZEN$NPSYLANX=labelled_spss(NACC_FROZEN$NPSYLANX, label="Language of test administration - Other (specify)")
  
  NACC_FROZEN$LOGIMO=labelled_spss(NACC_FROZEN$LOGIMO,c(
    "Unknown"=88,
    "Not available"=-4
  ), label="If this test has been administered to the subject within the past 3 months, specify the date previously administered (month)")
  
  NACC_FROZEN$LOGIDAY=labelled_spss(NACC_FROZEN$LOGIDAY,c(
    "Unknown"=88,
    "Not available"=-4
  ), label="If this test has been administered to the subject within the past 3 months, specify the date previously administered (day)")
  
  NACC_FROZEN$LOGIYR=labelled_spss(NACC_FROZEN$LOGIYR,c(
    "Unknown"=8888,
    "Not available"=-4
  ), label="If this test has been administered to the subject within the past 3 months, specify the date previously administered (year)")
  
  NACC_FROZEN$LOGIPREV=labelled_spss(NACC_FROZEN$LOGIPREV,c(
    "Not available"=-4
  ), label="Total score from the previous test administration")
  
  NACC_FROZEN$LOGIMEM=labelled_spss(NACC_FROZEN$LOGIMEM,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total number of story units recalled from this current test administration")
  
  NACC_FROZEN$MEMUNITS=labelled_spss(NACC_FROZEN$MEMUNITS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Logical Memory IIA - Delayed - Total number of story units recalled")
  
  NACC_FROZEN$MEMTIME=labelled_spss(NACC_FROZEN$MEMTIME,c(
    "Unknown"=99,
    "Not available"=-4
  ), label="Logical Memory IIA - Delayed - Time elapsed since Logical Memory IA - Immediate")
  
  NACC_FROZEN$UDSBENTC=labelled_spss(NACC_FROZEN$UDSBENTC,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total score for copy of Benson figure")
  
  NACC_FROZEN$UDSBENTD=labelled_spss(NACC_FROZEN$UDSBENTD,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total score for 10- to 15-minute delayed drawing of Benson figure")
  
  NACC_FROZEN$UDSBENRS=labelled_spss(NACC_FROZEN$UDSBENRS,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Recognized original stimulus from among four options")
  
  NACC_FROZEN$DIGIF=labelled_spss(NACC_FROZEN$DIGIF,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Digit span forward trials correct")
  
  NACC_FROZEN$DIGIFLEN=labelled_spss(NACC_FROZEN$DIGIFLEN,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Digit span forward length")
  
  NACC_FROZEN$DIGIB=labelled_spss(NACC_FROZEN$DIGIB,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Digit span backward trials correct")
  
  NACC_FROZEN$DIGIBLEN=labelled_spss(NACC_FROZEN$DIGIBLEN,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Digit span backward length")
  
  NACC_FROZEN$ANIMALS=labelled_spss(NACC_FROZEN$ANIMALS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Animals - Total number of animals named in 60 seconds")
  
  NACC_FROZEN$VEG=labelled_spss(NACC_FROZEN$VEG,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Vegetable - Total number of vegetables named in 60 seconds")
  
  NACC_FROZEN$TRAILA=labelled_spss(NACC_FROZEN$TRAILA,c(
    "Physical problem"=995,
    "Cognitive/behavior problem"=996,
    "Other problem"=997,
    "Verbal refusal"=998,
    "Not available"=-4
  ), label="Trail Making Test Part A - Total number of seconds to complete")
  
  NACC_FROZEN$TRAILARR=labelled_spss(NACC_FROZEN$TRAILARR,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Part A - Number of commission errors")
  
  NACC_FROZEN$TRAILALI=labelled_spss(NACC_FROZEN$TRAILALI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Part A - Number of correct lines")
  
  NACC_FROZEN$TRAILB=labelled_spss(NACC_FROZEN$TRAILB,c(
    "Physical problem"=995,
    "Cognitive/behavior problem"=996,
    "Other problem"=997,
    "Verbal refusal"=998,
    "Not available"=-4
  ), label="Trail Making Test Part B - Total number of seconds to complete")
  
  NACC_FROZEN$TRAILBRR=labelled_spss(NACC_FROZEN$TRAILBRR,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Part B - Number of commission errors")
  
  NACC_FROZEN$TRAILBLI=labelled_spss(NACC_FROZEN$TRAILBLI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Part B - Number of correct lines")
  
  NACC_FROZEN$WAIS=labelled_spss(NACC_FROZEN$WAIS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="WAIS-R Digit Symbol")
  
  NACC_FROZEN$BOSTON=labelled_spss(NACC_FROZEN$BOSTON,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Boston Naming Test (30) - Total score")
  
  NACC_FROZEN$UDSVERFC=labelled_spss(NACC_FROZEN$UDSVERFC,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number of correct F-words generated in 1 minute")
  
  NACC_FROZEN$UDSVERFN=labelled_spss(NACC_FROZEN$UDSVERFN,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number of F-words repeated in 1 minute")
  
  NACC_FROZEN$UDSVERNF=labelled_spss(NACC_FROZEN$UDSVERNF,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number of non-F-words and rule violation errors in 1 minute")
  
  NACC_FROZEN$UDSVERLC=labelled_spss(NACC_FROZEN$UDSVERLC,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number of correct L-words generated in 1 minute")
  
  NACC_FROZEN$UDSVERLR=labelled_spss(NACC_FROZEN$UDSVERLR,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number of L-words repeated in 1 minute")
  
  NACC_FROZEN$UDSVERLN=labelled_spss(NACC_FROZEN$UDSVERLN,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number of non-L-words and rule violation errors in 1 minute")
  
  NACC_FROZEN$UDSVERTN=labelled_spss(NACC_FROZEN$UDSVERTN,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total number of correct F-words and L-words")
  
  NACC_FROZEN$UDSVERTE=labelled_spss(NACC_FROZEN$UDSVERTE,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total number of F-word and L-word repetition errors")
  
  NACC_FROZEN$UDSVERTI=labelled_spss(NACC_FROZEN$UDSVERTI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Total number of non-F/L-words and rule violation errors")
  
  NACC_FROZEN$COGSTAT=labelled_spss(NACC_FROZEN$COGSTAT,c(
    "Clinician unable to render opinion"=0,
    "Better than normal for age"=1,
    "Normal for age"=2,
    "One or two test scores abnormal"=3,
    "Three or more scores are abnormal or lower than expected"=4,
    "Missing"=9,
    "Not available"=-4
  ), label="Per clinician, based on the neuropsychological examination, the subject's cognitive status is deemed")
  
  NACC_FROZEN$NACCC1=labelled_spss(NACC_FROZEN$NACCC1,c(
    "UDS Form C1 completed within 90 days of Form A1"=0,
    "UDS Form C1 completed >90 days before or after Form A1"=1,
    "Not available"=-4
  ), label="Form date discrepancy between UDS Form A1 and Form C1")
  
  #-----------------------------------------------------------------------------
  ### C2 Neuropsychological Battery Scores
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$MOCACOMP=labelled_spss(NACC_FROZEN$MOCACOMP,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Was any part of MoCA administered?")
  
  NACC_FROZEN$MOCAREAS=labelled_spss(NACC_FROZEN$MOCAREAS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="If no part of MoCA administered, reason code")
  
  NACC_FROZEN$MOCALOC=labelled_spss(NACC_FROZEN$MOCALOC,c(
    "In ADC or Clinic"=1,
    "In Home"=2,
    "In-person - other"=3,
    "Not available"=-4
  ), label="Where was MoCA administered?")
  
  NACC_FROZEN$MOCALAN=labelled_spss(NACC_FROZEN$MOCALAN,c(
    "English"=1,
    "Spanish"=2,
    "Other"=3,
    "Not available"=-4
  ), label="Language of MoCA administration")
  
  NACC_FROZEN$MOCALANX=as.character(NACC_FROZEN$MOCALANX)
  NACC_FROZEN$MOCALANX=labelled_spss(NACC_FROZEN$MOCALANX, label="Language of MoCA administration - Other, specify")
  
  NACC_FROZEN$MOCAVIS=labelled_spss(NACC_FROZEN$MOCAVIS,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Subject was unable to complete one or more sections due to visual impairment")
  
  NACC_FROZEN$MOCAHEAR=labelled_spss(NACC_FROZEN$MOCAHEAR,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Subject was unable to complete one or more sections due to hearing impairment")
  
  NACC_FROZEN$MOCATOTS=labelled_spss(NACC_FROZEN$MOCATOTS,c(
    "Item(s) or whole test not administered"=88,
    "Not available"=-4
  ), label="MoCA Total Raw Score - uncorrected")
  
  NACC_FROZEN$NACCMOCA=labelled_spss(NACC_FROZEN$NACCMOCA,c(
    "Item(s) or whole test not administered"=88,
    "Years of education missing/unknown"=99,
    "Not available"=-4
  ), label="MoCA Total Score - corrected for education")
  
  NACC_FROZEN$MOCATRAI=labelled_spss(NACC_FROZEN$MOCATRAI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Visuospatial/executive - Trails")
  
  NACC_FROZEN$MOCACUBE=labelled_spss(NACC_FROZEN$MOCACUBE,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Visuospatial/executive - Cube")
  
  NACC_FROZEN$MOCACLOC=labelled_spss(NACC_FROZEN$MOCACLOC,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Visuospatial/executive - Clock contour")
  
  NACC_FROZEN$MOCACLON=labelled_spss(NACC_FROZEN$MOCACLON,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Visuospatial/executive - Clock numbers")
  
  NACC_FROZEN$MOCACLOH=labelled_spss(NACC_FROZEN$MOCACLOH,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Visuospatial/executive - Clock hands")
  
  NACC_FROZEN$MOCANAMI=labelled_spss(NACC_FROZEN$MOCANAMI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Language - Naming")
  
  NACC_FROZEN$MOCAREGI=labelled_spss(NACC_FROZEN$MOCAREGI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Memory - Registration (two trials)")
  
  NACC_FROZEN$MOCADIGI=labelled_spss(NACC_FROZEN$MOCADIGI,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Attention - Digits")
  
  NACC_FROZEN$MOCALETT=labelled_spss(NACC_FROZEN$MOCALETT,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Attention - Letter A")
  
  NACC_FROZEN$MOCASER7=labelled_spss(NACC_FROZEN$MOCASER7,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Attention - Serial 7s")
  
  NACC_FROZEN$MOCAREPE=labelled_spss(NACC_FROZEN$MOCAREPE,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Language - Repetition")
  
  NACC_FROZEN$MOCAFLUE=labelled_spss(NACC_FROZEN$MOCAFLUE,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Language - Fluency")
  
  NACC_FROZEN$MOCAABST=labelled_spss(NACC_FROZEN$MOCAABST,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Abstraction")
  
  NACC_FROZEN$MOCARECN=labelled_spss(NACC_FROZEN$MOCARECN,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Delayed recall - No cue")
  
  NACC_FROZEN$MOCARECC=labelled_spss(NACC_FROZEN$MOCARECC,c(
    "Not applicable, category cue not given"=88,
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Delayed recall - Category cue")
  
  NACC_FROZEN$MOCARECR=labelled_spss(NACC_FROZEN$MOCARECR,c(
    "Not applicable, category cue not given"=88,
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Delayed recall - Recognition")
  
  NACC_FROZEN$MOCAORDT=labelled_spss(NACC_FROZEN$MOCAORDT,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Orientation - Date")
  
  NACC_FROZEN$MOCAORMO=labelled_spss(NACC_FROZEN$MOCAORMO,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Orientation - Month")
  
  NACC_FROZEN$MOCAORYR=labelled_spss(NACC_FROZEN$MOCAORYR,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Orientation - Year")
  
  NACC_FROZEN$MOCAORDY=labelled_spss(NACC_FROZEN$MOCAORDY,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Orientation - Day")
  
  NACC_FROZEN$MOCAORPL=labelled_spss(NACC_FROZEN$MOCAORPL,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Orientation - Place")
  
  NACC_FROZEN$MOCAORCT=labelled_spss(NACC_FROZEN$MOCAORCT,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="MoCA: Orientation - City")
  
  NACC_FROZEN$CRAFTVRS=labelled_spss(NACC_FROZEN$CRAFTVRS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Craft Story 21 Recall (Immediate) - Total story units recalled, verbatim scoring")
  
  NACC_FROZEN$CRAFTURS=labelled_spss(NACC_FROZEN$CRAFTURS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Craft Story 21 Recall (Immediate) - Total story units recalled, paraphrase scoring")
  
  NACC_FROZEN$DIGFORCT=labelled_spss(NACC_FROZEN$DIGFORCT,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number Span Test: Forward - Number of correct trials")
  
  NACC_FROZEN$DIGFORSL=labelled_spss(NACC_FROZEN$DIGFORSL,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number Span Test: Forward - Longest span forward")
  
  NACC_FROZEN$DIGBACCT=labelled_spss(NACC_FROZEN$DIGBACCT,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number Span Test: Backward - Number of correct trials")
  
  NACC_FROZEN$DIGBACLS=labelled_spss(NACC_FROZEN$DIGBACLS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Number Span Test: Backward - Longest span backward")
  
  NACC_FROZEN$CRAFTDVR=labelled_spss(NACC_FROZEN$CRAFTDVR,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Craft Story 21 Recall (Delayed) - Total story units recalled, verbatim scoring")
  
  NACC_FROZEN$CRAFTDRE=labelled_spss(NACC_FROZEN$CRAFTDRE,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Craft Story 21 Recall (Delayed) - Total story units recalled, paraphrase scoring")
  
  NACC_FROZEN$CRAFTDTI=labelled_spss(NACC_FROZEN$CRAFTDTI,c(
    "Unknown"=99,
    "Not available"=-4
  ), label="Craft Story 21 Recall (Delayed) - Delay time")
  
  NACC_FROZEN$CRAFTCUE=labelled_spss(NACC_FROZEN$CRAFTCUE,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Craft Story 21 Recall (Delayed) - Cue (boy) needed")
  
  NACC_FROZEN$MINTTOTS=labelled_spss(NACC_FROZEN$MINTTOTS,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Multilingual Naming Test (MINT) - Total score")
  
  NACC_FROZEN$MINTTOTW=labelled_spss(NACC_FROZEN$MINTTOTW,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Multilingual Naming Test (MINT) - Total correct without semantic cue")
  
  NACC_FROZEN$MINTSCNG=labelled_spss(NACC_FROZEN$MINTSCNG,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Multilingual Naming Test (MINT) - Semantic cues: Number given")
  
  NACC_FROZEN$MINTSCNC=labelled_spss(NACC_FROZEN$MINTSCNC,c(
    "Not applicable, no semantic cues given"=88,
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Multilingual Naming Test (MINT) - Semantic cues: Number correct with cue")
  
  NACC_FROZEN$MINTPCNG=labelled_spss(NACC_FROZEN$MINTPCNG,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Multilingual Naming Test (MINT) - Phonemic cues: Number given")
  
  NACC_FROZEN$MINTPCNC=labelled_spss(NACC_FROZEN$MINTPCNC,c(
    "Physical problem"=95,
    "Cognitive/behavior problem"=96,
    "Other problem"=97,
    "Verbal refusal"=98,
    "Not available"=-4
  ), label="Multilingual Naming Test (MINT) - Phonemic cues: Number correct with cue")
  
  NACC_FROZEN$NACCC2=labelled_spss(NACC_FROZEN$NACCC2,c(
    "UDS Form C2 completed within 90 days of Form A1"=0,
    "UDS Form C2 completed >90 days before or after Form A1"=1,
    "Not available"=-4
  ), label="Form date discrepancy between UDS Form A1 and Form C2")
  
  #-----------------------------------------------------------------------------
  ### D1 Clinician Diagnosis
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$WHODIDDX=labelled_spss(NACC_FROZEN$WHODIDDX,c(
    "A single clinician"=1,
    "Consensus diagnosis"=2,
    "Not applicable"=-4
  ), label="Who did diagnosis")
  
  NACC_FROZEN$DXMETHOD=labelled_spss(NACC_FROZEN$DXMETHOD,c(
    "A single clinician"=1,
    "A formal consensus panel"=2,
    "Other (e.g., two or more clinicians or other informal group)"=3,
    "Not applicable"=-4
  ), label="Diagnosis method")
  
  NACC_FROZEN$NORMCOG=labelled_spss(NACC_FROZEN$NORMCOG,c(
    "No"=0,
    "Yes"=1
  ), label="Normal cognition and behavior")
  
  NACC_FROZEN$DEMENTED=labelled_spss(NACC_FROZEN$DEMENTED,c(
    "No"=0,
    "Yes"=1
  ), label="Met criteria for dementia")
  
  NACC_FROZEN$NACCUDSD=labelled_spss(NACC_FROZEN$NACCUDSD,c(
    "Normal cognition"=1,
    "Impaired-not-MCI"=2,
    "MCI"=3,
    "Dementia"=4
  ), label="Cognitive status at UDS visit")
  
  NACC_FROZEN$AMNDEM=labelled_spss(NACC_FROZEN$AMNDEM,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8,
    "Not applicable"=-4
  ), label="Dementia syndrome - Amnestic multidomain dementia syndrome")
  
  NACC_FROZEN$PCA=labelled_spss(NACC_FROZEN$PCA,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8,
    "Not applicable"=-4
  ), label="Dementia syndrome - Posterior cortical atrophy syndrome (or primary visual presentation)")
  
  NACC_FROZEN$NACCPPA=labelled_spss(NACC_FROZEN$NACCPPA,c(
    "No"=0,
    "Yes"=1,
    "Subject had Impaired-not-MCI or MCI but is missing information on presence/absence of PPA"=7,
    "No cognitive impairment"=8
  ), label="Primary progressive aphasia (PPA) with cognitive impairment")
  
  NACC_FROZEN$NACCPPAG=labelled_spss(NACC_FROZEN$NACCPPAG,c(
    "Meets criteria for semantic PPA"=1,
    "Meets criteria for logopenic PPA"=2,
    "Meets criteria for nonfluent/agrammatic PPA"=3,
    "PPA other/not otherwise specified"=4,
    "Impaired but no PPA syndrome"=7,
    "No cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Dementia syndrome - Primary progressive aphasia (PPA) subtype according to the criteria outlined by Gorno-Tempini et al. 2011")
  
  NACC_FROZEN$NACCPPME=labelled_spss(NACC_FROZEN$NACCPPME,c(
    "Meets criteria for progressive nonfluent PPA"=1,
    "Meets criteria for semantic dementia - anomia plus word comprehension"=2,
    "Meets criteria for semantic dementia - agnostic variant"=3,
    "PPA other/not otherwise specified (logopenic, anomic, transcortical, word deafness, syntactic comprehension, motor speech disorder)"=4,
    "Subject had MCI but missing information on presence / absence of PPA"=6,
    "Subject was cognitively impaired but did not have PPA"=7,
    "No cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Primary progressive aphasia (PPA) subtype according to older criteria outlined by Mesulam et al (2001 and 2003)")
  
  NACC_FROZEN$NACCBVFT=labelled_spss(NACC_FROZEN$NACCBVFT,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8
  ), label="Dementia syndrome - behavioral variant FTD syndrome (bvFTD)")
  
  NACC_FROZEN$NACCLBDS=labelled_spss(NACC_FROZEN$NACCLBDS,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8
  ), label="Dementia syndrome - Lewy body dementia syndrome")
  
  NACC_FROZEN$NAMNDEM=labelled_spss(NACC_FROZEN$NAMNDEM,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8,
    "Not applicable"=-4
  ), label="Dementia syndrome - Non-amnestic multidomain dementia, not PCA, PPA, bvFTD, or DLB syndrome")
  
  NACC_FROZEN$NACCTMCI=labelled_spss(NACC_FROZEN$NACCTMCI,c(
    "Amnestic MCI- single domain"=1,
    "Amnestic MCI- multiple domain"=2,
    "Non-amnestic MCI- single domain"=3,
    "Non-amnestic MCI- multiple domain"=4,
    "No diagnosis of MCI"=8
  ), label="Mild cognitive impairment (MCI) type")
  
  NACC_FROZEN$NACCMCIL=labelled_spss(NACC_FROZEN$NACCMCIL,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8
  ), label="MCI domain affected - language")
  
  NACC_FROZEN$NACCMCIA=labelled_spss(NACC_FROZEN$NACCMCIA,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8
  ), label="MCI domain affected - attention")
  
  NACC_FROZEN$NACCMCIE=labelled_spss(NACC_FROZEN$NACCMCIE,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8
  ), label="MCI domain affected - executive function")
  
  NACC_FROZEN$NACCMCIV=labelled_spss(NACC_FROZEN$NACCMCIV,c(
    "No"=0,
    "Yes"=1,
    "No diagnosis of dementia"=8
  ), label="MCI domain affected - visuospatial")
  
  NACC_FROZEN$IMPNOMCI=labelled_spss(NACC_FROZEN$IMPNOMCI,c(
    "No"=0,
    "Yes"=1
  ), label="Cognitively impaired, not MCI")
  
  NACC_FROZEN$AMYLPET=labelled_spss(NACC_FROZEN$AMYLPET,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Abnormally elevated amyloid on PET")
  
  NACC_FROZEN$AMYLCSF=labelled_spss(NACC_FROZEN$AMYLCSF,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Abnormally low amyloid in CSF")
  
  NACC_FROZEN$FDGAD=labelled_spss(NACC_FROZEN$FDGAD,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="FDG-PET pattern of AD")
  
  NACC_FROZEN$HIPPATR=labelled_spss(NACC_FROZEN$HIPPATR,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Hippocampal atrophy")
  
  NACC_FROZEN$TAUPETAD=labelled_spss(NACC_FROZEN$TAUPETAD,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Tau PET evidence for AD")
  
  NACC_FROZEN$CSFTAU=labelled_spss(NACC_FROZEN$CSFTAU,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Abnormally elevated CSF Tau or pTau")
  
  NACC_FROZEN$FDGFTLD=labelled_spss(NACC_FROZEN$FDGFTLD,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="FDG-PET evidence for frontal or anterior temporal hypometabolism for FTLD")
  
  NACC_FROZEN$TPETFTLD=labelled_spss(NACC_FROZEN$TPETFTLD,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Tau PET evidence for FTLD")
  
  NACC_FROZEN$MRFTLD=labelled_spss(NACC_FROZEN$MRFTLD,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Structural MR evidence for frontal or anterior temporal atrophy for FTLD")
  
  NACC_FROZEN$DATSCAN=labelled_spss(NACC_FROZEN$DATSCAN,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Dopamine transporter scan (DATscan) evidence for Lewy body disease")
  
  NACC_FROZEN$OTHBIOM=labelled_spss(NACC_FROZEN$OTHBIOM,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Biomarker findings - Other")
  
  NACC_FROZEN$OTHBIOMX=labelled_spss(NACC_FROZEN$OTHBIOMX, label="Biomarker findings - Other (specify)")
  
  NACC_FROZEN$IMAGLINF=labelled_spss(NACC_FROZEN$IMAGLINF,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Large vessel infarct(s)")
  
  NACC_FROZEN$IMAGLAC=labelled_spss(NACC_FROZEN$IMAGLAC,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Lacunar infarct(s)")
  
  NACC_FROZEN$IMAGMACH=labelled_spss(NACC_FROZEN$IMAGMACH,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Macrohemorrhage(s)")
  
  NACC_FROZEN$IMAGMICH=labelled_spss(NACC_FROZEN$IMAGMICH,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Microhemorrhage(s)")
  
  NACC_FROZEN$IMAGMWMH=labelled_spss(NACC_FROZEN$IMAGMWMH,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Moderate white-matter hyperintensity (CHS score 5-6)")
  
  NACC_FROZEN$IMAGEWMH=labelled_spss(NACC_FROZEN$IMAGEWMH,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=8,
    "Not applicable"=-4
  ), label="Extensive white-matter hyperintensity (CHS score 7-8)")
  
  NACC_FROZEN$OTHMUT=labelled_spss(NACC_FROZEN$OTHMUT,c(
    "No"=0,
    "Yes"=1,
    "Unknown/not assessed"=9,
    "Not applicable"=-4
  ), label="Does the subject have a hereditary mutation other than an AD or FTLD mutation?")
  
  NACC_FROZEN$OTHMUTX=as.character(NACC_FROZEN$OTHMUTX)
  NACC_FROZEN$OTHMUTX=labelled_spss(NACC_FROZEN$OTHMUTX, label="Other mutation, specify")
  
  NACC_FROZEN$NACCALZD=labelled_spss(NACC_FROZEN$NACCALZD,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "No cognitive impairment"=8
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Alzheimer's disease")
  
  NACC_FROZEN$NACCALZP=labelled_spss(NACC_FROZEN$NACCALZP,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but not AD diagnosis"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of observed cognitive impairment - Alzheimer's disease (AD)")
  
  NACC_FROZEN$PROBAD=labelled_spss(NACC_FROZEN$PROBAD,c(
    "No"=0,
    "Yes"=1,
    "No cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Probable Alzheimer's disease")
  
  NACC_FROZEN$PROBADIF=labelled_spss(NACC_FROZEN$PROBADIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but not AD diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Probable Alzheimer's disease")
  
  NACC_FROZEN$POSSAD=labelled_spss(NACC_FROZEN$POSSAD,c(
    "No"=0,
    "Yes"=1,
    "No cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Possible Alzheimer's disease")
  
  NACC_FROZEN$POSSADIF=labelled_spss(NACC_FROZEN$POSSADIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but not AD diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Possible Alzheimer's disease")
  
  NACC_FROZEN$NACCLBDE=labelled_spss(NACC_FROZEN$NACCLBDE,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "No cognitive impairment"=8
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Lewy body disease")
  
  NACC_FROZEN$NACCLBDP=labelled_spss(NACC_FROZEN$NACCLBDP,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but not LBD diagnosis"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Lewy body disease (LBD)")
  
  NACC_FROZEN$PARK=labelled_spss(NACC_FROZEN$PARK,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Parkinson's disease present")
  
  NACC_FROZEN$MSA=labelled_spss(NACC_FROZEN$MSA,c(
    "No (assumed assessed and found not present"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Multiple system atrophy (MSA)")
  
  NACC_FROZEN$MSAIF=labelled_spss(NACC_FROZEN$MSAIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no MSA diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Multiple system atrophy (MSA)")
  
  NACC_FROZEN$PSP=labelled_spss(NACC_FROZEN$PSP,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - primary supranuclear palsy (PSP)")
  
  NACC_FROZEN$PSPIF=labelled_spss(NACC_FROZEN$PSPIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no PSP diagnosis"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Primary supranuclear palsy (PSP)")
  
  NACC_FROZEN$CORT=labelled_spss(NACC_FROZEN$CORT,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Corticobasal degeneration (CBD)")
  
  NACC_FROZEN$CORTIF=labelled_spss(NACC_FROZEN$CORTIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no CBD diagnosis"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Corticobasal degeneration (CBD)")
  
  NACC_FROZEN$FTLDMO=labelled_spss(NACC_FROZEN$FTLDMO,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - FTLD with motor neuron disease (MND)")
  
  NACC_FROZEN$FTLDMOIF=labelled_spss(NACC_FROZEN$FTLDMOIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no FTLD with MND diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - FTLD with motor neuron disease (MND)")
  
  NACC_FROZEN$FTLDNOS=labelled_spss(NACC_FROZEN$FTLDNOS,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - FTLD not otherwise specified (NOS)")
  
  NACC_FROZEN$FTLDNOIF=labelled_spss(NACC_FROZEN$FTLDNOIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no FTLD NOS diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - FTLD not otherwise specified (NOS)")
  
  NACC_FROZEN$FTD=labelled_spss(NACC_FROZEN$FTD,c(
    "Absent"=0,
    "Present"=1,
    "No cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Presence of behavioral frontotemporal dementia (bvFTD)")
  
  NACC_FROZEN$FTDIF=labelled_spss(NACC_FROZEN$FTDIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Cognitively impaired but no bvFTD diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - behavioral frontotemporal dementia (bvFTD)")
  
  NACC_FROZEN$PPAPH=labelled_spss(NACC_FROZEN$PPAPH,c(
    "No"=0,
    "Yes"=1,
    "No cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Primary progressive aphasia (PPA)")
  
  NACC_FROZEN$PPAPHIF=labelled_spss(NACC_FROZEN$PPAPHIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Cognitively impaired but no PPA diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - primary progressive aphasia (PPA)")
  
  NACC_FROZEN$FTLDSUBT=labelled_spss(NACC_FROZEN$FTLDSUBT,c(
    "Tauopathy"=1,
    "TDP-43 proteinopathy"=2,
    "Other"=3,
    "Cognitively impaired but no FTLD diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Unknown subtype"=9,
    "Not applicable"=-4
  ), label="FTLD subtype")
  
  NACC_FROZEN$FTLDSUBX=labelled_spss(NACC_FROZEN$FTLDSUBX, label="Other FTLD subtype, specify")
  
  NACC_FROZEN$CVD=labelled_spss(NACC_FROZEN$CVD,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Vascular brain injury (VBI)")
  
  NACC_FROZEN$CVDIF=labelled_spss(NACC_FROZEN$CVDIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no VBI diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - vascular brain injury")
  
  NACC_FROZEN$PREVSTK=labelled_spss(NACC_FROZEN$PREVSTK,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Previous symptomatic stroke")
  
  NACC_FROZEN$STROKDEC=labelled_spss(NACC_FROZEN$STROKDEC,c(
    "No"=0,
    "Yes"=1,
    "Subject did not have a previous symptomatic stroke"=8,
    "Not applicable"=-4
  ), label="Temporal relationship between stroke and cognitive decline")
  
  NACC_FROZEN$STKIMAG=labelled_spss(NACC_FROZEN$STKIMAG,c(
    "No"=0,
    "Yes"=1,
    "Subject did not have a previous symptomatic stroke"=8,
    "Unknown, no relevant imaging data available"=9,
    "Not applicable"=-4
  ), label="Confirmation of stroke by neuroimaging")
  
  NACC_FROZEN$INFNETW=labelled_spss(NACC_FROZEN$INFNETW,c(
    "No"=0,
    "Yes"=1,
    "Unknown, no relevant imaging data available"=9,
    "Not applicable"=-4
  ), label="Imaging evidence of cystic infarction in cognitive network(s)")
  
  NACC_FROZEN$INFWMH=labelled_spss(NACC_FROZEN$INFWMH,c(
    "No"=0,
    "Yes"=1,
    "Unknown, no relevant imaging data available"=9,
    "Not applicable"=-4
  ), label="Imaging evidence of cystic infarction, imaging evidence of extensive white matter hyperintensity (CHS grade 7-8+), and impairment in executive function")
  
  NACC_FROZEN$VASC=labelled_spss(NACC_FROZEN$VASC,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Probable vascular dementia (NINDS/AIREN criteria)")
  
  NACC_FROZEN$VASCIF=labelled_spss(NACC_FROZEN$VASCIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Cognitively impaired but no CVD diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Probable vascular dementia (NINDS/AIREN criteria)")
  
  NACC_FROZEN$VASCPS=labelled_spss(NACC_FROZEN$VASCPS,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, no cognitive impairment"=8,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Possible vascular dementia (NINDS/AIREN criteria)")
  
  NACC_FROZEN$VASCPSIF=labelled_spss(NACC_FROZEN$VASCPSIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Cognitively impaired but not diagnosed with primary possible vascular dementia"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - possible vascular dementia (NINDS/AIREN criteria)")
  
  NACC_FROZEN$STROKE=labelled_spss(NACC_FROZEN$STROKE,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Stroke")
  
  NACC_FROZEN$STROKIF=labelled_spss(NACC_FROZEN$STROKIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no stroke diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - stroke")
  
  NACC_FROZEN$ESSTREM=labelled_spss(NACC_FROZEN$ESSTREM,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Essential tremor")
  
  NACC_FROZEN$ESSTREIF=labelled_spss(NACC_FROZEN$ESSTREIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of essential tremor"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Essential tremor")
  
  NACC_FROZEN$DOWNS=labelled_spss(NACC_FROZEN$DOWNS,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Down syndrome")
  
  NACC_FROZEN$DOWNSIF=labelled_spss(NACC_FROZEN$DOWNSIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no Down syndrome diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Down syndrome")
  
  NACC_FROZEN$HUNT=labelled_spss(NACC_FROZEN$HUNT,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Huntington's disease")
  
  NACC_FROZEN$HUNTIF=labelled_spss(NACC_FROZEN$HUNTIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no Huntington's disease diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Huntington's disease")
  
  NACC_FROZEN$PRION=labelled_spss(NACC_FROZEN$PRION,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Prion disease (CJD, other)")
  
  NACC_FROZEN$PRIONIF=labelled_spss(NACC_FROZEN$PRIONIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no Prion disease diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Prion disease (CJD, other)")
  
  NACC_FROZEN$BRNINJ=labelled_spss(NACC_FROZEN$BRNINJ,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Traumatic brain injury (TBI)")
  
  NACC_FROZEN$BRNINJIF=labelled_spss(NACC_FROZEN$BRNINJIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of TBI"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Traumatic brain injury (TBI)")
  
  NACC_FROZEN$BRNINCTE=labelled_spss(NACC_FROZEN$BRNINCTE,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "No TBI diagnosis"=8,
    "Not applicable"=-4
  ), label="Symptoms consistent with chronic traumatic encephalopathy (CTE)")
  
  NACC_FROZEN$HYCEPH=labelled_spss(NACC_FROZEN$HYCEPH,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Normal-pressure hydrocephalus (NPH)")
  
  NACC_FROZEN$HYCEPHIF=labelled_spss(NACC_FROZEN$HYCEPHIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no hydrocephalus diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Normal-pressure hydrocephalus (NPH)")
  
  NACC_FROZEN$EPILEP=labelled_spss(NACC_FROZEN$EPILEP,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Epilepsy")
  
  NACC_FROZEN$EPILEPIF=labelled_spss(NACC_FROZEN$EPILEPIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no epilepsy diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Epilepsy")
  
  NACC_FROZEN$NEOP=labelled_spss(NACC_FROZEN$NEOP,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - CNS neoplasm")
  
  NACC_FROZEN$NEOPIF=labelled_spss(NACC_FROZEN$NEOPIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no CNS neoplasm diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - CNS neoplasm")
  
  NACC_FROZEN$NEOPSTAT=labelled_spss(NACC_FROZEN$NEOPSTAT,c(
    "Benign"=1,
    "Malignant"=2,
    "No diagnosis of CNS neoplasm"=8,
    "Not applicable"=-4
  ), label="CNS neoplasm - benign or malignant")
  
  NACC_FROZEN$HIV=labelled_spss(NACC_FROZEN$HIV,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Human immunodeficiency virus (HIV)")
  
  NACC_FROZEN$HIVIF=labelled_spss(NACC_FROZEN$HIVIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no HIV diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - HIV")
  
  NACC_FROZEN$OTHCOG=labelled_spss(NACC_FROZEN$OTHCOG,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Other neurological, genetic, or infectious condition")
  
  NACC_FROZEN$OTHCOGIF=labelled_spss(NACC_FROZEN$OTHCOGIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of other neurological, genetic, or infectious condition "=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Other neurological, genetic, or infectious condition")
  
  NACC_FROZEN$OTHCOGX=labelled_spss(NACC_FROZEN$OTHCOGX, label="Presumptive etiologic diagnosis of the cognitive disorder - Other neurological, genetic, or infectious conditions (specify)")
  
  NACC_FROZEN$DEP=labelled_spss(NACC_FROZEN$DEP,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Depression")
  
  NACC_FROZEN$DEPIF=labelled_spss(NACC_FROZEN$DEPIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no depression diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Depression")
  
  NACC_FROZEN$DEPTREAT=labelled_spss(NACC_FROZEN$DEPTREAT,c(
    "Untreated"=0,
    "Treated"=1,
    "No diagnosis of depression"=8,
    "Not applicable"=-4
  ), label="Depression - Treated or untreated")
  
  NACC_FROZEN$BIPOLDX=labelled_spss(NACC_FROZEN$BIPOLDX,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Bipolar disorder")
  
  NACC_FROZEN$BIPOLDIF=labelled_spss(NACC_FROZEN$BIPOLDIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no bipolar disorder diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - bipolar disorder")
  
  NACC_FROZEN$SCHIZOP=labelled_spss(NACC_FROZEN$SCHIZOP,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Schizophrenia or other psychosis")
  
  NACC_FROZEN$SCHIZOIF=labelled_spss(NACC_FROZEN$SCHIZOIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no schizophrenia diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Schizophrenia or other psychosis")
  
  NACC_FROZEN$ANXIET=labelled_spss(NACC_FROZEN$ANXIET,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Anxiety")
  
  NACC_FROZEN$ANXIETIF=labelled_spss(NACC_FROZEN$ANXIETIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no anxiety diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Anxiety")
  
  NACC_FROZEN$DELIR=labelled_spss(NACC_FROZEN$DELIR,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Delirium")
  
  NACC_FROZEN$DELIRIF=labelled_spss(NACC_FROZEN$DELIRIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no delirium diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Delirium")
  
  NACC_FROZEN$PTSDDX=labelled_spss(NACC_FROZEN$PTSDDX,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Post-traumatic stress disorder (PTSD)")
  
  NACC_FROZEN$PTSDDXIF=labelled_spss(NACC_FROZEN$PTSDDXIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no PTSD diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - PTSD")
  
  NACC_FROZEN$OTHPSY=labelled_spss(NACC_FROZEN$OTHPSY,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Other psychiatric disease")
  
  NACC_FROZEN$OTHPSYIF=labelled_spss(NACC_FROZEN$OTHPSYIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of other psychiatric disease"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Other psychiatric disease")
  
  NACC_FROZEN$OTHPSYX=labelled_spss(NACC_FROZEN$OTHPSYX, label="Presumptive etiologic diagnosis of the cognitive disorder - Other psychiatric disease (specify)")
  
  NACC_FROZEN$ALCDEM=labelled_spss(NACC_FROZEN$ALCDEM,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Cognitive impairment due to alcohol abuse")
  
  NACC_FROZEN$ALCDEMIF=labelled_spss(NACC_FROZEN$ALCDEMIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of impairment due to alcohol abuse"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Alcohol abuse")
  
  NACC_FROZEN$ALCABUSE=labelled_spss(NACC_FROZEN$ALCABUSE,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9,
    "No diagnosis of impairment due to alcohol abuse"=8,
    "Not applicable"=-4
  ), label="Current alcohol abuse")
  
  NACC_FROZEN$IMPSUB=labelled_spss(NACC_FROZEN$IMPSUB,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Cognitive impairment due to other substance abuse")
  
  NACC_FROZEN$IMPSUBIF=labelled_spss(NACC_FROZEN$IMPSUBIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of impairment due to substance abuse"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Other substance abuse")
  
  NACC_FROZEN$DYSILL=labelled_spss(NACC_FROZEN$DYSILL,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Cognitive impairment due to systemic disease/ medical illness")
  
  NACC_FROZEN$DYSILLIF=labelled_spss(NACC_FROZEN$DYSILLIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of impairment due to systemic disease/medical illness"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - systemic disease/medical illness")
  
  NACC_FROZEN$MEDS=labelled_spss(NACC_FROZEN$MEDS,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Cognitive impairment due to medications")
  
  NACC_FROZEN$MEDSIF=labelled_spss(NACC_FROZEN$MEDSIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of impairment due to medications"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - medications")
  
  NACC_FROZEN$DEMUN=labelled_spss(NACC_FROZEN$DEMUN,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Undetermined etiology")
  
  NACC_FROZEN$DEMUNIF=labelled_spss(NACC_FROZEN$DEMUNIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no diagnosis of dementia due to undetermined etiology"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Undetermined etiology")
  
  NACC_FROZEN$COGOTH=labelled_spss(NACC_FROZEN$COGOTH,c(
    "No (assumed assessed and found not present)"=0,
    "Yes"=1
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Other 1 (specify)")
  
  NACC_FROZEN$COGOTHIF=labelled_spss(NACC_FROZEN$COGOTHIF,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no other etiologic diagnosis"=7,
    "Diagnosis of normal cognition"=8
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Other1 (specify)")
  
  NACC_FROZEN$COGOTHX=as.character(NACC_FROZEN$COGOTHX)
  NACC_FROZEN$COGOTHX=labelled_spss(NACC_FROZEN$COGOTHX, label="Other presumptive etiologic diagnosis of the cognitive disorder 1, specify")
  
  NACC_FROZEN$COGOTH2=labelled_spss(NACC_FROZEN$COGOTH2,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Other 2 (specify)")
  
  NACC_FROZEN$COGOTH2F=labelled_spss(NACC_FROZEN$COGOTH2F,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no other etiologic diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Other 2 (specify)")
  
  NACC_FROZEN$COGOTH2X=as.character(NACC_FROZEN$COGOTH2X)
  NACC_FROZEN$COGOTH2X=labelled_spss(NACC_FROZEN$COGOTH2X, label="Other presumptive etiologic diagnosis of the cognitive disorder 2, specify")
  
  NACC_FROZEN$COGOTH3=labelled_spss(NACC_FROZEN$COGOTH3,c(
    "No"=0,
    "Yes"=1,
    "Not applicable"=-4
  ), label="Presumptive etiologic diagnosis of the cognitive disorder - Other 3 (specify)")
  
  NACC_FROZEN$COGOTH3F=labelled_spss(NACC_FROZEN$COGOTH3F,c(
    "Primary"=1,
    "Contributing"=2,
    "Non-contributing"=3,
    "Cognitively impaired but no other etiologic diagnosis"=7,
    "Diagnosis of normal cognition"=8,
    "Not applicable"=-4
  ), label="Primary, contributing, or non- contributing cause of cognitive impairment - Other 3 (specify)")
  
  NACC_FROZEN$COGOTH3X=as.character(NACC_FROZEN$COGOTH3X)
  NACC_FROZEN$COGOTH3X=labelled_spss(NACC_FROZEN$COGOTH3X, label="Other presumptive etiologic diagnosis of the cognitive disorder 3, specify")
  
  NACC_FROZEN$NACCNORM=labelled_spss(NACC_FROZEN$NACCNORM,c(
    "Had a diagnosis other than normal cognition (impaired but not MCI, MCI, or dementia) for at least one UDS visit"=0,
    "Normal cognition at all UDS visits"=1
  ), label="Normal cognition at all visits to date")
  
  NACC_FROZEN$NACCIDEM=labelled_spss(NACC_FROZEN$NACCIDEM,c(
    "Did not progress to dementia"=0,
    "Progressed to dementia"=1,
    "Initial visit only or diagnosed with dementia at initial visit"=8
  ), label="Incident dementia during UDS follow-up")
  
  NACC_FROZEN$NACCMCII=labelled_spss(NACC_FROZEN$NACCMCII,c(
    "Did not progress to MCI"=0,
    "Progressed to MCI"=1,
    "Initial visit only, or had a diagnosis of MCI or dementia at initial UDS visit, or progressed directly to dementia"=8
  ), label="Incident MCI during UDS follow-up")
  
  NACC_FROZEN$NACCADMU=labelled_spss(NACC_FROZEN$NACCADMU,c(
    "No/unknown"=0,
    "Yes"=1
  ), label="Does the subject have a dominantly inherited AD mutation?")
  
  NACC_FROZEN$NACCFTDM=labelled_spss(NACC_FROZEN$NACCFTDM,c(
    "No/unknown"=0,
    "Yes"=1
  ), label="Does the subject have an hereditary FTLD mutation?")
  
  NACC_FROZEN$NACCETPR=labelled_spss(NACC_FROZEN$NACCETPR,c(
    "Alzheimer's disease (AD)"=1,
    "Lewy body disease (LBD)"=2,
    "Multiple system atrophy (MSA)"=3,
    "Progressive supranuclear palsy (PSP)"=4,
    "Corticobasal degeneration (CBD)"=5,
    "FTLD with motor neuron disease (e.g., ALS)"=6,
    "FTLD, other"=7,
    "Vascular brain injury or vascular dementia including stroke"=8,
    "Essential tremor"=9,
    "Down syndrome"=10,
    "Huntington's disease"=11,
    "Prion disease (CJD, other)"=12,
    "Traumatic brain injury (TBI)"=13,
    "Normal-pressure hydrocephalus (NPH)"=14,
    "Epilepsy"=15,
    "CNS neoplasm"=16,
    "Human immunodeficiency virus (HIV)"=17,
    "Other neurologic, genetic, or infectious condition"=18,
    "Depression"=19,
    "Bipolar disorder"=20,
    "Schizophrenia or other psychosis"=21,
    "Anxiety disorder"=22,
    "Delirium"=23,
    "Post-traumatic stress disorder (PTSD)"=24,
    "Other psychiatric disease"=25,
    "Cognitive impairment due to alcohol abuse"=26,
    "Cognitive impairment due to other substance abuse"=27,
    "Cognitive impairment due to systemic disease or medical illness"=28,
    "Cognitive impairment due to medications"=29,
    "Cognitive impairment for other specified reasons (i.e., written-in values)"=30,
    "Not applicable, not cognitively impaired"=88,
    "Missing/unknown"=99
  ), label="Primary etiologic diagnosis (MCI); impaired, not MCI; or dementia")
  
  #-----------------------------------------------------------------------------
  ### D2 Clinician-assessed Medical Conditions
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$CANCER=labelled_spss(NACC_FROZEN$CANCER,c(
    "No"=0,
    "Yes, primary/non-metastatic"=1,
    "Yes, metastatic"=2,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Cancer present in the last 12 months (excluding non-melanoma skin cancer), primary or metastatic")
  
  NACC_FROZEN$CANCSITE=labelled_spss(NACC_FROZEN$CANCSITE, label="Cancer primary site specification ")
  
  NACC_FROZEN$DIABET=labelled_spss(NACC_FROZEN$DIABET,c(
    "No"=0,
    "Yes, Type I"=1,
    "Yes, Type II"=2,
    "Yes, other type"=3,
    "Not assessed or unknown"=9,
    "Not available"=-4
  ), label="Diabetes present at visit ")
  
  NACC_FROZEN$MYOINF=labelled_spss(NACC_FROZEN$MYOINF,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Myocardial infarct present within the past 12 months")
  
  NACC_FROZEN$CONGHRT=labelled_spss(NACC_FROZEN$CONGHRT,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Congestive heart failure present")
  
  NACC_FROZEN$AFIBRILL=labelled_spss(NACC_FROZEN$AFIBRILL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Atrial fibrillation present")
  
  NACC_FROZEN$HYPERT=labelled_spss(NACC_FROZEN$HYPERT,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Hypertension present")
  
  NACC_FROZEN$ANGINA=labelled_spss(NACC_FROZEN$ANGINA,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Angina present")
  
  NACC_FROZEN$HYPCHOL=labelled_spss(NACC_FROZEN$HYPCHOL,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Hypercholesterolemia present")
  
  NACC_FROZEN$VB12DEF=labelled_spss(NACC_FROZEN$VB12DEF,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="B12 deficiency present")
  
  NACC_FROZEN$THYDIS=labelled_spss(NACC_FROZEN$THYDIS,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Thyroid disease present")
  
  NACC_FROZEN$ARTH=labelled_spss(NACC_FROZEN$ARTH,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Arthritis present")
  
  NACC_FROZEN$ARTYPE=labelled_spss(NACC_FROZEN$ARTYPE,c(
    "Rheumatoid"=1,
    "Osteoarthritis"=2,
    "Other (specify)"=3,
    "No arthritis reported"=8,
    "Unknown"=9,
    "Not available"=-4
  ), label="Arthritis type")
  
  NACC_FROZEN$ARTYPEX=labelled_spss(NACC_FROZEN$ARTYPEX, label="Other arthritis type specification")
  
  NACC_FROZEN$ARTUPEX=labelled_spss(NACC_FROZEN$ARTUPEX,c(
    "No"=0,
    "Yes"=1,
    "No arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis region affected - upper extremity")
  
  NACC_FROZEN$ARTLOEX=labelled_spss(NACC_FROZEN$ARTLOEX,c(
    "No"=0,
    "Yes"=1,
    "No arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis region affected - lower extremity")
  
  NACC_FROZEN$ARTSPIN=labelled_spss(NACC_FROZEN$ARTSPIN,c(
    "No"=0,
    "Yes"=1,
    "No arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis region affected - spine")
  
  NACC_FROZEN$ARTUNKN=labelled_spss(NACC_FROZEN$ARTUNKN,c(
    "No"=0,
    "Yes"=1,
    "No arthritis reported"=8,
    "Not available"=-4
  ), label="Arthritis region affected - unknown")
  
  NACC_FROZEN$URINEINC=labelled_spss(NACC_FROZEN$URINEINC,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Incontinence present - urinary")
  
  NACC_FROZEN$BOWLINC=labelled_spss(NACC_FROZEN$BOWLINC,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Incontinence present - bowel")
  
  NACC_FROZEN$SLEEPAP=labelled_spss(NACC_FROZEN$SLEEPAP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Sleep apnea present")
  
  NACC_FROZEN$REMDIS=labelled_spss(NACC_FROZEN$REMDIS,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="REM sleep behavior disorder (RBD) present")
  
  NACC_FROZEN$HYPOSOM=labelled_spss(NACC_FROZEN$HYPOSOM,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Hyposomnia/insomnia present")
  
  NACC_FROZEN$SLEEPOTH=labelled_spss(NACC_FROZEN$SLEEPOTH,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Other sleep disorder present")
  
  NACC_FROZEN$SLEEPOTX=labelled_spss(NACC_FROZEN$SLEEPOTX, label="Other sleep disorder specification")
  
  NACC_FROZEN$ANGIOCP=labelled_spss(NACC_FROZEN$ANGIOCP,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Carotid procedure: angioplasty, endarterectomy, or stent within the past 12 months")
  
  NACC_FROZEN$ANGIOPCI=labelled_spss(NACC_FROZEN$ANGIOPCI,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Percutaneous coronary intervention: angioplasty and/or stent within the past 12 months")
  
  NACC_FROZEN$PACEMAKE=labelled_spss(NACC_FROZEN$PACEMAKE,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Procedure: pacemaker and/or defibrillator within the past 12 months")
  
  NACC_FROZEN$HVALVE=labelled_spss(NACC_FROZEN$HVALVE,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Procedure: heart valve replacement or repair within the past 12 months")
  
  NACC_FROZEN$ANTIENC=labelled_spss(NACC_FROZEN$ANTIENC,c(
    "No"=0,
    "Yes"=1,
    "Not assessed"=8,
    "Not available"=-4
  ), label="Antibody-mediated encephalopathy within the past 12 months")
  
  NACC_FROZEN$ANTIENCX=as.character(NACC_FROZEN$ANTIENCX)
  NACC_FROZEN$ANTIENCX=labelled_spss(NACC_FROZEN$ANTIENCX, label="Antibody-mediated encephalopathy, specify")
  
  NACC_FROZEN$OTHCOND=labelled_spss(NACC_FROZEN$OTHCOND,c(
    "No"=0,
    "Yes"=1,
    "Not available"=-4
  ), label="Other medical conditions or procedures within the past 12 months not listed above")
  
  NACC_FROZEN$OTHCONDX=labelled_spss(NACC_FROZEN$OTHCONDX, label="Other medical conditions specification ")
  
  #-----------------------------------------------------------------------------
  ### Z1X Form Checklist
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$LANGA1=labelled_spss(NACC_FROZEN$LANGA1,c(
    "English"=1,
    "Spanish"=2
  ), label="A1 Subject Demographics - language")
  
  NACC_FROZEN$LANGA2=labelled_spss(NACC_FROZEN$LANGA2,c(
    "English"=1,
    "Spanish"=2
  ), label="A2 Co-participant Demographics - language")
  
  NACC_FROZEN$LANGA3=labelled_spss(NACC_FROZEN$LANGA3,c(
    "English"=1,
    "Spanish"=2
  ), label="A3 Subject Family History - language")
  
  NACC_FROZEN$LANGA4=labelled_spss(NACC_FROZEN$LANGA4,c(
    "English"=1,
    "Spanish"=2
  ), label="A4 Subject Medications - language")
  
  NACC_FROZEN$LANGA5=labelled_spss(NACC_FROZEN$LANGA5,c(
    "English"=1,
    "Spanish"=2
  ), label="A5 Subject Health History - language")
  
  NACC_FROZEN$LANGB1=labelled_spss(NACC_FROZEN$LANGB1,c(
    "English"=1,
    "Spanish"=2
  ), label="B1 Evaluation Form: Physical - language")
  
  NACC_FROZEN$LANGB4=labelled_spss(NACC_FROZEN$LANGB4,c(
    "English"=1,
    "Spanish"=2
  ), label="B4 Global Staging - CDR: Standard and Supplemental - language")
  
  NACC_FROZEN$LANGB5=labelled_spss(NACC_FROZEN$LANGB5,c(
    "English"=1,
    "Spanish"=2
  ), label="B5 Behavioral Assessment: NPI-Q - language")
  
  NACC_FROZEN$LANGB6=labelled_spss(NACC_FROZEN$LANGB6,c(
    "English"=1,
    "Spanish"=2
  ), label="B6 Behavioral Assessment: GDS - language")
  
  NACC_FROZEN$LANGB7=labelled_spss(NACC_FROZEN$LANGB7,c(
    "English"=1,
    "Spanish"=2
  ), label="B7 Functional Assessment: FAS - language")
  
  NACC_FROZEN$LANGB8=labelled_spss(NACC_FROZEN$LANGB8,c(
    "English"=1,
    "Spanish"=2
  ), label="B8 Neurological Examination Findings - language")
  
  NACC_FROZEN$LANGB9=labelled_spss(NACC_FROZEN$LANGB9,c(
    "English"=1,
    "Spanish"=2
  ), label="B9 Clinician Judgment of Symptoms - language")
  
  NACC_FROZEN$LANGC2=labelled_spss(NACC_FROZEN$LANGC2,c(
    "English"=1,
    "Spanish"=2
  ), label="C2 Neuropsychological Battery Scores - language")
  
  NACC_FROZEN$LANGD1=labelled_spss(NACC_FROZEN$LANGD1,c(
    "English"=1,
    "Spanish"=2
  ), label="D1 Clinician Diagnosis - language")
  
  NACC_FROZEN$LANGD2=labelled_spss(NACC_FROZEN$LANGD2,c(
    "English"=1,
    "Spanish"=2
  ), label="D2 Clinician-assessed Medical Conditions - language")
  
  NACC_FROZEN$LANGB3F=as.numeric(NACC_FROZEN$LANGB3F)
  NACC_FROZEN$LANGB9F=as.numeric(NACC_FROZEN$LANGB9F)
  NACC_FROZEN$LANGC1F=as.numeric(NACC_FROZEN$LANGC1F)
  NACC_FROZEN$LANGC2F=as.numeric(NACC_FROZEN$LANGC2F)
  NACC_FROZEN$LANGC3F=as.numeric(NACC_FROZEN$LANGC3F)
  NACC_FROZEN$LANGC4F=as.numeric(NACC_FROZEN$LANGC4F)
  NACC_FROZEN$LANGC5F=as.numeric(NACC_FROZEN$LANGC5F)
  NACC_FROZEN$LANGC6F=as.numeric(NACC_FROZEN$LANGC6F)
  NACC_FROZEN$LANGE2F=as.numeric(NACC_FROZEN$LANGE2F)
  NACC_FROZEN$LANGE3F=as.numeric(NACC_FROZEN$LANGE3F)
  
  NACC_FROZEN$LANGB3F=labelled_spss(NACC_FROZEN$LANGB3F,c(
    "English"=1,
    "Spanish"=2
  ), label="B3F Supplemental UPDRS - language")
  
  NACC_FROZEN$LANGB9F=labelled_spss(NACC_FROZEN$LANGB9F,c(
    "English"=1,
    "Spanish"=2
  ), label="B9F Clinical PPA and bvFTD Features - language")
  
  NACC_FROZEN$LANGC1F=labelled_spss(NACC_FROZEN$LANGC1F,c(
    "English"=1,
    "Spanish"=2
  ), label="C1F Neuropsychological Battery Summary Scores - language")
  
  NACC_FROZEN$LANGC2F=labelled_spss(NACC_FROZEN$LANGC2F,c(
    "English"=1,
    "Spanish"=2
  ), label="C2F Social Norms Questionnaire - language")
  
  NACC_FROZEN$LANGC3F=labelled_spss(NACC_FROZEN$LANGC3F,c(
    "English"=1,
    "Spanish"=2
  ), label="C3F Social Behavior Observer Checklist - language")
  
  NACC_FROZEN$LANGC4F=labelled_spss(NACC_FROZEN$LANGC4F,c(
    "English"=1,
    "Spanish"=2
  ), label="C4F Behavioral Inhibition Scale - language")
  
  NACC_FROZEN$LANGC5F=labelled_spss(NACC_FROZEN$LANGC5F,c(
    "English"=1,
    "Spanish"=2
  ), label="C5F Interpersonal Reactivity Index - language")
  
  NACC_FROZEN$LANGC6F=labelled_spss(NACC_FROZEN$LANGC6F,c(
    "English"=1,
    "Spanish"=2
  ), label="C6F Revised Self-monitoring Scale - language")
  
  NACC_FROZEN$LANGE2F=labelled_spss(NACC_FROZEN$LANGE2F,c(
    "English"=1,
    "Spanish"=2
  ), label="E2F Imaging Available - language")
  
  NACC_FROZEN$LANGE3F=labelled_spss(NACC_FROZEN$LANGE3F,c(
    "English"=1,
    "Spanish"=2
  ), label="E3F Imaging in Diagnosis - language")
  
  NACC_FROZEN$LANGCLS=labelled_spss(NACC_FROZEN$LANGCLS,c(
    "English"=1,
    "Spanish"=2
  ), label="CLS Subject Demographics - language")
  
  NACC_FROZEN$CLSSUB=labelled_spss(NACC_FROZEN$CLSSUB,c(
    "No"=0,
    "Yes"=1
  ), label="B3F Subject Demographics - language")
  
  #-----------------------------------------------------------------------------
  ### CLS Linguistic History Form
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$NACCSPNL=labelled_spss(NACC_FROZEN$NACCSPNL, label="Average Spanish level (average of Questions 6 €“ 9)")
  
  NACC_FROZEN$NACCENGL=labelled_spss(NACC_FROZEN$NACCENGL, label="Average English level (average of Questions 11 €“ 14)")
  
  NACC_FROZEN$APREFLAN=labelled_spss(NACC_FROZEN$APREFLAN,c(
    "English"=1,
    "Spanish"=2
  ), label="In what language do you prefer to be evaluated (English or Spanish)")
  
  NACC_FROZEN$AYRSPAN=labelled_spss(NACC_FROZEN$AYRSPAN, label="How many years have you lived in an environment where people generally speak Spanish")
  
  NACC_FROZEN$AYRENGL=labelled_spss(NACC_FROZEN$AYRENGL, label="How many years have you lived in an environment where people generally speak English")
  
  NACC_FROZEN$APCSPAN=labelled_spss(NACC_FROZEN$APCSPAN, label="Please approximate the percentage of time during a normal/average day that you use Spanish")
  
  NACC_FROZEN$APCENGL=labelled_spss(NACC_FROZEN$APCENGL, label="Please approximate the percentage of time during a normal/average day that you use English")
  
  NACC_FROZEN$ASPKSPAN=labelled_spss(NACC_FROZEN$ASPKSPAN,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency when you speak Spanish")
  
  NACC_FROZEN$AREASPAN=labelled_spss(NACC_FROZEN$AREASPAN,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency when you read Spanish")
  
  NACC_FROZEN$AWRISPAN=labelled_spss(NACC_FROZEN$AWRISPAN,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency when you write in Spanish")
  
  NACC_FROZEN$AUNDSPAN=labelled_spss(NACC_FROZEN$AUNDSPAN,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency for understanding spoken/oral Spanish")
  
  NACC_FROZEN$ASPKENGL=labelled_spss(NACC_FROZEN$ASPKENGL,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency when you speak English")
  
  NACC_FROZEN$AREAENGL=labelled_spss(NACC_FROZEN$AREAENGL,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency when you read English")
  
  NACC_FROZEN$AWRIENGL=labelled_spss(NACC_FROZEN$AWRIENGL,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency when you write in English")
  
  NACC_FROZEN$AUNDENGL=labelled_spss(NACC_FROZEN$AUNDENGL,c(
    "Almost none"=1,
    "Very poor"=2,
    "Fair"=3,
    "Functional"=4,
    "Good"=5,
    "Very good"=6,
    "Like native speaker"=7
  ), label="In your opinion, what is your level of proficiency for understanding spoken/oral English")
  
  #-----------------------------------------------------------------------------
  ### Other data available at NACC
  #-----------------------------------------------------------------------------
  
  NACC_FROZEN$NACCFTD=labelled_spss(NACC_FROZEN$NACCFTD,c(
    "No FTLD Module visit"=0,
    "At least one FTLD Module visit"=1
  ), label="One or more FTLD Module visits completed")
  
  NACC_FROZEN$NACCLBDM=labelled_spss(NACC_FROZEN$NACCLBDM,c(
    "No LBD Module visit"=0,
    "At least one LBD Module visit"=1
  ), label="One or more LBD Module visits completed")
  
  NACC_FROZEN$NACCNMRI=labelled_spss(NACC_FROZEN$NACCNMRI,c(
    "Not applicable / no MRI available"=88
  ), label="Total number of MRI sessions")
  
  NACC_FROZEN$NACCMRI=labelled_spss(NACC_FROZEN$NACCMRI, label="MRI file available")
  
  NACC_FROZEN$NACCACSF=labelled_spss(NACC_FROZEN$NACCACSF,c(
    "No AÎ²1€“42 reported"=0,
    "One or more measures of AÎ²1€“42 reported"=1
  ), label="One or more measures of AÎ²1€“42 reported")
  
  NACC_FROZEN$NACCPCSF=labelled_spss(NACC_FROZEN$NACCPCSF,c(
    "No P-tau181P reported"=0,
    "One or more measures of P-tau181P reported"=1
  ), label="One or more measures of P-tau181P reported")
  
  NACC_FROZEN$NACCTCSF=labelled_spss(NACC_FROZEN$NACCTCSF,c(
    "No T-tau reported"=0,
    "One or more measures of T-tau reported"=1
  ), label="One or more measures of T-tau reported")
  
  NACC_FROZEN$NACCAUTP=labelled_spss(NACC_FROZEN$NACCAUTP,c(
    "No"=0,
    "Yes"=1,
    "Not applicable, subject not deceased"=8
  ), label="Neuropathology data from an autopsy is available")
  
#-------------------------------------------------------------------------------
### Non-essential UDS Variables
#-------------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
  ### A3 Subject Family History
  #-----------------------------------------------------------------------------
  NACC_FROZEN$AFFFAMM=as.numeric(NACC_FROZEN$AFFFAMM)
  NACC_FROZEN$A3CHG=as.numeric(NACC_FROZEN$A3CHG)
  NACC_FROZEN$NWINFMUT=as.numeric(NACC_FROZEN$NWINFMUT)
  NACC_FROZEN$FADMUT=as.numeric(NACC_FROZEN$FADMUT)
  NACC_FROZEN$FADMUSO=as.numeric(NACC_FROZEN$FADMUSO)
  NACC_FROZEN$FFTDMUT=as.numeric(NACC_FROZEN$FFTDMUT)
  NACC_FROZEN$FFTDMUSO=as.numeric(NACC_FROZEN$FFTDMUSO)
  NACC_FROZEN$FOTHMUT=as.numeric(NACC_FROZEN$FOTHMUT)
  NACC_FROZEN$FOTHMUSO=as.numeric(NACC_FROZEN$FOTHMUSO)
  NACC_FROZEN$PARCHG=as.numeric(NACC_FROZEN$PARCHG)
  NACC_FROZEN$NWINFPAR=as.numeric(NACC_FROZEN$NWINFPAR)
  NACC_FROZEN$MOMMOB=as.numeric(NACC_FROZEN$MOMMOB)
  NACC_FROZEN$MOMYOB=as.numeric(NACC_FROZEN$MOMYOB)
  NACC_FROZEN$MOMLIV=as.numeric(NACC_FROZEN$MOMLIV)
  NACC_FROZEN$MOMYOD=as.numeric(NACC_FROZEN$MOMYOD)
  NACC_FROZEN$MOMDEM=as.numeric(NACC_FROZEN$MOMDEM)
  NACC_FROZEN$MOMONSET=as.numeric(NACC_FROZEN$MOMONSET)
  NACC_FROZEN$MOMAGE=as.numeric(NACC_FROZEN$MOMAGE)
  NACC_FROZEN$MOMDAGE=as.numeric(NACC_FROZEN$MOMDAGE)
  NACC_FROZEN$MOMNEUR=as.numeric(NACC_FROZEN$MOMNEUR)
  NACC_FROZEN$MOMPRDX=as.numeric(NACC_FROZEN$MOMPRDX)
  NACC_FROZEN$MOMMOE=as.numeric(NACC_FROZEN$MOMMOE)
  NACC_FROZEN$MOMAGEO=as.numeric(NACC_FROZEN$MOMAGEO)
  NACC_FROZEN$DADMOB=as.numeric(NACC_FROZEN$DADMOB)
  NACC_FROZEN$DADYOB=as.numeric(NACC_FROZEN$DADYOB)
  NACC_FROZEN$DADLIV=as.numeric(NACC_FROZEN$DADLIV)
  NACC_FROZEN$DADYOD=as.numeric(NACC_FROZEN$DADYOD)
  NACC_FROZEN$DADDEM=as.numeric(NACC_FROZEN$DADDEM)
  NACC_FROZEN$DADONSET=as.numeric(NACC_FROZEN$DADONSET)
  NACC_FROZEN$DADAGE=as.numeric(NACC_FROZEN$DADAGE)
  NACC_FROZEN$DADDAGE=as.numeric(NACC_FROZEN$DADDAGE)
  NACC_FROZEN$DADNEUR=as.numeric(NACC_FROZEN$DADNEUR)
  NACC_FROZEN$DADPRDX=as.numeric(NACC_FROZEN$DADPRDX)
  NACC_FROZEN$DADMOE=as.numeric(NACC_FROZEN$DADMOE)
  NACC_FROZEN$DADAGEO=as.numeric(NACC_FROZEN$DADAGEO)
  NACC_FROZEN$TWIN=as.numeric(NACC_FROZEN$TWIN)
  NACC_FROZEN$TWINTYPE=as.numeric(NACC_FROZEN$TWINTYPE)
  NACC_FROZEN$SIBS=as.numeric(NACC_FROZEN$SIBS)
  NACC_FROZEN$SIBSDEM=as.numeric(NACC_FROZEN$SIBSDEM)
  NACC_FROZEN$SIBCHG=as.numeric(NACC_FROZEN$SIBCHG)
  NACC_FROZEN$NWINFSIB=as.numeric(NACC_FROZEN$NWINFSIB)
  NACC_FROZEN$SIB1MOB=as.numeric(NACC_FROZEN$SIB1MOB)
  NACC_FROZEN$SIB1YOB=as.numeric(NACC_FROZEN$SIB1YOB)
  NACC_FROZEN$SIB1AGD=as.numeric(NACC_FROZEN$SIB1AGD)
  NACC_FROZEN$SIB1NEU=as.numeric(NACC_FROZEN$SIB1NEU)
  NACC_FROZEN$SIB1PDX=as.numeric(NACC_FROZEN$SIB1PDX)
  NACC_FROZEN$SIB1MOE=as.numeric(NACC_FROZEN$SIB1MOE)
  NACC_FROZEN$SIB1AGO=as.numeric(NACC_FROZEN$SIB1AGO)
  NACC_FROZEN$SIB2MOB=as.numeric(NACC_FROZEN$SIB2MOB)
  NACC_FROZEN$SIB2YOB=as.numeric(NACC_FROZEN$SIB2YOB)
  NACC_FROZEN$SIB2AGD=as.numeric(NACC_FROZEN$SIB2AGD)
  NACC_FROZEN$SIB2NEU=as.numeric(NACC_FROZEN$SIB2NEU)
  NACC_FROZEN$SIB2PDX=as.numeric(NACC_FROZEN$SIB2PDX)
  NACC_FROZEN$SIB2MOE=as.numeric(NACC_FROZEN$SIB2MOE)
  NACC_FROZEN$SIB2AGO=as.numeric(NACC_FROZEN$SIB2AGO)
  NACC_FROZEN$SIB3MOB=as.numeric(NACC_FROZEN$SIB3MOB)
  NACC_FROZEN$SIB3YOB=as.numeric(NACC_FROZEN$SIB3YOB)
  NACC_FROZEN$SIB3AGD=as.numeric(NACC_FROZEN$SIB3AGD)
  NACC_FROZEN$SIB3NEU=as.numeric(NACC_FROZEN$SIB3NEU)
  NACC_FROZEN$SIB3PDX=as.numeric(NACC_FROZEN$SIB3PDX)
  NACC_FROZEN$SIB3MOE=as.numeric(NACC_FROZEN$SIB3MOE)
  NACC_FROZEN$SIB3AGO=as.numeric(NACC_FROZEN$SIB3AGO)
  NACC_FROZEN$SIB4MOB=as.numeric(NACC_FROZEN$SIB4MOB)
  NACC_FROZEN$SIB4YOB=as.numeric(NACC_FROZEN$SIB4YOB)
  NACC_FROZEN$SIB4AGD=as.numeric(NACC_FROZEN$SIB4AGD)
  NACC_FROZEN$SIB4NEU=as.numeric(NACC_FROZEN$SIB4NEU)
  NACC_FROZEN$SIB4PDX=as.numeric(NACC_FROZEN$SIB4PDX)
  NACC_FROZEN$SIB4MOE=as.numeric(NACC_FROZEN$SIB4MOE)
  NACC_FROZEN$SIB4AGO=as.numeric(NACC_FROZEN$SIB4AGO)
  NACC_FROZEN$SIB5MOB=as.numeric(NACC_FROZEN$SIB5MOB)
  NACC_FROZEN$SIB5YOB=as.numeric(NACC_FROZEN$SIB5YOB)
  NACC_FROZEN$SIB5AGD=as.numeric(NACC_FROZEN$SIB5AGD)
  NACC_FROZEN$SIB5NEU=as.numeric(NACC_FROZEN$SIB5NEU)
  NACC_FROZEN$SIB5PDX=as.numeric(NACC_FROZEN$SIB5PDX)
  NACC_FROZEN$SIB5MOE=as.numeric(NACC_FROZEN$SIB5MOE)
  NACC_FROZEN$SIB5AGO=as.numeric(NACC_FROZEN$SIB5AGO)
  NACC_FROZEN$SIB6MOB=as.numeric(NACC_FROZEN$SIB6MOB)
  NACC_FROZEN$SIB6YOB=as.numeric(NACC_FROZEN$SIB6YOB)
  NACC_FROZEN$SIB6AGD=as.numeric(NACC_FROZEN$SIB6AGD)
  NACC_FROZEN$SIB6NEU=as.numeric(NACC_FROZEN$SIB6NEU)
  NACC_FROZEN$SIB6PDX=as.numeric(NACC_FROZEN$SIB6PDX)
  NACC_FROZEN$SIB6MOE=as.numeric(NACC_FROZEN$SIB6MOE)
  NACC_FROZEN$SIB6AGO=as.numeric(NACC_FROZEN$SIB6AGO)
  NACC_FROZEN$SIB7MOB=as.numeric(NACC_FROZEN$SIB7MOB)
  NACC_FROZEN$SIB7YOB=as.numeric(NACC_FROZEN$SIB7YOB)
  NACC_FROZEN$SIB7AGD=as.numeric(NACC_FROZEN$SIB7AGD)
  NACC_FROZEN$SIB7NEU=as.numeric(NACC_FROZEN$SIB7NEU)
  NACC_FROZEN$SIB7PDX=as.numeric(NACC_FROZEN$SIB7PDX)
  NACC_FROZEN$SIB7MOE=as.numeric(NACC_FROZEN$SIB7MOE)
  NACC_FROZEN$SIB7AGO=as.numeric(NACC_FROZEN$SIB7AGO)
  NACC_FROZEN$SIB8MOB=as.numeric(NACC_FROZEN$SIB8MOB)
  NACC_FROZEN$SIB8YOB=as.numeric(NACC_FROZEN$SIB8YOB)
  NACC_FROZEN$SIB8AGD=as.numeric(NACC_FROZEN$SIB8AGD)
  NACC_FROZEN$SIB8NEU=as.numeric(NACC_FROZEN$SIB8NEU)
  NACC_FROZEN$SIB8PDX=as.numeric(NACC_FROZEN$SIB8PDX)
  NACC_FROZEN$SIB8MOE=as.numeric(NACC_FROZEN$SIB8MOE)
  NACC_FROZEN$SIB8AGO=as.numeric(NACC_FROZEN$SIB8AGO)
  NACC_FROZEN$SIB9MOB=as.numeric(NACC_FROZEN$SIB9MOB)
  NACC_FROZEN$SIB9YOB=as.numeric(NACC_FROZEN$SIB9YOB)
  NACC_FROZEN$SIB9AGD=as.numeric(NACC_FROZEN$SIB9AGD)
  NACC_FROZEN$SIB9NEU=as.numeric(NACC_FROZEN$SIB9NEU)
  NACC_FROZEN$SIB9PDX=as.numeric(NACC_FROZEN$SIB9PDX)
  NACC_FROZEN$SIB9MOE=as.numeric(NACC_FROZEN$SIB9MOE)
  NACC_FROZEN$SIB9AGO=as.numeric(NACC_FROZEN$SIB9AGO)
  NACC_FROZEN$SIB10MOB=as.numeric(NACC_FROZEN$SIB10MOB)
  NACC_FROZEN$SIB10YOB=as.numeric(NACC_FROZEN$SIB10YOB)
  NACC_FROZEN$SIB10AGD=as.numeric(NACC_FROZEN$SIB10AGD)
  NACC_FROZEN$SIB10NEU=as.numeric(NACC_FROZEN$SIB10NEU)
  NACC_FROZEN$SIB10PDX=as.numeric(NACC_FROZEN$SIB10PDX)
  NACC_FROZEN$SIB10MOE=as.numeric(NACC_FROZEN$SIB10MOE)
  NACC_FROZEN$SIB10AGO=as.numeric(NACC_FROZEN$SIB10AGO)
  NACC_FROZEN$SIB11MOB=as.numeric(NACC_FROZEN$SIB11MOB)
  NACC_FROZEN$SIB11YOB=as.numeric(NACC_FROZEN$SIB11YOB)
  NACC_FROZEN$SIB11AGD=as.numeric(NACC_FROZEN$SIB11AGD)
  NACC_FROZEN$SIB11NEU=as.numeric(NACC_FROZEN$SIB11NEU)
  NACC_FROZEN$SIB11PDX=as.numeric(NACC_FROZEN$SIB11PDX)
  NACC_FROZEN$SIB11MOE=as.numeric(NACC_FROZEN$SIB11MOE)
  NACC_FROZEN$SIB11AGO=as.numeric(NACC_FROZEN$SIB11AGO)
  NACC_FROZEN$SIB12MOB=as.numeric(NACC_FROZEN$SIB12MOB)
  NACC_FROZEN$SIB12YOB=as.numeric(NACC_FROZEN$SIB12YOB)
  NACC_FROZEN$SIB12AGD=as.numeric(NACC_FROZEN$SIB12AGD)
  NACC_FROZEN$SIB12NEU=as.numeric(NACC_FROZEN$SIB12NEU)
  NACC_FROZEN$SIB12PDX=as.numeric(NACC_FROZEN$SIB12PDX)
  NACC_FROZEN$SIB12MOE=as.numeric(NACC_FROZEN$SIB12MOE)
  NACC_FROZEN$SIB12AGO=as.numeric(NACC_FROZEN$SIB12AGO)
  NACC_FROZEN$SIB13MOB=as.numeric(NACC_FROZEN$SIB13MOB)
  NACC_FROZEN$SIB13YOB=as.numeric(NACC_FROZEN$SIB13YOB)
  NACC_FROZEN$SIB13AGD=as.numeric(NACC_FROZEN$SIB13AGD)
  NACC_FROZEN$SIB13NEU=as.numeric(NACC_FROZEN$SIB13NEU)
  NACC_FROZEN$SIB13PDX=as.numeric(NACC_FROZEN$SIB13PDX)
  NACC_FROZEN$SIB13MOE=as.numeric(NACC_FROZEN$SIB13MOE)
  NACC_FROZEN$SIB13AGO=as.numeric(NACC_FROZEN$SIB13AGO)
  NACC_FROZEN$SIB14MOB=as.numeric(NACC_FROZEN$SIB14MOB)
  NACC_FROZEN$SIB14YOB=as.numeric(NACC_FROZEN$SIB14YOB)
  NACC_FROZEN$SIB14AGD=as.numeric(NACC_FROZEN$SIB14AGD)
  NACC_FROZEN$SIB14NEU=as.numeric(NACC_FROZEN$SIB14NEU)
  NACC_FROZEN$SIB14PDX=as.numeric(NACC_FROZEN$SIB14PDX)
  NACC_FROZEN$SIB14MOE=as.numeric(NACC_FROZEN$SIB14MOE)
  NACC_FROZEN$SIB14AGO=as.numeric(NACC_FROZEN$SIB14AGO)
  NACC_FROZEN$SIB15MOB=as.numeric(NACC_FROZEN$SIB15MOB)
  NACC_FROZEN$SIB15YOB=as.numeric(NACC_FROZEN$SIB15YOB)
  NACC_FROZEN$SIB15AGD=as.numeric(NACC_FROZEN$SIB15AGD)
  NACC_FROZEN$SIB15NEU=as.numeric(NACC_FROZEN$SIB15NEU)
  NACC_FROZEN$SIB15PDX=as.numeric(NACC_FROZEN$SIB15PDX)
  NACC_FROZEN$SIB15MOE=as.numeric(NACC_FROZEN$SIB15MOE)
  NACC_FROZEN$SIB15AGO=as.numeric(NACC_FROZEN$SIB15AGO)
  NACC_FROZEN$SIB16MOB=as.numeric(NACC_FROZEN$SIB16MOB)
  NACC_FROZEN$SIB16YOB=as.numeric(NACC_FROZEN$SIB16YOB)
  NACC_FROZEN$SIB16AGD=as.numeric(NACC_FROZEN$SIB16AGD)
  NACC_FROZEN$SIB16NEU=as.numeric(NACC_FROZEN$SIB16NEU)
  NACC_FROZEN$SIB16PDX=as.numeric(NACC_FROZEN$SIB16PDX)
  NACC_FROZEN$SIB16MOE=as.numeric(NACC_FROZEN$SIB16MOE)
  NACC_FROZEN$SIB16AGO=as.numeric(NACC_FROZEN$SIB16AGO)
  NACC_FROZEN$SIB17MOB=as.numeric(NACC_FROZEN$SIB17MOB)
  NACC_FROZEN$SIB17YOB=as.numeric(NACC_FROZEN$SIB17YOB)
  NACC_FROZEN$SIB17AGD=as.numeric(NACC_FROZEN$SIB17AGD)
  NACC_FROZEN$SIB17NEU=as.numeric(NACC_FROZEN$SIB17NEU)
  NACC_FROZEN$SIB17PDX=as.numeric(NACC_FROZEN$SIB17PDX)
  NACC_FROZEN$SIB17MOE=as.numeric(NACC_FROZEN$SIB17MOE)
  NACC_FROZEN$SIB17AGO=as.numeric(NACC_FROZEN$SIB17AGO)
  NACC_FROZEN$SIB18MOB=as.numeric(NACC_FROZEN$SIB18MOB)
  NACC_FROZEN$SIB18YOB=as.numeric(NACC_FROZEN$SIB18YOB)
  NACC_FROZEN$SIB18AGD=as.numeric(NACC_FROZEN$SIB18AGD)
  NACC_FROZEN$SIB18NEU=as.numeric(NACC_FROZEN$SIB18NEU)
  NACC_FROZEN$SIB18PDX=as.numeric(NACC_FROZEN$SIB18PDX)
  NACC_FROZEN$SIB18MOE=as.numeric(NACC_FROZEN$SIB18MOE)
  NACC_FROZEN$SIB18AGO=as.numeric(NACC_FROZEN$SIB18AGO)
  NACC_FROZEN$SIB19MOB=as.numeric(NACC_FROZEN$SIB19MOB)
  NACC_FROZEN$SIB19YOB=as.numeric(NACC_FROZEN$SIB19YOB)
  NACC_FROZEN$SIB19AGD=as.numeric(NACC_FROZEN$SIB19AGD)
  NACC_FROZEN$SIB19NEU=as.numeric(NACC_FROZEN$SIB19NEU)
  NACC_FROZEN$SIB19PDX=as.numeric(NACC_FROZEN$SIB19PDX)
  NACC_FROZEN$SIB19MOE=as.numeric(NACC_FROZEN$SIB19MOE)
  NACC_FROZEN$SIB19AGO=as.numeric(NACC_FROZEN$SIB19AGO)
  NACC_FROZEN$SIB20MOB=as.numeric(NACC_FROZEN$SIB20MOB)
  NACC_FROZEN$SIB20YOB=as.numeric(NACC_FROZEN$SIB20YOB)
  NACC_FROZEN$SIB20AGD=as.numeric(NACC_FROZEN$SIB20AGD)
  NACC_FROZEN$SIB20NEU=as.numeric(NACC_FROZEN$SIB20NEU)
  NACC_FROZEN$SIB20PDX=as.numeric(NACC_FROZEN$SIB20PDX)
  NACC_FROZEN$SIB20MOE=as.numeric(NACC_FROZEN$SIB20MOE)
  NACC_FROZEN$SIB20AGO=as.numeric(NACC_FROZEN$SIB20AGO)
  NACC_FROZEN$SIB1LIV=as.numeric(NACC_FROZEN$SIB1LIV)
  NACC_FROZEN$SIB1YOD=as.numeric(NACC_FROZEN$SIB1YOD)
  NACC_FROZEN$SIB1DEM=as.numeric(NACC_FROZEN$SIB1DEM)
  NACC_FROZEN$SIB1ONS=as.numeric(NACC_FROZEN$SIB1ONS)
  NACC_FROZEN$SIB1AGE=as.numeric(NACC_FROZEN$SIB1AGE)
  NACC_FROZEN$SIB2LIV=as.numeric(NACC_FROZEN$SIB2LIV)
  NACC_FROZEN$SIB2YOD=as.numeric(NACC_FROZEN$SIB2YOD)
  NACC_FROZEN$SIB2DEM=as.numeric(NACC_FROZEN$SIB2DEM)
  NACC_FROZEN$SIB2ONS=as.numeric(NACC_FROZEN$SIB2ONS)
  NACC_FROZEN$SIB2AGE=as.numeric(NACC_FROZEN$SIB2AGE)
  NACC_FROZEN$SIB3LIV=as.numeric(NACC_FROZEN$SIB3LIV)
  NACC_FROZEN$SIB3YOD=as.numeric(NACC_FROZEN$SIB3YOD)
  NACC_FROZEN$SIB3DEM=as.numeric(NACC_FROZEN$SIB3DEM)
  NACC_FROZEN$SIB3ONS=as.numeric(NACC_FROZEN$SIB3ONS)
  NACC_FROZEN$SIB3AGE=as.numeric(NACC_FROZEN$SIB3AGE)
  NACC_FROZEN$SIB4LIV=as.numeric(NACC_FROZEN$SIB4LIV)
  NACC_FROZEN$SIB4YOD=as.numeric(NACC_FROZEN$SIB4YOD)
  NACC_FROZEN$SIB4DEM=as.numeric(NACC_FROZEN$SIB4DEM)
  NACC_FROZEN$SIB4ONS=as.numeric(NACC_FROZEN$SIB4ONS)
  NACC_FROZEN$SIB4AGE=as.numeric(NACC_FROZEN$SIB4AGE)
  NACC_FROZEN$SIB5LIV=as.numeric(NACC_FROZEN$SIB5LIV)
  NACC_FROZEN$SIB5YOD=as.numeric(NACC_FROZEN$SIB5YOD)
  NACC_FROZEN$SIB5DEM=as.numeric(NACC_FROZEN$SIB5DEM)
  NACC_FROZEN$SIB5ONS=as.numeric(NACC_FROZEN$SIB5ONS)
  NACC_FROZEN$SIB5AGE=as.numeric(NACC_FROZEN$SIB5AGE)
  NACC_FROZEN$SIB6LIV=as.numeric(NACC_FROZEN$SIB6LIV)
  NACC_FROZEN$SIB6YOD=as.numeric(NACC_FROZEN$SIB6YOD)
  NACC_FROZEN$SIB6DEM=as.numeric(NACC_FROZEN$SIB6DEM)
  NACC_FROZEN$SIB6ONS=as.numeric(NACC_FROZEN$SIB6ONS)
  NACC_FROZEN$SIB6AGE=as.numeric(NACC_FROZEN$SIB6AGE)
  NACC_FROZEN$SIB7LIV=as.numeric(NACC_FROZEN$SIB7LIV)
  NACC_FROZEN$SIB7YOD=as.numeric(NACC_FROZEN$SIB7YOD)
  NACC_FROZEN$SIB7DEM=as.numeric(NACC_FROZEN$SIB7DEM)
  NACC_FROZEN$SIB7ONS=as.numeric(NACC_FROZEN$SIB7ONS)
  NACC_FROZEN$SIB8LIV=as.numeric(NACC_FROZEN$SIB8LIV)
  NACC_FROZEN$SIB8YOD=as.numeric(NACC_FROZEN$SIB8YOD)
  NACC_FROZEN$SIB8DEM=as.numeric(NACC_FROZEN$SIB8DEM)
  NACC_FROZEN$SIB8ONS=as.numeric(NACC_FROZEN$SIB8ONS)
  NACC_FROZEN$SIB9LIV=as.numeric(NACC_FROZEN$SIB9LIV)
  NACC_FROZEN$SIB9YOD=as.numeric(NACC_FROZEN$SIB9YOD)
  NACC_FROZEN$SIB9DEM=as.numeric(NACC_FROZEN$SIB9DEM)
  NACC_FROZEN$SIB9ONS=as.numeric(NACC_FROZEN$SIB9ONS)
  NACC_FROZEN$SIB10LIV=as.numeric(NACC_FROZEN$SIB10LIV)
  NACC_FROZEN$SIB10YOD=as.numeric(NACC_FROZEN$SIB10YOD)
  NACC_FROZEN$SIB10DEM=as.numeric(NACC_FROZEN$SIB10DEM)
  NACC_FROZEN$SIB10ONS=as.numeric(NACC_FROZEN$SIB10ONS)
  NACC_FROZEN$SIB11LIV=as.numeric(NACC_FROZEN$SIB11LIV)
  NACC_FROZEN$SIB11YOD=as.numeric(NACC_FROZEN$SIB11YOD)
  NACC_FROZEN$SIB11DEM=as.numeric(NACC_FROZEN$SIB11DEM)
  NACC_FROZEN$SIB11ONS=as.numeric(NACC_FROZEN$SIB11ONS)
  NACC_FROZEN$SIB12LIV=as.numeric(NACC_FROZEN$SIB12LIV)
  NACC_FROZEN$SIB12YOD=as.numeric(NACC_FROZEN$SIB12YOD)
  NACC_FROZEN$SIB12DEM=as.numeric(NACC_FROZEN$SIB12DEM)
  NACC_FROZEN$SIB12ONS=as.numeric(NACC_FROZEN$SIB12ONS)
  NACC_FROZEN$SIB13LIV=as.numeric(NACC_FROZEN$SIB13LIV)
  NACC_FROZEN$SIB13YOD=as.numeric(NACC_FROZEN$SIB13YOD)
  NACC_FROZEN$SIB13DEM=as.numeric(NACC_FROZEN$SIB13DEM)
  NACC_FROZEN$SIB13ONS=as.numeric(NACC_FROZEN$SIB13ONS)
  NACC_FROZEN$SIB14LIV=as.numeric(NACC_FROZEN$SIB14LIV)
  NACC_FROZEN$SIB14YOD=as.numeric(NACC_FROZEN$SIB14YOD)
  NACC_FROZEN$SIB14DEM=as.numeric(NACC_FROZEN$SIB14DEM)
  NACC_FROZEN$SIB14ONS=as.numeric(NACC_FROZEN$SIB14ONS)
  NACC_FROZEN$SIB15LIV=as.numeric(NACC_FROZEN$SIB15LIV)
  NACC_FROZEN$SIB15YOD=as.numeric(NACC_FROZEN$SIB15YOD)
  NACC_FROZEN$SIB15DEM=as.numeric(NACC_FROZEN$SIB15DEM)
  NACC_FROZEN$SIB15ONS=as.numeric(NACC_FROZEN$SIB15ONS)
  NACC_FROZEN$SIB16LIV=as.numeric(NACC_FROZEN$SIB16LIV)
  NACC_FROZEN$SIB16YOD=as.numeric(NACC_FROZEN$SIB16YOD)
  NACC_FROZEN$SIB16DEM=as.numeric(NACC_FROZEN$SIB16DEM)
  NACC_FROZEN$SIB16ONS=as.numeric(NACC_FROZEN$SIB16ONS)
  NACC_FROZEN$SIB17LIV=as.numeric(NACC_FROZEN$SIB17LIV)
  NACC_FROZEN$SIB17YOD=as.numeric(NACC_FROZEN$SIB17YOD)
  NACC_FROZEN$SIB17DEM=as.numeric(NACC_FROZEN$SIB17DEM)
  NACC_FROZEN$SIB17ONS=as.numeric(NACC_FROZEN$SIB17ONS)
  NACC_FROZEN$SIB18LIV=as.numeric(NACC_FROZEN$SIB18LIV)
  NACC_FROZEN$SIB18YOD=as.numeric(NACC_FROZEN$SIB18YOD)
  NACC_FROZEN$SIB18DEM=as.numeric(NACC_FROZEN$SIB18DEM)
  NACC_FROZEN$SIB18ONS=as.numeric(NACC_FROZEN$SIB18ONS)
  NACC_FROZEN$SIB19LIV=as.numeric(NACC_FROZEN$SIB19LIV)
  NACC_FROZEN$SIB19YOD=as.numeric(NACC_FROZEN$SIB19YOD)
  NACC_FROZEN$SIB19DEM=as.numeric(NACC_FROZEN$SIB19DEM)
  NACC_FROZEN$SIB19ONS=as.numeric(NACC_FROZEN$SIB19ONS)
  NACC_FROZEN$SIB20LIV=as.numeric(NACC_FROZEN$SIB20LIV)
  NACC_FROZEN$SIB20YOD=as.numeric(NACC_FROZEN$SIB20YOD)
  NACC_FROZEN$SIB20DEM=as.numeric(NACC_FROZEN$SIB20DEM)
  NACC_FROZEN$SIB20ONS=as.numeric(NACC_FROZEN$SIB20ONS)
  NACC_FROZEN$KIDS=as.numeric(NACC_FROZEN$KIDS)
  NACC_FROZEN$KIDSDEM=as.numeric(NACC_FROZEN$KIDSDEM)
  NACC_FROZEN$KIDCHG=as.numeric(NACC_FROZEN$KIDCHG)
  NACC_FROZEN$NWINFKID=as.numeric(NACC_FROZEN$NWINFKID)
  NACC_FROZEN$KID1MOB=as.numeric(NACC_FROZEN$KID1MOB)
  NACC_FROZEN$KID1YOB=as.numeric(NACC_FROZEN$KID1YOB)
  NACC_FROZEN$KID1AGD=as.numeric(NACC_FROZEN$KID1AGD)
  NACC_FROZEN$KID1NEU=as.numeric(NACC_FROZEN$KID1NEU)
  NACC_FROZEN$KID1PDX=as.numeric(NACC_FROZEN$KID1PDX)
  NACC_FROZEN$KID1MOE=as.numeric(NACC_FROZEN$KID1MOE)
  NACC_FROZEN$KID1AGO=as.numeric(NACC_FROZEN$KID1AGO)
  NACC_FROZEN$KID2MOB=as.numeric(NACC_FROZEN$KID2MOB)
  NACC_FROZEN$KID2YOB=as.numeric(NACC_FROZEN$KID2YOB)
  NACC_FROZEN$KID2AGD=as.numeric(NACC_FROZEN$KID2AGD)
  NACC_FROZEN$KID2NEU=as.numeric(NACC_FROZEN$KID2NEU)
  NACC_FROZEN$KID2PDX=as.numeric(NACC_FROZEN$KID2PDX)
  NACC_FROZEN$KID2MOE=as.numeric(NACC_FROZEN$KID2MOE)
  NACC_FROZEN$KID2AGO=as.numeric(NACC_FROZEN$KID2AGO)
  NACC_FROZEN$KID3MOB=as.numeric(NACC_FROZEN$KID3MOB)
  NACC_FROZEN$KID3YOB=as.numeric(NACC_FROZEN$KID3YOB)
  NACC_FROZEN$KID3AGD=as.numeric(NACC_FROZEN$KID3AGD)
  NACC_FROZEN$KID3NEU=as.numeric(NACC_FROZEN$KID3NEU)
  NACC_FROZEN$KID3PDX=as.numeric(NACC_FROZEN$KID3PDX)
  NACC_FROZEN$KID3MOE=as.numeric(NACC_FROZEN$KID3MOE)
  NACC_FROZEN$KID3AGO=as.numeric(NACC_FROZEN$KID3AGO)
  NACC_FROZEN$KID4MOB=as.numeric(NACC_FROZEN$KID4MOB)
  NACC_FROZEN$KID4YOB=as.numeric(NACC_FROZEN$KID4YOB)
  NACC_FROZEN$KID4AGD=as.numeric(NACC_FROZEN$KID4AGD)
  NACC_FROZEN$KID4NEU=as.numeric(NACC_FROZEN$KID4NEU)
  NACC_FROZEN$KID4PDX=as.numeric(NACC_FROZEN$KID4PDX)
  NACC_FROZEN$KID4MOE=as.numeric(NACC_FROZEN$KID4MOE)
  NACC_FROZEN$KID4AGO=as.numeric(NACC_FROZEN$KID4AGO)
  NACC_FROZEN$KID5MOB=as.numeric(NACC_FROZEN$KID5MOB)
  NACC_FROZEN$KID5YOB=as.numeric(NACC_FROZEN$KID5YOB)
  NACC_FROZEN$KID5AGD=as.numeric(NACC_FROZEN$KID5AGD)
  NACC_FROZEN$KID5NEU=as.numeric(NACC_FROZEN$KID5NEU)
  NACC_FROZEN$KID5PDX=as.numeric(NACC_FROZEN$KID5PDX)
  NACC_FROZEN$KID5MOE=as.numeric(NACC_FROZEN$KID5MOE)
  NACC_FROZEN$KID5AGO=as.numeric(NACC_FROZEN$KID5AGO)
  NACC_FROZEN$KID6MOB=as.numeric(NACC_FROZEN$KID6MOB)
  NACC_FROZEN$KID6YOB=as.numeric(NACC_FROZEN$KID6YOB)
  NACC_FROZEN$KID6AGD=as.numeric(NACC_FROZEN$KID6AGD)
  NACC_FROZEN$KID6NEU=as.numeric(NACC_FROZEN$KID6NEU)
  NACC_FROZEN$KID6PDX=as.numeric(NACC_FROZEN$KID6PDX)
  NACC_FROZEN$KID6MOE=as.numeric(NACC_FROZEN$KID6MOE)
  NACC_FROZEN$KID6AGO=as.numeric(NACC_FROZEN$KID6AGO)
  NACC_FROZEN$KID7MOB=as.numeric(NACC_FROZEN$KID7MOB)
  NACC_FROZEN$KID7YOB=as.numeric(NACC_FROZEN$KID7YOB)
  NACC_FROZEN$KID7AGD=as.numeric(NACC_FROZEN$KID7AGD)
  NACC_FROZEN$KID7NEU=as.numeric(NACC_FROZEN$KID7NEU)
  NACC_FROZEN$KID7PDX=as.numeric(NACC_FROZEN$KID7PDX)
  NACC_FROZEN$KID7MOE=as.numeric(NACC_FROZEN$KID7MOE)
  NACC_FROZEN$KID7AGO=as.numeric(NACC_FROZEN$KID7AGO)
  NACC_FROZEN$KID8MOB=as.numeric(NACC_FROZEN$KID8MOB)
  NACC_FROZEN$KID8YOB=as.numeric(NACC_FROZEN$KID8YOB)
  NACC_FROZEN$KID8AGD=as.numeric(NACC_FROZEN$KID8AGD)
  NACC_FROZEN$KID8NEU=as.numeric(NACC_FROZEN$KID8NEU)
  NACC_FROZEN$KID8PDX=as.numeric(NACC_FROZEN$KID8PDX)
  NACC_FROZEN$KID8MOE=as.numeric(NACC_FROZEN$KID8MOE)
  NACC_FROZEN$KID8AGO=as.numeric(NACC_FROZEN$KID8AGO)
  NACC_FROZEN$KID9MOB=as.numeric(NACC_FROZEN$KID9MOB)
  NACC_FROZEN$KID9YOB=as.numeric(NACC_FROZEN$KID9YOB)
  NACC_FROZEN$KID9AGD=as.numeric(NACC_FROZEN$KID9AGD)
  NACC_FROZEN$KID9NEU=as.numeric(NACC_FROZEN$KID9NEU)
  NACC_FROZEN$KID9PDX=as.numeric(NACC_FROZEN$KID9PDX)
  NACC_FROZEN$KID9MOE=as.numeric(NACC_FROZEN$KID9MOE)
  NACC_FROZEN$KID9AGO=as.numeric(NACC_FROZEN$KID9AGO)
  NACC_FROZEN$KID10MOB=as.numeric(NACC_FROZEN$KID10MOB)
  NACC_FROZEN$KID10YOB=as.numeric(NACC_FROZEN$KID10YOB)
  NACC_FROZEN$KID10AGD=as.numeric(NACC_FROZEN$KID10AGD)
  NACC_FROZEN$KID10NEU=as.numeric(NACC_FROZEN$KID10NEU)
  NACC_FROZEN$KID10PDX=as.numeric(NACC_FROZEN$KID10PDX)
  NACC_FROZEN$KID10MOE=as.numeric(NACC_FROZEN$KID10MOE)
  NACC_FROZEN$KID10AGO=as.numeric(NACC_FROZEN$KID10AGO)
  NACC_FROZEN$KID11MOB=as.numeric(NACC_FROZEN$KID11MOB)
  NACC_FROZEN$KID11YOB=as.numeric(NACC_FROZEN$KID11YOB)
  NACC_FROZEN$KID11AGD=as.numeric(NACC_FROZEN$KID11AGD)
  NACC_FROZEN$KID11NEU=as.numeric(NACC_FROZEN$KID11NEU)
  NACC_FROZEN$KID11PDX=as.numeric(NACC_FROZEN$KID11PDX)
  NACC_FROZEN$KID11MOE=as.numeric(NACC_FROZEN$KID11MOE)
  NACC_FROZEN$KID11AGO=as.numeric(NACC_FROZEN$KID11AGO)
  NACC_FROZEN$KID12MOB=as.numeric(NACC_FROZEN$KID12MOB)
  NACC_FROZEN$KID12YOB=as.numeric(NACC_FROZEN$KID12YOB)
  NACC_FROZEN$KID12AGD=as.numeric(NACC_FROZEN$KID12AGD)
  NACC_FROZEN$KID12NEU=as.numeric(NACC_FROZEN$KID12NEU)
  NACC_FROZEN$KID12PDX=as.numeric(NACC_FROZEN$KID12PDX)
  NACC_FROZEN$KID12MOE=as.numeric(NACC_FROZEN$KID12MOE)
  NACC_FROZEN$KID12AGO=as.numeric(NACC_FROZEN$KID12AGO)
  NACC_FROZEN$KID13MOB=as.numeric(NACC_FROZEN$KID13MOB)
  NACC_FROZEN$KID13YOB=as.numeric(NACC_FROZEN$KID13YOB)
  NACC_FROZEN$KID13AGD=as.numeric(NACC_FROZEN$KID13AGD)
  NACC_FROZEN$KID13NEU=as.numeric(NACC_FROZEN$KID13NEU)
  NACC_FROZEN$KID13PDX=as.numeric(NACC_FROZEN$KID13PDX)
  NACC_FROZEN$KID13MOE=as.numeric(NACC_FROZEN$KID13MOE)
  NACC_FROZEN$KID13AGO=as.numeric(NACC_FROZEN$KID13AGO)
  NACC_FROZEN$KID14MOB=as.numeric(NACC_FROZEN$KID14MOB)
  NACC_FROZEN$KID14YOB=as.numeric(NACC_FROZEN$KID14YOB)
  NACC_FROZEN$KID14AGD=as.numeric(NACC_FROZEN$KID14AGD)
  NACC_FROZEN$KID14NEU=as.numeric(NACC_FROZEN$KID14NEU)
  NACC_FROZEN$KID14PDX=as.numeric(NACC_FROZEN$KID14PDX)
  NACC_FROZEN$KID14MOE=as.numeric(NACC_FROZEN$KID14MOE)
  NACC_FROZEN$KID14AGO=as.numeric(NACC_FROZEN$KID14AGO)
  NACC_FROZEN$KID15MOB=as.numeric(NACC_FROZEN$KID15MOB)
  NACC_FROZEN$KID15YOB=as.numeric(NACC_FROZEN$KID15YOB)
  NACC_FROZEN$KID15AGD=as.numeric(NACC_FROZEN$KID15AGD)
  NACC_FROZEN$KID15NEU=as.numeric(NACC_FROZEN$KID15NEU)
  NACC_FROZEN$KID15PDX=as.numeric(NACC_FROZEN$KID15PDX)
  NACC_FROZEN$KID15MOE=as.numeric(NACC_FROZEN$KID15MOE)
  NACC_FROZEN$KID15AGO=as.numeric(NACC_FROZEN$KID15AGO)
  NACC_FROZEN$KID1LIV=as.numeric(NACC_FROZEN$KID1LIV)
  NACC_FROZEN$KID1YOD=as.numeric(NACC_FROZEN$KID1YOD)
  NACC_FROZEN$KID1DEM=as.numeric(NACC_FROZEN$KID1DEM)
  NACC_FROZEN$KID1ONS=as.numeric(NACC_FROZEN$KID1ONS)
  NACC_FROZEN$KID1AGE=as.numeric(NACC_FROZEN$KID1AGE)
  NACC_FROZEN$KID2LIV=as.numeric(NACC_FROZEN$KID2LIV)
  NACC_FROZEN$KID2YOD=as.numeric(NACC_FROZEN$KID2YOD)
  NACC_FROZEN$KID2DEM=as.numeric(NACC_FROZEN$KID2DEM)
  NACC_FROZEN$KID2ONS=as.numeric(NACC_FROZEN$KID2ONS)
  NACC_FROZEN$KID2AGE=as.numeric(NACC_FROZEN$KID2AGE)
  NACC_FROZEN$KID3LIV=as.numeric(NACC_FROZEN$KID3LIV)
  NACC_FROZEN$KID3YOD=as.numeric(NACC_FROZEN$KID3YOD)
  NACC_FROZEN$KID3DEM=as.numeric(NACC_FROZEN$KID3DEM)
  NACC_FROZEN$KID3ONS=as.numeric(NACC_FROZEN$KID3ONS)
  NACC_FROZEN$KID3AGE=as.numeric(NACC_FROZEN$KID3AGE)
  NACC_FROZEN$KID4LIV=as.numeric(NACC_FROZEN$KID4LIV)
  NACC_FROZEN$KID4YOD=as.numeric(NACC_FROZEN$KID4YOD)
  NACC_FROZEN$KID4DEM=as.numeric(NACC_FROZEN$KID4DEM)
  NACC_FROZEN$KID4ONS=as.numeric(NACC_FROZEN$KID4ONS)
  NACC_FROZEN$KID4AGE=as.numeric(NACC_FROZEN$KID4AGE)
  NACC_FROZEN$KID5LIV=as.numeric(NACC_FROZEN$KID5LIV)
  NACC_FROZEN$KID5YOD=as.numeric(NACC_FROZEN$KID5YOD)
  NACC_FROZEN$KID5DEM=as.numeric(NACC_FROZEN$KID5DEM)
  NACC_FROZEN$KID5ONS=as.numeric(NACC_FROZEN$KID5ONS)
  NACC_FROZEN$KID5AGE=as.numeric(NACC_FROZEN$KID5AGE)
  NACC_FROZEN$KID6LIV=as.numeric(NACC_FROZEN$KID6LIV)
  NACC_FROZEN$KID6YOD=as.numeric(NACC_FROZEN$KID6YOD)
  NACC_FROZEN$KID6DEM=as.numeric(NACC_FROZEN$KID6DEM)
  NACC_FROZEN$KID6ONS=as.numeric(NACC_FROZEN$KID6ONS)
  NACC_FROZEN$KID6AGE=as.numeric(NACC_FROZEN$KID6AGE)
  NACC_FROZEN$KID7LIV=as.numeric(NACC_FROZEN$KID7LIV)
  NACC_FROZEN$KID7YOD=as.numeric(NACC_FROZEN$KID7YOD)
  NACC_FROZEN$KID7DEM=as.numeric(NACC_FROZEN$KID7DEM)
  NACC_FROZEN$KID7ONS=as.numeric(NACC_FROZEN$KID7ONS)
  NACC_FROZEN$KID8LIV=as.numeric(NACC_FROZEN$KID8LIV)
  NACC_FROZEN$KID8YOD=as.numeric(NACC_FROZEN$KID8YOD)
  NACC_FROZEN$KID8DEM=as.numeric(NACC_FROZEN$KID8DEM)
  NACC_FROZEN$KID8ONS=as.numeric(NACC_FROZEN$KID8ONS)
  NACC_FROZEN$KID9LIV=as.numeric(NACC_FROZEN$KID9LIV)
  NACC_FROZEN$KID9YOD=as.numeric(NACC_FROZEN$KID9YOD)
  NACC_FROZEN$KID9DEM=as.numeric(NACC_FROZEN$KID9DEM)
  NACC_FROZEN$KID9ONS=as.numeric(NACC_FROZEN$KID9ONS)
  NACC_FROZEN$KID10LIV=as.numeric(NACC_FROZEN$KID10LIV)
  NACC_FROZEN$KID10YOD=as.numeric(NACC_FROZEN$KID10YOD)
  NACC_FROZEN$KID10DEM=as.numeric(NACC_FROZEN$KID10DEM)
  NACC_FROZEN$KID10ONS=as.numeric(NACC_FROZEN$KID10ONS)
  NACC_FROZEN$KID11LIV=as.numeric(NACC_FROZEN$KID11LIV)
  NACC_FROZEN$KID11YOD=as.numeric(NACC_FROZEN$KID11YOD)
  NACC_FROZEN$KID11DEM=as.numeric(NACC_FROZEN$KID11DEM)
  NACC_FROZEN$KID11ONS=as.numeric(NACC_FROZEN$KID11ONS)
  NACC_FROZEN$KID12LIV=as.numeric(NACC_FROZEN$KID12LIV)
  NACC_FROZEN$KID12YOD=as.numeric(NACC_FROZEN$KID12YOD)
  NACC_FROZEN$KID12DEM=as.numeric(NACC_FROZEN$KID12DEM)
  NACC_FROZEN$KID12ONS=as.numeric(NACC_FROZEN$KID12ONS)
  NACC_FROZEN$KID13LIV=as.numeric(NACC_FROZEN$KID13LIV)
  NACC_FROZEN$KID13YOD=as.numeric(NACC_FROZEN$KID13YOD)
  NACC_FROZEN$KID13DEM=as.numeric(NACC_FROZEN$KID13DEM)
  NACC_FROZEN$KID13ONS=as.numeric(NACC_FROZEN$KID13ONS)
  NACC_FROZEN$KID14LIV=as.numeric(NACC_FROZEN$KID14LIV)
  NACC_FROZEN$KID14YOD=as.numeric(NACC_FROZEN$KID14YOD)
  NACC_FROZEN$KID14DEM=as.numeric(NACC_FROZEN$KID14DEM)
  NACC_FROZEN$KID14ONS=as.numeric(NACC_FROZEN$KID14ONS)
  NACC_FROZEN$KID15LIV=as.numeric(NACC_FROZEN$KID15LIV)
  NACC_FROZEN$KID15YOD=as.numeric(NACC_FROZEN$KID15YOD)
  NACC_FROZEN$KID15DEM=as.numeric(NACC_FROZEN$KID15DEM)
  NACC_FROZEN$KID15ONS=as.numeric(NACC_FROZEN$KID15ONS)
  NACC_FROZEN$RELCHG=as.numeric(NACC_FROZEN$RELCHG)
  NACC_FROZEN$RELSDEM=as.numeric(NACC_FROZEN$RELSDEM)
  NACC_FROZEN$REL1YOB=as.numeric(NACC_FROZEN$REL1YOB)
  NACC_FROZEN$REL1LIV=as.numeric(NACC_FROZEN$REL1LIV)
  NACC_FROZEN$REL1YOD=as.numeric(NACC_FROZEN$REL1YOD)
  NACC_FROZEN$REL1ONS=as.numeric(NACC_FROZEN$REL1ONS)
  NACC_FROZEN$REL1AGE=as.numeric(NACC_FROZEN$REL1AGE)
  NACC_FROZEN$REL2YOB=as.numeric(NACC_FROZEN$REL2YOB)
  NACC_FROZEN$REL2LIV=as.numeric(NACC_FROZEN$REL2LIV)
  NACC_FROZEN$REL2YOD=as.numeric(NACC_FROZEN$REL2YOD)
  NACC_FROZEN$REL2ONS=as.numeric(NACC_FROZEN$REL2ONS)
  NACC_FROZEN$REL2AGE=as.numeric(NACC_FROZEN$REL2AGE)
  NACC_FROZEN$REL3YOB=as.numeric(NACC_FROZEN$REL3YOB)
  NACC_FROZEN$REL3LIV=as.numeric(NACC_FROZEN$REL3LIV)
  NACC_FROZEN$REL3YOD=as.numeric(NACC_FROZEN$REL3YOD)
  NACC_FROZEN$REL3ONS=as.numeric(NACC_FROZEN$REL3ONS)
  NACC_FROZEN$REL3AGE=as.numeric(NACC_FROZEN$REL3AGE)
  NACC_FROZEN$REL4YOB=as.numeric(NACC_FROZEN$REL4YOB)
  NACC_FROZEN$REL4LIV=as.numeric(NACC_FROZEN$REL4LIV)
  NACC_FROZEN$REL4YOD=as.numeric(NACC_FROZEN$REL4YOD)
  NACC_FROZEN$REL4ONS=as.numeric(NACC_FROZEN$REL4ONS)
  NACC_FROZEN$REL4AGE=as.numeric(NACC_FROZEN$REL4AGE)
  NACC_FROZEN$REL5YOB=as.numeric(NACC_FROZEN$REL5YOB)
  NACC_FROZEN$REL5LIV=as.numeric(NACC_FROZEN$REL5LIV)
  NACC_FROZEN$REL5YOD=as.numeric(NACC_FROZEN$REL5YOD)
  NACC_FROZEN$REL5ONS=as.numeric(NACC_FROZEN$REL5ONS)
  NACC_FROZEN$REL5AGE=as.numeric(NACC_FROZEN$REL5AGE)
  NACC_FROZEN$REL6YOB=as.numeric(NACC_FROZEN$REL6YOB)
  NACC_FROZEN$REL6LIV=as.numeric(NACC_FROZEN$REL6LIV)
  NACC_FROZEN$REL6YOD=as.numeric(NACC_FROZEN$REL6YOD)
  NACC_FROZEN$REL6ONS=as.numeric(NACC_FROZEN$REL6ONS)
  NACC_FROZEN$REL6AGE=as.numeric(NACC_FROZEN$REL6AGE)
  NACC_FROZEN$REL7YOB=as.numeric(NACC_FROZEN$REL7YOB)
  NACC_FROZEN$REL7LIV=as.numeric(NACC_FROZEN$REL7LIV)
  NACC_FROZEN$REL7YOD=as.numeric(NACC_FROZEN$REL7YOD)
  NACC_FROZEN$REL7ONS=as.numeric(NACC_FROZEN$REL7ONS)
  NACC_FROZEN$REL8YOB=as.numeric(NACC_FROZEN$REL8YOB)
  NACC_FROZEN$REL8LIV=as.numeric(NACC_FROZEN$REL8LIV)
  NACC_FROZEN$REL8YOD=as.numeric(NACC_FROZEN$REL8YOD)
  NACC_FROZEN$REL8ONS=as.numeric(NACC_FROZEN$REL8ONS)
  NACC_FROZEN$REL9YOB=as.numeric(NACC_FROZEN$REL9YOB)
  NACC_FROZEN$REL9LIV=as.numeric(NACC_FROZEN$REL9LIV)
  NACC_FROZEN$REL9YOD=as.numeric(NACC_FROZEN$REL9YOD)
  NACC_FROZEN$REL9ONS=as.numeric(NACC_FROZEN$REL9ONS)
  NACC_FROZEN$REL10YOB=as.numeric(NACC_FROZEN$REL10YOB)
  NACC_FROZEN$REL10LIV=as.numeric(NACC_FROZEN$REL10LIV)
  NACC_FROZEN$REL10YOD=as.numeric(NACC_FROZEN$REL10YOD)
  NACC_FROZEN$REL10ONS=as.numeric(NACC_FROZEN$REL10ONS)
  NACC_FROZEN$REL11YOB=as.numeric(NACC_FROZEN$REL11YOB)
  NACC_FROZEN$REL11LIV=as.numeric(NACC_FROZEN$REL11LIV)
  NACC_FROZEN$REL11YOD=as.numeric(NACC_FROZEN$REL11YOD)
  NACC_FROZEN$REL11ONS=as.numeric(NACC_FROZEN$REL11ONS)
  NACC_FROZEN$REL12YOB=as.numeric(NACC_FROZEN$REL12YOB)
  NACC_FROZEN$REL12LIV=as.numeric(NACC_FROZEN$REL12LIV)
  NACC_FROZEN$REL12YOD=as.numeric(NACC_FROZEN$REL12YOD)
  NACC_FROZEN$REL12ONS=as.numeric(NACC_FROZEN$REL12ONS)
  NACC_FROZEN$REL13YOB=as.numeric(NACC_FROZEN$REL13YOB)
  NACC_FROZEN$REL13LIV=as.numeric(NACC_FROZEN$REL13LIV)
  NACC_FROZEN$REL13YOD=as.numeric(NACC_FROZEN$REL13YOD)
  NACC_FROZEN$REL13ONS=as.numeric(NACC_FROZEN$REL13ONS)
  NACC_FROZEN$REL14YOB=as.numeric(NACC_FROZEN$REL14YOB)
  NACC_FROZEN$REL14LIV=as.numeric(NACC_FROZEN$REL14LIV)
  NACC_FROZEN$REL14YOD=as.numeric(NACC_FROZEN$REL14YOD)
  NACC_FROZEN$REL14ONS=as.numeric(NACC_FROZEN$REL14ONS)
  NACC_FROZEN$REL15YOB=as.numeric(NACC_FROZEN$REL15YOB)
  NACC_FROZEN$REL15LIV=as.numeric(NACC_FROZEN$REL15LIV)
  NACC_FROZEN$REL15YOD=as.numeric(NACC_FROZEN$REL15YOD)
  NACC_FROZEN$REL15ONS=as.numeric(NACC_FROZEN$REL15ONS)
  
  NACC_FROZEN$AFFFAMM=labelled_spss(NACC_FROZEN$AFFFAMM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Are there affected family members (biological parents, full siblings, or biological children)?")
  
  NACC_FROZEN$A3CHG=labelled_spss(NACC_FROZEN$A3CHG,c(
    "subject/informant has changes in family history"=0,
    "no changes since previous visit"=1
  ), label="Changes in family history since previous UDS visit")
  
  NACC_FROZEN$NWINFMUT=labelled_spss(NACC_FROZEN$NWINFMUT,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="New information available concerning genetic mutations?")
  
  NACC_FROZEN$FADMUT=labelled_spss(NACC_FROZEN$FADMUT,c(
    "No"=0,
    "Yes, APP"=1,
    "Yes, PS-1 (PSEN-1)"=2,
    "Yes, PS-2 (PSEN-2)"=3,
    "Yes, Other (specify)"=8,
    "Unknown whether mutation exists"=9
  ), label="In this family, is there evidence for an AD mutation? If Yes, select predominant mutation.")
  
  NACC_FROZEN$FADMUTX=labelled_spss(NACC_FROZEN$FADMUTX,label="If Yes, Other (specify):")
  
  NACC_FROZEN$FADMUSO=labelled_spss(NACC_FROZEN$FADMUSO,c(
    "Family report (no test documentation available)"=1,
    "Commercial test documentation"=2,
    "Research lab test documentation"=3,
    "Other (specify)"=8,
    "Unknown"=9
  ), label="Source of evidence for AD mutation:")
  
  NACC_FROZEN$FADMUSOX=labelled_spss(NACC_FROZEN$FADMUSOX,label="If other, specify:")
  
  NACC_FROZEN$FFTDMUT=labelled_spss(NACC_FROZEN$FFTDMUT,c(
    "No"=0,
    "Yes, MAPT"=1,
    "Yes, PGRN"=2,
    "Yes, C9orf72"=3,
    "Yes, FUS"=4,
    "Yes, Other (specify)"=8,
    "Unknown whether mutation exists"=9
  ), label="In this family, is there evidence for an FTLD mutation? If Yes, select predominant mutation.")
  
  NACC_FROZEN$FFTDMUTX=labelled_spss(NACC_FROZEN$FFTDMUTX,label="If Yes, Other (specify):")
  
  NACC_FROZEN$FFTDMUSO=labelled_spss(NACC_FROZEN$FFTDMUSO,c(
    "Family report (no test documentation available)"=1,
    "Commercial test documentation"=2,
    "Research lab test documentation"=3,
    "Other (specify)"=8,
    "Unknown"=9
  ), label="Source of evidence for FTLD mutation:")
  
  NACC_FROZEN$FFTDMUSX=labelled_spss(NACC_FROZEN$FFTDMUSX,label="If other, specify:")
  
  NACC_FROZEN$FOTHMUT=labelled_spss(NACC_FROZEN$FOTHMUT,c(
    "No"=0,
    "Yes (specify)"=1,
    "Unknown"=9
  ), label="In this family, is there evidence for a mutation other than an AD or FTLD mutation?")
  
  NACC_FROZEN$FOTHMUTX=labelled_spss(NACC_FROZEN$FOTHMUTX,c(
    
  ), label="If Yes, specify:")
  NACC_FROZEN$FOTHMUSO=labelled_spss(NACC_FROZEN$FOTHMUSO,c(
    "Family report (no test documentation available)"=1,
    "Commercial test documentation"=2,
    "Research lab test documentation"=3,
    "Other (specify)"=8,
    "Unknown"=9
  ), label="Source of evidence for other mutation:")
  
  NACC_FROZEN$FOTHMUSX=labelled_spss(NACC_FROZEN$FOTHMUSX,label="If other, specify:")
  
  NACC_FROZEN$PARCHG=labelled_spss(NACC_FROZEN$PARCHG,c(
    "subject/informant has changes in parent history"=0,
    "no changes since previous visit"=1
  ), label="Changes in parent information since previous UDS visit")
  
  NACC_FROZEN$NWINFPAR=labelled_spss(NACC_FROZEN$NWINFPAR,c(
    "No"=0,
    "Yes"=1
  ), label="New information available on parents status?")
  
  NACC_FROZEN$MOMMOB=labelled_spss(NACC_FROZEN$MOMMOB,c(
    "Unknown"=99
  ), label="Mother - birth month")
  NACC_FROZEN$MOMYOB=labelled_spss(NACC_FROZEN$MOMYOB,c(
    "Unknown"=9999
  ), label="Mother - birth year")
  NACC_FROZEN$MOMLIV=labelled_spss(NACC_FROZEN$MOMLIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Mother living")
  
  NACC_FROZEN$MOMYOD=labelled_spss(NACC_FROZEN$MOMYOD,c(
    "Unknown"=9999
  ), label="Mother year of death")
  NACC_FROZEN$MOMDEM=labelled_spss(NACC_FROZEN$MOMDEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Mother demented")
  
  NACC_FROZEN$MOMONSET=labelled_spss(NACC_FROZEN$MOMONSET,c(
    "Age unknown"=999
  ), label="Mother age at onset")
  
  NACC_FROZEN$MOMAGE=labelled_spss(NACC_FROZEN$MOMAGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Mother current age if living")
  
  NACC_FROZEN$MOMDAGE=labelled_spss(NACC_FROZEN$MOMDAGE,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Mother - age at death")
  
  NACC_FROZEN$MOMNEUR=labelled_spss(NACC_FROZEN$MOMNEUR,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Mother - neurological problem")
  
  NACC_FROZEN$MOMPRDX=labelled_spss(NACC_FROZEN$MOMPRDX,c(
    "Specific diagnosis unknown"=999
  ), label="Mother - primary dx")
  
  NACC_FROZEN$MOMMOE=labelled_spss(NACC_FROZEN$MOMMOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Mother - method of evaluation")
  
  NACC_FROZEN$MOMAGEO=labelled_spss(NACC_FROZEN$MOMAGEO,c(
    "Unknown"=999
  ), label="Mother - age of onset")
  NACC_FROZEN$DADMOB=labelled_spss(NACC_FROZEN$DADMOB,c(
    "Unknown"=99
  ), label="Father - birth month")
  
  NACC_FROZEN$DADYOB=labelled_spss(NACC_FROZEN$DADYOB,c(
    "Unknown"=9999
  ), label="Father - birth year")
  
  NACC_FROZEN$DADLIV=labelled_spss(NACC_FROZEN$DADLIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Father living")
  
  NACC_FROZEN$DADYOD=labelled_spss(NACC_FROZEN$DADYOD,c(
    "Unknown"=9999
  ), label="Father year of death")
  
  NACC_FROZEN$DADDEM=labelled_spss(NACC_FROZEN$DADDEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Father demented")
  
  NACC_FROZEN$DADONSET=labelled_spss(NACC_FROZEN$DADONSET,c(
    "Age unknown"=999
  ), label="Father age at onset")
  
  NACC_FROZEN$DADAGE=labelled_spss(NACC_FROZEN$DADAGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Father current age if living")
  
  NACC_FROZEN$DADDAGE=labelled_spss(NACC_FROZEN$DADDAGE,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Father - age at death")
  
  NACC_FROZEN$DADNEUR=labelled_spss(NACC_FROZEN$DADNEUR,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Father - neurological problem")
  
  NACC_FROZEN$DADPRDX=labelled_spss(NACC_FROZEN$DADPRDX,c(
    "Specific diagnosis unknown"=999
  ), label="Father - primary dx")
  
  NACC_FROZEN$DADMOE=labelled_spss(NACC_FROZEN$DADMOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Father - method of evaluation")
  
  NACC_FROZEN$DADAGEO=labelled_spss(NACC_FROZEN$DADAGEO,c(
    "Unknown"=999
  ), label="Father - age of onset")
  
  NACC_FROZEN$TWIN=labelled_spss(NACC_FROZEN$TWIN,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Is the subject a twin")
  
  NACC_FROZEN$TWINTYPE=labelled_spss(NACC_FROZEN$TWINTYPE,c(
    "Monozygotic (i.e., identical)"=1,
    "Dizygotic (i.e., fraternal)"=2,
    "Unknown"=9
  ), label="Type of twin")
  
  NACC_FROZEN$SIBS=labelled_spss(NACC_FROZEN$SIBS,c(
    "Adopted, unknown"=77
  ), label="Number of full siblings?")
  
  NACC_FROZEN$SIBSDEM=labelled_spss(NACC_FROZEN$SIBSDEM,c(
    "N/A"=88,
    "Unknown"=99
  ), label="Number of siblings demented")
  
  NACC_FROZEN$SIBCHG=labelled_spss(NACC_FROZEN$SIBCHG,c(
    "subject/informant has changes in sibling history"=0,
    "no changes since previous visit"=1
  ), label="Changes in sibling information since previous UDS visit")
  
  NACC_FROZEN$NWINFSIB=labelled_spss(NACC_FROZEN$NWINFSIB,c(
    "No"=0,
    "Yes"=1
  ), label="New information on affected siblings?")
  
  NACC_FROZEN$SIB1MOB=labelled_spss(NACC_FROZEN$SIB1MOB,c(
    "Unknown"=99
  ), label="Sibling 1 - birth month")
  
  NACC_FROZEN$SIB1YOB=labelled_spss(NACC_FROZEN$SIB1YOB,c(
    "Unknown"=9999
  ), label="Sibling 1 - birth year")
  
  NACC_FROZEN$SIB1AGD=labelled_spss(NACC_FROZEN$SIB1AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 1 - age at death")
  
  NACC_FROZEN$SIB1NEU=labelled_spss(NACC_FROZEN$SIB1NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 1 - neurological problem")
  
  NACC_FROZEN$SIB1PDX=labelled_spss(NACC_FROZEN$SIB1PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 1 - primary dx")
  
  NACC_FROZEN$SIB1MOE=labelled_spss(NACC_FROZEN$SIB1MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 1 - method of evaluation")
  
  NACC_FROZEN$SIB1AGO=labelled_spss(NACC_FROZEN$SIB1AGO,c(
    "Unknown"=999
  ), label="Sibling 1 - age of onset")
  
  NACC_FROZEN$SIB2MOB=labelled_spss(NACC_FROZEN$SIB2MOB,c(
    "Unknown"=99
  ), label="Sibling 2 - birth month")
  
  NACC_FROZEN$SIB2YOB=labelled_spss(NACC_FROZEN$SIB2YOB,c(
    "Unknown"=9999
  ), label="Sibling 2 - birth year")
  
  NACC_FROZEN$SIB2AGD=labelled_spss(NACC_FROZEN$SIB2AGD,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 2 - age at death")
  
  NACC_FROZEN$SIB2NEU=labelled_spss(NACC_FROZEN$SIB2NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 2 - neurological problem")
  
  NACC_FROZEN$SIB2PDX=labelled_spss(NACC_FROZEN$SIB2PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 2 - primary dx")
  
  NACC_FROZEN$SIB2MOE=labelled_spss(NACC_FROZEN$SIB2MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 2 - method of evaluation")
  
  NACC_FROZEN$SIB2AGO=labelled_spss(NACC_FROZEN$SIB2AGO,c(
    "Unknown"=999
  ), label="Sibling 2 - age of onset")
  
  NACC_FROZEN$SIB3MOB=labelled_spss(NACC_FROZEN$SIB3MOB,c(
    "Unknown"=99
  ), label="Sibling 3 - birth month")
  
  NACC_FROZEN$SIB3YOB=labelled_spss(NACC_FROZEN$SIB3YOB,c(
    "Unknown"=9999
  ), label="Sibling 3 - birth year")
  
  NACC_FROZEN$SIB3AGD=labelled_spss(NACC_FROZEN$SIB3AGD,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 3 - age at death")
  
  NACC_FROZEN$SIB3NEU=labelled_spss(NACC_FROZEN$SIB3NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 3 - neurological problem")
  
  NACC_FROZEN$SIB3PDX=labelled_spss(NACC_FROZEN$SIB3PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 3 - primary dx")
  
  NACC_FROZEN$SIB3MOE=labelled_spss(NACC_FROZEN$SIB3MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 3 - method of evaluation")
  
  NACC_FROZEN$SIB3AGO=labelled_spss(NACC_FROZEN$SIB3AGO,c(
    "Unknown"=999
  ), label="Sibling 3 - age of onset")
  
  NACC_FROZEN$SIB4MOB=labelled_spss(NACC_FROZEN$SIB4MOB,c(
    "Unknown"=99
  ), label="Sibling 4 - birth month")
  
  NACC_FROZEN$SIB4YOB=labelled_spss(NACC_FROZEN$SIB4YOB,c(
    "Unknown"=9999
  ), label="Sibling 4 - birth year")
  
  NACC_FROZEN$SIB4AGD=labelled_spss(NACC_FROZEN$SIB4AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 4 - age at death")
  
  NACC_FROZEN$SIB4NEU=labelled_spss(NACC_FROZEN$SIB4NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 4 - neurological problem")
  
  NACC_FROZEN$SIB4PDX=labelled_spss(NACC_FROZEN$SIB4PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 4 - primary dx")
  
  NACC_FROZEN$SIB4MOE=labelled_spss(NACC_FROZEN$SIB4MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 4 - method of evaluation")
  
  NACC_FROZEN$SIB4AGO=labelled_spss(NACC_FROZEN$SIB4AGO,c(
    "Unknown"=999
  ), label="Sibling 4 - age of onset")
  
  NACC_FROZEN$SIB5MOB=labelled_spss(NACC_FROZEN$SIB5MOB,c(
    "Unknown"=99
  ), label="Sibling 5 - birth month")
  
  NACC_FROZEN$SIB5YOB=labelled_spss(NACC_FROZEN$SIB5YOB,c(
    "Unknown"=9999
  ), label="Sibling 5 - birth year")
  
  NACC_FROZEN$SIB5AGD=labelled_spss(NACC_FROZEN$SIB5AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 5 - age at death")
  
  NACC_FROZEN$SIB5NEU=labelled_spss(NACC_FROZEN$SIB5NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 5 - neurological problem")
  
  NACC_FROZEN$SIB5PDX=labelled_spss(NACC_FROZEN$SIB5PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 5 - primary dx")
  
  NACC_FROZEN$SIB5MOE=labelled_spss(NACC_FROZEN$SIB5MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 5 - method of evaluation")
  
  NACC_FROZEN$SIB5AGO=labelled_spss(NACC_FROZEN$SIB5AGO,c(
    "Unknown"=999
  ), label="Sibling 5 - age of onset")
  
  NACC_FROZEN$SIB6MOB=labelled_spss(NACC_FROZEN$SIB6MOB,c(
    "Unknown"=99
  ), label="Sibling 6 - birth month")
  
  NACC_FROZEN$SIB6YOB=labelled_spss(NACC_FROZEN$SIB6YOB,c(
    "Unknown"=9999
  ), label="Sibling 6 - birth year")
  
  NACC_FROZEN$SIB6AGD=labelled_spss(NACC_FROZEN$SIB6AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 6 - age at death")
  
  NACC_FROZEN$SIB6NEU=labelled_spss(NACC_FROZEN$SIB6NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 6 - neurological problem")
  
  NACC_FROZEN$SIB6PDX=labelled_spss(NACC_FROZEN$SIB6PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 6 - primary dx")
  
  NACC_FROZEN$SIB6MOE=labelled_spss(NACC_FROZEN$SIB6MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 6 - method of evaluation")
  
  NACC_FROZEN$SIB6AGO=labelled_spss(NACC_FROZEN$SIB6AGO,c(
    "Unknown"=999
  ), label="Sibling 6 - age of onset")
  
  NACC_FROZEN$SIB7MOB=labelled_spss(NACC_FROZEN$SIB7MOB,c(
    "Unknown"=99
  ), label="Sibling 7 - birth month")
  
  NACC_FROZEN$SIB7YOB=labelled_spss(NACC_FROZEN$SIB7YOB,c(
    "Unknown"=9999
  ), label="Sibling 7 - birth year")
  
  NACC_FROZEN$SIB7AGD=labelled_spss(NACC_FROZEN$SIB7AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 7 - age at death")
  
  NACC_FROZEN$SIB7NEU=labelled_spss(NACC_FROZEN$SIB7NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 7 - neurological problem")
  
  NACC_FROZEN$SIB7PDX=labelled_spss(NACC_FROZEN$SIB7PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 7 - primary dx")
  
  NACC_FROZEN$SIB7MOE=labelled_spss(NACC_FROZEN$SIB7MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 7 - method of evaluation")
  
  NACC_FROZEN$SIB7AGO=labelled_spss(NACC_FROZEN$SIB7AGO,c(
    "Unknown"=999
  ), label="Sibling 7 - age of onset")
  
  NACC_FROZEN$SIB8MOB=labelled_spss(NACC_FROZEN$SIB8MOB,c(
    "Unknown"=99
  ), label="Sibling 8 - birth month")
  
  NACC_FROZEN$SIB8YOB=labelled_spss(NACC_FROZEN$SIB8YOB,c(
    "Unknown"=9999
  ), label="Sibling 8 - birth year")
  
  NACC_FROZEN$SIB8AGD=labelled_spss(NACC_FROZEN$SIB8AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 8 - age at death")
  
  NACC_FROZEN$SIB8NEU=labelled_spss(NACC_FROZEN$SIB8NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 8 - neurological problem")
  
  NACC_FROZEN$SIB8PDX=labelled_spss(NACC_FROZEN$SIB8PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 8 - primary dx")
  
  NACC_FROZEN$SIB8MOE=labelled_spss(NACC_FROZEN$SIB8MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 8 - method of evaluation")
  
  NACC_FROZEN$SIB8AGO=labelled_spss(NACC_FROZEN$SIB8AGO,c(
    "Unknown"=999
  ), label="Sibling 8 - age of onset")
  
  NACC_FROZEN$SIB9MOB=labelled_spss(NACC_FROZEN$SIB9MOB,c(
    "Unknown"=99
  ), label="Sibling 9 - birth month")
  
  NACC_FROZEN$SIB9YOB=labelled_spss(NACC_FROZEN$SIB9YOB,c(
    "Unknown"=9999
  ), label="Sibling 9 - birth year")
  
  NACC_FROZEN$SIB9AGD=labelled_spss(NACC_FROZEN$SIB9AGD,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 9 - age at death")
  
  NACC_FROZEN$SIB9NEU=labelled_spss(NACC_FROZEN$SIB9NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 9 - neurological problem")
  
  NACC_FROZEN$SIB9PDX=labelled_spss(NACC_FROZEN$SIB9PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 9 - primary dx")
  
  NACC_FROZEN$SIB9MOE=labelled_spss(NACC_FROZEN$SIB9MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 9 - method of evaluation")
  
  NACC_FROZEN$SIB9AGO=labelled_spss(NACC_FROZEN$SIB9AGO,c(
    "Unknown"=999
  ), label="Sibling 9 - age of onset")
  
  NACC_FROZEN$SIB10MOB=labelled_spss(NACC_FROZEN$SIB10MOB,c(
    "Unknown"=99
  ), label="Sibling 10 - birth month")
  
  NACC_FROZEN$SIB10YOB=labelled_spss(NACC_FROZEN$SIB10YOB,c(
    "Unknown"=9999
  ), label="Sibling 10 - birth year")
  
  NACC_FROZEN$SIB10AGD=labelled_spss(NACC_FROZEN$SIB10AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 10 - age at death")
  
  NACC_FROZEN$SIB10NEU=labelled_spss(NACC_FROZEN$SIB10NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 10 - neurological problem")
  
  NACC_FROZEN$SIB10PDX=labelled_spss(NACC_FROZEN$SIB10PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 10 - primary dx")
  
  NACC_FROZEN$SIB10MOE=labelled_spss(NACC_FROZEN$SIB10MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 10 - method of evaluation")
  
  NACC_FROZEN$SIB10AGO=labelled_spss(NACC_FROZEN$SIB10AGO,c(
    "Unknown"=999
  ), label="Sibling 10 - age of onset")
  
  NACC_FROZEN$SIB11MOB=labelled_spss(NACC_FROZEN$SIB11MOB,c(
    "Unknown"=99
  ), label="Sibling 11 - birth month")
  
  NACC_FROZEN$SIB11YOB=labelled_spss(NACC_FROZEN$SIB11YOB,c(
    "Unknown"=9999
  ), label="Sibling 11 - birth year")
  
  NACC_FROZEN$SIB11AGD=labelled_spss(NACC_FROZEN$SIB11AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 11 - age at death")
  
  NACC_FROZEN$SIB11NEU=labelled_spss(NACC_FROZEN$SIB11NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 11 - neurological problem")
  
  NACC_FROZEN$SIB11PDX=labelled_spss(NACC_FROZEN$SIB11PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 11 - primary dx")
  
  NACC_FROZEN$SIB11MOE=labelled_spss(NACC_FROZEN$SIB11MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 11 - method of evaluation")
  
  NACC_FROZEN$SIB11AGO=labelled_spss(NACC_FROZEN$SIB11AGO,c(
    "Unknown"=999
  ), label="Sibling 11 - age of onset")
  
  NACC_FROZEN$SIB12MOB=labelled_spss(NACC_FROZEN$SIB12MOB,c(
    "Unknown"=99
  ), label="Sibling 12 - birth month")
  
  NACC_FROZEN$SIB12YOB=labelled_spss(NACC_FROZEN$SIB12YOB,c(
    "Unknown"=9999
  ), label="Sibling 12 - birth year")
  
  NACC_FROZEN$SIB12AGD=labelled_spss(NACC_FROZEN$SIB12AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 12 - age at death")
  
  NACC_FROZEN$SIB12NEU=labelled_spss(NACC_FROZEN$SIB12NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 12 - neurological problem")
  
  NACC_FROZEN$SIB12PDX=labelled_spss(NACC_FROZEN$SIB12PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 12 - primary dx")
  
  NACC_FROZEN$SIB12MOE=labelled_spss(NACC_FROZEN$SIB12MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 12 - method of evaluation")
  
  NACC_FROZEN$SIB12AGO=labelled_spss(NACC_FROZEN$SIB12AGO,c(
    "Unknown"=999
  ), label="Sibling 12 - age of onset")
  
  NACC_FROZEN$SIB13MOB=labelled_spss(NACC_FROZEN$SIB13MOB,c(
    "Unknown"=99
  ), label="Sibling 13 - birth month")
  
  NACC_FROZEN$SIB13YOB=labelled_spss(NACC_FROZEN$SIB13YOB,c(
    "Unknown"=9999
  ), label="Sibling 13 - birth year")
  
  NACC_FROZEN$SIB13AGD=labelled_spss(NACC_FROZEN$SIB13AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 13 - age at death")
  
  NACC_FROZEN$SIB13NEU=labelled_spss(NACC_FROZEN$SIB13NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 13 - neurological problem")
  
  NACC_FROZEN$SIB13PDX=labelled_spss(NACC_FROZEN$SIB13PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 13 - primary dx")
  
  NACC_FROZEN$SIB13MOE=labelled_spss(NACC_FROZEN$SIB13MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 13 - method of evaluation")
  
  NACC_FROZEN$SIB13AGO=labelled_spss(NACC_FROZEN$SIB13AGO,c(
    "Unknown"=999
  ), label="Sibling 13 - age of onset")
  
  NACC_FROZEN$SIB14MOB=labelled_spss(NACC_FROZEN$SIB14MOB,c(
    "Unknown"=99
  ), label="Sibling 14 - birth month")
  
  NACC_FROZEN$SIB14YOB=labelled_spss(NACC_FROZEN$SIB14YOB,c(
    "Unknown"=9999
  ), label="Sibling 14 - birth year")
  
  NACC_FROZEN$SIB14AGD=labelled_spss(NACC_FROZEN$SIB14AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 14 - age at death")
  
  NACC_FROZEN$SIB14NEU=labelled_spss(NACC_FROZEN$SIB14NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 14 - neurological problem")
  
  NACC_FROZEN$SIB14PDX=labelled_spss(NACC_FROZEN$SIB14PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 14 - primary dx")
  
  NACC_FROZEN$SIB14MOE=labelled_spss(NACC_FROZEN$SIB14MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 14 - method of evaluation")
  
  NACC_FROZEN$SIB14AGO=labelled_spss(NACC_FROZEN$SIB14AGO,c(
    "Unknown"=999
  ), label="Sibling 14 - age of onset")
  
  NACC_FROZEN$SIB15MOB=labelled_spss(NACC_FROZEN$SIB15MOB,c(
    "Unknown"=99
  ), label="Sibling 15 - birth month")
  
  NACC_FROZEN$SIB15YOB=labelled_spss(NACC_FROZEN$SIB15YOB,c(
    "Unknown"=9999
  ), label="Sibling 15 - birth year")
  
  NACC_FROZEN$SIB15AGD=labelled_spss(NACC_FROZEN$SIB15AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 15 - age at death")
  
  NACC_FROZEN$SIB15NEU=labelled_spss(NACC_FROZEN$SIB15NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 15 - neurological problem")
  
  NACC_FROZEN$SIB15PDX=labelled_spss(NACC_FROZEN$SIB15PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 15 - primary dx")
  
  NACC_FROZEN$SIB15MOE=labelled_spss(NACC_FROZEN$SIB15MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 15 - method of evaluation")
  
  NACC_FROZEN$SIB15AGO=labelled_spss(NACC_FROZEN$SIB15AGO,c(
    "Unknown"=999
  ), label="Sibling 15 - age of onset")
  
  NACC_FROZEN$SIB16MOB=labelled_spss(NACC_FROZEN$SIB16MOB,c(
    "Unknown"=99
  ), label="Sibling 16 - birth month")
  
  NACC_FROZEN$SIB16YOB=labelled_spss(NACC_FROZEN$SIB16YOB,c(
    "Unknown"=9999
  ), label="Sibling 16 - birth year")
  
  NACC_FROZEN$SIB16AGD=labelled_spss(NACC_FROZEN$SIB16AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 16 - age at death")
  
  NACC_FROZEN$SIB16NEU=labelled_spss(NACC_FROZEN$SIB16NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 16 - neurological problem")
  
  NACC_FROZEN$SIB16PDX=labelled_spss(NACC_FROZEN$SIB16PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 16 - primary dx")
  
  NACC_FROZEN$SIB16MOE=labelled_spss(NACC_FROZEN$SIB16MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 16 - method of evaluation")
  
  NACC_FROZEN$SIB16AGO=labelled_spss(NACC_FROZEN$SIB16AGO,c(
    "Unknown"=999
  ), label="Sibling 16 - age of onset")
  
  NACC_FROZEN$SIB17MOB=labelled_spss(NACC_FROZEN$SIB17MOB,c(
    "Unknown"=99
  ), label="Sibling 17 - birth month")
  
  NACC_FROZEN$SIB17YOB=labelled_spss(NACC_FROZEN$SIB17YOB,c(
    "Unknown"=9999
  ), label="Sibling 17 - birth year")
  
  NACC_FROZEN$SIB17AGD=labelled_spss(NACC_FROZEN$SIB17AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 17 - age at death")
  
  NACC_FROZEN$SIB17NEU=labelled_spss(NACC_FROZEN$SIB17NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 17 - neurological problem")
  
  NACC_FROZEN$SIB17PDX=labelled_spss(NACC_FROZEN$SIB17PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 17 - primary dx")
  
  NACC_FROZEN$SIB17MOE=labelled_spss(NACC_FROZEN$SIB17MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 17 - method of evaluation")
  
  NACC_FROZEN$SIB17AGO=labelled_spss(NACC_FROZEN$SIB17AGO,c(
    "Unknown"=999
  ), label="Sibling 17 - age of onset")
  
  NACC_FROZEN$SIB18MOB=labelled_spss(NACC_FROZEN$SIB18MOB,c(
    "Unknown"=99
  ), label="Sibling 18 - birth month")
  
  NACC_FROZEN$SIB18YOB=labelled_spss(NACC_FROZEN$SIB18YOB,c(
    "Unknown"=9999
  ), label="Sibling 18 - birth year")
  
  NACC_FROZEN$SIB18AGD=labelled_spss(NACC_FROZEN$SIB18AGD,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 18 - age at death")
  
  NACC_FROZEN$SIB18NEU=labelled_spss(NACC_FROZEN$SIB18NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 18 - neurological problem")
  
  NACC_FROZEN$SIB18PDX=labelled_spss(NACC_FROZEN$SIB18PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 18 - primary dx")
  
  NACC_FROZEN$SIB18MOE=labelled_spss(NACC_FROZEN$SIB18MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 18 - method of evaluation")
  
  NACC_FROZEN$SIB18AGO=labelled_spss(NACC_FROZEN$SIB18AGO,c(
    "Unknown"=999
  ), label="Sibling 18 - age of onset")
  
  NACC_FROZEN$SIB19MOB=labelled_spss(NACC_FROZEN$SIB19MOB,c(
    "Unknown"=99
  ), label="Sibling 19 - birth month")
  
  NACC_FROZEN$SIB19YOB=labelled_spss(NACC_FROZEN$SIB19YOB,c(
    "Unknown"=9999
  ), label="Sibling 19 - birth year")
  
  NACC_FROZEN$SIB19AGD=labelled_spss(NACC_FROZEN$SIB19AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 19 - age at death")
  
  NACC_FROZEN$SIB19NEU=labelled_spss(NACC_FROZEN$SIB19NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 19 - neurological problem")
  
  NACC_FROZEN$SIB19PDX=labelled_spss(NACC_FROZEN$SIB19PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 19 - primary dx")
  
  NACC_FROZEN$SIB19MOE=labelled_spss(NACC_FROZEN$SIB19MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 19 - method of evaluation")
  
  NACC_FROZEN$SIB19AGO=labelled_spss(NACC_FROZEN$SIB19AGO,c(
    "Unknown"=999
  ), label="Sibling 19 - age of onset")
  
  NACC_FROZEN$SIB20MOB=labelled_spss(NACC_FROZEN$SIB20MOB,c(
    "Unknown"=99
  ), label="Sibling 20 - birth month")
  
  NACC_FROZEN$SIB20YOB=labelled_spss(NACC_FROZEN$SIB20YOB,c(
    "Unknown"=9999
  ), label="Sibling 20 - birth year")
  
  NACC_FROZEN$SIB20AGD=labelled_spss(NACC_FROZEN$SIB20AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Sibling 20 - age at death")
  
  NACC_FROZEN$SIB20NEU=labelled_spss(NACC_FROZEN$SIB20NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Sibling 20 - neurological problem")
  
  NACC_FROZEN$SIB20PDX=labelled_spss(NACC_FROZEN$SIB20PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Sibling 20 - primary dx")
  
  NACC_FROZEN$SIB20MOE=labelled_spss(NACC_FROZEN$SIB20MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Sibling 20 - method of evaluation")
  
  NACC_FROZEN$SIB20AGO=labelled_spss(NACC_FROZEN$SIB20AGO,c(
    "Unknown"=999
  ), label="Sibling 20 - age of onset")
  
  NACC_FROZEN$SIB1LIV=labelled_spss(NACC_FROZEN$SIB1LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 1 living")
  
  NACC_FROZEN$SIB1YOD=labelled_spss(NACC_FROZEN$SIB1YOD,c(
    "Unknown"=9999
  ), label="Sibling 1 year of death")
  
  NACC_FROZEN$SIB1DEM=labelled_spss(NACC_FROZEN$SIB1DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 1 demented")
  
  NACC_FROZEN$SIB1ONS=labelled_spss(NACC_FROZEN$SIB1ONS,c(
    "Age unknown"=999
  ), label="Sibling 1 age at onset")
  
  NACC_FROZEN$SIB1AGE=labelled_spss(NACC_FROZEN$SIB1AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 1 current age if living")
  
  NACC_FROZEN$SIB2LIV=labelled_spss(NACC_FROZEN$SIB2LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 2 living")
  
  NACC_FROZEN$SIB2YOD=labelled_spss(NACC_FROZEN$SIB2YOD,c(
    "Unknown"=9999
  ), label="Sibling 2 year of death")
  
  NACC_FROZEN$SIB2DEM=labelled_spss(NACC_FROZEN$SIB2DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 2 demented")
  
  NACC_FROZEN$SIB2ONS=labelled_spss(NACC_FROZEN$SIB2ONS,c(
    "Age unknown"=999
  ), label="Sibling 2 age at onset")
  
  NACC_FROZEN$SIB2AGE=labelled_spss(NACC_FROZEN$SIB2AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 2 current age if living")
  
  NACC_FROZEN$SIB3LIV=labelled_spss(NACC_FROZEN$SIB3LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 3 living")
  
  NACC_FROZEN$SIB3YOD=labelled_spss(NACC_FROZEN$SIB3YOD,c(
    "Unknown"=9999
  ), label="Sibling 3 year of death")
  
  NACC_FROZEN$SIB3DEM=labelled_spss(NACC_FROZEN$SIB3DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 3 demented")
  
  NACC_FROZEN$SIB3ONS=labelled_spss(NACC_FROZEN$SIB3ONS,c(
    "Age unknown"=999
  ), label="Sibling 3 age at onset")
  
  NACC_FROZEN$SIB3AGE=labelled_spss(NACC_FROZEN$SIB3AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 3 current age if living")
  
  NACC_FROZEN$SIB4LIV=labelled_spss(NACC_FROZEN$SIB4LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 4 living")
  
  NACC_FROZEN$SIB4YOD=labelled_spss(NACC_FROZEN$SIB4YOD,c(
    "Unknown"=9999
  ), label="Sibling 4 year of death")
  
  NACC_FROZEN$SIB4DEM=labelled_spss(NACC_FROZEN$SIB4DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 4 demented")
  
  NACC_FROZEN$SIB4ONS=labelled_spss(NACC_FROZEN$SIB4ONS,c(
    "Age unknown"=999
  ), label="Sibling 4 age at onset")
  
  NACC_FROZEN$SIB4AGE=labelled_spss(NACC_FROZEN$SIB4AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 4 current age if living")
  
  NACC_FROZEN$SIB5LIV=labelled_spss(NACC_FROZEN$SIB5LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 5 living")
  
  NACC_FROZEN$SIB5YOD=labelled_spss(NACC_FROZEN$SIB5YOD,c(
    "Unknown"=9999
  ), label="Sibling 5 year of death")
  
  NACC_FROZEN$SIB5DEM=labelled_spss(NACC_FROZEN$SIB5DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 5 demented")
  
  NACC_FROZEN$SIB5ONS=labelled_spss(NACC_FROZEN$SIB5ONS,c(
    "Age unknown"=999
  ), label="Sibling 5 age at onset")
  
  NACC_FROZEN$SIB5AGE=labelled_spss(NACC_FROZEN$SIB5AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 5 current age if living")
  
  NACC_FROZEN$SIB6LIV=labelled_spss(NACC_FROZEN$SIB6LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 6 living")
  
  NACC_FROZEN$SIB6YOD=labelled_spss(NACC_FROZEN$SIB6YOD,c(
    "Unknown"=9999
  ), label="Sibling 6 year of death")
  
  NACC_FROZEN$SIB6DEM=labelled_spss(NACC_FROZEN$SIB6DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 6 demented")
  
  NACC_FROZEN$SIB6ONS=labelled_spss(NACC_FROZEN$SIB6ONS,c(
    "Age unknown"=999
  ), label="Sibling 6 age at onset")
  
  NACC_FROZEN$SIB6AGE=labelled_spss(NACC_FROZEN$SIB6AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Sibling 6 current age if living")
  
  NACC_FROZEN$SIB7LIV=labelled_spss(NACC_FROZEN$SIB7LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 7 living")
  
  NACC_FROZEN$SIB7YOD=labelled_spss(NACC_FROZEN$SIB7YOD,c(
    "Unknown"=9999
  ), label="Sibling 7 year of death")
  
  NACC_FROZEN$SIB7DEM=labelled_spss(NACC_FROZEN$SIB7DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 7 demented")
  
  NACC_FROZEN$SIB7ONS=labelled_spss(NACC_FROZEN$SIB7ONS,c(
    "Age unknown"=999
  ), label="Sibling 7 age at onset")
  
  NACC_FROZEN$SIB8LIV=labelled_spss(NACC_FROZEN$SIB8LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 8 living")
  
  NACC_FROZEN$SIB8YOD=labelled_spss(NACC_FROZEN$SIB8YOD,c(
    "Unknown"=9999
  ), label="Sibling 8 year of death")
  
  NACC_FROZEN$SIB8DEM=labelled_spss(NACC_FROZEN$SIB8DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 8 demented")
  
  NACC_FROZEN$SIB8ONS=labelled_spss(NACC_FROZEN$SIB8ONS,c(
    "Age unknown"=999
  ), label="Sibling 8 age at onset")
  
  NACC_FROZEN$SIB9LIV=labelled_spss(NACC_FROZEN$SIB9LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 9 living")
  
  NACC_FROZEN$SIB9YOD=labelled_spss(NACC_FROZEN$SIB9YOD,c(
    "Unknown"=9999
  ), label="Sibling 9 year of death")
  
  NACC_FROZEN$SIB9DEM=labelled_spss(NACC_FROZEN$SIB9DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 9 demented")
  
  NACC_FROZEN$SIB9ONS=labelled_spss(NACC_FROZEN$SIB9ONS,c(
    "Age unknown"=999
  ), label="Sibling 9 age at onset")
  
  NACC_FROZEN$SIB10LIV=labelled_spss(NACC_FROZEN$SIB10LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 10 living")
  
  NACC_FROZEN$SIB10YOD=labelled_spss(NACC_FROZEN$SIB10YOD,c(
    "Unknown"=9999
  ), label="Sibling 10 year of death")
  
  NACC_FROZEN$SIB10DEM=labelled_spss(NACC_FROZEN$SIB10DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 10 demented")
  
  NACC_FROZEN$SIB10ONS=labelled_spss(NACC_FROZEN$SIB10ONS,c(
    "Age unknown"=999
  ), label="Sibling 10 age at onset")
  
  NACC_FROZEN$SIB11LIV=labelled_spss(NACC_FROZEN$SIB11LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 11 living")
  
  NACC_FROZEN$SIB11YOD=labelled_spss(NACC_FROZEN$SIB11YOD,c(
    "Unknown"=9999
  ), label="Sibling 11 year of death")
  
  NACC_FROZEN$SIB11DEM=labelled_spss(NACC_FROZEN$SIB11DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 11 demented")
  
  NACC_FROZEN$SIB11ONS=labelled_spss(NACC_FROZEN$SIB11ONS,c(
    "Age unknown"=999
  ), label="Sibling 11 age at onset")
  
  NACC_FROZEN$SIB12LIV=labelled_spss(NACC_FROZEN$SIB12LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 12 living")
  
  NACC_FROZEN$SIB12YOD=labelled_spss(NACC_FROZEN$SIB12YOD,c(
    "Unknown"=9999
  ), label="Sibling 12 year of death")
  
  NACC_FROZEN$SIB12DEM=labelled_spss(NACC_FROZEN$SIB12DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 12 demented")
  
  NACC_FROZEN$SIB12ONS=labelled_spss(NACC_FROZEN$SIB12ONS,c(
    "Age unknown"=999
  ), label="Sibling 12 age at onset")
  
  NACC_FROZEN$SIB13LIV=labelled_spss(NACC_FROZEN$SIB13LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 13 living")
  
  NACC_FROZEN$SIB13YOD=labelled_spss(NACC_FROZEN$SIB13YOD,c(
    "Unknown"=9999
  ), label="Sibling 13 year of death")
  
  NACC_FROZEN$SIB13DEM=labelled_spss(NACC_FROZEN$SIB13DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 13 demented")
  
  NACC_FROZEN$SIB13ONS=labelled_spss(NACC_FROZEN$SIB13ONS,c(
    "Age unknown"=999
  ), label="Sibling 13 age at onset")
  
  NACC_FROZEN$SIB14LIV=labelled_spss(NACC_FROZEN$SIB14LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 14 living")
  
  NACC_FROZEN$SIB14YOD=labelled_spss(NACC_FROZEN$SIB14YOD,c(
    "Unknown"=9999
  ), label="Sibling 14 year of death")
  
  NACC_FROZEN$SIB14DEM=labelled_spss(NACC_FROZEN$SIB14DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 14 demented")
  
  NACC_FROZEN$SIB14ONS=labelled_spss(NACC_FROZEN$SIB14ONS,c(
    "Age unknown"=999
  ), label="Sibling 14 age at onset")
  
  NACC_FROZEN$SIB15LIV=labelled_spss(NACC_FROZEN$SIB15LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 15 living")
  
  NACC_FROZEN$SIB15YOD=labelled_spss(NACC_FROZEN$SIB15YOD,c(
    "Unknown"=9999
  ), label="Sibling 15 year of death")
  
  NACC_FROZEN$SIB15DEM=labelled_spss(NACC_FROZEN$SIB15DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 15 demented")
  
  NACC_FROZEN$SIB15ONS=labelled_spss(NACC_FROZEN$SIB15ONS,c(
    "Age unknown"=999
  ), label="Sibling 15 age at onset")
  
  NACC_FROZEN$SIB16LIV=labelled_spss(NACC_FROZEN$SIB16LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 16 living")
  
  NACC_FROZEN$SIB16YOD=labelled_spss(NACC_FROZEN$SIB16YOD,c(
    "Unknown"=9999
  ), label="Sibling 16 year of death")
  
  NACC_FROZEN$SIB16DEM=labelled_spss(NACC_FROZEN$SIB16DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 16 demented")
  
  NACC_FROZEN$SIB16ONS=labelled_spss(NACC_FROZEN$SIB16ONS,c(
    "Age unknown"=999
  ), label="Sibling 16 age at onset")
  
  NACC_FROZEN$SIB17LIV=labelled_spss(NACC_FROZEN$SIB17LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 17 living")
  
  NACC_FROZEN$SIB17YOD=labelled_spss(NACC_FROZEN$SIB17YOD,c(
    "Unknown"=9999
  ), label="Sibling 17 year of death")
  
  NACC_FROZEN$SIB17DEM=labelled_spss(NACC_FROZEN$SIB17DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 17 demented")
  
  NACC_FROZEN$SIB17ONS=labelled_spss(NACC_FROZEN$SIB17ONS,c(
    "Age unknown"=999
  ), label="Sibling 17 age at onset")
  
  NACC_FROZEN$SIB18LIV=labelled_spss(NACC_FROZEN$SIB18LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 18 living")
  
  NACC_FROZEN$SIB18YOD=labelled_spss(NACC_FROZEN$SIB18YOD,c(
    "Unknown"=9999
  ), label="Sibling 18 year of death")
  
  NACC_FROZEN$SIB18DEM=labelled_spss(NACC_FROZEN$SIB18DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 18 demented")
  
  NACC_FROZEN$SIB18ONS=labelled_spss(NACC_FROZEN$SIB18ONS,c(
    "Age unknown"=999
  ), label="Sibling 18 age at onset")
  
  NACC_FROZEN$SIB19LIV=labelled_spss(NACC_FROZEN$SIB19LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 19 living")
  
  NACC_FROZEN$SIB19YOD=labelled_spss(NACC_FROZEN$SIB19YOD,c(
    "Unknown"=9999
  ), label="Sibling 19 year of death")
  
  NACC_FROZEN$SIB19DEM=labelled_spss(NACC_FROZEN$SIB19DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 19 demented")
  
  NACC_FROZEN$SIB19ONS=labelled_spss(NACC_FROZEN$SIB19ONS,c(
    "Age unknown"=999
  ), label="Sibling 19 age at onset")
  
  NACC_FROZEN$SIB20LIV=labelled_spss(NACC_FROZEN$SIB20LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 20 living")
  
  NACC_FROZEN$SIB20YOD=labelled_spss(NACC_FROZEN$SIB20YOD,c(
    "Unknown"=9999
  ), label="Sibling 20 year of death")
  
  NACC_FROZEN$SIB20DEM=labelled_spss(NACC_FROZEN$SIB20DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Sibling 20 demented")
  
  NACC_FROZEN$SIB20ONS=labelled_spss(NACC_FROZEN$SIB20ONS,c(
    "Age unknown"=999
  ), label="Sibling 20 age at onset")
  
  NACC_FROZEN$KIDS=labelled_spss(NACC_FROZEN$KIDS,label="Number of biological children?")
  
  NACC_FROZEN$KIDSDEM=labelled_spss(NACC_FROZEN$KIDSDEM,c(
    "N/A"=88,
    "Unknown"=99
  ), label="Number of kids demented")
  
  NACC_FROZEN$KIDCHG=labelled_spss(NACC_FROZEN$KIDCHG,c(
    "subject/informant has changes in children history"=0,
    "no changes since previous visit"=1
  ), label="Changes in children information since previous UDS visit")
  
  NACC_FROZEN$NWINFKID=labelled_spss(NACC_FROZEN$NWINFKID,c(
    "No"=0,
    "Yes"=1
  ), label="New information on biological children?")
  
  NACC_FROZEN$KID1MOB=labelled_spss(NACC_FROZEN$KID1MOB,c(
    "Unknown"=99
  ), label="Child 1 - birth month")
  
  NACC_FROZEN$KID1YOB=labelled_spss(NACC_FROZEN$KID1YOB,c(
    "Unknown"=9999
  ), label="Child 1 - birth year")
  
  NACC_FROZEN$KID1AGD=labelled_spss(NACC_FROZEN$KID1AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 1 - age at death")
  
  NACC_FROZEN$KID1NEU=labelled_spss(NACC_FROZEN$KID1NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 1 - neurological problem")
  
  NACC_FROZEN$KID1PDX=labelled_spss(NACC_FROZEN$KID1PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 1 - primary dx")
  
  NACC_FROZEN$KID1MOE=labelled_spss(NACC_FROZEN$KID1MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 1 - method of evaluation")
  
  NACC_FROZEN$KID1AGO=labelled_spss(NACC_FROZEN$KID1AGO,c(
    "Unknown"=999
  ), label="Child 1 - age of onset")
  
  NACC_FROZEN$KID2MOB=labelled_spss(NACC_FROZEN$KID2MOB,c(
    "Unknown"=99
  ), label="Child 2 - birth month")
  
  NACC_FROZEN$KID2YOB=labelled_spss(NACC_FROZEN$KID2YOB,c(
    "Unknown"=9999
  ), label="Child 2 - birth year")
  
  NACC_FROZEN$KID2AGD=labelled_spss(NACC_FROZEN$KID2AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 2 - age at death")
  
  NACC_FROZEN$KID2NEU=labelled_spss(NACC_FROZEN$KID2NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 2 - neurological problem")
  
  NACC_FROZEN$KID2PDX=labelled_spss(NACC_FROZEN$KID2PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 2 - primary dx")
  
  NACC_FROZEN$KID2MOE=labelled_spss(NACC_FROZEN$KID2MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 2 - method of evaluation")
  
  NACC_FROZEN$KID2AGO=labelled_spss(NACC_FROZEN$KID2AGO,c(
    "Unknown"=999
  ), label="Child 2 - age of onset")
  
  NACC_FROZEN$KID3MOB=labelled_spss(NACC_FROZEN$KID3MOB,c(
    "Unknown"=99
  ), label="Child 3 - birth month")
  
  NACC_FROZEN$KID3YOB=labelled_spss(NACC_FROZEN$KID3YOB,c(
    "Unknown"=9999
  ), label="Child 3 - birth year")
  
  NACC_FROZEN$KID3AGD=labelled_spss(NACC_FROZEN$KID3AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 3 - age at death")
  
  NACC_FROZEN$KID3NEU=labelled_spss(NACC_FROZEN$KID3NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 3 - neurological problem")
  
  NACC_FROZEN$KID3PDX=labelled_spss(NACC_FROZEN$KID3PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 3 - primary dx")
  
  NACC_FROZEN$KID3MOE=labelled_spss(NACC_FROZEN$KID3MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 3 - method of evaluation")
  
  NACC_FROZEN$KID3AGO=labelled_spss(NACC_FROZEN$KID3AGO,c(
    "Unknown"=999
  ), label="Child 3 - age of onset")
  
  NACC_FROZEN$KID4MOB=labelled_spss(NACC_FROZEN$KID4MOB,c(
    "Unknown"=99
  ), label="Child 4 - birth month")
  
  NACC_FROZEN$KID4YOB=labelled_spss(NACC_FROZEN$KID4YOB,c(
    "Unknown"=9999
  ), label="Child 4 - birth year")
  
  NACC_FROZEN$KID4AGD=labelled_spss(NACC_FROZEN$KID4AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 4 - age at death")
  
  NACC_FROZEN$KID4NEU=labelled_spss(NACC_FROZEN$KID4NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 4 - neurological problem")
  
  NACC_FROZEN$KID4PDX=labelled_spss(NACC_FROZEN$KID4PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 4 - primary dx")
  
  NACC_FROZEN$KID4MOE=labelled_spss(NACC_FROZEN$KID4MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 4 - method of evaluation")
  
  NACC_FROZEN$KID4AGO=labelled_spss(NACC_FROZEN$KID4AGO,c(
    "Unknown"=999
  ), label="Child 4 - age of onset")
  
  NACC_FROZEN$KID5MOB=labelled_spss(NACC_FROZEN$KID5MOB,c(
    "Unknown"=99
  ), label="Child 5 - birth month")
  
  NACC_FROZEN$KID5YOB=labelled_spss(NACC_FROZEN$KID5YOB,c(
    "Unknown"=9999
  ), label="Child 5 - birth year")
  
  NACC_FROZEN$KID5AGD=labelled_spss(NACC_FROZEN$KID5AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 5 - age at death")
  
  NACC_FROZEN$KID5NEU=labelled_spss(NACC_FROZEN$KID5NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 5 - neurological problem")
  
  NACC_FROZEN$KID5PDX=labelled_spss(NACC_FROZEN$KID5PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 5 - primary dx")
  
  NACC_FROZEN$KID5MOE=labelled_spss(NACC_FROZEN$KID5MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 5 - method of evaluation")
  
  NACC_FROZEN$KID5AGO=labelled_spss(NACC_FROZEN$KID5AGO,c(
    "Unknown"=999
  ), label="Child 5 - age of onset")
  
  NACC_FROZEN$KID6MOB=labelled_spss(NACC_FROZEN$KID6MOB,c(
    "Unknown"=99
  ), label="Child 6 - birth month")
  
  NACC_FROZEN$KID6YOB=labelled_spss(NACC_FROZEN$KID6YOB,c(
    "Unknown"=9999
  ), label="Child 6 - birth year")
  
  NACC_FROZEN$KID6AGD=labelled_spss(NACC_FROZEN$KID6AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 6 - age at death")
  
  NACC_FROZEN$KID6NEU=labelled_spss(NACC_FROZEN$KID6NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 6 - neurological problem")
  
  NACC_FROZEN$KID6PDX=labelled_spss(NACC_FROZEN$KID6PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 6 - primary dx")
  
  NACC_FROZEN$KID6MOE=labelled_spss(NACC_FROZEN$KID6MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 6 - method of evaluation")
  
  NACC_FROZEN$KID6AGO=labelled_spss(NACC_FROZEN$KID6AGO,c(
    "Unknown"=999
  ), label="Child 6 - age of onset")
  
  NACC_FROZEN$KID7MOB=labelled_spss(NACC_FROZEN$KID7MOB,c(
    "Unknown"=99
  ), label="Child 7 - birth month")
  
  NACC_FROZEN$KID7YOB=labelled_spss(NACC_FROZEN$KID7YOB,c(
    "Unknown"=9999
  ), label="Child 7 - birth year")
  
  NACC_FROZEN$KID7AGD=labelled_spss(NACC_FROZEN$KID7AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 7 - age at death")
  
  NACC_FROZEN$KID7NEU=labelled_spss(NACC_FROZEN$KID7NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 7 - neurological problem")
  
  NACC_FROZEN$KID7PDX=labelled_spss(NACC_FROZEN$KID7PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 7 - primary dx")
  
  NACC_FROZEN$KID7MOE=labelled_spss(NACC_FROZEN$KID7MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 7 - method of evaluation")
  
  NACC_FROZEN$KID7AGO=labelled_spss(NACC_FROZEN$KID7AGO,c(
    "Unknown"=999
  ), label="Child 7 - age of onset")
  
  NACC_FROZEN$KID8MOB=labelled_spss(NACC_FROZEN$KID8MOB,c(
    "Unknown"=99
  ), label="Child 8 - birth month")
  
  NACC_FROZEN$KID8YOB=labelled_spss(NACC_FROZEN$KID8YOB,c(
    "Unknown"=9999
  ), label="Child 8 - birth year")
  
  NACC_FROZEN$KID8AGD=labelled_spss(NACC_FROZEN$KID8AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 8 - age at death")
  
  NACC_FROZEN$KID8NEU=labelled_spss(NACC_FROZEN$KID8NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 8 - neurological problem")
  
  NACC_FROZEN$KID8PDX=labelled_spss(NACC_FROZEN$KID8PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 8 - primary dx")
  
  NACC_FROZEN$KID8MOE=labelled_spss(NACC_FROZEN$KID8MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 8 - method of evaluation")
  
  NACC_FROZEN$KID8AGO=labelled_spss(NACC_FROZEN$KID8AGO,c(
    "Unknown"=999
  ), label="Child 8 - age of onset")
  
  NACC_FROZEN$KID9MOB=labelled_spss(NACC_FROZEN$KID9MOB,c(
    "Unknown"=99
  ), label="Child 9 - birth month")
  
  NACC_FROZEN$KID9YOB=labelled_spss(NACC_FROZEN$KID9YOB,c(
    "Unknown"=9999
  ), label="Child 9 - birth year")
  
  NACC_FROZEN$KID9AGD=labelled_spss(NACC_FROZEN$KID9AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 9 - age at death")
  
  NACC_FROZEN$KID9NEU=labelled_spss(NACC_FROZEN$KID9NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 9 - neurological problem")
  
  NACC_FROZEN$KID9PDX=labelled_spss(NACC_FROZEN$KID9PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 9 - primary dx")
  
  NACC_FROZEN$KID9MOE=labelled_spss(NACC_FROZEN$KID9MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 9 - method of evaluation")
  
  NACC_FROZEN$KID9AGO=labelled_spss(NACC_FROZEN$KID9AGO,c(
    "Unknown"=999
  ), label="Child 9 - age of onset")
  
  NACC_FROZEN$KID10MOB=labelled_spss(NACC_FROZEN$KID10MOB,c(
    "Unknown"=99
  ), label="Child 10 - birth month")
  
  NACC_FROZEN$KID10YOB=labelled_spss(NACC_FROZEN$KID10YOB,c(
    "Unknown"=9999
  ), label="Child 10 - birth year")
  
  NACC_FROZEN$KID10AGD=labelled_spss(NACC_FROZEN$KID10AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 10 - age at death")
  
  NACC_FROZEN$KID10NEU=labelled_spss(NACC_FROZEN$KID10NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 10 - neurological problem")
  
  NACC_FROZEN$KID10PDX=labelled_spss(NACC_FROZEN$KID10PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 10 - primary dx")
  
  NACC_FROZEN$KID10MOE=labelled_spss(NACC_FROZEN$KID10MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 10 - method of evaluation")
  
  NACC_FROZEN$KID10AGO=labelled_spss(NACC_FROZEN$KID10AGO,c(
    "Unknown"=999
  ), label="Child 10 - age of onset")
  
  NACC_FROZEN$KID11MOB=labelled_spss(NACC_FROZEN$KID11MOB,c(
    "Unknown"=99
  ), label="Child 11 - birth month")
  
  NACC_FROZEN$KID11YOB=labelled_spss(NACC_FROZEN$KID11YOB,c(
    "Unknown"=9999
  ), label="Child 11 - birth year")
  
  NACC_FROZEN$KID11AGD=labelled_spss(NACC_FROZEN$KID11AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 11 - age at death")
  
  NACC_FROZEN$KID11NEU=labelled_spss(NACC_FROZEN$KID11NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 11 - neurological problem")
  
  NACC_FROZEN$KID11PDX=labelled_spss(NACC_FROZEN$KID11PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 11 - primary dx")
  
  NACC_FROZEN$KID11MOE=labelled_spss(NACC_FROZEN$KID11MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 11 - method of evaluation")
  
  NACC_FROZEN$KID11AGO=labelled_spss(NACC_FROZEN$KID11AGO,c(
    "Unknown"=999
  ), label="Child 11 - age of onset")
  
  NACC_FROZEN$KID12MOB=labelled_spss(NACC_FROZEN$KID12MOB,c(
    "Unknown"=99
  ), label="Child 12 - birth month")
  
  NACC_FROZEN$KID12YOB=labelled_spss(NACC_FROZEN$KID12YOB,c(
    "Unknown"=9999
  ), label="Child 12 - birth year")
  
  NACC_FROZEN$KID12AGD=labelled_spss(NACC_FROZEN$KID12AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 12 - age at death")
  
  NACC_FROZEN$KID12NEU=labelled_spss(NACC_FROZEN$KID12NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 12 - neurological problem")
  
  NACC_FROZEN$KID12PDX=labelled_spss(NACC_FROZEN$KID12PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 12 - primary dx")
  
  NACC_FROZEN$KID12MOE=labelled_spss(NACC_FROZEN$KID12MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 12 - method of evaluation")
  
  NACC_FROZEN$KID12AGO=labelled_spss(NACC_FROZEN$KID12AGO,c(
    "Unknown"=999
  ), label="Child 12 - age of onset")
  
  NACC_FROZEN$KID13MOB=labelled_spss(NACC_FROZEN$KID13MOB,c(
    "Unknown"=99
  ), label="Child 13 - birth month")
  
  NACC_FROZEN$KID13YOB=labelled_spss(NACC_FROZEN$KID13YOB,c(
    "Unknown"=9999
  ), label="Child 13 - birth year")
  
  NACC_FROZEN$KID13AGD=labelled_spss(NACC_FROZEN$KID13AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 13 - age at death")
  
  NACC_FROZEN$KID13NEU=labelled_spss(NACC_FROZEN$KID13NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 13 - neurological problem")
  
  NACC_FROZEN$KID13PDX=labelled_spss(NACC_FROZEN$KID13PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 13 - primary dx")
  
  NACC_FROZEN$KID13MOE=labelled_spss(NACC_FROZEN$KID13MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 13 - method of evaluation")
  
  NACC_FROZEN$KID13AGO=labelled_spss(NACC_FROZEN$KID13AGO,c(
    "Unknown"=999
  ), label="Child 13 - age of onset")
  
  NACC_FROZEN$KID14MOB=labelled_spss(NACC_FROZEN$KID14MOB,c(
    "Unknown"=99
  ), label="Child 14 - birth month")
  
  NACC_FROZEN$KID14YOB=labelled_spss(NACC_FROZEN$KID14YOB,c(
    "Unknown"=9999
  ), label="Child 14 - birth year")
  
  NACC_FROZEN$KID14AGD=labelled_spss(NACC_FROZEN$KID14AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 14 - age at death")
  
  NACC_FROZEN$KID14NEU=labelled_spss(NACC_FROZEN$KID14NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 14 - neurological problem")
  
  NACC_FROZEN$KID14PDX=labelled_spss(NACC_FROZEN$KID14PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 14 - primary dx")
  
  NACC_FROZEN$KID14MOE=labelled_spss(NACC_FROZEN$KID14MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 14 - method of evaluation")
  
  NACC_FROZEN$KID14AGO=labelled_spss(NACC_FROZEN$KID14AGO,c(
    "Unknown"=999
  ), label="Child 14 - age of onset")
  
  NACC_FROZEN$KID15MOB=labelled_spss(NACC_FROZEN$KID15MOB,c(
    "Unknown"=99
  ), label="Child 15 - birth month")
  
  NACC_FROZEN$KID15YOB=labelled_spss(NACC_FROZEN$KID15YOB,c(
    "Unknown"=9999
  ), label="Child 15 - birth year")
  
  NACC_FROZEN$KID15AGD=labelled_spss(NACC_FROZEN$KID15AGD,c(
    "N/A"=888,
    "Unknown"=999
  ), label="Child 15 - age at death")
  
  NACC_FROZEN$KID15NEU=labelled_spss(NACC_FROZEN$KID15NEU,c(
    "Cognitive impairment/behavior change "=1,
    "Parkinsonism"=2,
    "ALS"=3,
    "Other neurologic condition such as multiple sclerosis or stroke"=4,
    "Psychiatric condition such as schizophrenia, bipolar disorder, or alcoholism"=5,
    "N/A, no neurological problem or psychiatric condition"=8,
    "Unknown"=9
  ), label="Child 15 - neurological problem")
  
  NACC_FROZEN$KID15PDX=labelled_spss(NACC_FROZEN$KID15PDX,c(
    "Specific diagnosis unknown"=999
  ), label="Child 15 - primary dx")
  
  NACC_FROZEN$KID15MOE=labelled_spss(NACC_FROZEN$KID15MOE,c(
    "Autopsy"=1,
    "Examination"=2,
    "Medical record review from formal dementia evaluation"=3,
    "Review of general medical records AND co-participant and/or subject telephone interview"=4,
    "Review of general medical records only"=5,
    "Subject and/or co-participant telephone interview"=6,
    "Family report"=7
  ), label="Child 15 - method of evaluation")
  
  NACC_FROZEN$KID15AGO=labelled_spss(NACC_FROZEN$KID15AGO,c(
    "Unknown"=999
  ), label="Child 15 - age of onset")
  
  NACC_FROZEN$KID1LIV=labelled_spss(NACC_FROZEN$KID1LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 1 living")
  
  NACC_FROZEN$KID1YOD=labelled_spss(NACC_FROZEN$KID1YOD,c(
    "Unknown"=9999
  ), label="Child 1 year of death")
  
  NACC_FROZEN$KID1DEM=labelled_spss(NACC_FROZEN$KID1DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 1 demented")
  
  NACC_FROZEN$KID1ONS=labelled_spss(NACC_FROZEN$KID1ONS,c(
    "Age unknown"=999
  ), label="Child 1 age at onset")
  
  NACC_FROZEN$KID1AGE=labelled_spss(NACC_FROZEN$KID1AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Child 1 current age if living")
  
  NACC_FROZEN$KID2LIV=labelled_spss(NACC_FROZEN$KID2LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 2 living")
  
  NACC_FROZEN$KID2YOD=labelled_spss(NACC_FROZEN$KID2YOD,c(
    "Unknown"=9999
  ), label="Child 2 year of death")
  
  NACC_FROZEN$KID2DEM=labelled_spss(NACC_FROZEN$KID2DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 2 demented")
  
  NACC_FROZEN$KID2ONS=labelled_spss(NACC_FROZEN$KID2ONS,c(
    "Age unknown"=999
  ), label="Child 2 age at onset")
  
  NACC_FROZEN$KID2AGE=labelled_spss(NACC_FROZEN$KID2AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Child 2 current age if living")
  
  NACC_FROZEN$KID3LIV=labelled_spss(NACC_FROZEN$KID3LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 3 living")
  
  NACC_FROZEN$KID3YOD=labelled_spss(NACC_FROZEN$KID3YOD,c(
    "Unknown"=9999
  ), label="Child 3 year of death")
  
  NACC_FROZEN$KID3DEM=labelled_spss(NACC_FROZEN$KID3DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 3 demented")
  
  NACC_FROZEN$KID3ONS=labelled_spss(NACC_FROZEN$KID3ONS,c(
    "Age unknown"=999
  ), label="Child 3 age at onset")
  
  NACC_FROZEN$KID3AGE=labelled_spss(NACC_FROZEN$KID3AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Child 3 current age if living")
  
  NACC_FROZEN$KID4LIV=labelled_spss(NACC_FROZEN$KID4LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 4 living")
  
  NACC_FROZEN$KID4YOD=labelled_spss(NACC_FROZEN$KID4YOD,c(
    "Unknown"=9999
  ), label="Child 4 year of death")
  
  NACC_FROZEN$KID4DEM=labelled_spss(NACC_FROZEN$KID4DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 4 demented")
  
  NACC_FROZEN$KID4ONS=labelled_spss(NACC_FROZEN$KID4ONS,c(
    "Age unknown"=999
  ), label="Child 4 age at onset")
  
  NACC_FROZEN$KID4AGE=labelled_spss(NACC_FROZEN$KID4AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Child 4 current age if living")
  
  NACC_FROZEN$KID5LIV=labelled_spss(NACC_FROZEN$KID5LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 5 living")
  
  NACC_FROZEN$KID5YOD=labelled_spss(NACC_FROZEN$KID5YOD,c(
    "Unknown"=9999
  ), label="Child 5 year of death")
  
  NACC_FROZEN$KID5DEM=labelled_spss(NACC_FROZEN$KID5DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 5 demented")
  
  NACC_FROZEN$KID5ONS=labelled_spss(NACC_FROZEN$KID5ONS,c(
    "Age unknown"=999
  ), label="Child 5 age at onset")
  
  NACC_FROZEN$KID5AGE=labelled_spss(NACC_FROZEN$KID5AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Child 5 current age if living")
  
  NACC_FROZEN$KID6LIV=labelled_spss(NACC_FROZEN$KID6LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 6 living")
  
  NACC_FROZEN$KID6YOD=labelled_spss(NACC_FROZEN$KID6YOD,c(
    "Unknown"=9999
  ), label="Child 6 year of death")
  
  NACC_FROZEN$KID6DEM=labelled_spss(NACC_FROZEN$KID6DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 6 demented")
  
  NACC_FROZEN$KID6ONS=labelled_spss(NACC_FROZEN$KID6ONS,c(
    "Age unknown"=999
  ), label="Child 6 age at onset")
  
  NACC_FROZEN$KID6AGE=labelled_spss(NACC_FROZEN$KID6AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Child 6 current age if living")
  
  NACC_FROZEN$KID7LIV=labelled_spss(NACC_FROZEN$KID7LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 7 living")
  
  NACC_FROZEN$KID7YOD=labelled_spss(NACC_FROZEN$KID7YOD,c(
    "Unknown"=9999
  ), label="Child 7 year of death")
  
  NACC_FROZEN$KID7DEM=labelled_spss(NACC_FROZEN$KID7DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 7 demented")
  
  NACC_FROZEN$KID7ONS=labelled_spss(NACC_FROZEN$KID7ONS,c(
    "Age unknown"=999
  ), label="Child 7 age at onset")
  
  NACC_FROZEN$KID8LIV=labelled_spss(NACC_FROZEN$KID8LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 8 living")
  
  NACC_FROZEN$KID8YOD=labelled_spss(NACC_FROZEN$KID8YOD,c(
    "Unknown"=9999
  ), label="Child 8 year of death")
  
  NACC_FROZEN$KID8DEM=labelled_spss(NACC_FROZEN$KID8DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 8 demented")
  
  NACC_FROZEN$KID8ONS=labelled_spss(NACC_FROZEN$KID8ONS,c(
    "Age unknown"=999
  ), label="Child 8 age at onset")
  
  NACC_FROZEN$KID9LIV=labelled_spss(NACC_FROZEN$KID9LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 9 living")
  
  NACC_FROZEN$KID9YOD=labelled_spss(NACC_FROZEN$KID9YOD,c(
    "Unknown"=9999
  ), label="Child 9 year of death")
  
  NACC_FROZEN$KID9DEM=labelled_spss(NACC_FROZEN$KID9DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 9 demented")
  
  NACC_FROZEN$KID9ONS=labelled_spss(NACC_FROZEN$KID9ONS,c(
    "Age unknown"=999
  ), label="Child 9 age at onset")
  
  NACC_FROZEN$KID10LIV=labelled_spss(NACC_FROZEN$KID10LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 10 living")
  
  NACC_FROZEN$KID10YOD=labelled_spss(NACC_FROZEN$KID10YOD,c(
    "Unknown"=9999
  ), label="Child 10 year of death")
  
  NACC_FROZEN$KID10DEM=labelled_spss(NACC_FROZEN$KID10DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 10 demented")
  
  NACC_FROZEN$KID10ONS=labelled_spss(NACC_FROZEN$KID10ONS,c(
    "Age unknown"=999
  ), label="Child 10 age at onset")
  
  NACC_FROZEN$KID11LIV=labelled_spss(NACC_FROZEN$KID11LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 11 living")
  
  NACC_FROZEN$KID11YOD=labelled_spss(NACC_FROZEN$KID11YOD,c(
    "Unknown"=9999
  ), label="Child 11 year of death")
  
  NACC_FROZEN$KID11DEM=labelled_spss(NACC_FROZEN$KID11DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 11 demented")
  
  NACC_FROZEN$KID11ONS=labelled_spss(NACC_FROZEN$KID11ONS,c(
    "Age unknown"=999
  ), label="Child 11 age at onset")
  
  NACC_FROZEN$KID12LIV=labelled_spss(NACC_FROZEN$KID12LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 12 living")
  
  NACC_FROZEN$KID12YOD=labelled_spss(NACC_FROZEN$KID12YOD,c(
    "Unknown"=9999
  ), label="Child 12 year of death")
  
  NACC_FROZEN$KID12DEM=labelled_spss(NACC_FROZEN$KID12DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 12 demented")
  
  NACC_FROZEN$KID12ONS=labelled_spss(NACC_FROZEN$KID12ONS,c(
    "Age unknown"=999
  ), label="Child 12 age at onset")
  
  NACC_FROZEN$KID13LIV=labelled_spss(NACC_FROZEN$KID13LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 13 living")
  
  NACC_FROZEN$KID13YOD=labelled_spss(NACC_FROZEN$KID13YOD,c(
    "Unknown"=9999
  ), label="Child 13 year of death")
  
  NACC_FROZEN$KID13DEM=labelled_spss(NACC_FROZEN$KID13DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 13 demented")
  
  NACC_FROZEN$KID13ONS=labelled_spss(NACC_FROZEN$KID13ONS,c(
    "Age unknown"=999
  ), label="Child 13 age at onset")
  
  NACC_FROZEN$KID14LIV=labelled_spss(NACC_FROZEN$KID14LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 14 living")
  
  NACC_FROZEN$KID14YOD=labelled_spss(NACC_FROZEN$KID14YOD,c(
    "Unknown"=9999
  ), label="Child 14 year of death")
  
  NACC_FROZEN$KID14DEM=labelled_spss(NACC_FROZEN$KID14DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 14 demented")
  
  NACC_FROZEN$KID14ONS=labelled_spss(NACC_FROZEN$KID14ONS,c(
    "Age unknown"=999
  ), label="Child 14 age at onset")
  
  NACC_FROZEN$KID15LIV=labelled_spss(NACC_FROZEN$KID15LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 15 living")
  
  NACC_FROZEN$KID15YOD=labelled_spss(NACC_FROZEN$KID15YOD,c(
    "Unknown"=9999
  ), label="Child 15 year of death")
  
  NACC_FROZEN$KID15DEM=labelled_spss(NACC_FROZEN$KID15DEM,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Child 15 demented")
  
  NACC_FROZEN$KID15ONS=labelled_spss(NACC_FROZEN$KID15ONS,c(
    "Age unknown"=999
  ), label="Child 15 age at onset")
 
  NACC_FROZEN$RELCHG=labelled_spss(NACC_FROZEN$RELCHG,c(
    "subject/informant has changes in relative history"=0,
    "no changes since previous visit"=1
  ), label="Changes in relative information since previous UDS visit")
  
  NACC_FROZEN$RELSDEM=labelled_spss(NACC_FROZEN$RELSDEM,c(
    "Unknown"=99
  ), label="Relatives demented")
  
  NACC_FROZEN$REL1YOB=labelled_spss(NACC_FROZEN$REL1YOB,c(
    "Unknown"=9999
  ), label="Relative 1 year of birth")
  
  NACC_FROZEN$REL1LIV=labelled_spss(NACC_FROZEN$REL1LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 1 living")
  
  NACC_FROZEN$REL1YOD=labelled_spss(NACC_FROZEN$REL1YOD,c(
    "Unknown"=9999
  ), label="Relative 1 year of death")
  
  NACC_FROZEN$REL1ONS=labelled_spss(NACC_FROZEN$REL1ONS,c(
    "Age unknown"=999
  ), label="Relative 1 age at onset")
  
  NACC_FROZEN$REL1AGE=labelled_spss(NACC_FROZEN$REL1AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Relative 1 current age if living")
  
  NACC_FROZEN$REL2YOB=labelled_spss(NACC_FROZEN$REL2YOB,c(
    "Unknown"=9999
  ), label="Relative 2 year of birth")
  
  NACC_FROZEN$REL2LIV=labelled_spss(NACC_FROZEN$REL2LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 2 living")
  
  NACC_FROZEN$REL2YOD=labelled_spss(NACC_FROZEN$REL2YOD,c(
    "Unknown"=9999
  ), label="Relative 2 year of death")
  
  NACC_FROZEN$REL2ONS=labelled_spss(NACC_FROZEN$REL2ONS,c(
    "Age unknown"=999
  ), label="Relative 2 age at onset")
  
  NACC_FROZEN$REL2AGE=labelled_spss(NACC_FROZEN$REL2AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Relative 2 current age if living")
  
  NACC_FROZEN$REL3YOB=labelled_spss(NACC_FROZEN$REL3YOB,c(
    "Unknown"=9999
  ), label="Relative 3 year of birth")
  
  NACC_FROZEN$REL3LIV=labelled_spss(NACC_FROZEN$REL3LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 3 living")
  
  NACC_FROZEN$REL3YOD=labelled_spss(NACC_FROZEN$REL3YOD,c(
    "Unknown"=9999
  ), label="Relative 3 year of death")
  
  NACC_FROZEN$REL3ONS=labelled_spss(NACC_FROZEN$REL3ONS,c(
    "Age unknown"=999
  ), label="Relative 3 age at onset")
  
  NACC_FROZEN$REL3AGE=labelled_spss(NACC_FROZEN$REL3AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Relative 3 current age if living")
  
  NACC_FROZEN$REL4YOB=labelled_spss(NACC_FROZEN$REL4YOB,c(
    "Unknown"=9999
  ), label="Relative 4 year of birth")
  
  NACC_FROZEN$REL4LIV=labelled_spss(NACC_FROZEN$REL4LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 4 living")
  
  NACC_FROZEN$REL4YOD=labelled_spss(NACC_FROZEN$REL4YOD,c(
    "Unknown"=9999
  ), label="Relative 4 year of death")
  
  NACC_FROZEN$REL4ONS=labelled_spss(NACC_FROZEN$REL4ONS,c(
    "Age unknown"=999
  ), label="Relative 4 age at onset")
  
  NACC_FROZEN$REL4AGE=labelled_spss(NACC_FROZEN$REL4AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Relative 4 current age if living")
  
  NACC_FROZEN$REL5YOB=labelled_spss(NACC_FROZEN$REL5YOB,c(
    "Unknown"=9999
  ), label="Relative 5 year of birth")
  
  NACC_FROZEN$REL5LIV=labelled_spss(NACC_FROZEN$REL5LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 5 living")
  
  NACC_FROZEN$REL5YOD=labelled_spss(NACC_FROZEN$REL5YOD,c(
    "Unknown"=9999
  ), label="Relative 5 year of death")
  
  NACC_FROZEN$REL5ONS=labelled_spss(NACC_FROZEN$REL5ONS,c(
    "Age unknown"=999
  ), label="Relative 5 age at onset")
  
  NACC_FROZEN$REL5AGE=labelled_spss(NACC_FROZEN$REL5AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Relative 5 current age if living")
  
  NACC_FROZEN$REL6YOB=labelled_spss(NACC_FROZEN$REL6YOB,c(
    "Unknown"=9999
  ), label="Relative 6 year of birth")
  
  NACC_FROZEN$REL6LIV=labelled_spss(NACC_FROZEN$REL6LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 6 living")
  
  NACC_FROZEN$REL6YOD=labelled_spss(NACC_FROZEN$REL6YOD,c(
    "Unknown"=9999
  ), label="Relative 6 year of death")
  
  NACC_FROZEN$REL6ONS=labelled_spss(NACC_FROZEN$REL6ONS,c(
    "Age unknown"=999
  ), label="Relative 6 age at onset")
  
  NACC_FROZEN$REL6AGE=labelled_spss(NACC_FROZEN$REL6AGE,c(
    "N/A"=888,
    "Age Unknown"=999
  ), label="Relative 6 current age if living")
  
  NACC_FROZEN$REL7YOB=labelled_spss(NACC_FROZEN$REL7YOB,c(
    "Unknown"=9999
  ), label="Relative 7 year of birth")
  
  NACC_FROZEN$REL7LIV=labelled_spss(NACC_FROZEN$REL7LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 7 living")
  
  NACC_FROZEN$REL7YOD=labelled_spss(NACC_FROZEN$REL7YOD,c(
    "Unknown"=9999
  ), label="Relative 7 year of death")
  
  NACC_FROZEN$REL7ONS=labelled_spss(NACC_FROZEN$REL7ONS,c(
    "Age unknown"=999
  ), label="Relative 7 age at onset")
  
  NACC_FROZEN$REL8YOB=labelled_spss(NACC_FROZEN$REL8YOB,c(
    "Unknown"=9999
  ), label="Relative 8 year of birth")
  
  NACC_FROZEN$REL8LIV=labelled_spss(NACC_FROZEN$REL8LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 8 living")
  
  NACC_FROZEN$REL8YOD=labelled_spss(NACC_FROZEN$REL8YOD,c(
    "Unknown"=9999
  ), label="Relative 8 year of death")
  
  NACC_FROZEN$REL8ONS=labelled_spss(NACC_FROZEN$REL8ONS,c(
    "Age unknown"=999
  ), label="Relative 8 age at onset")
  
  NACC_FROZEN$REL9YOB=labelled_spss(NACC_FROZEN$REL9YOB,c(
    "Unknown"=9999
  ), label="Relative 9 year of birth")
  
  NACC_FROZEN$REL9LIV=labelled_spss(NACC_FROZEN$REL9LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 9 living")
  
  NACC_FROZEN$REL9YOD=labelled_spss(NACC_FROZEN$REL9YOD,c(
    "Unknown"=9999
  ), label="Relative 9 year of death")
  
  NACC_FROZEN$REL9ONS=labelled_spss(NACC_FROZEN$REL9ONS,c(
    "Age unknown"=999
  ), label="Relative 9 age at onset")
  
  NACC_FROZEN$REL10YOB=labelled_spss(NACC_FROZEN$REL10YOB,c(
    "Unknown"=9999
  ), label="Relative 10 year of birth")
  
  NACC_FROZEN$REL10LIV=labelled_spss(NACC_FROZEN$REL10LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 10 living")
  
  NACC_FROZEN$REL10YOD=labelled_spss(NACC_FROZEN$REL10YOD,c(
    "Unknown"=9999
  ), label="Relative 10 year of death")
  
  NACC_FROZEN$REL10ONS=labelled_spss(NACC_FROZEN$REL10ONS,c(
    "Age unknown"=999
  ), label="Relative 10 age at onset")
  
  NACC_FROZEN$REL11YOB=labelled_spss(NACC_FROZEN$REL11YOB,c(
    "Unknown"=9999
  ), label="Relative 11 year of birth")
  
  NACC_FROZEN$REL11LIV=labelled_spss(NACC_FROZEN$REL11LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 11 living")
  
  NACC_FROZEN$REL11YOD=labelled_spss(NACC_FROZEN$REL11YOD,c(
    "Unknown"=9999
  ), label="Relative 11 year of death")
  
  NACC_FROZEN$REL11ONS=labelled_spss(NACC_FROZEN$REL11ONS,c(
    "Age unknown"=999
  ), label="Relative 11 age at onset")
  
  NACC_FROZEN$REL12YOB=labelled_spss(NACC_FROZEN$REL12YOB,c(
    "Unknown"=9999
  ), label="Relative 12 year of birth")
  
  NACC_FROZEN$REL12LIV=labelled_spss(NACC_FROZEN$REL12LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 12 living")
  
  NACC_FROZEN$REL12YOD=labelled_spss(NACC_FROZEN$REL12YOD,c(
    "Unknown"=9999
  ), label="Relative 12 year of death")
  
  NACC_FROZEN$REL12ONS=labelled_spss(NACC_FROZEN$REL12ONS,c(
    "Age unknown"=999
  ), label="Relative 12 age at onset")
  
  NACC_FROZEN$REL13YOB=labelled_spss(NACC_FROZEN$REL13YOB,c(
    "Unknown"=9999
  ), label="Relative 13 year of birth")
  
  NACC_FROZEN$REL13LIV=labelled_spss(NACC_FROZEN$REL13LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 13 living")
  
  NACC_FROZEN$REL13YOD=labelled_spss(NACC_FROZEN$REL13YOD,c(
    "Unknown"=9999
  ), label="Relative 13 year of death")
  
  NACC_FROZEN$REL13ONS=labelled_spss(NACC_FROZEN$REL13ONS,c(
    "Age unknown"=999
  ), label="Relative 13 age at onset")
  
  NACC_FROZEN$REL14YOB=labelled_spss(NACC_FROZEN$REL14YOB,c(
    "Unknown"=9999
  ), label="Relative 14 year of birth")
  
  NACC_FROZEN$REL14LIV=labelled_spss(NACC_FROZEN$REL14LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 14 living")
  
  NACC_FROZEN$REL14YOD=labelled_spss(NACC_FROZEN$REL14YOD,c(
    "Unknown"=9999
  ), label="Relative 14 year of death")
  
  NACC_FROZEN$REL14ONS=labelled_spss(NACC_FROZEN$REL14ONS,c(
    "Age unknown"=999
  ), label="Relative 14 age at onset")
  
  NACC_FROZEN$REL15YOB=labelled_spss(NACC_FROZEN$REL15YOB,c(
    "Unknown"=9999
  ), label="Relative 15 year of birth")
  
  NACC_FROZEN$REL15LIV=labelled_spss(NACC_FROZEN$REL15LIV,c(
    "No"=0,
    "Yes"=1,
    "Unknown"=9
  ), label="Relative 15 living")
  
  NACC_FROZEN$REL15YOD=labelled_spss(NACC_FROZEN$REL15YOD,c(
    "Unknown"=9999
  ), label="Relative 15 year of death")
  
  NACC_FROZEN$REL15ONS=labelled_spss(NACC_FROZEN$REL15ONS,c(
    "Age unknown"=999
  ), label="Relative 15 age at onset")
  
  #-----------------------------------------------------------------------------
  ### D1 Clinician Diagnosis
  #-----------------------------------------------------------------------------
  NACC_FROZEN$ALZDIS=labelled_spss(NACC_FROZEN$ALZDIS,c(
    "Absent" = 0,
    "Present" = 1,
    "Not available"=-4
  ), label="Alzheimer's disease")

    
#-------------------------------------------------------------------------------
### Neuropathology Data Set
#-------------------------------------------------------------------------------
  
NACC_FROZEN$NPFORMVER=labelled_spss(NACC_FROZEN$NPFORMVER,c(
  "Version 1"=1,
  "Version 7"=7,
  "Version 8"=8,
  "Version 9"=9,
  "Version 10"=10,
  "Not available"=-4
), label="NP form version")

NACC_FROZEN$NPSEX=labelled_spss(NACC_FROZEN$NPSEX,c( 
  "Male"=1,
  "Female"=2,
  "Not available"=-4
), label="Subject's sex")

NACC_FROZEN$NACCDAGE=labelled_spss(NACC_FROZEN$NACCDAGE,c(	
  "Not applicable"=888,
  "Unknown"=999,
  "Not available"=-4
), label="Age at death")

NACC_FROZEN$NACCMOD=labelled_spss(NACC_FROZEN$NACCMOD,c(
  "Not applicable"=88,
  "Unknown"=99,
  "Not available"=-4
), label="Month of death")

NACC_FROZEN$NACCYOD=labelled_spss(NACC_FROZEN$NACCYOD,c(
  "Not applicable"=8888,
  "Unknown"=9999,
  "Not available"=-4
), label="Year of death")

NACC_FROZEN$NACCINT=labelled_spss(NACC_FROZEN$NACCINT,c(
  "Not applicable"=888,
  "Unknown"=999,
  "Not available"=-4
), label="Time interval between last visit and death")

NACC_FROZEN$NPPMIH=labelled_spss(NACC_FROZEN$NPPMIH,c(
  "Unknown"=99.9,
  "Not available"=-4.4
), label="Postmortem interval (PMI) (hours)")

NACC_FROZEN$NPFIX=labelled_spss(NACC_FROZEN$NPFIX,c(
"Formalin"=1,
"Paraformaldehyde"=2,
"Other (specify)"=7,
"Not available"=-4
), label="Fixative")

NACC_FROZEN$NPFIXX=as.character(NACC_FROZEN$NPFIXX)
NACC_FROZEN$NPFIXX=labelled_spss(NACC_FROZEN$NPFIXX,
label="Fixative other specify")

NACC_FROZEN$NPWBRWT=labelled_spss(NACC_FROZEN$NPWBRWT,c(
"unknown"=9999,
"Not available"=-4
), label="Whole brain weight (grams)")

NACC_FROZEN$NPWBRF=labelled_spss(NACC_FROZEN$NPWBRF,c( 
  "Fresh"=1,
  "Fixed"=2,
  "Not applicable"=8,
  "Not available"=-4
), label="Fresh or fixed brain weight")

NACC_FROZEN$NACCBRNN=labelled_spss(NACC_FROZEN$NACCBRNN,c( 
  "Some pathologic change present"=0,
  "No major pathologic change present"=1,
  "At least one required variable is not assessed/ missing/ unknown"=8,
  "Not available"=-4
), label="No major neuropathologic change present")

NACC_FROZEN$NPGRCCA=labelled_spss(NACC_FROZEN$NPGRCCA,c( 
  "None"=0,
  "Mild"=1,
  "Moderate"=2,
  "Severe"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Severity of gross findings - cerebral cortex atrophy")

NACC_FROZEN$NPGRLA=labelled_spss(NACC_FROZEN$NPGRLA,c( 
  "None"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Severity of gross findings - lobar atrophy")

NACC_FROZEN$NPGRHA=labelled_spss(NACC_FROZEN$NPGRHA,c( 
  "None"=0,
  "Mild"=1,
  "Moderate"=2,
  "Severe"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Severity of gross findings - hippocampus atrophy")

NACC_FROZEN$NPGRSNH=labelled_spss(NACC_FROZEN$NPGRSNH,c( 
  "None"=0,
  "Mild"=1,
  "Moderate"=2,
  "Severe"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Severity of gross findings - substantia nigra hypopigmentation")

NACC_FROZEN$NPGRLCH=labelled_spss(NACC_FROZEN$NPGRLCH,c( 
  "None"=0,
  "Mild"=1,
  "Moderate"=2,
  "Severe"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Severity of gross findings - I. (locus) ceruleus hypopigmentation")

NACC_FROZEN$NACCAVAS=labelled_spss(NACC_FROZEN$NACCAVAS,c( 
  "None"=0,
  "Mild"=1,
  "Moderate"=2,
  "Severe"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Severity of gross findings - atherosclerosis of the circle of Willis")

NACC_FROZEN$NPTAN=labelled_spss(NACC_FROZEN$NPTAN,c( 
  "Non-phospho specific"=1,
  "PHF1"=2,
  "CP13"=3,
  "AT8"=4,
  "Other (specify)"=7,
  "Not assessed"=8,
  "Not available"=-4
), label="Method for scoring case - tau antibody")

NACC_FROZEN$NPTANX=as.character(NACC_FROZEN$NPTANX)
NACC_FROZEN$NPTANX=labelled_spss(NACC_FROZEN$NPTANX,
label="Method for scoring case - tau antibody other specify")

NACC_FROZEN$NPABAN=labelled_spss(NACC_FROZEN$NPABAN,c( 
  "4G8"=1,
  "10D5"=2,
  "Other (specify)"=7,
  "Not assessed"=8,
  "Not available"=-4
), label="Method for scoring case - amyloid beta antibody")

NACC_FROZEN$NPABANX=as.character(NACC_FROZEN$NPABANX)
NACC_FROZEN$NPABANX=labelled_spss(NACC_FROZEN$NPABANX,
label="Method for scoring case - amyloid beta antibody other specify")

NACC_FROZEN$NPASAN=labelled_spss(NACC_FROZEN$NPASAN,c( 
  "Non-phospho specific (e.g., LB509)"=1,
  "Phospho-specific (e.g., pSYN#64)"=2,
  "Other (specify)"=7,
  "Not assessed"=8,
  "Not available"=-4
), label="Method for scoring case - alpha synuclein antibody")

NACC_FROZEN$NPASANX=as.character(NACC_FROZEN$NPASANX)
NACC_FROZEN$NPASANX=labelled_spss(NACC_FROZEN$NPASANX,
label="Method for scoring case - alpha synuclein antibody other specify")

NACC_FROZEN$NPTDPAN=labelled_spss(NACC_FROZEN$NPTDPAN,c( 
  "Non-phospho specific "=1,
  "Phospho-specific "=2,
  "Other (specify)"=7,
  "Not assessed"=8,
  "Not available"=-4
), label="Method for scoring case - TDP-43 antibody")

NACC_FROZEN$NPTDPANX=as.character(NACC_FROZEN$NPTDPANX)
NACC_FROZEN$NPTDPANX=labelled_spss(NACC_FROZEN$NPTDPANX,
label="Method for scoring case - TDP-43 antibody  other specify")

NACC_FROZEN$NPHISMB=labelled_spss(NACC_FROZEN$NPHISMB,c( 
  "No"=0,
  "Yes"=1,
  "Not available"=-4
), label="Histochemical stain used - modifed Bielschosky")

NACC_FROZEN$NPHISG=labelled_spss(NACC_FROZEN$NPHISG,c( 
  "No"=0,
  "Yes"=1,
  "Not available"=-4
), label="Histochemical stain used - Gallyas")

NACC_FROZEN$NPHISSS=labelled_spss(NACC_FROZEN$NPHISSS,c( 
  "No"=0,
  "Yes"=1,
  "Not available"=-4
), label="Histochemical stain used - other silver stain")

NACC_FROZEN$NPHIST=labelled_spss(NACC_FROZEN$NPHIST,c( 
  "No"=0,
  "Yes"=1,
  "Not available"=-4
), label="Histochemical stain used - thioflavin")

NACC_FROZEN$NPHISO=labelled_spss(NACC_FROZEN$NPHISO,c( 
  "No"=0,
  "Yes"=1,
  "Not available"=-4
), label="Histochemical stain used - other")

NACC_FROZEN$NPHISOX=as.character(NACC_FROZEN$NPHISOX)
NACC_FROZEN$NPHISOX=labelled_spss(NACC_FROZEN$NPHISOX, 
label="Histochemical stain used - other specify")

NACC_FROZEN$NPTHAL=labelled_spss(NACC_FROZEN$NPTHAL,c( 
  "Phase 0 (A0)"=0,
  "Phase 1 (A1)"=1,
  "Phase 2 (A1)"=2,
  "Phase 3 (A2)"=3,
  "Phase 4 (A3)"=4,
  "Phase 5 (A3)"=5,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Thal phase for amyloid plaques (A score) Braak stage for neurofibrillary degeneration")

NACC_FROZEN$NACCBRAA=labelled_spss(NACC_FROZEN$NACCBRAA,c( 
  "Stage 0, AD-type neurofibrillary degeneration not present (B0)"=0,
  "Stage I (B1)"=1,
  "Stage II (B1)"=2,
  "Stage III (B2)"=3,
  "Stage IV (B2)"=4,
  "Stage V (B3)"=5,
  "Stage VI (B3)"=6,
  "The presence of a tauopathy (other than aging/AD) precludes Braak staging"=7,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Braak stage for neurofibrillary degeneration  (B score)")

NACC_FROZEN$NACCNEUR=labelled_spss(NACC_FROZEN$NACCNEUR,c( 
"No neuritic plaques (C0)"=0,
"Sparse neuritic plaques (C1)"=1,
"Moderate neuritic plaques (C2)"=2,
"Frequent neuritic plaques (C3)"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Density of neocortical neuritic plaques (CERAD score) (C score)")

NACC_FROZEN$NPADNC=labelled_spss(NACC_FROZEN$NPADNC,c( 
"Not AD"=0,
"Low ADNC"=1,
"Intermediate ADNC"=2,
"High ADNC"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="NIA-AA Alzheimer's disease neuropathologic change (ADNC) (ABC score)")

NACC_FROZEN$NACCDIFF=labelled_spss(NACC_FROZEN$NACCDIFF,c( 
  "No diffuse plaques"=0,
  "Sparse diffuse plaques"=1,
  "Moderate diffuse plaques "=2,
  "Frequent diffuse plaques "=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Density of diffuse plaques (CERAD semi- quantitative score)")

NACC_FROZEN$NACCVASC=labelled_spss(NACC_FROZEN$NACCVASC,c( 
"No"=0,
"One or more vascular pathology"=1,
"Unknown"=9,
"Not available"=-4
), label="Ischemic, hemorrhagic, or vascular pathology present")

NACC_FROZEN$NACCAMY=labelled_spss(NACC_FROZEN$NACCAMY,c( 
"None"=0,
"Mild"=1,
"Moderate "=2,
"Severe "=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Cerebral amyloid angiopathy")

NACC_FROZEN$NPLINF=labelled_spss(NACC_FROZEN$NPLINF,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Large arterial infarcts present")

NACC_FROZEN$NPLAC=labelled_spss(NACC_FROZEN$NPLAC,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="One or more lacunes (small artery infracts and/or hemorrhages) present")

NACC_FROZEN$NPINF=labelled_spss(NACC_FROZEN$NPINF,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Old infarcts observed grossly (including lacunes)")

NACC_FROZEN$NPINF1A=labelled_spss(NACC_FROZEN$NPINF1A,c(
  "Not assessed"=88,
  "Missing/unknown"=99,
  "Not available"=-4
), label="Old infarcts observed grossly - number in  cerebral cortex")

NACC_FROZEN$NPINF1B=labelled_spss(NACC_FROZEN$NPINF1B,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of largest old infarct observed in cerebral cortex (cm)")

NACC_FROZEN$NPINF1D=labelled_spss(NACC_FROZEN$NPINF1D,c(
"Not assessed or not applicable"=88.8,
"Missing/unknown"=99.9,
"Not available"=-4
), label="Size of second-largest old infarct observed in cerebral cortex (cm)")

NACC_FROZEN$NPINF1F=labelled_spss(NACC_FROZEN$NPINF1F,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of third-largest old infact observed in  cerebral cortex (cm)")

NACC_FROZEN$NPINF2A=labelled_spss(NACC_FROZEN$NPINF2A,c(
"Not assessed"=88,
"Missing/unknown"=99,
"Not available"=-4
), label="Old infarcts observed grossly - number in subcortical/periventricular white matter")

NACC_FROZEN$NPINF2B=labelled_spss(NACC_FROZEN$NPINF2B,c(
"Not assessed or not applicable"=88.8,
"Missing/unknown"=99.9,
"Not available"=-4
), label="Size of largest old infarct observed in subcortical cerebral/periventricular white matter (cm)")

NACC_FROZEN$NPINF2D=labelled_spss(NACC_FROZEN$NPINF2D,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of second-largest old infarct observed in sub- cortical cerebral/periventricular white matter (cm)")

NACC_FROZEN$NPINF2F=labelled_spss(NACC_FROZEN$NPINF2F,c(
"Not assessed or not applicable"=88.8,
"Missing/unknown"=99.9,
"Not available"=-4
), label="Size of third-largest old infarct observed in sub- cortical cerebral/periventricular white matter (cm)")

NACC_FROZEN$NPINF3A=labelled_spss(NACC_FROZEN$NPINF3A,c(
  "Not assessed"=88,
  "Missing/unknown"=99,
  "Not available"=-4
), label="Old infarcts observed grossly - number in deep cerebral gray matter or internal capsule")

NACC_FROZEN$NPINF3B=labelled_spss(NACC_FROZEN$NPINF3B,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of largest old infarct observed in deep cerebral gray matter or internal capsule")

NACC_FROZEN$NPINF3D=labelled_spss(NACC_FROZEN$NPINF3D,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of second-largest old infarct observed in deep cerebral gray matter or internal capsule (cm)")

NACC_FROZEN$NPINF3F=labelled_spss(NACC_FROZEN$NPINF3F,c(
"Not assessed or not applicable"=88.8,
"Missing/unknown"=99.9,
"Not available"=-4
), label="Size of third-largest old infarct observed in deep cerebral gray matter or internal capsule (cm)")

NACC_FROZEN$NPINF4A=as.numeric(NACC_FROZEN$NPINF4A)
NACC_FROZEN$NPINF4A=labelled_spss(NACC_FROZEN$NPINF4A,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Old infarcts observed grossly - number in brainstem or cerebellum")

NACC_FROZEN$NPINF4B=labelled_spss(NACC_FROZEN$NPINF4B,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of largest old infarct observed in brainstem  or cerebellum (cm)")

NACC_FROZEN$NPINF4D=labelled_spss(NACC_FROZEN$NPINF4D,c(
"Not assessed or not applicable"=88.8,
"Missing/unknown"=99.9,
"Not available"=-4
), label="Size of second largest old infarct observed in brainstem or cerebellum (cm)")

NACC_FROZEN$NPINF4F=labelled_spss(NACC_FROZEN$NPINF4F,c(
  "Not assessed or not applicable"=88.8,
  "Missing/unknown"=99.9,
  "Not available"=-4
), label="Size of third largest old infarct observed in brainstem or cerebellum (cm)")

NACC_FROZEN$NACCINF=labelled_spss(NACC_FROZEN$NACCINF,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Unknown or missing"=9,
"Not available"=-4
), label="Infarcts and lacunes")

NACC_FROZEN$NPHEM=labelled_spss(NACC_FROZEN$NPHEM,c(
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Single or multiple hemorrhages present")

NACC_FROZEN$NPHEMO=labelled_spss(NACC_FROZEN$NPHEMO,c(
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Single or multiple old hemorrhages observed grossly")

NACC_FROZEN$NPHEMO1=labelled_spss(NACC_FROZEN$NPHEMO1,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Single or multiple old hemorrhages observed grossly - subdural or epidural hemorrhage")

NACC_FROZEN$NPHEMO2=labelled_spss(NACC_FROZEN$NPHEMO2,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Single or multiple old hemorrhages observed grossly - primary parenchymal hemorrhage")

NACC_FROZEN$NPHEMO3=labelled_spss(NACC_FROZEN$NPHEMO3,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Single or multiple old hemorrhages observed grossly - secondary parenchymal hemorrhage")

NACC_FROZEN$NPMICRO=labelled_spss(NACC_FROZEN$NPMICRO,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Multiple microinfarcts present")

NACC_FROZEN$NPOLD=labelled_spss(NACC_FROZEN$NPOLD,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Old microinfarcts, not observed grossly")

NACC_FROZEN$NPOLD1=labelled_spss(NACC_FROZEN$NPOLD1,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of old microinfarcts, not observed grossly - cerebral cortex")

NACC_FROZEN$NPOLD2=labelled_spss(NACC_FROZEN$NPOLD2,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of old microinfarcts, not observed grossly - subcortical or periventricular white matter")

NACC_FROZEN$NPOLD3=labelled_spss(NACC_FROZEN$NPOLD3,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of old microinfarcts, not observed grossly - subcortical gray matter")

NACC_FROZEN$NPOLD4=labelled_spss(NACC_FROZEN$NPOLD4,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of old microinfarcts, not observed grossly - brainstem and cerebellum")

NACC_FROZEN$NACCMICR=labelled_spss(NACC_FROZEN$NACCMICR,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Unknown or missing"=9,
"Not available"=-4
), label="Microinfarcts")

NACC_FROZEN$NPOLDD=labelled_spss(NACC_FROZEN$NPOLDD,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Old cerebral microbleeds")

NACC_FROZEN$NPOLDD1=labelled_spss(NACC_FROZEN$NPOLDD1,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of cerebral microbleeds - cerebral cortex")

NACC_FROZEN$NPOLDD2=labelled_spss(NACC_FROZEN$NPOLDD2,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of cerebral microbleeds - subcortical  and periventricular white matter")

NACC_FROZEN$NPOLDD3=labelled_spss(NACC_FROZEN$NPOLDD3,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of cerebral microbleeds - subcortical gray matter")

NACC_FROZEN$NPOLDD4=labelled_spss(NACC_FROZEN$NPOLDD4,c( 
"0"=0,
"1"=1,
"2"=2,
"3 or more"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Number of cerebral microbleeds - brainstem  and cerebellum")

NACC_FROZEN$NACCHEM=labelled_spss(NACC_FROZEN$NACCHEM,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Unknown or missing"=9,
"Not available"=-4
), label="Hemorrhages and microbleeds")

NACC_FROZEN$NACCARTE=labelled_spss(NACC_FROZEN$NACCARTE,c( 
"None"=0,
"Mild"=1,
"Moderate"=2,
"Severe"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Arteriolosclerosis")

NACC_FROZEN$NPWMR=labelled_spss(NACC_FROZEN$NPWMR,c( 
"None"=0,
"Mild"=1,
"Moderate"=2,
"Severe"=3,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="White matter rarefaction")

NACC_FROZEN$NPPATH=labelled_spss(NACC_FROZEN$NPPATH,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Other pathological changes related to ischemic or vascular disease not previously specfied")

NACC_FROZEN$NACCNEC=labelled_spss(NACC_FROZEN$NACCNEC,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Laminar necrosis")

NACC_FROZEN$NPPATH2=labelled_spss(NACC_FROZEN$NPPATH2,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Acute neuronal necrosis")

NACC_FROZEN$NPPATH3=labelled_spss(NACC_FROZEN$NPPATH3,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Acute/subacute gross infarcts")

NACC_FROZEN$NPPATH4=labelled_spss(NACC_FROZEN$NPPATH4,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Acute/subacute microinfarcts")

NACC_FROZEN$NPPATH5=labelled_spss(NACC_FROZEN$NPPATH5,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Acute/subacute gross hemorrhage")

NACC_FROZEN$NPPATH6=labelled_spss(NACC_FROZEN$NPPATH6,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Acute/subacute microhemorrhage")

NACC_FROZEN$NPPATH7=labelled_spss(NACC_FROZEN$NPPATH7,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Vascular malformation of any type")

NACC_FROZEN$NPPATH8=labelled_spss(NACC_FROZEN$NPPATH8,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Aneurysm of any type")

NACC_FROZEN$NPPATH9=labelled_spss(NACC_FROZEN$NPPATH9,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Vasculitis of any type")

NACC_FROZEN$NPPATH10=labelled_spss(NACC_FROZEN$NPPATH10,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="CADASIL")

NACC_FROZEN$NPPATH11=labelled_spss(NACC_FROZEN$NPPATH11,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Mineralization of blood vessels")

NACC_FROZEN$NPPATHO=labelled_spss(NACC_FROZEN$NPPATHO,c( 
"No"=0,
"Yes"=1,
"Not available"=-4
), label="Other ischemic or vascular pathology")

NACC_FROZEN$NPPATHOX=as.character(NACC_FROZEN$NPPATHOX)
NACC_FROZEN$NPPATHOX=labelled_spss(NACC_FROZEN$NPPATHOX,
label="Other ischemic or vascular pathology specify")

NACC_FROZEN$NPART=labelled_spss(NACC_FROZEN$NPART,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Subcortical arteriosclerotic leukoencephalopathy present")

NACC_FROZEN$NPOANG=labelled_spss(NACC_FROZEN$NPOANG,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Angiopathy other than amyloid angiopathy present")

NACC_FROZEN$NACCLEWY=labelled_spss(NACC_FROZEN$NACCLEWY,c( 
"No Lewy body pathology"=0,
"Brainstem-predominant"=1,
"Limbic (transitional) or amygdala-predominant"=2,
"Neocortical (diffuse)"=3,
"Lewy bodies present, but region unspecified or found in the olfactory bulb"=4,
"Not assessed"=8,
"Missing"=9,
"Not available"=-4
), label="Lewy body pathology (NOTE: For v1-9, olfactory bulb may not have been assessed, and therefore, if there were Lewy bodies in the olfactory bulb, they would have nacclewy = 0)")

NACC_FROZEN$NPLBOD=labelled_spss(NACC_FROZEN$NPLBOD,c( 
  "No"=0,
  "Brainstem predominant"=1,
  "Limbic (transitional)"=2,
  "Neocortical (diffuse)"=3,
  "Amygdala predominant"=4,
  "Olfactory bulb"=5,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Evidence of Lewy body pathology")

NACC_FROZEN$NPNLOSS=labelled_spss(NACC_FROZEN$NPNLOSS,c( 
  "None"=0,
  "Mild"=1,
  "Moderate"=2,
  "Severe"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Neuron loss in the substantia nigra")

NACC_FROZEN$NPHIPSCL=labelled_spss(NACC_FROZEN$NPHIPSCL,c( 
  "None"=0,
  "Unilateral"=1,
  "Bilateral"=2,
  "Present but laterality not assessed"=3,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Hippocampal sclerosis (CA1 and/or subiculum)")

NACC_FROZEN$NPSCL=labelled_spss(NACC_FROZEN$NPSCL,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Medial temporal lobe sclerosis present")

NACC_FROZEN$NPFTDTAU=labelled_spss(NACC_FROZEN$NPFTDTAU,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD with tau pathology (FTLD-tau) or other tauopathy")

NACC_FROZEN$NACCPICK=labelled_spss(NACC_FROZEN$NACCPICK,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - Pick's (PiD)")

NACC_FROZEN$NPFTDT2=labelled_spss(NACC_FROZEN$NPFTDT2,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - other 3R tauopathy  (includes MAPT mutation tauopathy)")

NACC_FROZEN$NACCCBD=labelled_spss(NACC_FROZEN$NACCCBD,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTLD-tau subtype - corticobasal degeneration (CBD)")

NACC_FROZEN$NACCPROG=labelled_spss(NACC_FROZEN$NACCPROG,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - progressive supranuclear palsy (PSP)")

NACC_FROZEN$NPFTDT5=labelled_spss(NACC_FROZEN$NPFTDT5,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTLD-tau subtype - argyrophilic grains")

NACC_FROZEN$NPFTDT6=labelled_spss(NACC_FROZEN$NPFTDT6,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTLD-tau subtype - other 4R tauopathy (includes sporadic multiple systems tauopathy, globular glial tauopathy, MAPT mutation tauopathy)")

NACC_FROZEN$NPFTDT7=labelled_spss(NACC_FROZEN$NPFTDT7,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - chronic traumatic encephalopathy")

NACC_FROZEN$NPFTDT8=labelled_spss(NACC_FROZEN$NPFTDT8,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - amyotrophic lateral sclerosis (ALS)/parkinsonism-dementia")

NACC_FROZEN$NPFTDT9=labelled_spss(NACC_FROZEN$NPFTDT9,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - tangle dominant disease")

NACC_FROZEN$NPFTDT10=labelled_spss(NACC_FROZEN$NPFTDT10,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="FTLD-tau subtype - other 3R + 4R tauopathy")

NACC_FROZEN$NPFRONT=labelled_spss(NACC_FROZEN$NPFRONT,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Frontemporal dementia and parkinsonism with  tau-positive or argyrophilic inclusions")

NACC_FROZEN$NPTAU=labelled_spss(NACC_FROZEN$NPTAU,c( 
"Yes"=1,
"No"=2,
"Not assessed"=3,
"Missing/unknown"=9,
"Not available"=-4
), label="Tauopathy, other (e.g., tangle-only dementia and argyrophilic grain dementia)")

NACC_FROZEN$NPFTD=labelled_spss(NACC_FROZEN$NPFTD,c( 
  "FTD with motor neuron disease"=1,
  "FTD without motor neuron disease"=2,
  "None present"=3,
  "Not assessed"=4,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTD with ubiquitin-positive 9 (tau-negative) inclusions")

NACC_FROZEN$NPFTDTDP=labelled_spss(NACC_FROZEN$NPFTDTDP,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTLD with TDP-43 pathology (FTLD-TDP)")

NACC_FROZEN$NPALSMND=labelled_spss(NACC_FROZEN$NPALSMND,c( 
  "No"=0,
  "Yes, with TDP-43 inclusions in motor neurons"=1,
  "Yes, with FUS inclusions in motor neurons"=2,
  "Yes, with SOD1 inclusions in motor neurons"=3,
  "Yes, with other inclusions"=4,
  "Yes, with no specific inclusions"=5,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="ALS/motor neuron disease (MND)")

NACC_FROZEN$NPOFTD=labelled_spss(NACC_FROZEN$NPOFTD,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Other FTLD")

NACC_FROZEN$NPOFTD1=labelled_spss(NACC_FROZEN$NPOFTD1,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Other FTLD subtype - atypical FTLD-U")

NACC_FROZEN$NPOFTD2=labelled_spss(NACC_FROZEN$NPOFTD2,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Other FTLD subtype - NIFID (neuronal intermediate filament inclusions disease)")

NACC_FROZEN$NPOFTD3=labelled_spss(NACC_FROZEN$NPOFTD3,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Other FTLD subtype - BIBD (basophilic inclusion body disease)")

NACC_FROZEN$NPOFTD4=labelled_spss(NACC_FROZEN$NPOFTD4,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Other FTLD subtype - FTLD-UPS (ubiquitin- proteasome system [ubiquitin or p62 positive, tau/ TDP-43/FUS negative inclusions])")

NACC_FROZEN$NPOFTD5=labelled_spss(NACC_FROZEN$NPOFTD5,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Other FTLD subtype - FTLD-NOS (includes dementia lacking distinctive histology [DLDH] and FTLD with no inclusions [FTLD-NI] detected bytau, TDP-43, or ubiquitin/p62 IHC)")

NACC_FROZEN$NPFTDNO=labelled_spss(NACC_FROZEN$NPFTDNO,c( 
  "Yes"=1,
  "No"=2,
  "Not assessed"=3,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTD with no distinctive histopathology present")

NACC_FROZEN$NPFTDSPC=labelled_spss(NACC_FROZEN$NPFTDSPC,c( 
  "Yes"=1,
  "No"=2,
  "Not assessed"=3,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTD not otherwise specified present")

NACC_FROZEN$NPTDPA=labelled_spss(NACC_FROZEN$NPTDPA,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Distribution of TDP-43 immunoreactive inclusions - spinal cord")

NACC_FROZEN$NPTDPB=labelled_spss(NACC_FROZEN$NPTDPB,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Distribution of TDP-43 immunoreactive inclusions - amygdala")

NACC_FROZEN$NPTDPC=labelled_spss(NACC_FROZEN$NPTDPC,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Distribution of TDP-43 immunoreactive inclusions - hippcampus")

NACC_FROZEN$NPTDPD=labelled_spss(NACC_FROZEN$NPTDPD,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Distribution of TDP-43 immunoreactive inclusions - entorhinal/inferior temporal cortex")

NACC_FROZEN$NPTDPE=labelled_spss(NACC_FROZEN$NPTDPE,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Distribution of TDP-43 immunoreactive inclusions - neocortex")

NACC_FROZEN$NPPDXA=labelled_spss(NACC_FROZEN$NPPDXA,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Pigment-spheroid degeneration/NBIA")

NACC_FROZEN$NPPDXB=labelled_spss(NACC_FROZEN$NPPDXB,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Multiple system atrophy")

NACC_FROZEN$NACCPRIO=labelled_spss(NACC_FROZEN$NACCPRIO,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Prion disease")

NACC_FROZEN$NPPDXD=labelled_spss(NACC_FROZEN$NPPDXD,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Trinucleotide disease (Huntington disease,  SCA, other)")

NACC_FROZEN$NPPDXE=labelled_spss(NACC_FROZEN$NPPDXE,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Malformation of cortical development")

NACC_FROZEN$NPPDXF=labelled_spss(NACC_FROZEN$NPPDXF,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Metabolic/storage disorder of any type")

NACC_FROZEN$NPPDXG=labelled_spss(NACC_FROZEN$NPPDXG,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="WM disease, leukodystrophy")

NACC_FROZEN$NPPDXH=labelled_spss(NACC_FROZEN$NPPDXH,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="WM disease, multiple sclerosis or other demyelinating disease")

NACC_FROZEN$NPPDXI=labelled_spss(NACC_FROZEN$NPPDXI,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Contusion/traumatic brain injury of any type, acute")

NACC_FROZEN$NPPDXJ=labelled_spss(NACC_FROZEN$NPPDXJ,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Contusion/traumatic brain injury of any type, chronic")

NACC_FROZEN$NPPDXK=labelled_spss(NACC_FROZEN$NPPDXK,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Neoplasm, primary")

NACC_FROZEN$NPPDXL=labelled_spss(NACC_FROZEN$NPPDXL,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Neoplasm, metastatic")

NACC_FROZEN$NPPDXM=labelled_spss(NACC_FROZEN$NPPDXM,c( 
"No"=0,
"Yes"=1,
"Not assessed"=8,
"Missing/unknown"=9,
"Not available"=-4
), label="Infectious process of any type (encephalitis, abscess, etc.)")

NACC_FROZEN$NPPDXN=labelled_spss(NACC_FROZEN$NPPDXN,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Herniation, any site")

NACC_FROZEN$NACCDOWN=labelled_spss(NACC_FROZEN$NACCDOWN,c( 
  "Flag for known mutation"=1,
  "No flag for known mutation (not present, not assessed, missing or unknown)"=7,
  "Not available"=-4
), label="Down syndrome")

NACC_FROZEN$NPPDXP=labelled_spss(NACC_FROZEN$NPPDXP,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="AD-related genes")

NACC_FROZEN$NPPDXQ=labelled_spss(NACC_FROZEN$NPPDXQ,c( 
  "No"=0,
  "Yes"=1,
  "Not assessed"=8,
  "Missing/unknown"=9,
  "Not available"=-4
), label="FTLD-related genes")

NACC_FROZEN$NACCOTHP=labelled_spss(NACC_FROZEN$NACCOTHP,c( 
  "No"=0,
  "Yes, one or more written-in diagnoses"=1,
  "Not assessed"=8,
  "Unknown"=9,
  "Not available"=-4
), label="Other pathologic diagnosis")

NACC_FROZEN$NACCWRI1=as.character(NACC_FROZEN$NACCWRI1)
NACC_FROZEN$NACCWRI1=labelled_spss(NACC_FROZEN$NACCWRI1,
label="First other pathologic diagnosis write-in")

NACC_FROZEN$NACCWRI2=as.character(NACC_FROZEN$NACCWRI2)
NACC_FROZEN$NACCWRI2=labelled_spss(NACC_FROZEN$NACCWRI2,
label="Second other pathologic diagnosis write-in")

NACC_FROZEN$NACCWRI3=as.character(NACC_FROZEN$NACCWRI3)
NACC_FROZEN$NACCWRI3=labelled_spss(NACC_FROZEN$NACCWRI3, 
label="Third other pathologic diagnosis write-in")

NACC_FROZEN$NACCBNKF=labelled_spss(NACC_FROZEN$NACCBNKF,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Banked frozen brain")

NACC_FROZEN$NPBNKB=labelled_spss(NACC_FROZEN$NPBNKB,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Banked frozen wedge of cerebellum or other sample for future DNA prep")

NACC_FROZEN$NACCFORM=labelled_spss(NACC_FROZEN$NACCFORM,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Formalin- or paraformaldehyde-fixed brain derived")

NACC_FROZEN$NACCPARA=labelled_spss(NACC_FROZEN$NACCPARA,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Paraffin-embedded blocks of brain regions")

NACC_FROZEN$NACCCSFP=labelled_spss(NACC_FROZEN$NACCCSFP,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Banked postmortem CSF")

NACC_FROZEN$NPBNKF=labelled_spss(NACC_FROZEN$NPBNKF,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Banked postmortem blood or serum")

NACC_FROZEN$NPFAUT=labelled_spss(NACC_FROZEN$NPFAUT,c( 
  "No"=0,
  "Yes"=1,
  "Missing/unknown"=9,
  "Not available"=-4
), label="Full autopsy performed")

NACC_FROZEN$NPFAUT1=as.character(NACC_FROZEN$NPFAUT1)
NACC_FROZEN$NPFAUT1=labelled_spss(NACC_FROZEN$NPFAUT1,
label="If full autopsy performed, first major finding")

NACC_FROZEN$NPFAUT2=as.character(NACC_FROZEN$NPFAUT2)
NACC_FROZEN$NPFAUT2=labelled_spss(NACC_FROZEN$NPFAUT2,
label="If full autopsy performed, second major finding")

NACC_FROZEN$NPFAUT3=as.character(NACC_FROZEN$NPFAUT3)
NACC_FROZEN$NPFAUT3=labelled_spss(NACC_FROZEN$NPFAUT3,
label="If full autopsy performed, third major finding")

NACC_FROZEN$NPFAUT4=as.character(NACC_FROZEN$NPFAUT4)
NACC_FROZEN$NPFAUT4=labelled_spss(NACC_FROZEN$NPFAUT4,
label="If full autopsy performed, fourth major finding")

NACC_FROZEN$NPNIT=labelled_spss(NACC_FROZEN$NPNIT,c(
  "High likelihood of dementia being due to Alzheimer's disease"=1,
  "Intermediate likelihood of dementia being due to Alzheimer's disease"=2,
  "Low likelihood of dementia being due to Alzheimer's disease"=3,
  "Criteria not met"=4,
  "Not Done"=5,
  "Missing/unknown"=9,
  "Not available"=-4
), label="NIA/Reagan Institute criteria")

NACC_FROZEN$NPCERAD=labelled_spss(NACC_FROZEN$NPCERAD,c(
  "Definite Alzheimer's disease"=1,
  "Probable Alzheimer's disease"=2,
  "Possible Alzheimer's disease"=3,
  "Criteria not met"=4,
  "Not done"=5,
  "Missing/Unknown"=9,
  "Not available"=-4
), label="CERAD criteria")

NACC_FROZEN$NPADRDA=labelled_spss(NACC_FROZEN$NPADRDA,c(
  "Alzheimer's disease"=1,
  "Criteria not met"=2,
  "Not done"=3,
  "Missing/Unknown"=9,
  "Not available"=-4
), label="ADRDA/Khachaturian criteria")

NACC_FROZEN$NPOCRIT=labelled_spss(NACC_FROZEN$NPOCRIT,c(
  "Alzheimer's disease, unspecified"=1,
  "Criteria not met"=2,
  "Not done"=3,
  "Missing/Unknown"=9,
  "Not available"=-4
), label="Other criteria")

NACC_FROZEN$NPVOTH=labelled_spss(NACC_FROZEN$NPVOTH,c(
  "Yes"=1,
  "No"=2,
  "Not assessed"=3,
  "Missing/Unknown"=9,
  "Not available"=-4
), label="Other vascular")

NACC_FROZEN$NPLEWYCS=labelled_spss(NACC_FROZEN$NPLEWYCS,c(
  "Low"=1,
  "Intermediate"=2,
  "High"=3,
  "N/A (not applicable)"=6,
  "Missing/Unknown"=9,
  "Not available"=-4
), label="DLB clinical syndrome due to DLB pathology")

NACC_FROZEN$NPGENE=labelled_spss(NACC_FROZEN$NPGENE,c(
  "Family history of similar neurodegenerative disorder"=1,
  "Family history of other (dissimilar) neurodegenerative disorder"=2,
  "No family history of similar or dissimilar neurodegenerative disorder"=3,
  "Family history of both similar and dissimilar neurodegenerative disorder"=4,
  "Family history unknown/not available/missing"=9,
  "Not available"=-4
), label="Family history")

NACC_FROZEN$NPFHSPEC=as.character(NACC_FROZEN$NPFHSPEC)
NACC_FROZEN$NPFHSPEC=labelled_spss(NACC_FROZEN$NPFHSPEC,
label="Specify family history")

NACC_FROZEN$NPTAUHAP=labelled_spss(NACC_FROZEN$NPTAUHAP,c(
  "H1, H1"=1,
  "H1, H2"=2,
  "H2, H2"=3,
  "Other polymorphism (e.g., A0)"=4,
  "Missing/Unknown/not assessed"=9,
  "Not available"=-4
), label="Tau haplotype")

NACC_FROZEN$NPPRNP=labelled_spss(NACC_FROZEN$NPPRNP,c(
  "M, M"=1,
  "M, V"=2,
  "V, V"=3,
  "Missing/Unknown/not assessed"=9,
  "Not available"=-4
), label="PRNP codon 129")

NACC_FROZEN$NPCHROM=labelled_spss(NACC_FROZEN$NPCHROM,c(
  "PS1 mutation"=2,
  "PS2 mutation"=3,
  "Tau mutation"=4,
  "Alpha-Synuclein mutation"=5,
  "Parkin mutation"=6,
  "PRNP mutation"=7,
  "Huntingtin mutation"=8,
  "Notch 3 mutation (CADASIL)"=9,
  "Other known genetic mutation (e.g., ABri, neuroserpin)"=10,
  "Down Syndrome"=11,
  "Other chromosomal abnormality"=12,
  "No known genetic or chromosomal abnormality"=13,
  "Not assessed"=50,
  "Missing/unknown"=99,
  "Not available"=-4
), label="Genetic or chromosomal abnormalities")

NACC_FROZEN$NPPNORM=labelled_spss(NACC_FROZEN$NPPNORM,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Normal brain - primary")

NACC_FROZEN$NPCNORM=labelled_spss(NACC_FROZEN$NPCNORM,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Normal brain - contributing")

NACC_FROZEN$NPPADP=labelled_spss(NACC_FROZEN$NPPADP,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="AD pathology present but insufficient for AD diagnosis - primary")

NACC_FROZEN$NPCADP=labelled_spss(NACC_FROZEN$NPCADP,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="AD pathology present but insufficient for AD diagnosis - contributing")

NACC_FROZEN$NPPAD=labelled_spss(NACC_FROZEN$NPPAD,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Alzheimer's disease - primary")

NACC_FROZEN$NPCAD=labelled_spss(NACC_FROZEN$NPCAD,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Alzheimer's disease - contributing")

NACC_FROZEN$NPPLEWY=labelled_spss(NACC_FROZEN$NPPLEWY,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Lewy body disease, with or without AD - primary")

NACC_FROZEN$NPCLEWY=labelled_spss(NACC_FROZEN$NPCLEWY,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Lewy body disease, with or without AD - contributing")

NACC_FROZEN$NPPVASC=labelled_spss(NACC_FROZEN$NPPVASC,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Vascular disease - primary")

NACC_FROZEN$NPCVASC=labelled_spss(NACC_FROZEN$NPCVASC,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Vascular disease - contributing")

NACC_FROZEN$NPPFTLD=labelled_spss(NACC_FROZEN$NPPFTLD,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="FTLD - primary")

NACC_FROZEN$NPCFTLD=labelled_spss(NACC_FROZEN$NPCFTLD,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="FTLD - contributing")

NACC_FROZEN$NPPHIPP=labelled_spss(NACC_FROZEN$NPPHIPP,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Hippocampal sclerosis - primary")

NACC_FROZEN$NPCHIPP=labelled_spss(NACC_FROZEN$NPCHIPP,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Hippocampal sclerosis - contributing")

NACC_FROZEN$NPPPRION=labelled_spss(NACC_FROZEN$NPPPRION,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Prion-associated disease - primary")

NACC_FROZEN$NPCPRION=labelled_spss(NACC_FROZEN$NPCPRION,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Prion-associated disease - contributing")

NACC_FROZEN$NPPOTH1=labelled_spss(NACC_FROZEN$NPPOTH1,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Other primary pathologic diagnosis 1")

NACC_FROZEN$NPCOTH1=labelled_spss(NACC_FROZEN$NPCOTH1,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Other contributing pathologic diagnosis 1")

NACC_FROZEN$NPOTH1X=as.character(NACC_FROZEN$NPOTH1X)
NACC_FROZEN$NPOTH1X=labelled_spss(NACC_FROZEN$NPOTH1X,
label="Other pathologic diagnosis 1 - specify")

NACC_FROZEN$NPPOTH2=labelled_spss(NACC_FROZEN$NPPOTH2,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Other primary pathologic diagnosis 2")

NACC_FROZEN$NPCOTH2=labelled_spss(NACC_FROZEN$NPCOTH2,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Other contributing pathologic diagnosis 2")

NACC_FROZEN$NPOTH2X=as.character(NACC_FROZEN$NPOTH2X)
NACC_FROZEN$NPOTH2X=labelled_spss(NACC_FROZEN$NPOTH2X,
label="Other pathologic diagnosis 2 - specify")

NACC_FROZEN$NPPOTH3=labelled_spss(NACC_FROZEN$NPPOTH3,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Other primary pathologic diagnosis 3")

NACC_FROZEN$NPCOTH3=labelled_spss(NACC_FROZEN$NPCOTH3,c(
  "Yes"=1,
  "No"=2,
  "Not available"=-4
), label="Other contributing pathologic diagnosis 3")

NACC_FROZEN$NPOTH3X=as.character(NACC_FROZEN$NPOTH3X)
NACC_FROZEN$NPOTH3X=labelled_spss(NACC_FROZEN$NPOTH3X,
label="Other pathologic diagnosis 3 - specify")

#-------------------------------------------------------------------------------
### Genetic Data Set
#-------------------------------------------------------------------------------
NACC_FROZEN$NACCAPOE=labelled_spss(NACC_FROZEN$NACCAPOE,c(
  "e3,e3"=1,
  "e3,e4"=2,
  "e3,e2"=3,
  "e4,e4"=4,
  "e4,e2"=5,
  "e2,e2"=6,
  "Missing/ unknown/ not assessed"=9
), label="APOE genotype")

NACC_FROZEN$NACCNE4S=labelled_spss(NACC_FROZEN$NACCNE4S,c(
  "No e4 allele"=0,
  "1 copy of e4 allele"=1,
  "2 copies of e4 allele"=2,
  "Missing/ unknown/ not assessed"=9
), label="Number of APOE e4 alleles")

NACC_FROZEN$ADGCGWAS=labelled_spss(NACC_FROZEN$ADGCGWAS,c(
  "No"=0,
  "Yes"=1
), label="GWAS available from ADGC")

NACC_FROZEN$ADGCRND=labelled_spss(NACC_FROZEN$ADGCRND,label="ADGC data-selection round")

NACC_FROZEN$NACCNCRD=labelled_spss(NACC_FROZEN$NACCNCRD,c(
  "No"=0,
  "Yes"=1
), label="Genetic samples are available from NCRAD")

NACC_FROZEN$ADGCEXOM=labelled_spss(NACC_FROZEN$ADGCEXOM,c(
  "No"=0,
  "Yes"=1
), label="ExomeChip available at ADGC")

NACC_FROZEN$NGDSGWAS=labelled_spss(NACC_FROZEN$NGDSGWAS,c(
  "No"=0,
  "Yes"=1
), label="GWAS available at NIAGADS")

NACC_FROZEN$NGDSEXOM=labelled_spss(NACC_FROZEN$NGDSEXOM,c(
  "No"=0,
  "Yes"=1
), label="ExomeChip available at NIAGADS")

NACC_FROZEN$NGDSWES=labelled_spss(NACC_FROZEN$NGDSWES,c(
  "No"=0,
  "Yes"=1
), label="Whole exome sequencing available at NIAGADS")

NACC_FROZEN$NGDSWGS=labelled_spss(NACC_FROZEN$NGDSWGS,c(
  "No"=0,
  "Yes"=1
), label="Whole genome sequencing available at NIAGADS")

NACC_FROZEN$NGDSGWAC=labelled_spss(NACC_FROZEN$NGDSGWAC,label="NIAGADS GWAS accession number")

NACC_FROZEN$NGDSEXAC=labelled_spss(NACC_FROZEN$NGDSEXAC,label="NIAGADS ExomeChip accession number")

NACC_FROZEN$NGDSWEAC=as.character(NACC_FROZEN$NGDSWEAC)
NACC_FROZEN$NGDSWEAC=labelled_spss(NACC_FROZEN$NGDSWEAC,label="NIAGADS whole exome sequencing accession number")

NACC_FROZEN$NGDSWGAC=as.character(NACC_FROZEN$NGDSWGAC)
NACC_FROZEN$NGDSWGAC=labelled_spss(NACC_FROZEN$NGDSWGAC,label="NIAGADS whole genome sequencing accession number")

NACC_FROZEN$ADGCEXR=labelled_spss(NACC_FROZEN$ADGCEXR,label="ExomeChip genotyping round")


################################################################################
########################## NACC Supplemental Data ##############################
################################################################################
#-------------------------------------------------------------------------------
### APET (supplemental csv)
#-------------------------------------------------------------------------------
#Read in Data
NACC_APET=read.csv("1FL APET.csv")

#Add data labels

#Code Factors

#-------------------------------------------------------------------------------
### MRI (supplemental csv)
#-------------------------------------------------------------------------------
#Read in Data
NACC_MRI=read.csv("1FL MRI.csv")

#Add data labels

#Code Factors


################################################################################
####################### 1FL Specific Data (RedCap) #############################
################################################################################
#-------------------------------------------------------------------------------
### FL4 Modified CDR Rating Scale
#-------------------------------------------------------------------------------
#Read in Data
MCDR=read.csv('1FL mCDR.csv',na.strings=c("","NA","na"))

#Coalesce English and Spanish Variables
library(dplyr)
MCDR_coalesced=data.frame(
  #not included in Spanish RedCap form (English only)
  FL4_EXAMINARe=MCDR$fl4_examinar,
  FL4_VISITe=MCDR$fl4_visit,
  FL4_DATEe=MCDR$fl4_date,
  FL4_5A_GARBAGEe=MCDR$fl4_5a_garbage,
  FL4_5b_COFFEEe=MCDR$fl4_5b_coffee,
  #not included in English RedCap form (Spanish only)
  FL4_5ab_SIMPLEs=MCDR$fl4s_5a_simple,
  #Included in both forms
  FL4_A_SOURCE=coalesce(MCDR$fl4_a_source,MCDR$fl4s_a_source),
  FL4_B_INFRAT=coalesce(MCDR$fl4_b_infrat,MCDR$fl4s_b_infrat),
  FL4_1A_EVENTS=coalesce(MCDR$fl4_1a_events,MCDR$fl4s_1a_events),
  FL4_1B_TASKS=coalesce(MCDR$fl4_1b_tasks,MCDR$fl4s_1b_tasks),
  FL4_1C_NAMES=coalesce(MCDR$fl4_1c_names,MCDR$fl4s_1c_names),
  FL4_1D_WORDS=coalesce(MCDR$fl4_1d_words,MCDR$fl4s_1d_words),
  FL4_1E_POSSESS=coalesce(MCDR$fl4_1e_possess,MCDR$fl4s_1e_possess),
  FL4_1F_RESPONSIB=coalesce(MCDR$fl4_1f_responsib,MCDR$fl4s_1f_responsib),
  FL4_1_MEAN=coalesce(MCDR$fl4_1_mean,MCDR$fl4s_1_mean),
  FL4_2A_EVENTS=coalesce(MCDR$fl4_2a_events,MCDR$fl4s_2a_events),
  FL4_2B_WITHIN=coalesce(MCDR$fl4_2b_within,MCDR$fl4s_2b_within),
  FL4_2C_OUTSIDE=coalesce(MCDR$fl4_2c_outside,MCDR$fl4s_2c_outside),
  FL4_2D_DAY=coalesce(MCDR$fl4_2d_day,MCDR$fl4s_2d_day),
  FL4_2E_MONTH=coalesce(MCDR$fl4_2e_month,MCDR$fl4s_2e_month),
  FL4_2F_YEAR=coalesce(MCDR$fl4_2f_year,MCDR$fl4s_2f_year),
  FL4_2_MEAN=coalesce(MCDR$fl4_2_mean,MCDR$fl4s_2_mean),
  FL4_3A_RECOGNIZE_ERR=coalesce(MCDR$fl4_3a_recognize_err,MCDR$fl4s_3a_recognize_err),
  FL4_3B_SHOW_CAUTION=coalesce(MCDR$fl4_3b_show_caution,MCDR$fl4s_3b_show_caution),
  FL4_3C_PLAN_ERRAND=coalesce(MCDR$fl4_3c_plan_errand,MCDR$fl4s_3c_plan_errand),
  FL4_3D_MAKE_CHANGE=coalesce(MCDR$fl4_3d_make_change,MCDR$fl4s_3d_make_change),
  FL4_3E_HANDLE_FIN=coalesce(MCDR$fl4_3e_handle_fin,MCDR$fl4s_3e_handle_fin),
  FL4_3F_JUDGE_GROCERY=coalesce(MCDR$fl4_3f_judge_grocery,MCDR$fl4s_3f_judge_grocery),
  FL4_3_MEAN=coalesce(MCDR$fl4_3_mean,MCDR$fl4s_3_mean),
  FL4_4A_SELF_MOTIV=coalesce(MCDR$fl4_4a_self_motiv,MCDR$fl4s_4a_self_motiv),
  FL4_4B_PERSONAL_HYG=coalesce(MCDR$fl4_4b_personal_hyg,MCDR$fl4s_4b_personal_hyg),
  FL4_4C_ACT_IMPULSIV=coalesce(MCDR$fl4_4c_act_impulsiv,MCDR$fl4s_4c_act_impulsiv),
  FL4_4D_FAILED_EVENTS=coalesce(MCDR$fl4_4d_failed_events,MCDR$fl4s_4d_failed_events),
  FL4_4E_PEOPLE_FEEL=coalesce(MCDR$fl4_4e_people_feel,MCDR$fl4s_4e_people_feel),
  FL4_4F_REACT_AS_BEFORE=coalesce(MCDR$fl4_4f_react_as_before,MCDR$fl4s_4f_react_as_before),
  FL4_4_MEAN=coalesce(MCDR$fl4_4_mean,MCDR$fl4s_4_mean),
  FL4_5C_COMPLEX=coalesce(MCDR$fl4_5c_complex,MCDR$fl4s_5b_complex),
  FL4_5D_NON_ROUTINE=coalesce(MCDR$fl4_5d_non_routine,MCDR$fl4s_5c_non_routine),
  FL4_5E_TV_PROGRAMS=coalesce(MCDR$fl4_5e_tv_programs,MCDR$fl4s_5d_tv),
  FL4_5F_CROSSWORD=coalesce(MCDR$fl4_5f_crossword,MCDR$fl4s_5e_crossword),
  FL4_5_MEAN=coalesce(MCDR$fl4_5_mean,MCDR$fl4s_5_mean),
  FL4_6A_URINE=coalesce(MCDR$fl4_6a_urine,MCDR$fl4s_6a_urine),
  FL4_6B_BOWELS=coalesce(MCDR$fl4_6b_bowels,MCDR$fl4s_6b_bowels),
  FL4_6C_CLOTHES=coalesce(MCDR$fl4_6c_clothes,MCDR$fl4s_6c_clothes),
  FL4_6D_SHOWER=coalesce(MCDR$fl4_6d_shower,MCDR$fl4s_6d_shower),
  FL4_6E_GROOM=coalesce(MCDR$fl4_6e_groom,MCDR$fl4s_6e_groom),
  FL4_6F_UTENSILS=coalesce(MCDR$fl4_6f_utensils,MCDR$fl4s_6f_utensils),
  FL4_6_MEAN=coalesce(MCDR$fl4_6_mean,MCDR$fl4s_6_mean),
  FL4_1_MAX=coalesce(MCDR$fl4_1_max,MCDR$fl4s_1_max),
  FL4_2_MAX=coalesce(MCDR$fl4_2_max,MCDR$fl4s_2_max),
  FL4_3_MAX=coalesce(MCDR$fl4_3_max,MCDR$fl4s_3_max),
  FL4_4_MAX=coalesce(MCDR$fl4_4_max,MCDR$fl4s_4_max),
  FL4_5_MAX=coalesce(MCDR$fl4_5_max,MCDR$fl4s_5_max),
  FL4_6_MAX=coalesce(MCDR$fl4_6_max,MCDR$fl4s_6_max),
  FL4_SUM_OF_MEANS=coalesce(MCDR$fl4_sum_of_means,MCDR$fl4s_sum_of_means),
  FL4_SUM_OF_MAX=coalesce(MCDR$fl4_sum_of_max,MCDR$fl4s_sum_of_max),
  FL4_MEAN_OF_MEANS=coalesce(MCDR$fl4_mean_of_means,MCDR$fl4s_mean_of_means),
  FL4_MEAN_OF_MAX=coalesce(MCDR$fl4_mean_of_max,MCDR$fl4s_mean_of_max)
    )
#Remove rows with all missing values
del=rowSums(is.na(MCDR_coalesced)) == ncol(MCDR_coalesced)
MCDR_coalesced=cbind(del,MCDR$ptid,MCDR$visitnum,MCDR_coalesced)
MCDR_coalesced=MCDR_coalesced[!MCDR_coalesced$del,]
MCDR_coalesced=MCDR_coalesced[2:61]
rm(del)

#write sav
library(haven)
write_sav(MCDR_coalesced, "1FL mCDR.sav")

#-------------------------------------------------------------------------------
### FL9 Neuropsychology Battery
#-------------------------------------------------------------------------------
#Read in Data
NeuroPsych=read.csv('1FL Neuropsych.csv',na.strings=c("","NA","na","996","997","998","999"))

#Coalesce English and Spanish Variables
library(dplyr)
NeuroPsych_coalesced=data.frame(
  B_EXAMINAR=coalesce(NeuroPsych$fl9_b_examinar,NeuroPsych$fl9s_b_examinar),
  C_VISIT=coalesce(NeuroPsych$fl9_c_visit,NeuroPsych$fl9s_c_visit),
  D_DATE=coalesce(NeuroPsych$fl9_d_date,NeuroPsych$fl9s_d_date),
  E_SITE=coalesce(NeuroPsych$fl9_e_site,NeuroPsych$fl9s_e_site),
  
  
  
  
  
  
  
  
  
  
  MMSE_A_ORIENTATION=coalesce(NeuroPsych$fl9_mmse_a_orientation,NeuroPsych$fl9s_mmse_a_orientation),
  MMSE_B_3WORD=coalesce(NeuroPsych$fl9_mmse_b_3word,NeuroPsych$fl9s_mmse_b_3word),
  MMSE_C_TOTAL=coalesce(NeuroPsych$fl9_mmse_c_total,NeuroPsych$fl9s_mmse_c_total),
  MMSE_D_SERIAL=coalesce(NeuroPsych$fl9_mmse_d_serial,NeuroPsych$fl9s_mmse_d_serial),
  
  
  
  
  
  
  NACC_A_IMMEDIATE=coalesce(NeuroPsych$fl9_nacc_a_immediate,NeuroPsych$fl9s_nacc_a_immediate),
  NACC_B_DELAYED=coalesce(NeuroPsych$fl9_nacc_b_delayed,NeuroPsych$fl9s_nacc_b_delayed),
  BVMT_A_TRAIL1=coalesce(NeuroPsych$fl9_bvmt_a_trail1,NeuroPsych$fl9s_bvmt_a_trial1),
  BVMT_B_TRAIL2=coalesce(NeuroPsych$fl9_bvmt_b_trail2,NeuroPsych$fl9s_bvmt_b_trial2),
  BVMT_C_TRAIL3=coalesce(NeuroPsych$fl9_bvmt_c_trail3,NeuroPsych$fl9s_bvmt_c_trial3),
  BVMT_D_TOTAL=coalesce(NeuroPsych$fl9_bvmt_d_total,NeuroPsych$fl9s_bvmt_d_total),
  BVMT_E_LEARNING=coalesce(NeuroPsych$fl9_bvmt_e_learning,NeuroPsych$fl9s_bvmt_e_learning),
  BVMT_F_DELAY=coalesce(NeuroPsych$fl9_bvmt_f_delay,NeuroPsych$fl9s_bvmt_f_delay),
  BVMT_G_PERCENT=coalesce(NeuroPsych$fl9_bvmt_g_percent,NeuroPsych$fl9s_bvmt_g_percent),
  HVLT_A_TOTAL=coalesce(NeuroPsych$fl9_hvlt_a_total,NeuroPsych$fl9s_hvlt_a_total),
  HVLT_B_DELAYED=coalesce(NeuroPsych$fl9_hvlt_b_delayed,NeuroPsych$fl9s_hvlt_b_delayed),
  HVLT_C_RETENTION=coalesce(NeuroPsych$fl9_hvlt_c_retention,NeuroPsych$fl9s_hvlt_c_retention),
  LASSI_ARECALL1_RAW=coalesce(NeuroPsych$fl9_lassi_arecall1_raw,NeuroPsych$fl9s_lassi_arecall1_raw),
  LASSI_ARECALL1_NO=coalesce(NeuroPsych$fl9_lassi_arecall1_no,NeuroPsych$fl9s_lassi_arecall1_no),
  LASSI_ACUED1_RAW=coalesce(NeuroPsych$fl9_lassi_acued1_raw,NeuroPsych$fl9s_lassi_acued1_raw),
  LASSI_ACUED1_NO=coalesce(NeuroPsych$fl9_lassi_acued1_no,NeuroPsych$fl9s_lassi_acued1_no),
  LASSI_ACUED2_RAW=coalesce(NeuroPsych$fl9_lassi_acued2_raw,NeuroPsych$fl9s_lassi_acued2_raw),
  LASSI_ACUED2_NO=coalesce(NeuroPsych$fl9_lassi_acued2_no,NeuroPsych$fl9s_lassi_acued2_no),
  LASSI_BRECALL1_RAW=coalesce(NeuroPsych$fl9_lassi_brecall1_raw,NeuroPsych$fl9s_lassi_brecall1_raw),
  LASSI_BRECALL1_NO=coalesce(NeuroPsych$fl9_lassi_brecall1_no,NeuroPsych$fl9s_lassi_brecall1_no),
  LASSI_BCUED1_RAW=coalesce(NeuroPsych$fl9_lassi_bcued1_raw,NeuroPsych$fl9s_lassi_bcued1_raw),
  LASSI_BCUED1_NO=coalesce(NeuroPsych$fl9_lassi_bcued1_no,NeuroPsych$fl9s_lassi_bcued1_no),
  LASSI_BCUED2_RAW=coalesce(NeuroPsych$fl9_lassi_bcued2_raw,NeuroPsych$fl9s_lassi_bcued2_raw),
  LASSI_BCUED2_NO=coalesce(NeuroPsych$fl9_lassi_bcued2_no,NeuroPsych$fl9s_lassi_bcued2_no),
  LASSI_ARECALL2_RAW=coalesce(NeuroPsych$fl9_lassi_arecall2_raw,NeuroPsych$fl9s_lassi_arecall2_raw),
  LASSI_ARECALL2_NO=coalesce(NeuroPsych$fl9_lassi_arecall2_no,NeuroPsych$fl9s_lassi_arecall2_no),
  LASSI_ACUED3_RAW=coalesce(NeuroPsych$fl9_lassi_acued3_raw,NeuroPsych$fl9s_lassi_acued3_raw),
  LASSI_ACUED3_NO=coalesce(NeuroPsych$fl9_lassi_acued3_no,NeuroPsych$fl9s_lassi_acued3_no),
  LASSI_DELAYED_RAW=coalesce(NeuroPsych$fl9_lassi_delayed_raw,NeuroPsych$fl9s_lassi_delayed_raw),
  LASSI_DELAYED_NO=coalesce(NeuroPsych$fl9_lassi_delayed_no,NeuroPsych$fl9s_lassi_delayed_no),
  VISUAL_SAMPLE_MS=coalesce(NeuroPsych$fl9_visual_sample_ms,NeuroPsych$fl9s_visual_sample_ms),
  VISUAL_SAMPLE_PROP=coalesce(NeuroPsych$fl9_visual_sample_prop,NeuroPsych$fl9s_visual_sample_prop),
  VISUAL_SHAPES_MS=coalesce(NeuroPsych$fl9_visual_shapes_ms,NeuroPsych$fl9s_visual_shapes_ms),
  VISUAL_SHAPES_PROP=coalesce(NeuroPsych$fl9_visual_shapes_prop,NeuroPsych$fl9s_visual_shapes_prop),
  VISUAL_COLOR_MS=coalesce(NeuroPsych$fl9_visual_color_ms,NeuroPsych$fl9s_visual_color_ms),
  VISUAL_COLOR_PROP=coalesce(NeuroPsych$fl9_visual_color_prop,NeuroPsych$fl9s_visual_color_prop),
  
  TRAILS_A_RAW=coalesce(NeuroPsych$fl9_trails_a_raw,NeuroPsych$fl9s_trials_a_raw),
  TRAILS_A_ERRORS=coalesce(NeuroPsych$fl9_trails_a_errors,NeuroPsych$fl9s_trials_a_errors),
  TRAILS_B_RAW=coalesce(NeuroPsych$fl9_trails_b_raw,NeuroPsych$fl9s_trials_b_raw),
  TRAILS_B_ERRORS=coalesce(NeuroPsych$fl9_trails_b_errors,NeuroPsych$fl9s_trials_b_errors),
  NAB=coalesce(NeuroPsych$fl9_nab,NeuroPsych$fl9s_nab),
  NACC=coalesce(NeuroPsych$fl9_nacc,NeuroPsych$fl9s_nacc),
  STROOP_WORD=coalesce(NeuroPsych$fl9_stroop_word,NeuroPsych$fl9s_stroop_word),
  
  STROOP_COLOR=coalesce(NeuroPsych$fl9_stroop_color,NeuroPsych$fl9s_stroop_color),
  
  STROOP_CW=coalesce(NeuroPsych$fl9_stroop_cw,NeuroPsych$fl9s_stroop_cw),
  
  STROOP_INTER=coalesce(NeuroPsych$fl9_stroop_inter,NeuroPsych$fl9s_stroop_inter),
  WAIS=coalesce(NeuroPsych$fl9_wais,NeuroPsych$fl9s_wais),
  COWAT_F=coalesce(NeuroPsych$fl9_cowat_f,NeuroPsych$fl9s_cowat_f),
  COWAT_A=coalesce(NeuroPsych$fl9_cowat_a,NeuroPsych$fl9s_cowat_a),
  COWAT_S=coalesce(NeuroPsych$fl9_cowat_s,NeuroPsych$fl9s_cowat_s),
  COWAT_ANIMALS=coalesce(NeuroPsych$fl9_cowat_animals,NeuroPsych$fl9s_cowat_animals),
  COWAT_FRUITS=coalesce(NeuroPsych$fl9_cowat_fruits,NeuroPsych$fl9s_cowat_fruits),
  COWAT_VEG=coalesce(NeuroPsych$fl9_cowat_veg,NeuroPsych$fl9s_cowat_veg),
  GDS=coalesce(NeuroPsych$fl9_gds,NeuroPsych$fl9s_gds),
  ADCS_TOTAL=coalesce(NeuroPsych$fl9_adcs_total,NeuroPsych$fl9s_adcs_total),
  ADCS_DONT=coalesce(NeuroPsych$fl9_adcs_dont,NeuroPsych$fl9s_adcs_dont),
  
  ANXIETY=coalesce(NeuroPsych$fl9_anxiety,NeuroPsych$fl9s_anxiety),
  APATHY=coalesce(NeuroPsych$fl9_apathy,NeuroPsych$fl9s_apathy),
  VT_1_PATH=coalesce(NeuroPsych$fl9_vt_1_path,NeuroPsych$fl9s_vt_1_path),
  VT_1_TIME=coalesce(NeuroPsych$fl9_vt_1_time,NeuroPsych$fl9s_vt_1_time),
  VT_2_PATH=coalesce(NeuroPsych$fl9_vt_2_path,NeuroPsych$fl9s_vt_2_path),
  VT_2_TIME=coalesce(NeuroPsych$fl9_vt_2_time,NeuroPsych$fl9s_vt_2_time),
  VT_3_PATH=coalesce(NeuroPsych$fl9_vt_3_path,NeuroPsych$fl9s_vt_3_path),
  VT_3_TIME=coalesce(NeuroPsych$fl9_vt_3_time,NeuroPsych$fl9s_vt_3_time),
  VT_4_PATH=coalesce(NeuroPsych$fl9_vt_4_path,NeuroPsych$fl9s_vt_4_path),
  VT_4_TIME=coalesce(NeuroPsych$fl9_vt_4_time,NeuroPsych$fl9s_vt_4_time),
  IVT_1_1_TARGET=coalesce(NeuroPsych$fl9_ivt_1_1_target,NeuroPsych$fl9s_ivt_1_1_target),
  IVT_1_1_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_1_total,NeuroPsych$fl9s_ivt_1_1_total),
  IVT_1_1_PATH=coalesce(NeuroPsych$fl9_ivt_1_1_path,NeuroPsych$fl9s_ivt_1_1_path),
  IVT_1_1_TIME=coalesce(NeuroPsych$fl9_ivt_1_1_time,NeuroPsych$fl9s_ivt_1_1_time),
  IVT_1_1_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_1_qaudrant,NeuroPsych$fl9s_ivt_1_1_qaudrant),
  IVT_1_2_TARGET=coalesce(NeuroPsych$fl9_ivt_1_2_target,NeuroPsych$fl9s_ivt_1_2_target),
  IVT_1_2_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_2_total,NeuroPsych$fl9s_ivt_1_2_total),
  IVT_1_2_PATH=coalesce(NeuroPsych$fl9_ivt_1_2_path,NeuroPsych$fl9s_ivt_1_2_path),
  IVT_1_2_TIME=coalesce(NeuroPsych$fl9_ivt_1_2_time,NeuroPsych$fl9s_ivt_1_2_time),
  IVT_1_2_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_2_qaudrant,NeuroPsych$fl9s_ivt_1_2_qaudrant),
  IVT_1_3_TARGET=coalesce(NeuroPsych$fl9_ivt_1_3_target,NeuroPsych$fl9s_ivt_1_3_target),
  IVT_1_3_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_3_total,NeuroPsych$fl9s_ivt_1_3_total),
  IVT_1_3_PATH=coalesce(NeuroPsych$fl9_ivt_1_3_path,NeuroPsych$fl9s_ivt_1_3_path),
  IVT_1_3_TIME=coalesce(NeuroPsych$fl9_ivt_1_3_time,NeuroPsych$fl9s_ivt_1_3_time),
  IVT_1_3_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_3_qaudrant,NeuroPsych$fl9s_ivt_1_3_qaudrant),
  IVT_1_4_TARGET=coalesce(NeuroPsych$fl9_ivt_1_4_target,NeuroPsych$fl9s_ivt_1_4_target),
  IVT_1_4_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_4_total,NeuroPsych$fl9s_ivt_1_4_total),
  IVT_1_4_PATH=coalesce(NeuroPsych$fl9_ivt_1_4_path,NeuroPsych$fl9s_ivt_1_4_path),
  IVT_1_4_TIME=coalesce(NeuroPsych$fl9_ivt_1_4_time,NeuroPsych$fl9s_ivt_1_4_time),
  IVT_1_4_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_4_qaudrant,NeuroPsych$fl9s_ivt_1_4_qaudrant),
  IVT_1_5_TARGET=coalesce(NeuroPsych$fl9_ivt_1_5_target,NeuroPsych$fl9s_ivt_1_5_target),
  IVT_1_5_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_5_total,NeuroPsych$fl9s_ivt_1_5_total),
  IVT_1_5_PATH=coalesce(NeuroPsych$fl9_ivt_1_5_path,NeuroPsych$fl9s_ivt_1_5_path),
  IVT_1_5_TIME=coalesce(NeuroPsych$fl9_ivt_1_5_time,NeuroPsych$fl9s_ivt_1_5_time),
  IVT_1_5_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_5_qaudrant,NeuroPsych$fl9s_ivt_1_5_qaudrant),
  IVT_1_6_TARGET=coalesce(NeuroPsych$fl9_ivt_1_6_target,NeuroPsych$fl9s_ivt_1_6_target),
  IVT_1_6_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_6_total,NeuroPsych$fl9s_ivt_1_6_total),
  IVT_1_6_PATH=coalesce(NeuroPsych$fl9_ivt_1_6_path,NeuroPsych$fl9s_ivt_1_6_path),
  IVT_1_6_TIME=coalesce(NeuroPsych$fl9_ivt_1_6_time,NeuroPsych$fl9s_ivt_1_6_time),
  IVT_1_6_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_6_qaudrant,NeuroPsych$fl9s_ivt_1_6_qaudrant),
  IVT_1_7_TARGET=coalesce(NeuroPsych$fl9_ivt_1_7_target,NeuroPsych$fl9s_ivt_1_7_target),
  IVT_1_7_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_7_total,NeuroPsych$fl9s_ivt_1_7_total),
  IVT_1_7_PATH=coalesce(NeuroPsych$fl9_ivt_1_7_path,NeuroPsych$fl9s_ivt_1_7_path),
  IVT_1_7_TIME=coalesce(NeuroPsych$fl9_ivt_1_7_time,NeuroPsych$fl9s_ivt_1_7_time),
  IVT_1_7_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_7_qaudrant,NeuroPsych$fl9s_ivt_1_7_qaudrant),
  IVT_1_8_TARGET=coalesce(NeuroPsych$fl9_ivt_1_8_target,NeuroPsych$fl9s_ivt_1_8_target),
  IVT_1_8_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_8_total,NeuroPsych$fl9s_ivt_1_8_total),
  IVT_1_8_PATH=coalesce(NeuroPsych$fl9_ivt_1_8_path,NeuroPsych$fl9s_ivt_1_8_path),
  IVT_1_8_TIME=coalesce(NeuroPsych$fl9_ivt_1_8_time,NeuroPsych$fl9s_ivt_1_8_time),
  IVT_1_8_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_8_qaudrant,NeuroPsych$fl9s_ivt_1_8_qaudrant),
  
  IVT_1_9_TOTAL=coalesce(NeuroPsych$fl9_ivt_1_9_total,NeuroPsych$fl9s_ivt_1_9_total),
  
  
  IVT_1_9_QAUDRANT=coalesce(NeuroPsych$fl9_ivt_1_9_qaudrant,NeuroPsych$fl9s_ivt_1_9_qaudrant),
  IVT_2_1_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_1_search,NeuroPsych$fl9s_ivt_2_1_search),
  IVT_2_1_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_1_comments,NeuroPsych$fl9s_ivt_2_1_comments),
  IVT_2_2_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_2_search,NeuroPsych$fl9s_ivt_2_2_search),
  IVT_2_2_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_2_comments,NeuroPsych$fl9s_ivt_2_2_comments),
  IVT_2_3_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_3_search,NeuroPsych$fl9s_ivt_2_3_search),
  IVT_2_3_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_3_comments,NeuroPsych$fl9s_ivt_2_3_comments),
  IVT_2_4_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_4_search,NeuroPsych$fl9s_ivt_2_4_search),
  IVT_2_4_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_4_comments,NeuroPsych$fl9s_ivt_2_4_comments),
  IVT_2_5_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_5_search,NeuroPsych$fl9s_ivt_2_5_search),
  IVT_2_5_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_5_comments,NeuroPsych$fl9s_ivt_2_5_comments),
  IVT_2_6_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_6_search,NeuroPsych$fl9s_ivt_2_6_search),
  IVT_2_6_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_6_comments,NeuroPsych$fl9s_ivt_2_6_comments),
  IVT_2_7_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_7_search,NeuroPsych$fl9s_ivt_2_7_search),
  IVT_2_7_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_7_comments,NeuroPsych$fl9s_ivt_2_7_comments),
  IVT_2_8_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_8_search,NeuroPsych$fl9s_ivt_2_8_search),
  IVT_2_8_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_8_comments,NeuroPsych$fl9s_ivt_2_8_comments),
  IVT_2_9_SEARCH=coalesce(NeuroPsych$fl9_ivt_2_9_search,NeuroPsych$fl9s_ivt_2_9_search),
  IVT_2_9_COMMENTS=coalesce(NeuroPsych$fl9_ivt_2_9_comments,NeuroPsych$fl9s_ivt_2_9_comments),
  OPTIONAL_BNT=coalesce(NeuroPsych$fl9_optional_bnt,NeuroPsych$fl9s_optional_bnt),
  OPTIONAL_FLUENCY=coalesce(NeuroPsych$fl9_optional_fluency,NeuroPsych$fl9s_optional_fluency),
  OPTIONAL_FORWARDS=coalesce(NeuroPsych$fl9_optional_forwards,NeuroPsych$fl9s_optional_forwards),
  OPTIONAL_BACKWARDS=coalesce(NeuroPsych$fl9_optional_backwards,NeuroPsych$fl9s_optional_backwards),
  MITSI_A_ASOC1_RAW=coalesce(NeuroPsych$fl9_mitsi_a_asoc1_raw,NeuroPsych$fl9s_mitsi_a_asoc1_raw),
  MITSI_A_ASOC1_MS=coalesce(NeuroPsych$fl9_mitsi_a_asoc1_ms,NeuroPsych$fl9s_mitsi_a_asoc1_ms),
  MITSI_A_ASOC1_NO=coalesce(NeuroPsych$fl9_mitsi_a_asoc1_no,NeuroPsych$fl9s_mitsi_a_asoc1_no),
  MITSI_A_ASOC2_RAW=coalesce(NeuroPsych$fl9_mitsi_a_asoc2_raw,NeuroPsych$fl9s_mitsi_a_asoc2_raw),
  MITSI_A_ASOC2_MS=coalesce(NeuroPsych$fl9_mitsi_a_asoc2_ms,NeuroPsych$fl9s_mitsi_a_asoc2_ms),
  MITSI_A_ASOC2_NO=coalesce(NeuroPsych$fl9_mitsi_a_asoc2_no,NeuroPsych$fl9s_mitsi_a_asoc2_no),
  MITSI_B_ASOC1_RAW=coalesce(NeuroPsych$fl9_mitsi_b_asoc1_raw,NeuroPsych$fl9s_mitsi_b_asoc1_raw),
  MITSI_B_ASOC1_MS=coalesce(NeuroPsych$fl9_mitsi_b_asoc1_ms,NeuroPsych$fl9s_mitsi_b_asoc1_ms),
  MITSI_B_ASOC1_NO=coalesce(NeuroPsych$fl9_mitsi_b_asoc1_no,NeuroPsych$fl9s_mitsi_b_asoc1_no),
  MITSI_B_ASOC2_RAW=coalesce(NeuroPsych$fl9_mitsi_b_asoc2_raw,NeuroPsych$fl9s_mitsi_b_asoc2_raw),
  MITSI_B_ASOC2_MS=coalesce(NeuroPsych$fl9_mitsi_b_asoc2_ms,NeuroPsych$fl9s_mitsi_b_asoc2_ms),
  MITSI_B_ASOC2_NO=coalesce(NeuroPsych$fl9_mitsi_b_asoc2_no,NeuroPsych$fl9s_mitsi_b_asoc2_no),
  MITSI_A_SHORT_RAW=coalesce(NeuroPsych$fl9_mitsi_a_short_raw,NeuroPsych$fl9s_mitsi_a_short_raw),
  MITSI_A_SHORT_MS=coalesce(NeuroPsych$fl9_mitsi_a_short_ms,NeuroPsych$fl9s_mitsi_a_short_ms),
  MITSI_A_SHORT_NO=coalesce(NeuroPsych$fl9_mitsi_a_short_no,NeuroPsych$fl9s_mitsi_a_short_no),
  MITSI_A_LONG_RAW=coalesce(NeuroPsych$fl9_mitsi_a_long_raw,NeuroPsych$fl9s_mitsi_a_long_raw),
  MITSI_A_LONG_MS=coalesce(NeuroPsych$fl9_mitsi_a_long_ms,NeuroPsych$fl9s_mitsi_a_long_ms),
  MITSI_A_LONG_NO=coalesce(NeuroPsych$fl9_mitsi_a_long_no,NeuroPsych$fl9s_mitsi_a_long_no)
  )

#Remove rows with all missing values
del=rowSums(is.na(NeuroPsych_coalesced)) == ncol(NeuroPsych_coalesced)
NeuroPsych_coalesced=cbind(del,NeuroPsych$ptid,NeuroPsych$visitnum,NeuroPsych_coalesced)
NeuroPsych_coalesced=NeuroPsych_coalesced[!NeuroPsych_coalesced$del,]
NeuroPsych_coalesced=NeuroPsych_coalesced[2:159]
rm(del)

#write sav
library(haven)
write_sav(NeuroPsych_coalesced, "neuropsych.sav")
#-------------------------------------------------------------------------------
### FL10 ORDT and OPAT Battery
#-------------------------------------------------------------------------------
#ORDT
  #Read in Data
  ORDT=read.csv('1FL ORDT.csv',na.strings=c("","NA","na","999"))
  
  #Remove rows with all missing values
  del=rowSums(is.na(ORDT[,4:15])) == ncol(ORDT[,4:15])
  ORDT=cbind(del,ORDT)
  ORDT=ORDT[!ORDT$del,]
  ORDT=ORDT[2:16]
  rm(del)
  
  write_sav(ORDT,"1FL ORDT.sav")

#OPAT
  #No OPAT data was ever entered into RedCap, and it is not currently in use
#-------------------------------------------------------------------------------
### SUVR
#-------------------------------------------------------------------------------
#Read in Data
SUVR=read.csv('1FL SUVR.csv',na.strings=c("","NA","na","999"))

#Remove rows with all missing values
del=rowSums(is.na(SUVR[,4:285])) == ncol(SUVR[,4:285])
SUVR=cbind(del,SUVR)
SUVR=SUVR[!SUVR$del,]
SUVR=SUVR[2:286]
rm(del)

write_sav(SUVR,"SUVR.sav")

#-------------------------------------------------------------------------------
### MRI Features
#-------------------------------------------------------------------------------
#Read in Data
MRI_Features=read.csv('1FL MRI Features.csv',na.strings=c("","NA","na","999"))

#Remove rows with all missing values
del=rowSums(is.na(MRI_Features[,4:50])) == ncol(MRI_Features[,4:50])
MRI_Features=cbind(del,MRI_Features)
MRI_Features=MRI_Features[!MRI_Features$del,]
MRI_Features=MRI_Features[2:51]
rm(del)

write_sav(MRI_Features,"1FL MRI Features.sav")

#-------------------------------------------------------------------------------
### RedCap Imaging Inventory
#-------------------------------------------------------------------------------
#Read in Data
Imaging_Inventory=read.csv("RedCap Imaging Inventory.csv")

#Add data labels

#Code Factors
#-------------------------------------------------------------------------------
### NACC Supplement
#-------------------------------------------------------------------------------

################################################################################
############################# Output Datasets ##################################
################################################################################
library(haven)
#SPSS
  #1
  write_sav(NACC_FROZEN,"Analytical Dataset.sav")
  
  #2
  #Open in SPSS and run Missing Value script

#For other formats
  #1
  #Read in SPSS dataset to change all labeled missing values to system missing
  Analytical=read_sav("Analytical Dataset.sav")
  
  #2
  #write second version with all missing values changed to system missing
  write_sav(Analytical,"Analytical Dataset (non-specific missing vals).sav")
  
  #3
  #open Analytical Dataset2.sav in SPSS and use "save as" to save in the desired format

################################################################################
################################### API ########################################
################################################################################
devtools::install_github(repo = "OuhscBbmc/REDCapR")
library(REDCapR)
redcap_read(redcap_uri = "https://redcap.ctsi.ufl.edu/redcap/api/", 
            token = "A18D4CE607D2A26CF17246F02E76ABA8")$outcome_messages

################################################################################
############################ Redundancy Check ##################################
################################################################################
RedundantUDS=data.frame(PTID=Analytical$PTID,VISITNUM=Analytical$VISITNUM,
                        Analytical$NACCMMSE,Analytical$LOGIMEM,Analytical$MEMUNITS,
                        Analytical$TRAILA,Analytical$TRAILARR,Analytical$TRAILB,
                        Analytical$TRAILBRR,Analytical$WAIS,Analytical$ANIMALS,
                        Analytical$VEG,Analytical$NACCGDS,Analytical$BOSTON,
                        Analytical$UDSVERTN,Analytical$DIGIF,Analytical$DIGFORCT,
                        Analytical$DIGIB,Analytical$DIGBACCT,Analytical$UDSVERFC)

Redundant1FL=data.frame(PTID=NeuroPsych_coalesced$`NeuroPsych$ptid`,
                        VISITNUM=NeuroPsych_coalesced$`NeuroPsych$visitnum`,
                        NeuroPsych_coalesced$MMSE_C_TOTAL,NeuroPsych_coalesced$NACC_A_IMMEDIATE,
                        NeuroPsych_coalesced$NACC_B_DELAYED,NeuroPsych_coalesced$TRAILS_A_RAW,
                        NeuroPsych_coalesced$TRAILS_A_ERRORS,NeuroPsych_coalesced$TRAILS_B_RAW,
                        NeuroPsych_coalesced$TRAILS_B_ERRORS,NeuroPsych_coalesced$NACC,
                        NeuroPsych_coalesced$COWAT_ANIMALS,NeuroPsych_coalesced$COWAT_VEG,
                        NeuroPsych_coalesced$GDS,NeuroPsych_coalesced$OPTIONAL_BNT,
                        NeuroPsych_coalesced$OPTIONAL_FLUENCY,
                        NeuroPsych_coalesced$OPTIONAL_FORWARDS,
                        NeuroPsych_coalesced$OPTIONAL_BACKWARDS,
                        NeuroPsych_coalesced$COWAT_F)

Redundant=merge(RedundantUDS,Redundant1FL,by=c("PTID","VISITNUM"),all=TRUE)

#save
library(haven)
write_sav(Redundant,"Redundant Vars.sav")
write.csv(Redundant,"Redundant Vars2.csv",na = "")

#Longitudinal project
longit=data.frame(NACC_FROZEN$PTID,NACC_FROZEN$VISITNUM,NACC_FROZEN$NACCFDYS,
                  NACC_FROZEN$TRAILA,NACC_FROZEN$TRAILB,NACC_FROZEN$NACCAGEB,
                  NACC_FROZEN$EDUC,NACC_FROZEN$SEX,NACC_FROZEN$NACCNINR,
                  NACC_FROZEN$NACCETPR,NACC_FROZEN$NACCAHTN)

colnames(longit)=c("PTID","VISITNUM","NACCFDYS","TRAILA","TRAILB","NACCAGEB",
                   "EDUC","SEX","NACCNINR","NACCETPR","NACCAHTN")

write_sav(longit,"longit.sav")

library(reshape2)
longit_wide=dcast(longit, longit$PTID + longit$VISITNUM)
