library(shinydashboard)
library(leaflet)

dashboardPage(
  dashboardHeader(title="Medicare Map", titleWidth = 355),
  skin = "blue",
  dashboardSidebar(
    width = 355,
    selectInput('State', "State of Provider", choices = statelist,selected = 'all'),
    # selectInput('City','City of the Provider',choices = Medicaresam$City.of.the.Provider,multiple = TRUE),
    selectInput('entity','Entity Type of the Provider', choices = entity,selected = 'I'),
    #Additional Information
    htmlOutput('sidebarText')),
  dashboardBody( fluidPage(fluidRow(
    
    box(title = "Geographic Visualization of Medicare Providers", solidHeader=T, status="primary", width = '100%',height = "85%",
        leafletOutput("mapplot",width="100%",height="650px"))
  ))))
