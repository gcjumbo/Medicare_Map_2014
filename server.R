library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  observe({
    Medicaresam <- Medicaresam[Medicaresam$State.Code.of.the.Provider == input$State,]
    updateSelectInput(session, "City",
                      'City of the Provider',
                      choices = sort(Medicaresam$City.of.the.Provider),
                      selected = head(sort(Medicaresam$City.of.the.Provider), 1)
    )
  })
  
  data1 <- reactive({if (input$State != "all"){ 
    Medicaresam[(Medicaresam$State.Code.of.the.Provider %in% input$State) & (Medicaresam$Entity.Type.of.the.Provider %in% input$entity), ]
  }
    else {
      Medicaresam[(Medicaresam$Entity.Type.of.the.Provider %in% input$entity),]
    }
  })

  # data2 <- reactive( if (input$gender == 'F'){
  #     data1()[(data1()$Gender.of.the.Provider == "F"),]
  #   } else { if (input$gender == 'M'){
  #     data1()[(data1()$Gender.of.the.Provider == "M"),]
  #   } else {
  #     data1()[(data1()$Gender.of.the.Provider == NULL),]
  #   }
  #   })

  output$mapplot <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(-95.0382679, 35.3489054, zoom = 4) %>%
      addCircleMarkers(lng=data1()$Long, 
                       lat=data1()$Lat, 
                       popup = paste("<b>Name:</b>", 
                                     data1()$First.Name.of.the.Provider,
                                     data1()$Middle.Initial.of.the.Provider,
                                     data1()$Last.Name.Organization.Name.of.the.Provider,
                                     ",",
                                     data1()$Credentials.of.the.Provider,
                                     "<br>",
                                     "<b>Provider ID:</b>",
                                     data1()$National.Provider.Identifier,
                                     "<br>",
                                     "<b>Address:</b>",
                                     data1()$Street.Address.1.of.the.Provider,
                                     data1()$Street.Address.2.of.the.Provider,
                                     "<br>",
                                     data1()$City.of.the.Provider,
                                     ",",
                                     data1()$State.Code.of.the.Provider,
                                     data1()$ZIP,
                                     "<br>",
                                     "<b>HCPCS Code:</b>",
                                     data1()$HCPCS.Code,
                                     "<br>",
                                     "<b>HCPCS Description:</b>", 
                                     data1()$HCPCS.Description,
                                     "<br>",
                                     "<b># of Services:</b>",
                                     data1()$Number.of.Services,
                                     "<br>",
                                     "<b>Average Medicare Allowed:</b>",
                                     "$",
                                     data1()$Average.Medicare.Allowed.Amount,
                                     "<br>",
                                     "<b>Average Submitted Charge:</b>",
                                     "$",
                                     data1()$Average.Submitted.Charge.Amount,
                                     "<br>",
                                     "<b>Average Medicare Payment:</b>",
                                     "$",
                                     data1()$Average.Medicare.Payment.Amount), 
                       radius = 2,
                       fillOpacity = 1,
                       color = "slateblue")
    

 })
  # Text to be displayed in the side bar
  output$sidebarText <- renderText({"
            <div style='padding:1em'>
            <b>Directions:</b> The following interactive map displays information
            on services and procedures provided to Medicare beneficiaries by 
            physicians and other healthcare professionals.  1) Select a state of
            interest to see providers within a state.  2) Select the entity type
            of the provider to see either individuals or organizations.  3) Click
            any of the points on the map to obtain detailed provider information.</div>
            
            <div style='padding:1em'>
            The data were obtained from <a href='https://www.cms.gov/'> the
            Centers for Medicare & Medicaid Services website </a> as a public
            use file.  The data in the Physician and Other Supplier PUF cover 
            2014 and contain 100% final-action physician/supplier Part B 
            non-institutional line items for the Medicare fee-for-service 
            population.  For more information regarding the data, please click 
            <a href='http://go.cms.gov/1Tf8Wgi'>here</a>.
            </div>            
            <br>
            <div style='padding:1em'>
            <b>Event:</b> ArchHacks 2016 <br>
            <b>Location:</b> Washington University it St. Louis, St. Louis, MO, USA <br>
            <b>Authors:</b> Shrikar Iragavarapu (WUSTL, '19)<br>
            Dennis Liu (Grinnell College, '18)<br>
            Hanh Pham (Grinnell College, '17)<br>
            Jarren Santos (Grinnell College, '17)<br>
            <b>Date:</b> November 4-6, 2016
            </div>
      "})

    
  })
  
