Medicaresam <- read.csv("Medicare.csv")
Medicaresam <- as.data.frame(Medicaresam)
Medicaresam <- Medicaresam[complete.cases(Medicaresam),]
Medicaresam$City.of.the.Provider <- as.character(Medicaresam$City.of.the.Provider)
Medicaresam$State.Code.of.the.Provider <- as.character(Medicaresam$State.Code.of.the.Provider)
Medicaresam$HCPCS.Description <- as.character(Medicaresam$HCPCS.Description)
Medicaresam$Gender.of.the.Provider <- as.character(Medicaresam$Gender.of.the.Provider)
Medicaresam$Entity.Type.of.the.Provider <- as.character(Medicaresam$Entity.Type.of.the.Provider)
statelist <- c('All'="all",
  'Alabama'='AL',
  'Alaska'='AK',
  'Arizona'='AZ',
  'Arkansas'='AR',
  'California'='CA',
  'Colorado'='CO',
  'Connecticut'='CT',
  'Delaware'='DE',
  'Florida'='FL',
  'Georgia'='GA',
  'Hawaii'='HI',
  'Idaho'='ID',
  'Illinois'='IL',
  'Indiana'='IN',
  'Iowa'='IA',
  'Kansas'='KS',
  'Kentucky'='KY',
  'Louisiana'='LA',
  'Maine'='ME',
  'Maryland'='MD',
  'Massachusetts'='MA',
  'Michigan'='MI',
  'Minnesota'='MN',
  'Mississippi'='MS',
  'Missouri'='MO',
  'Montana'='MT',
  'Nebraska'='NE',
  'Nevada'='NV',
  'New Hampshire'='NH',
  'New Jersey'='NJ',
  'New Mexico'='NM',
  'New York'='NY',
  'North Carolina'='NC',
  'North Dakota'='ND',
  'Ohio'='OH',
  'Oklahoma'='OK',
  'Oregon'='OR',
  'Pennsylvania'='PA',
  'Puerto Rico' ='PR',
  'Rhode Island'='RI',
  'South Carolina'='SC',
  'South Dakota'='SD',
  'Tennessee'='TN',
  'Texas'='TX',
  'Utah'='UT',
  'Vermont'='VT',
  'Virginia'='VA',
  'Washington'='WA',
  'West Virginia'='WV',
  'Wisconsin'='WI',
  'Wyoming'='WY')

entity <- c('Individual' = 'I',
            'Organization' = 'O')
# 
# gender <- c('Female' = 'F',
#             'Male'='M',
#             'None'=' ')



