# interlaced type coercion is symmetric and unchanging

    Code
      mat
    Output
                                               interlaced<logical, logical>  
      interlaced<logical, logical>             "interlaced<logical, logical>"
      interlaced<logical, integer>             "interlaced<logical, integer>"
      interlaced<logical, double>              "interlaced<logical, double>" 
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<integer, logical>"
      interlaced<integer, integer>             "interlaced<integer, integer>"
      interlaced<integer, double>              "interlaced<integer, double>" 
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<double, logical>" 
      interlaced<double, integer>              "interlaced<double, integer>" 
      interlaced<double, double>               "interlaced<double, double>"  
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<logical, integer>  
      interlaced<logical, logical>             "interlaced<logical, integer>"
      interlaced<logical, integer>             "interlaced<logical, integer>"
      interlaced<logical, double>              "interlaced<logical, double>" 
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<integer, integer>"
      interlaced<integer, integer>             "interlaced<integer, integer>"
      interlaced<integer, double>              "interlaced<integer, double>" 
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<double, integer>" 
      interlaced<double, integer>              "interlaced<double, integer>" 
      interlaced<double, double>               "interlaced<double, double>"  
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<logical, double>  
      interlaced<logical, logical>             "interlaced<logical, double>"
      interlaced<logical, integer>             "interlaced<logical, double>"
      interlaced<logical, double>              "interlaced<logical, double>"
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<integer, double>"
      interlaced<integer, integer>             "interlaced<integer, double>"
      interlaced<integer, double>              "interlaced<integer, double>"
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<double, double>" 
      interlaced<double, integer>              "interlaced<double, double>" 
      interlaced<double, double>               "interlaced<double, double>" 
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<logical, factor<af15a>>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       "interlaced<logical, factor<af15a>>"
      interlaced<logical, character>           "interlaced<logical, character>"    
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<integer, character>           "interlaced<integer, character>"    
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>" 
      interlaced<double, character>            "interlaced<double, character>"     
      interlaced<factor<af15a>, logical>       NA                                  
      interlaced<factor<af15a>, integer>       NA                                  
      interlaced<factor<af15a>, double>        NA                                  
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           NA                                  
      interlaced<character, integer>           NA                                  
      interlaced<character, double>            NA                                  
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<logical, character>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       "interlaced<logical, character>"
      interlaced<logical, character>           "interlaced<logical, character>"
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       "interlaced<integer, character>"
      interlaced<integer, character>           "interlaced<integer, character>"
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        "interlaced<double, character>" 
      interlaced<double, character>            "interlaced<double, character>" 
      interlaced<factor<af15a>, logical>       NA                              
      interlaced<factor<af15a>, integer>       NA                              
      interlaced<factor<af15a>, double>        NA                              
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           NA                              
      interlaced<character, integer>           NA                              
      interlaced<character, double>            NA                              
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<integer, logical>  
      interlaced<logical, logical>             "interlaced<integer, logical>"
      interlaced<logical, integer>             "interlaced<integer, integer>"
      interlaced<logical, double>              "interlaced<integer, double>" 
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<integer, logical>"
      interlaced<integer, integer>             "interlaced<integer, integer>"
      interlaced<integer, double>              "interlaced<integer, double>" 
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<double, logical>" 
      interlaced<double, integer>              "interlaced<double, integer>" 
      interlaced<double, double>               "interlaced<double, double>"  
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<integer, integer>  
      interlaced<logical, logical>             "interlaced<integer, integer>"
      interlaced<logical, integer>             "interlaced<integer, integer>"
      interlaced<logical, double>              "interlaced<integer, double>" 
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<integer, integer>"
      interlaced<integer, integer>             "interlaced<integer, integer>"
      interlaced<integer, double>              "interlaced<integer, double>" 
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<double, integer>" 
      interlaced<double, integer>              "interlaced<double, integer>" 
      interlaced<double, double>               "interlaced<double, double>"  
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<integer, double>  
      interlaced<logical, logical>             "interlaced<integer, double>"
      interlaced<logical, integer>             "interlaced<integer, double>"
      interlaced<logical, double>              "interlaced<integer, double>"
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<integer, double>"
      interlaced<integer, integer>             "interlaced<integer, double>"
      interlaced<integer, double>              "interlaced<integer, double>"
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<double, double>" 
      interlaced<double, integer>              "interlaced<double, double>" 
      interlaced<double, double>               "interlaced<double, double>" 
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<integer, factor<af15a>>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<logical, character>           "interlaced<integer, character>"    
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<integer, character>           "interlaced<integer, character>"    
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>" 
      interlaced<double, character>            "interlaced<double, character>"     
      interlaced<factor<af15a>, logical>       NA                                  
      interlaced<factor<af15a>, integer>       NA                                  
      interlaced<factor<af15a>, double>        NA                                  
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           NA                                  
      interlaced<character, integer>           NA                                  
      interlaced<character, double>            NA                                  
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<integer, character>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       "interlaced<integer, character>"
      interlaced<logical, character>           "interlaced<integer, character>"
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       "interlaced<integer, character>"
      interlaced<integer, character>           "interlaced<integer, character>"
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        "interlaced<double, character>" 
      interlaced<double, character>            "interlaced<double, character>" 
      interlaced<factor<af15a>, logical>       NA                              
      interlaced<factor<af15a>, integer>       NA                              
      interlaced<factor<af15a>, double>        NA                              
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           NA                              
      interlaced<character, integer>           NA                              
      interlaced<character, double>            NA                              
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<double, logical>  
      interlaced<logical, logical>             "interlaced<double, logical>"
      interlaced<logical, integer>             "interlaced<double, integer>"
      interlaced<logical, double>              "interlaced<double, double>" 
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<double, logical>"
      interlaced<integer, integer>             "interlaced<double, integer>"
      interlaced<integer, double>              "interlaced<double, double>" 
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<double, logical>"
      interlaced<double, integer>              "interlaced<double, integer>"
      interlaced<double, double>               "interlaced<double, double>" 
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<double, integer>  
      interlaced<logical, logical>             "interlaced<double, integer>"
      interlaced<logical, integer>             "interlaced<double, integer>"
      interlaced<logical, double>              "interlaced<double, double>" 
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<double, integer>"
      interlaced<integer, integer>             "interlaced<double, integer>"
      interlaced<integer, double>              "interlaced<double, double>" 
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<double, integer>"
      interlaced<double, integer>              "interlaced<double, integer>"
      interlaced<double, double>               "interlaced<double, double>" 
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<double, double>  
      interlaced<logical, logical>             "interlaced<double, double>"
      interlaced<logical, integer>             "interlaced<double, double>"
      interlaced<logical, double>              "interlaced<double, double>"
      interlaced<logical, factor<af15a>>       NA                          
      interlaced<logical, character>           NA                          
      interlaced<integer, logical>             "interlaced<double, double>"
      interlaced<integer, integer>             "interlaced<double, double>"
      interlaced<integer, double>              "interlaced<double, double>"
      interlaced<integer, factor<af15a>>       NA                          
      interlaced<integer, character>           NA                          
      interlaced<double, logical>              "interlaced<double, double>"
      interlaced<double, integer>              "interlaced<double, double>"
      interlaced<double, double>               "interlaced<double, double>"
      interlaced<double, factor<af15a>>        NA                          
      interlaced<double, character>            NA                          
      interlaced<factor<af15a>, logical>       NA                          
      interlaced<factor<af15a>, integer>       NA                          
      interlaced<factor<af15a>, double>        NA                          
      interlaced<factor<af15a>, factor<af15a>> NA                          
      interlaced<factor<af15a>, character>     NA                          
      interlaced<character, logical>           NA                          
      interlaced<character, integer>           NA                          
      interlaced<character, double>            NA                          
      interlaced<character, factor<af15a>>     NA                          
      interlaced<character, character>         NA                          
                                               interlaced<double, factor<af15a>>  
      interlaced<logical, logical>             NA                                 
      interlaced<logical, integer>             NA                                 
      interlaced<logical, double>              NA                                 
      interlaced<logical, factor<af15a>>       "interlaced<double, factor<af15a>>"
      interlaced<logical, character>           "interlaced<double, character>"    
      interlaced<integer, logical>             NA                                 
      interlaced<integer, integer>             NA                                 
      interlaced<integer, double>              NA                                 
      interlaced<integer, factor<af15a>>       "interlaced<double, factor<af15a>>"
      interlaced<integer, character>           "interlaced<double, character>"    
      interlaced<double, logical>              NA                                 
      interlaced<double, integer>              NA                                 
      interlaced<double, double>               NA                                 
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>"
      interlaced<double, character>            "interlaced<double, character>"    
      interlaced<factor<af15a>, logical>       NA                                 
      interlaced<factor<af15a>, integer>       NA                                 
      interlaced<factor<af15a>, double>        NA                                 
      interlaced<factor<af15a>, factor<af15a>> NA                                 
      interlaced<factor<af15a>, character>     NA                                 
      interlaced<character, logical>           NA                                 
      interlaced<character, integer>           NA                                 
      interlaced<character, double>            NA                                 
      interlaced<character, factor<af15a>>     NA                                 
      interlaced<character, character>         NA                                 
                                               interlaced<double, character>  
      interlaced<logical, logical>             NA                             
      interlaced<logical, integer>             NA                             
      interlaced<logical, double>              NA                             
      interlaced<logical, factor<af15a>>       "interlaced<double, character>"
      interlaced<logical, character>           "interlaced<double, character>"
      interlaced<integer, logical>             NA                             
      interlaced<integer, integer>             NA                             
      interlaced<integer, double>              NA                             
      interlaced<integer, factor<af15a>>       "interlaced<double, character>"
      interlaced<integer, character>           "interlaced<double, character>"
      interlaced<double, logical>              NA                             
      interlaced<double, integer>              NA                             
      interlaced<double, double>               NA                             
      interlaced<double, factor<af15a>>        "interlaced<double, character>"
      interlaced<double, character>            "interlaced<double, character>"
      interlaced<factor<af15a>, logical>       NA                             
      interlaced<factor<af15a>, integer>       NA                             
      interlaced<factor<af15a>, double>        NA                             
      interlaced<factor<af15a>, factor<af15a>> NA                             
      interlaced<factor<af15a>, character>     NA                             
      interlaced<character, logical>           NA                             
      interlaced<character, integer>           NA                             
      interlaced<character, double>            NA                             
      interlaced<character, factor<af15a>>     NA                             
      interlaced<character, character>         NA                             
                                               interlaced<factor<af15a>, logical>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       NA                                  
      interlaced<logical, character>           NA                                  
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       NA                                  
      interlaced<integer, character>           NA                                  
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        NA                                  
      interlaced<double, character>            NA                                  
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, logical>"
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, integer>"
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, double>" 
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           "interlaced<character, logical>"    
      interlaced<character, integer>           "interlaced<character, integer>"    
      interlaced<character, double>            "interlaced<character, double>"     
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<factor<af15a>, integer>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       NA                                  
      interlaced<logical, character>           NA                                  
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       NA                                  
      interlaced<integer, character>           NA                                  
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        NA                                  
      interlaced<double, character>            NA                                  
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, integer>"
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, integer>"
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, double>" 
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           "interlaced<character, integer>"    
      interlaced<character, integer>           "interlaced<character, integer>"    
      interlaced<character, double>            "interlaced<character, double>"     
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<factor<af15a>, double>  
      interlaced<logical, logical>             NA                                 
      interlaced<logical, integer>             NA                                 
      interlaced<logical, double>              NA                                 
      interlaced<logical, factor<af15a>>       NA                                 
      interlaced<logical, character>           NA                                 
      interlaced<integer, logical>             NA                                 
      interlaced<integer, integer>             NA                                 
      interlaced<integer, double>              NA                                 
      interlaced<integer, factor<af15a>>       NA                                 
      interlaced<integer, character>           NA                                 
      interlaced<double, logical>              NA                                 
      interlaced<double, integer>              NA                                 
      interlaced<double, double>               NA                                 
      interlaced<double, factor<af15a>>        NA                                 
      interlaced<double, character>            NA                                 
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, double>"
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, double>"
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, double>"
      interlaced<factor<af15a>, factor<af15a>> NA                                 
      interlaced<factor<af15a>, character>     NA                                 
      interlaced<character, logical>           "interlaced<character, double>"    
      interlaced<character, integer>           "interlaced<character, double>"    
      interlaced<character, double>            "interlaced<character, double>"    
      interlaced<character, factor<af15a>>     NA                                 
      interlaced<character, character>         NA                                 
                                               interlaced<factor<af15a>, factor<af15a>>  
      interlaced<logical, logical>             NA                                        
      interlaced<logical, integer>             NA                                        
      interlaced<logical, double>              NA                                        
      interlaced<logical, factor<af15a>>       NA                                        
      interlaced<logical, character>           NA                                        
      interlaced<integer, logical>             NA                                        
      interlaced<integer, integer>             NA                                        
      interlaced<integer, double>              NA                                        
      interlaced<integer, factor<af15a>>       NA                                        
      interlaced<integer, character>           NA                                        
      interlaced<double, logical>              NA                                        
      interlaced<double, integer>              NA                                        
      interlaced<double, double>               NA                                        
      interlaced<double, factor<af15a>>        NA                                        
      interlaced<double, character>            NA                                        
      interlaced<factor<af15a>, logical>       NA                                        
      interlaced<factor<af15a>, integer>       NA                                        
      interlaced<factor<af15a>, double>        NA                                        
      interlaced<factor<af15a>, factor<af15a>> "interlaced<factor<af15a>, factor<af15a>>"
      interlaced<factor<af15a>, character>     "interlaced<factor<af15a>, character>"    
      interlaced<character, logical>           NA                                        
      interlaced<character, integer>           NA                                        
      interlaced<character, double>            NA                                        
      interlaced<character, factor<af15a>>     "interlaced<character, factor<af15a>>"    
      interlaced<character, character>         "interlaced<character, character>"        
                                               interlaced<factor<af15a>, character>  
      interlaced<logical, logical>             NA                                    
      interlaced<logical, integer>             NA                                    
      interlaced<logical, double>              NA                                    
      interlaced<logical, factor<af15a>>       NA                                    
      interlaced<logical, character>           NA                                    
      interlaced<integer, logical>             NA                                    
      interlaced<integer, integer>             NA                                    
      interlaced<integer, double>              NA                                    
      interlaced<integer, factor<af15a>>       NA                                    
      interlaced<integer, character>           NA                                    
      interlaced<double, logical>              NA                                    
      interlaced<double, integer>              NA                                    
      interlaced<double, double>               NA                                    
      interlaced<double, factor<af15a>>        NA                                    
      interlaced<double, character>            NA                                    
      interlaced<factor<af15a>, logical>       NA                                    
      interlaced<factor<af15a>, integer>       NA                                    
      interlaced<factor<af15a>, double>        NA                                    
      interlaced<factor<af15a>, factor<af15a>> "interlaced<factor<af15a>, character>"
      interlaced<factor<af15a>, character>     "interlaced<factor<af15a>, character>"
      interlaced<character, logical>           NA                                    
      interlaced<character, integer>           NA                                    
      interlaced<character, double>            NA                                    
      interlaced<character, factor<af15a>>     "interlaced<character, character>"    
      interlaced<character, character>         "interlaced<character, character>"    
                                               interlaced<character, logical>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       NA                              
      interlaced<logical, character>           NA                              
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       NA                              
      interlaced<integer, character>           NA                              
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        NA                              
      interlaced<double, character>            NA                              
      interlaced<factor<af15a>, logical>       "interlaced<character, logical>"
      interlaced<factor<af15a>, integer>       "interlaced<character, integer>"
      interlaced<factor<af15a>, double>        "interlaced<character, double>" 
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           "interlaced<character, logical>"
      interlaced<character, integer>           "interlaced<character, integer>"
      interlaced<character, double>            "interlaced<character, double>" 
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<character, integer>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       NA                              
      interlaced<logical, character>           NA                              
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       NA                              
      interlaced<integer, character>           NA                              
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        NA                              
      interlaced<double, character>            NA                              
      interlaced<factor<af15a>, logical>       "interlaced<character, integer>"
      interlaced<factor<af15a>, integer>       "interlaced<character, integer>"
      interlaced<factor<af15a>, double>        "interlaced<character, double>" 
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           "interlaced<character, integer>"
      interlaced<character, integer>           "interlaced<character, integer>"
      interlaced<character, double>            "interlaced<character, double>" 
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<character, double>  
      interlaced<logical, logical>             NA                             
      interlaced<logical, integer>             NA                             
      interlaced<logical, double>              NA                             
      interlaced<logical, factor<af15a>>       NA                             
      interlaced<logical, character>           NA                             
      interlaced<integer, logical>             NA                             
      interlaced<integer, integer>             NA                             
      interlaced<integer, double>              NA                             
      interlaced<integer, factor<af15a>>       NA                             
      interlaced<integer, character>           NA                             
      interlaced<double, logical>              NA                             
      interlaced<double, integer>              NA                             
      interlaced<double, double>               NA                             
      interlaced<double, factor<af15a>>        NA                             
      interlaced<double, character>            NA                             
      interlaced<factor<af15a>, logical>       "interlaced<character, double>"
      interlaced<factor<af15a>, integer>       "interlaced<character, double>"
      interlaced<factor<af15a>, double>        "interlaced<character, double>"
      interlaced<factor<af15a>, factor<af15a>> NA                             
      interlaced<factor<af15a>, character>     NA                             
      interlaced<character, logical>           "interlaced<character, double>"
      interlaced<character, integer>           "interlaced<character, double>"
      interlaced<character, double>            "interlaced<character, double>"
      interlaced<character, factor<af15a>>     NA                             
      interlaced<character, character>         NA                             
                                               interlaced<character, factor<af15a>>  
      interlaced<logical, logical>             NA                                    
      interlaced<logical, integer>             NA                                    
      interlaced<logical, double>              NA                                    
      interlaced<logical, factor<af15a>>       NA                                    
      interlaced<logical, character>           NA                                    
      interlaced<integer, logical>             NA                                    
      interlaced<integer, integer>             NA                                    
      interlaced<integer, double>              NA                                    
      interlaced<integer, factor<af15a>>       NA                                    
      interlaced<integer, character>           NA                                    
      interlaced<double, logical>              NA                                    
      interlaced<double, integer>              NA                                    
      interlaced<double, double>               NA                                    
      interlaced<double, factor<af15a>>        NA                                    
      interlaced<double, character>            NA                                    
      interlaced<factor<af15a>, logical>       NA                                    
      interlaced<factor<af15a>, integer>       NA                                    
      interlaced<factor<af15a>, double>        NA                                    
      interlaced<factor<af15a>, factor<af15a>> "interlaced<character, factor<af15a>>"
      interlaced<factor<af15a>, character>     "interlaced<character, character>"    
      interlaced<character, logical>           NA                                    
      interlaced<character, integer>           NA                                    
      interlaced<character, double>            NA                                    
      interlaced<character, factor<af15a>>     "interlaced<character, factor<af15a>>"
      interlaced<character, character>         "interlaced<character, character>"    
                                               interlaced<character, character>  
      interlaced<logical, logical>             NA                                
      interlaced<logical, integer>             NA                                
      interlaced<logical, double>              NA                                
      interlaced<logical, factor<af15a>>       NA                                
      interlaced<logical, character>           NA                                
      interlaced<integer, logical>             NA                                
      interlaced<integer, integer>             NA                                
      interlaced<integer, double>              NA                                
      interlaced<integer, factor<af15a>>       NA                                
      interlaced<integer, character>           NA                                
      interlaced<double, logical>              NA                                
      interlaced<double, integer>              NA                                
      interlaced<double, double>               NA                                
      interlaced<double, factor<af15a>>        NA                                
      interlaced<double, character>            NA                                
      interlaced<factor<af15a>, logical>       NA                                
      interlaced<factor<af15a>, integer>       NA                                
      interlaced<factor<af15a>, double>        NA                                
      interlaced<factor<af15a>, factor<af15a>> "interlaced<character, character>"
      interlaced<factor<af15a>, character>     "interlaced<character, character>"
      interlaced<character, logical>           NA                                
      interlaced<character, integer>           NA                                
      interlaced<character, double>            NA                                
      interlaced<character, factor<af15a>>     "interlaced<character, character>"
      interlaced<character, character>         "interlaced<character, character>"

# base type coercion is symmetric and unchanging

    Code
      mat
    Output
                                               logical                             
      interlaced<logical, logical>             "interlaced<logical, logical>"      
      interlaced<logical, integer>             "interlaced<logical, integer>"      
      interlaced<logical, double>              "interlaced<logical, double>"       
      interlaced<logical, factor<af15a>>       "interlaced<logical, factor<af15a>>"
      interlaced<logical, character>           "interlaced<logical, character>"    
      interlaced<integer, logical>             "interlaced<integer, logical>"      
      interlaced<integer, integer>             "interlaced<integer, integer>"      
      interlaced<integer, double>              "interlaced<integer, double>"       
      interlaced<integer, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<integer, character>           "interlaced<integer, character>"    
      interlaced<double, logical>              "interlaced<double, logical>"       
      interlaced<double, integer>              "interlaced<double, integer>"       
      interlaced<double, double>               "interlaced<double, double>"        
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>" 
      interlaced<double, character>            "interlaced<double, character>"     
      interlaced<factor<af15a>, logical>       NA                                  
      interlaced<factor<af15a>, integer>       NA                                  
      interlaced<factor<af15a>, double>        NA                                  
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           NA                                  
      interlaced<character, integer>           NA                                  
      interlaced<character, double>            NA                                  
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               integer                             
      interlaced<logical, logical>             "interlaced<integer, logical>"      
      interlaced<logical, integer>             "interlaced<integer, integer>"      
      interlaced<logical, double>              "interlaced<integer, double>"       
      interlaced<logical, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<logical, character>           "interlaced<integer, character>"    
      interlaced<integer, logical>             "interlaced<integer, logical>"      
      interlaced<integer, integer>             "interlaced<integer, integer>"      
      interlaced<integer, double>              "interlaced<integer, double>"       
      interlaced<integer, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<integer, character>           "interlaced<integer, character>"    
      interlaced<double, logical>              "interlaced<double, logical>"       
      interlaced<double, integer>              "interlaced<double, integer>"       
      interlaced<double, double>               "interlaced<double, double>"        
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>" 
      interlaced<double, character>            "interlaced<double, character>"     
      interlaced<factor<af15a>, logical>       NA                                  
      interlaced<factor<af15a>, integer>       NA                                  
      interlaced<factor<af15a>, double>        NA                                  
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           NA                                  
      interlaced<character, integer>           NA                                  
      interlaced<character, double>            NA                                  
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               double                             
      interlaced<logical, logical>             "interlaced<double, logical>"      
      interlaced<logical, integer>             "interlaced<double, integer>"      
      interlaced<logical, double>              "interlaced<double, double>"       
      interlaced<logical, factor<af15a>>       "interlaced<double, factor<af15a>>"
      interlaced<logical, character>           "interlaced<double, character>"    
      interlaced<integer, logical>             "interlaced<double, logical>"      
      interlaced<integer, integer>             "interlaced<double, integer>"      
      interlaced<integer, double>              "interlaced<double, double>"       
      interlaced<integer, factor<af15a>>       "interlaced<double, factor<af15a>>"
      interlaced<integer, character>           "interlaced<double, character>"    
      interlaced<double, logical>              "interlaced<double, logical>"      
      interlaced<double, integer>              "interlaced<double, integer>"      
      interlaced<double, double>               "interlaced<double, double>"       
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>"
      interlaced<double, character>            "interlaced<double, character>"    
      interlaced<factor<af15a>, logical>       NA                                 
      interlaced<factor<af15a>, integer>       NA                                 
      interlaced<factor<af15a>, double>        NA                                 
      interlaced<factor<af15a>, factor<af15a>> NA                                 
      interlaced<factor<af15a>, character>     NA                                 
      interlaced<character, logical>           NA                                 
      interlaced<character, integer>           NA                                 
      interlaced<character, double>            NA                                 
      interlaced<character, factor<af15a>>     NA                                 
      interlaced<character, character>         NA                                 
                                               factor<af15a>                             
      interlaced<logical, logical>             NA                                        
      interlaced<logical, integer>             NA                                        
      interlaced<logical, double>              NA                                        
      interlaced<logical, factor<af15a>>       NA                                        
      interlaced<logical, character>           NA                                        
      interlaced<integer, logical>             NA                                        
      interlaced<integer, integer>             NA                                        
      interlaced<integer, double>              NA                                        
      interlaced<integer, factor<af15a>>       NA                                        
      interlaced<integer, character>           NA                                        
      interlaced<double, logical>              NA                                        
      interlaced<double, integer>              NA                                        
      interlaced<double, double>               NA                                        
      interlaced<double, factor<af15a>>        NA                                        
      interlaced<double, character>            NA                                        
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, logical>"      
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, integer>"      
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, double>"       
      interlaced<factor<af15a>, factor<af15a>> "interlaced<factor<af15a>, factor<af15a>>"
      interlaced<factor<af15a>, character>     "interlaced<factor<af15a>, character>"    
      interlaced<character, logical>           "interlaced<character, logical>"          
      interlaced<character, integer>           "interlaced<character, integer>"          
      interlaced<character, double>            "interlaced<character, double>"           
      interlaced<character, factor<af15a>>     "interlaced<character, factor<af15a>>"    
      interlaced<character, character>         "interlaced<character, character>"        
                                               character                             
      interlaced<logical, logical>             NA                                    
      interlaced<logical, integer>             NA                                    
      interlaced<logical, double>              NA                                    
      interlaced<logical, factor<af15a>>       NA                                    
      interlaced<logical, character>           NA                                    
      interlaced<integer, logical>             NA                                    
      interlaced<integer, integer>             NA                                    
      interlaced<integer, double>              NA                                    
      interlaced<integer, factor<af15a>>       NA                                    
      interlaced<integer, character>           NA                                    
      interlaced<double, logical>              NA                                    
      interlaced<double, integer>              NA                                    
      interlaced<double, double>               NA                                    
      interlaced<double, factor<af15a>>        NA                                    
      interlaced<double, character>            NA                                    
      interlaced<factor<af15a>, logical>       "interlaced<character, logical>"      
      interlaced<factor<af15a>, integer>       "interlaced<character, integer>"      
      interlaced<factor<af15a>, double>        "interlaced<character, double>"       
      interlaced<factor<af15a>, factor<af15a>> "interlaced<character, factor<af15a>>"
      interlaced<factor<af15a>, character>     "interlaced<character, character>"    
      interlaced<character, logical>           "interlaced<character, logical>"      
      interlaced<character, integer>           "interlaced<character, integer>"      
      interlaced<character, double>            "interlaced<character, double>"       
      interlaced<character, factor<af15a>>     "interlaced<character, factor<af15a>>"
      interlaced<character, character>         "interlaced<character, character>"    

---

    Code
      mat2
    Output
                    interlaced<logical, logical>   interlaced<logical, integer>  
      logical       "interlaced<logical, logical>" "interlaced<logical, integer>"
      integer       "interlaced<integer, logical>" "interlaced<integer, integer>"
      double        "interlaced<double, logical>"  "interlaced<double, integer>" 
      factor<af15a> NA                             NA                            
      character     NA                             NA                            
                    interlaced<logical, double>  
      logical       "interlaced<logical, double>"
      integer       "interlaced<integer, double>"
      double        "interlaced<double, double>" 
      factor<af15a> NA                           
      character     NA                           
                    interlaced<logical, factor<af15a>>  
      logical       "interlaced<logical, factor<af15a>>"
      integer       "interlaced<integer, factor<af15a>>"
      double        "interlaced<double, factor<af15a>>" 
      factor<af15a> NA                                  
      character     NA                                  
                    interlaced<logical, character>   interlaced<integer, logical>  
      logical       "interlaced<logical, character>" "interlaced<integer, logical>"
      integer       "interlaced<integer, character>" "interlaced<integer, logical>"
      double        "interlaced<double, character>"  "interlaced<double, logical>" 
      factor<af15a> NA                               NA                            
      character     NA                               NA                            
                    interlaced<integer, integer>   interlaced<integer, double>  
      logical       "interlaced<integer, integer>" "interlaced<integer, double>"
      integer       "interlaced<integer, integer>" "interlaced<integer, double>"
      double        "interlaced<double, integer>"  "interlaced<double, double>" 
      factor<af15a> NA                             NA                           
      character     NA                             NA                           
                    interlaced<integer, factor<af15a>>  
      logical       "interlaced<integer, factor<af15a>>"
      integer       "interlaced<integer, factor<af15a>>"
      double        "interlaced<double, factor<af15a>>" 
      factor<af15a> NA                                  
      character     NA                                  
                    interlaced<integer, character>   interlaced<double, logical>  
      logical       "interlaced<integer, character>" "interlaced<double, logical>"
      integer       "interlaced<integer, character>" "interlaced<double, logical>"
      double        "interlaced<double, character>"  "interlaced<double, logical>"
      factor<af15a> NA                               NA                           
      character     NA                               NA                           
                    interlaced<double, integer>   interlaced<double, double>  
      logical       "interlaced<double, integer>" "interlaced<double, double>"
      integer       "interlaced<double, integer>" "interlaced<double, double>"
      double        "interlaced<double, integer>" "interlaced<double, double>"
      factor<af15a> NA                            NA                          
      character     NA                            NA                          
                    interlaced<double, factor<af15a>>  
      logical       "interlaced<double, factor<af15a>>"
      integer       "interlaced<double, factor<af15a>>"
      double        "interlaced<double, factor<af15a>>"
      factor<af15a> NA                                 
      character     NA                                 
                    interlaced<double, character>  
      logical       "interlaced<double, character>"
      integer       "interlaced<double, character>"
      double        "interlaced<double, character>"
      factor<af15a> NA                             
      character     NA                             
                    interlaced<factor<af15a>, logical>  
      logical       NA                                  
      integer       NA                                  
      double        NA                                  
      factor<af15a> "interlaced<factor<af15a>, logical>"
      character     "interlaced<character, logical>"    
                    interlaced<factor<af15a>, integer>  
      logical       NA                                  
      integer       NA                                  
      double        NA                                  
      factor<af15a> "interlaced<factor<af15a>, integer>"
      character     "interlaced<character, integer>"    
                    interlaced<factor<af15a>, double>  
      logical       NA                                 
      integer       NA                                 
      double        NA                                 
      factor<af15a> "interlaced<factor<af15a>, double>"
      character     "interlaced<character, double>"    
                    interlaced<factor<af15a>, factor<af15a>>  
      logical       NA                                        
      integer       NA                                        
      double        NA                                        
      factor<af15a> "interlaced<factor<af15a>, factor<af15a>>"
      character     "interlaced<character, factor<af15a>>"    
                    interlaced<factor<af15a>, character>  
      logical       NA                                    
      integer       NA                                    
      double        NA                                    
      factor<af15a> "interlaced<factor<af15a>, character>"
      character     "interlaced<character, character>"    
                    interlaced<character, logical>   interlaced<character, integer>  
      logical       NA                               NA                              
      integer       NA                               NA                              
      double        NA                               NA                              
      factor<af15a> "interlaced<character, logical>" "interlaced<character, integer>"
      character     "interlaced<character, logical>" "interlaced<character, integer>"
                    interlaced<character, double>  
      logical       NA                             
      integer       NA                             
      double        NA                             
      factor<af15a> "interlaced<character, double>"
      character     "interlaced<character, double>"
                    interlaced<character, factor<af15a>>  
      logical       NA                                    
      integer       NA                                    
      double        NA                                    
      factor<af15a> "interlaced<character, factor<af15a>>"
      character     "interlaced<character, factor<af15a>>"
                    interlaced<character, character>  
      logical       NA                                
      integer       NA                                
      double        NA                                
      factor<af15a> "interlaced<character, character>"
      character     "interlaced<character, character>"

# base type casting unwraps / lifts and is unchanging

    Code
      lifts
    Output
                    interlaced<logical, logical>   interlaced<logical, integer>  
      logical       "interlaced<logical, logical>" "interlaced<logical, integer>"
      integer       "interlaced<logical, logical>" "interlaced<logical, integer>"
      double        "interlaced<logical, logical>" "interlaced<logical, integer>"
      factor<af15a> NA                             NA                            
      character     NA                             NA                            
                    interlaced<logical, double>  
      logical       "interlaced<logical, double>"
      integer       "interlaced<logical, double>"
      double        "interlaced<logical, double>"
      factor<af15a> NA                           
      character     NA                           
                    interlaced<logical, factor<af15a>>  
      logical       "interlaced<logical, factor<af15a>>"
      integer       "interlaced<logical, factor<af15a>>"
      double        "interlaced<logical, factor<af15a>>"
      factor<af15a> NA                                  
      character     NA                                  
                    interlaced<logical, character>   interlaced<integer, logical>  
      logical       "interlaced<logical, character>" "interlaced<integer, logical>"
      integer       "interlaced<logical, character>" "interlaced<integer, logical>"
      double        "interlaced<logical, character>" "interlaced<integer, logical>"
      factor<af15a> NA                               NA                            
      character     NA                               NA                            
                    interlaced<integer, integer>   interlaced<integer, double>  
      logical       "interlaced<integer, integer>" "interlaced<integer, double>"
      integer       "interlaced<integer, integer>" "interlaced<integer, double>"
      double        "interlaced<integer, integer>" "interlaced<integer, double>"
      factor<af15a> NA                             NA                           
      character     NA                             NA                           
                    interlaced<integer, factor<af15a>>  
      logical       "interlaced<integer, factor<af15a>>"
      integer       "interlaced<integer, factor<af15a>>"
      double        "interlaced<integer, factor<af15a>>"
      factor<af15a> NA                                  
      character     NA                                  
                    interlaced<integer, character>   interlaced<double, logical>  
      logical       "interlaced<integer, character>" "interlaced<double, logical>"
      integer       "interlaced<integer, character>" "interlaced<double, logical>"
      double        "interlaced<integer, character>" "interlaced<double, logical>"
      factor<af15a> NA                               NA                           
      character     NA                               NA                           
                    interlaced<double, integer>   interlaced<double, double>  
      logical       "interlaced<double, integer>" "interlaced<double, double>"
      integer       "interlaced<double, integer>" "interlaced<double, double>"
      double        "interlaced<double, integer>" "interlaced<double, double>"
      factor<af15a> NA                            NA                          
      character     NA                            NA                          
                    interlaced<double, factor<af15a>>  
      logical       "interlaced<double, factor<af15a>>"
      integer       "interlaced<double, factor<af15a>>"
      double        "interlaced<double, factor<af15a>>"
      factor<af15a> NA                                 
      character     NA                                 
                    interlaced<double, character>  
      logical       "interlaced<double, character>"
      integer       "interlaced<double, character>"
      double        "interlaced<double, character>"
      factor<af15a> NA                             
      character     NA                             
                    interlaced<factor<af15a>, logical>  
      logical       NA                                  
      integer       NA                                  
      double        NA                                  
      factor<af15a> "interlaced<factor<af15a>, logical>"
      character     "interlaced<factor<af15a>, logical>"
                    interlaced<factor<af15a>, integer>  
      logical       NA                                  
      integer       NA                                  
      double        NA                                  
      factor<af15a> "interlaced<factor<af15a>, integer>"
      character     "interlaced<factor<af15a>, integer>"
                    interlaced<factor<af15a>, double>  
      logical       NA                                 
      integer       NA                                 
      double        NA                                 
      factor<af15a> "interlaced<factor<af15a>, double>"
      character     "interlaced<factor<af15a>, double>"
                    interlaced<factor<af15a>, factor<af15a>>  
      logical       NA                                        
      integer       NA                                        
      double        NA                                        
      factor<af15a> "interlaced<factor<af15a>, factor<af15a>>"
      character     "interlaced<factor<af15a>, factor<af15a>>"
                    interlaced<factor<af15a>, character>  
      logical       NA                                    
      integer       NA                                    
      double        NA                                    
      factor<af15a> "interlaced<factor<af15a>, character>"
      character     "interlaced<factor<af15a>, character>"
                    interlaced<character, logical>   interlaced<character, integer>  
      logical       NA                               NA                              
      integer       NA                               NA                              
      double        NA                               NA                              
      factor<af15a> "interlaced<character, logical>" "interlaced<character, integer>"
      character     "interlaced<character, logical>" "interlaced<character, integer>"
                    interlaced<character, double>  
      logical       NA                             
      integer       NA                             
      double        NA                             
      factor<af15a> "interlaced<character, double>"
      character     "interlaced<character, double>"
                    interlaced<character, factor<af15a>>  
      logical       NA                                    
      integer       NA                                    
      double        NA                                    
      factor<af15a> "interlaced<character, factor<af15a>>"
      character     "interlaced<character, factor<af15a>>"
                    interlaced<character, character>  
      logical       NA                                
      integer       NA                                
      double        NA                                
      factor<af15a> "interlaced<character, character>"
      character     "interlaced<character, character>"

---

    Code
      unwraps
    Output
                                               logical   integer   double  
      interlaced<logical, logical>             "logical" "integer" "double"
      interlaced<logical, integer>             "logical" "integer" "double"
      interlaced<logical, double>              "logical" "integer" "double"
      interlaced<logical, factor<af15a>>       "logical" "integer" "double"
      interlaced<logical, character>           "logical" "integer" "double"
      interlaced<integer, logical>             "logical" "integer" "double"
      interlaced<integer, integer>             "logical" "integer" "double"
      interlaced<integer, double>              "logical" "integer" "double"
      interlaced<integer, factor<af15a>>       "logical" "integer" "double"
      interlaced<integer, character>           "logical" "integer" "double"
      interlaced<double, logical>              "logical" "integer" "double"
      interlaced<double, integer>              "logical" "integer" "double"
      interlaced<double, double>               "logical" "integer" "double"
      interlaced<double, factor<af15a>>        "logical" "integer" "double"
      interlaced<double, character>            "logical" "integer" "double"
      interlaced<factor<af15a>, logical>       NA        NA        NA      
      interlaced<factor<af15a>, integer>       NA        NA        NA      
      interlaced<factor<af15a>, double>        NA        NA        NA      
      interlaced<factor<af15a>, factor<af15a>> NA        NA        NA      
      interlaced<factor<af15a>, character>     NA        NA        NA      
      interlaced<character, logical>           NA        NA        NA      
      interlaced<character, integer>           NA        NA        NA      
      interlaced<character, double>            NA        NA        NA      
      interlaced<character, factor<af15a>>     NA        NA        NA      
      interlaced<character, character>         NA        NA        NA      
                                               factor<af15a>   character  
      interlaced<logical, logical>             NA              NA         
      interlaced<logical, integer>             NA              NA         
      interlaced<logical, double>              NA              NA         
      interlaced<logical, factor<af15a>>       NA              NA         
      interlaced<logical, character>           NA              NA         
      interlaced<integer, logical>             NA              NA         
      interlaced<integer, integer>             NA              NA         
      interlaced<integer, double>              NA              NA         
      interlaced<integer, factor<af15a>>       NA              NA         
      interlaced<integer, character>           NA              NA         
      interlaced<double, logical>              NA              NA         
      interlaced<double, integer>              NA              NA         
      interlaced<double, double>               NA              NA         
      interlaced<double, factor<af15a>>        NA              NA         
      interlaced<double, character>            NA              NA         
      interlaced<factor<af15a>, logical>       "factor<af15a>" "character"
      interlaced<factor<af15a>, integer>       "factor<af15a>" "character"
      interlaced<factor<af15a>, double>        "factor<af15a>" "character"
      interlaced<factor<af15a>, factor<af15a>> "factor<af15a>" "character"
      interlaced<factor<af15a>, character>     "factor<af15a>" "character"
      interlaced<character, logical>           "factor<af15a>" "character"
      interlaced<character, integer>           "factor<af15a>" "character"
      interlaced<character, double>            "factor<af15a>" "character"
      interlaced<character, factor<af15a>>     "factor<af15a>" "character"
      interlaced<character, character>         "factor<af15a>" "character"

# interlaced type casting is unchanging

    Code
      mat
    Output
                                               interlaced<logical, logical>  
      interlaced<logical, logical>             "interlaced<logical, logical>"
      interlaced<logical, integer>             "interlaced<logical, logical>"
      interlaced<logical, double>              "interlaced<logical, logical>"
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<logical, logical>"
      interlaced<integer, integer>             "interlaced<logical, logical>"
      interlaced<integer, double>              "interlaced<logical, logical>"
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<logical, logical>"
      interlaced<double, integer>              "interlaced<logical, logical>"
      interlaced<double, double>               "interlaced<logical, logical>"
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<logical, integer>  
      interlaced<logical, logical>             "interlaced<logical, integer>"
      interlaced<logical, integer>             "interlaced<logical, integer>"
      interlaced<logical, double>              "interlaced<logical, integer>"
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<logical, integer>"
      interlaced<integer, integer>             "interlaced<logical, integer>"
      interlaced<integer, double>              "interlaced<logical, integer>"
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<logical, integer>"
      interlaced<double, integer>              "interlaced<logical, integer>"
      interlaced<double, double>               "interlaced<logical, integer>"
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<logical, double>  
      interlaced<logical, logical>             "interlaced<logical, double>"
      interlaced<logical, integer>             "interlaced<logical, double>"
      interlaced<logical, double>              "interlaced<logical, double>"
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<logical, double>"
      interlaced<integer, integer>             "interlaced<logical, double>"
      interlaced<integer, double>              "interlaced<logical, double>"
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<logical, double>"
      interlaced<double, integer>              "interlaced<logical, double>"
      interlaced<double, double>               "interlaced<logical, double>"
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<logical, factor<af15a>>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       "interlaced<logical, factor<af15a>>"
      interlaced<logical, character>           "interlaced<logical, factor<af15a>>"
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       "interlaced<logical, factor<af15a>>"
      interlaced<integer, character>           "interlaced<logical, factor<af15a>>"
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        "interlaced<logical, factor<af15a>>"
      interlaced<double, character>            "interlaced<logical, factor<af15a>>"
      interlaced<factor<af15a>, logical>       NA                                  
      interlaced<factor<af15a>, integer>       NA                                  
      interlaced<factor<af15a>, double>        NA                                  
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           NA                                  
      interlaced<character, integer>           NA                                  
      interlaced<character, double>            NA                                  
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<logical, character>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       "interlaced<logical, character>"
      interlaced<logical, character>           "interlaced<logical, character>"
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       "interlaced<logical, character>"
      interlaced<integer, character>           "interlaced<logical, character>"
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        "interlaced<logical, character>"
      interlaced<double, character>            "interlaced<logical, character>"
      interlaced<factor<af15a>, logical>       NA                              
      interlaced<factor<af15a>, integer>       NA                              
      interlaced<factor<af15a>, double>        NA                              
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           NA                              
      interlaced<character, integer>           NA                              
      interlaced<character, double>            NA                              
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<integer, logical>  
      interlaced<logical, logical>             "interlaced<integer, logical>"
      interlaced<logical, integer>             "interlaced<integer, logical>"
      interlaced<logical, double>              "interlaced<integer, logical>"
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<integer, logical>"
      interlaced<integer, integer>             "interlaced<integer, logical>"
      interlaced<integer, double>              "interlaced<integer, logical>"
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<integer, logical>"
      interlaced<double, integer>              "interlaced<integer, logical>"
      interlaced<double, double>               "interlaced<integer, logical>"
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<integer, integer>  
      interlaced<logical, logical>             "interlaced<integer, integer>"
      interlaced<logical, integer>             "interlaced<integer, integer>"
      interlaced<logical, double>              "interlaced<integer, integer>"
      interlaced<logical, factor<af15a>>       NA                            
      interlaced<logical, character>           NA                            
      interlaced<integer, logical>             "interlaced<integer, integer>"
      interlaced<integer, integer>             "interlaced<integer, integer>"
      interlaced<integer, double>              "interlaced<integer, integer>"
      interlaced<integer, factor<af15a>>       NA                            
      interlaced<integer, character>           NA                            
      interlaced<double, logical>              "interlaced<integer, integer>"
      interlaced<double, integer>              "interlaced<integer, integer>"
      interlaced<double, double>               "interlaced<integer, integer>"
      interlaced<double, factor<af15a>>        NA                            
      interlaced<double, character>            NA                            
      interlaced<factor<af15a>, logical>       NA                            
      interlaced<factor<af15a>, integer>       NA                            
      interlaced<factor<af15a>, double>        NA                            
      interlaced<factor<af15a>, factor<af15a>> NA                            
      interlaced<factor<af15a>, character>     NA                            
      interlaced<character, logical>           NA                            
      interlaced<character, integer>           NA                            
      interlaced<character, double>            NA                            
      interlaced<character, factor<af15a>>     NA                            
      interlaced<character, character>         NA                            
                                               interlaced<integer, double>  
      interlaced<logical, logical>             "interlaced<integer, double>"
      interlaced<logical, integer>             "interlaced<integer, double>"
      interlaced<logical, double>              "interlaced<integer, double>"
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<integer, double>"
      interlaced<integer, integer>             "interlaced<integer, double>"
      interlaced<integer, double>              "interlaced<integer, double>"
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<integer, double>"
      interlaced<double, integer>              "interlaced<integer, double>"
      interlaced<double, double>               "interlaced<integer, double>"
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<integer, factor<af15a>>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<logical, character>           "interlaced<integer, factor<af15a>>"
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       "interlaced<integer, factor<af15a>>"
      interlaced<integer, character>           "interlaced<integer, factor<af15a>>"
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        "interlaced<integer, factor<af15a>>"
      interlaced<double, character>            "interlaced<integer, factor<af15a>>"
      interlaced<factor<af15a>, logical>       NA                                  
      interlaced<factor<af15a>, integer>       NA                                  
      interlaced<factor<af15a>, double>        NA                                  
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           NA                                  
      interlaced<character, integer>           NA                                  
      interlaced<character, double>            NA                                  
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<integer, character>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       "interlaced<integer, character>"
      interlaced<logical, character>           "interlaced<integer, character>"
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       "interlaced<integer, character>"
      interlaced<integer, character>           "interlaced<integer, character>"
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        "interlaced<integer, character>"
      interlaced<double, character>            "interlaced<integer, character>"
      interlaced<factor<af15a>, logical>       NA                              
      interlaced<factor<af15a>, integer>       NA                              
      interlaced<factor<af15a>, double>        NA                              
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           NA                              
      interlaced<character, integer>           NA                              
      interlaced<character, double>            NA                              
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<double, logical>  
      interlaced<logical, logical>             "interlaced<double, logical>"
      interlaced<logical, integer>             "interlaced<double, logical>"
      interlaced<logical, double>              "interlaced<double, logical>"
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<double, logical>"
      interlaced<integer, integer>             "interlaced<double, logical>"
      interlaced<integer, double>              "interlaced<double, logical>"
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<double, logical>"
      interlaced<double, integer>              "interlaced<double, logical>"
      interlaced<double, double>               "interlaced<double, logical>"
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<double, integer>  
      interlaced<logical, logical>             "interlaced<double, integer>"
      interlaced<logical, integer>             "interlaced<double, integer>"
      interlaced<logical, double>              "interlaced<double, integer>"
      interlaced<logical, factor<af15a>>       NA                           
      interlaced<logical, character>           NA                           
      interlaced<integer, logical>             "interlaced<double, integer>"
      interlaced<integer, integer>             "interlaced<double, integer>"
      interlaced<integer, double>              "interlaced<double, integer>"
      interlaced<integer, factor<af15a>>       NA                           
      interlaced<integer, character>           NA                           
      interlaced<double, logical>              "interlaced<double, integer>"
      interlaced<double, integer>              "interlaced<double, integer>"
      interlaced<double, double>               "interlaced<double, integer>"
      interlaced<double, factor<af15a>>        NA                           
      interlaced<double, character>            NA                           
      interlaced<factor<af15a>, logical>       NA                           
      interlaced<factor<af15a>, integer>       NA                           
      interlaced<factor<af15a>, double>        NA                           
      interlaced<factor<af15a>, factor<af15a>> NA                           
      interlaced<factor<af15a>, character>     NA                           
      interlaced<character, logical>           NA                           
      interlaced<character, integer>           NA                           
      interlaced<character, double>            NA                           
      interlaced<character, factor<af15a>>     NA                           
      interlaced<character, character>         NA                           
                                               interlaced<double, double>  
      interlaced<logical, logical>             "interlaced<double, double>"
      interlaced<logical, integer>             "interlaced<double, double>"
      interlaced<logical, double>              "interlaced<double, double>"
      interlaced<logical, factor<af15a>>       NA                          
      interlaced<logical, character>           NA                          
      interlaced<integer, logical>             "interlaced<double, double>"
      interlaced<integer, integer>             "interlaced<double, double>"
      interlaced<integer, double>              "interlaced<double, double>"
      interlaced<integer, factor<af15a>>       NA                          
      interlaced<integer, character>           NA                          
      interlaced<double, logical>              "interlaced<double, double>"
      interlaced<double, integer>              "interlaced<double, double>"
      interlaced<double, double>               "interlaced<double, double>"
      interlaced<double, factor<af15a>>        NA                          
      interlaced<double, character>            NA                          
      interlaced<factor<af15a>, logical>       NA                          
      interlaced<factor<af15a>, integer>       NA                          
      interlaced<factor<af15a>, double>        NA                          
      interlaced<factor<af15a>, factor<af15a>> NA                          
      interlaced<factor<af15a>, character>     NA                          
      interlaced<character, logical>           NA                          
      interlaced<character, integer>           NA                          
      interlaced<character, double>            NA                          
      interlaced<character, factor<af15a>>     NA                          
      interlaced<character, character>         NA                          
                                               interlaced<double, factor<af15a>>  
      interlaced<logical, logical>             NA                                 
      interlaced<logical, integer>             NA                                 
      interlaced<logical, double>              NA                                 
      interlaced<logical, factor<af15a>>       "interlaced<double, factor<af15a>>"
      interlaced<logical, character>           "interlaced<double, factor<af15a>>"
      interlaced<integer, logical>             NA                                 
      interlaced<integer, integer>             NA                                 
      interlaced<integer, double>              NA                                 
      interlaced<integer, factor<af15a>>       "interlaced<double, factor<af15a>>"
      interlaced<integer, character>           "interlaced<double, factor<af15a>>"
      interlaced<double, logical>              NA                                 
      interlaced<double, integer>              NA                                 
      interlaced<double, double>               NA                                 
      interlaced<double, factor<af15a>>        "interlaced<double, factor<af15a>>"
      interlaced<double, character>            "interlaced<double, factor<af15a>>"
      interlaced<factor<af15a>, logical>       NA                                 
      interlaced<factor<af15a>, integer>       NA                                 
      interlaced<factor<af15a>, double>        NA                                 
      interlaced<factor<af15a>, factor<af15a>> NA                                 
      interlaced<factor<af15a>, character>     NA                                 
      interlaced<character, logical>           NA                                 
      interlaced<character, integer>           NA                                 
      interlaced<character, double>            NA                                 
      interlaced<character, factor<af15a>>     NA                                 
      interlaced<character, character>         NA                                 
                                               interlaced<double, character>  
      interlaced<logical, logical>             NA                             
      interlaced<logical, integer>             NA                             
      interlaced<logical, double>              NA                             
      interlaced<logical, factor<af15a>>       "interlaced<double, character>"
      interlaced<logical, character>           "interlaced<double, character>"
      interlaced<integer, logical>             NA                             
      interlaced<integer, integer>             NA                             
      interlaced<integer, double>              NA                             
      interlaced<integer, factor<af15a>>       "interlaced<double, character>"
      interlaced<integer, character>           "interlaced<double, character>"
      interlaced<double, logical>              NA                             
      interlaced<double, integer>              NA                             
      interlaced<double, double>               NA                             
      interlaced<double, factor<af15a>>        "interlaced<double, character>"
      interlaced<double, character>            "interlaced<double, character>"
      interlaced<factor<af15a>, logical>       NA                             
      interlaced<factor<af15a>, integer>       NA                             
      interlaced<factor<af15a>, double>        NA                             
      interlaced<factor<af15a>, factor<af15a>> NA                             
      interlaced<factor<af15a>, character>     NA                             
      interlaced<character, logical>           NA                             
      interlaced<character, integer>           NA                             
      interlaced<character, double>            NA                             
      interlaced<character, factor<af15a>>     NA                             
      interlaced<character, character>         NA                             
                                               interlaced<factor<af15a>, logical>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       NA                                  
      interlaced<logical, character>           NA                                  
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       NA                                  
      interlaced<integer, character>           NA                                  
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        NA                                  
      interlaced<double, character>            NA                                  
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, logical>"
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, logical>"
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, logical>"
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           "interlaced<factor<af15a>, logical>"
      interlaced<character, integer>           "interlaced<factor<af15a>, logical>"
      interlaced<character, double>            "interlaced<factor<af15a>, logical>"
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<factor<af15a>, integer>  
      interlaced<logical, logical>             NA                                  
      interlaced<logical, integer>             NA                                  
      interlaced<logical, double>              NA                                  
      interlaced<logical, factor<af15a>>       NA                                  
      interlaced<logical, character>           NA                                  
      interlaced<integer, logical>             NA                                  
      interlaced<integer, integer>             NA                                  
      interlaced<integer, double>              NA                                  
      interlaced<integer, factor<af15a>>       NA                                  
      interlaced<integer, character>           NA                                  
      interlaced<double, logical>              NA                                  
      interlaced<double, integer>              NA                                  
      interlaced<double, double>               NA                                  
      interlaced<double, factor<af15a>>        NA                                  
      interlaced<double, character>            NA                                  
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, integer>"
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, integer>"
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, integer>"
      interlaced<factor<af15a>, factor<af15a>> NA                                  
      interlaced<factor<af15a>, character>     NA                                  
      interlaced<character, logical>           "interlaced<factor<af15a>, integer>"
      interlaced<character, integer>           "interlaced<factor<af15a>, integer>"
      interlaced<character, double>            "interlaced<factor<af15a>, integer>"
      interlaced<character, factor<af15a>>     NA                                  
      interlaced<character, character>         NA                                  
                                               interlaced<factor<af15a>, double>  
      interlaced<logical, logical>             NA                                 
      interlaced<logical, integer>             NA                                 
      interlaced<logical, double>              NA                                 
      interlaced<logical, factor<af15a>>       NA                                 
      interlaced<logical, character>           NA                                 
      interlaced<integer, logical>             NA                                 
      interlaced<integer, integer>             NA                                 
      interlaced<integer, double>              NA                                 
      interlaced<integer, factor<af15a>>       NA                                 
      interlaced<integer, character>           NA                                 
      interlaced<double, logical>              NA                                 
      interlaced<double, integer>              NA                                 
      interlaced<double, double>               NA                                 
      interlaced<double, factor<af15a>>        NA                                 
      interlaced<double, character>            NA                                 
      interlaced<factor<af15a>, logical>       "interlaced<factor<af15a>, double>"
      interlaced<factor<af15a>, integer>       "interlaced<factor<af15a>, double>"
      interlaced<factor<af15a>, double>        "interlaced<factor<af15a>, double>"
      interlaced<factor<af15a>, factor<af15a>> NA                                 
      interlaced<factor<af15a>, character>     NA                                 
      interlaced<character, logical>           "interlaced<factor<af15a>, double>"
      interlaced<character, integer>           "interlaced<factor<af15a>, double>"
      interlaced<character, double>            "interlaced<factor<af15a>, double>"
      interlaced<character, factor<af15a>>     NA                                 
      interlaced<character, character>         NA                                 
                                               interlaced<factor<af15a>, factor<af15a>>  
      interlaced<logical, logical>             NA                                        
      interlaced<logical, integer>             NA                                        
      interlaced<logical, double>              NA                                        
      interlaced<logical, factor<af15a>>       NA                                        
      interlaced<logical, character>           NA                                        
      interlaced<integer, logical>             NA                                        
      interlaced<integer, integer>             NA                                        
      interlaced<integer, double>              NA                                        
      interlaced<integer, factor<af15a>>       NA                                        
      interlaced<integer, character>           NA                                        
      interlaced<double, logical>              NA                                        
      interlaced<double, integer>              NA                                        
      interlaced<double, double>               NA                                        
      interlaced<double, factor<af15a>>        NA                                        
      interlaced<double, character>            NA                                        
      interlaced<factor<af15a>, logical>       NA                                        
      interlaced<factor<af15a>, integer>       NA                                        
      interlaced<factor<af15a>, double>        NA                                        
      interlaced<factor<af15a>, factor<af15a>> "interlaced<factor<af15a>, factor<af15a>>"
      interlaced<factor<af15a>, character>     "interlaced<factor<af15a>, factor<af15a>>"
      interlaced<character, logical>           NA                                        
      interlaced<character, integer>           NA                                        
      interlaced<character, double>            NA                                        
      interlaced<character, factor<af15a>>     "interlaced<factor<af15a>, factor<af15a>>"
      interlaced<character, character>         "interlaced<factor<af15a>, factor<af15a>>"
                                               interlaced<factor<af15a>, character>  
      interlaced<logical, logical>             NA                                    
      interlaced<logical, integer>             NA                                    
      interlaced<logical, double>              NA                                    
      interlaced<logical, factor<af15a>>       NA                                    
      interlaced<logical, character>           NA                                    
      interlaced<integer, logical>             NA                                    
      interlaced<integer, integer>             NA                                    
      interlaced<integer, double>              NA                                    
      interlaced<integer, factor<af15a>>       NA                                    
      interlaced<integer, character>           NA                                    
      interlaced<double, logical>              NA                                    
      interlaced<double, integer>              NA                                    
      interlaced<double, double>               NA                                    
      interlaced<double, factor<af15a>>        NA                                    
      interlaced<double, character>            NA                                    
      interlaced<factor<af15a>, logical>       NA                                    
      interlaced<factor<af15a>, integer>       NA                                    
      interlaced<factor<af15a>, double>        NA                                    
      interlaced<factor<af15a>, factor<af15a>> "interlaced<factor<af15a>, character>"
      interlaced<factor<af15a>, character>     "interlaced<factor<af15a>, character>"
      interlaced<character, logical>           NA                                    
      interlaced<character, integer>           NA                                    
      interlaced<character, double>            NA                                    
      interlaced<character, factor<af15a>>     "interlaced<factor<af15a>, character>"
      interlaced<character, character>         "interlaced<factor<af15a>, character>"
                                               interlaced<character, logical>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       NA                              
      interlaced<logical, character>           NA                              
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       NA                              
      interlaced<integer, character>           NA                              
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        NA                              
      interlaced<double, character>            NA                              
      interlaced<factor<af15a>, logical>       "interlaced<character, logical>"
      interlaced<factor<af15a>, integer>       "interlaced<character, logical>"
      interlaced<factor<af15a>, double>        "interlaced<character, logical>"
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           "interlaced<character, logical>"
      interlaced<character, integer>           "interlaced<character, logical>"
      interlaced<character, double>            "interlaced<character, logical>"
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<character, integer>  
      interlaced<logical, logical>             NA                              
      interlaced<logical, integer>             NA                              
      interlaced<logical, double>              NA                              
      interlaced<logical, factor<af15a>>       NA                              
      interlaced<logical, character>           NA                              
      interlaced<integer, logical>             NA                              
      interlaced<integer, integer>             NA                              
      interlaced<integer, double>              NA                              
      interlaced<integer, factor<af15a>>       NA                              
      interlaced<integer, character>           NA                              
      interlaced<double, logical>              NA                              
      interlaced<double, integer>              NA                              
      interlaced<double, double>               NA                              
      interlaced<double, factor<af15a>>        NA                              
      interlaced<double, character>            NA                              
      interlaced<factor<af15a>, logical>       "interlaced<character, integer>"
      interlaced<factor<af15a>, integer>       "interlaced<character, integer>"
      interlaced<factor<af15a>, double>        "interlaced<character, integer>"
      interlaced<factor<af15a>, factor<af15a>> NA                              
      interlaced<factor<af15a>, character>     NA                              
      interlaced<character, logical>           "interlaced<character, integer>"
      interlaced<character, integer>           "interlaced<character, integer>"
      interlaced<character, double>            "interlaced<character, integer>"
      interlaced<character, factor<af15a>>     NA                              
      interlaced<character, character>         NA                              
                                               interlaced<character, double>  
      interlaced<logical, logical>             NA                             
      interlaced<logical, integer>             NA                             
      interlaced<logical, double>              NA                             
      interlaced<logical, factor<af15a>>       NA                             
      interlaced<logical, character>           NA                             
      interlaced<integer, logical>             NA                             
      interlaced<integer, integer>             NA                             
      interlaced<integer, double>              NA                             
      interlaced<integer, factor<af15a>>       NA                             
      interlaced<integer, character>           NA                             
      interlaced<double, logical>              NA                             
      interlaced<double, integer>              NA                             
      interlaced<double, double>               NA                             
      interlaced<double, factor<af15a>>        NA                             
      interlaced<double, character>            NA                             
      interlaced<factor<af15a>, logical>       "interlaced<character, double>"
      interlaced<factor<af15a>, integer>       "interlaced<character, double>"
      interlaced<factor<af15a>, double>        "interlaced<character, double>"
      interlaced<factor<af15a>, factor<af15a>> NA                             
      interlaced<factor<af15a>, character>     NA                             
      interlaced<character, logical>           "interlaced<character, double>"
      interlaced<character, integer>           "interlaced<character, double>"
      interlaced<character, double>            "interlaced<character, double>"
      interlaced<character, factor<af15a>>     NA                             
      interlaced<character, character>         NA                             
                                               interlaced<character, factor<af15a>>  
      interlaced<logical, logical>             NA                                    
      interlaced<logical, integer>             NA                                    
      interlaced<logical, double>              NA                                    
      interlaced<logical, factor<af15a>>       NA                                    
      interlaced<logical, character>           NA                                    
      interlaced<integer, logical>             NA                                    
      interlaced<integer, integer>             NA                                    
      interlaced<integer, double>              NA                                    
      interlaced<integer, factor<af15a>>       NA                                    
      interlaced<integer, character>           NA                                    
      interlaced<double, logical>              NA                                    
      interlaced<double, integer>              NA                                    
      interlaced<double, double>               NA                                    
      interlaced<double, factor<af15a>>        NA                                    
      interlaced<double, character>            NA                                    
      interlaced<factor<af15a>, logical>       NA                                    
      interlaced<factor<af15a>, integer>       NA                                    
      interlaced<factor<af15a>, double>        NA                                    
      interlaced<factor<af15a>, factor<af15a>> "interlaced<character, factor<af15a>>"
      interlaced<factor<af15a>, character>     "interlaced<character, factor<af15a>>"
      interlaced<character, logical>           NA                                    
      interlaced<character, integer>           NA                                    
      interlaced<character, double>            NA                                    
      interlaced<character, factor<af15a>>     "interlaced<character, factor<af15a>>"
      interlaced<character, character>         "interlaced<character, factor<af15a>>"
                                               interlaced<character, character>  
      interlaced<logical, logical>             NA                                
      interlaced<logical, integer>             NA                                
      interlaced<logical, double>              NA                                
      interlaced<logical, factor<af15a>>       NA                                
      interlaced<logical, character>           NA                                
      interlaced<integer, logical>             NA                                
      interlaced<integer, integer>             NA                                
      interlaced<integer, double>              NA                                
      interlaced<integer, factor<af15a>>       NA                                
      interlaced<integer, character>           NA                                
      interlaced<double, logical>              NA                                
      interlaced<double, integer>              NA                                
      interlaced<double, double>               NA                                
      interlaced<double, factor<af15a>>        NA                                
      interlaced<double, character>            NA                                
      interlaced<factor<af15a>, logical>       NA                                
      interlaced<factor<af15a>, integer>       NA                                
      interlaced<factor<af15a>, double>        NA                                
      interlaced<factor<af15a>, factor<af15a>> "interlaced<character, character>"
      interlaced<factor<af15a>, character>     "interlaced<character, character>"
      interlaced<character, logical>           NA                                
      interlaced<character, integer>           NA                                
      interlaced<character, double>            NA                                
      interlaced<character, factor<af15a>>     "interlaced<character, character>"
      interlaced<character, character>         "interlaced<character, character>"

