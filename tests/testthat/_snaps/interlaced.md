# interlaced type coercion is symmetric and unchanging

    Code
      mat
    Output
            [,1]                           [,2]                          
       [1,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [2,] "interlaced<logical, integer>" "interlaced<logical, integer>"
       [3,] "interlaced<logical, double>"  "interlaced<logical, double>" 
       [4,] NA                             NA                            
       [5,] NA                             NA                            
       [6,] "interlaced<integer, logical>" "interlaced<integer, integer>"
       [7,] "interlaced<integer, integer>" "interlaced<integer, integer>"
       [8,] "interlaced<integer, double>"  "interlaced<integer, double>" 
       [9,] NA                             NA                            
      [10,] NA                             NA                            
      [11,] "interlaced<double, logical>"  "interlaced<double, integer>" 
      [12,] "interlaced<double, integer>"  "interlaced<double, integer>" 
      [13,] "interlaced<double, double>"   "interlaced<double, double>"  
      [14,] NA                             NA                            
      [15,] NA                             NA                            
      [16,] NA                             NA                            
      [17,] NA                             NA                            
      [18,] NA                             NA                            
      [19,] NA                             NA                            
      [20,] NA                             NA                            
      [21,] NA                             NA                            
      [22,] NA                             NA                            
      [23,] NA                             NA                            
      [24,] NA                             NA                            
      [25,] NA                             NA                            
            [,3]                          [,4]                                
       [1,] "interlaced<logical, double>" NA                                  
       [2,] "interlaced<logical, double>" NA                                  
       [3,] "interlaced<logical, double>" NA                                  
       [4,] NA                            "interlaced<logical, factor<af15a>>"
       [5,] NA                            "interlaced<logical, character>"    
       [6,] "interlaced<integer, double>" NA                                  
       [7,] "interlaced<integer, double>" NA                                  
       [8,] "interlaced<integer, double>" NA                                  
       [9,] NA                            "interlaced<integer, factor<af15a>>"
      [10,] NA                            "interlaced<integer, character>"    
      [11,] "interlaced<double, double>"  NA                                  
      [12,] "interlaced<double, double>"  NA                                  
      [13,] "interlaced<double, double>"  NA                                  
      [14,] NA                            "interlaced<double, factor<af15a>>" 
      [15,] NA                            "interlaced<double, character>"     
      [16,] NA                            NA                                  
      [17,] NA                            NA                                  
      [18,] NA                            NA                                  
      [19,] NA                            NA                                  
      [20,] NA                            NA                                  
      [21,] NA                            NA                                  
      [22,] NA                            NA                                  
      [23,] NA                            NA                                  
      [24,] NA                            NA                                  
      [25,] NA                            NA                                  
            [,5]                             [,6]                          
       [1,] NA                               "interlaced<integer, logical>"
       [2,] NA                               "interlaced<integer, integer>"
       [3,] NA                               "interlaced<integer, double>" 
       [4,] "interlaced<logical, character>" NA                            
       [5,] "interlaced<logical, character>" NA                            
       [6,] NA                               "interlaced<integer, logical>"
       [7,] NA                               "interlaced<integer, integer>"
       [8,] NA                               "interlaced<integer, double>" 
       [9,] "interlaced<integer, character>" NA                            
      [10,] "interlaced<integer, character>" NA                            
      [11,] NA                               "interlaced<double, logical>" 
      [12,] NA                               "interlaced<double, integer>" 
      [13,] NA                               "interlaced<double, double>"  
      [14,] "interlaced<double, character>"  NA                            
      [15,] "interlaced<double, character>"  NA                            
      [16,] NA                               NA                            
      [17,] NA                               NA                            
      [18,] NA                               NA                            
      [19,] NA                               NA                            
      [20,] NA                               NA                            
      [21,] NA                               NA                            
      [22,] NA                               NA                            
      [23,] NA                               NA                            
      [24,] NA                               NA                            
      [25,] NA                               NA                            
            [,7]                           [,8]                         
       [1,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [2,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [3,] "interlaced<integer, double>"  "interlaced<integer, double>"
       [4,] NA                             NA                           
       [5,] NA                             NA                           
       [6,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [7,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [8,] "interlaced<integer, double>"  "interlaced<integer, double>"
       [9,] NA                             NA                           
      [10,] NA                             NA                           
      [11,] "interlaced<double, integer>"  "interlaced<double, double>" 
      [12,] "interlaced<double, integer>"  "interlaced<double, double>" 
      [13,] "interlaced<double, double>"   "interlaced<double, double>" 
      [14,] NA                             NA                           
      [15,] NA                             NA                           
      [16,] NA                             NA                           
      [17,] NA                             NA                           
      [18,] NA                             NA                           
      [19,] NA                             NA                           
      [20,] NA                             NA                           
      [21,] NA                             NA                           
      [22,] NA                             NA                           
      [23,] NA                             NA                           
      [24,] NA                             NA                           
      [25,] NA                             NA                           
            [,9]                                 [,10]                           
       [1,] NA                                   NA                              
       [2,] NA                                   NA                              
       [3,] NA                                   NA                              
       [4,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
       [5,] "interlaced<integer, character>"     "interlaced<integer, character>"
       [6,] NA                                   NA                              
       [7,] NA                                   NA                              
       [8,] NA                                   NA                              
       [9,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
      [10,] "interlaced<integer, character>"     "interlaced<integer, character>"
      [11,] NA                                   NA                              
      [12,] NA                                   NA                              
      [13,] NA                                   NA                              
      [14,] "interlaced<double, factor<af15a>>"  "interlaced<double, character>" 
      [15,] "interlaced<double, character>"      "interlaced<double, character>" 
      [16,] NA                                   NA                              
      [17,] NA                                   NA                              
      [18,] NA                                   NA                              
      [19,] NA                                   NA                              
      [20,] NA                                   NA                              
      [21,] NA                                   NA                              
      [22,] NA                                   NA                              
      [23,] NA                                   NA                              
      [24,] NA                                   NA                              
      [25,] NA                                   NA                              
            [,11]                         [,12]                        
       [1,] "interlaced<double, logical>" "interlaced<double, integer>"
       [2,] "interlaced<double, integer>" "interlaced<double, integer>"
       [3,] "interlaced<double, double>"  "interlaced<double, double>" 
       [4,] NA                            NA                           
       [5,] NA                            NA                           
       [6,] "interlaced<double, logical>" "interlaced<double, integer>"
       [7,] "interlaced<double, integer>" "interlaced<double, integer>"
       [8,] "interlaced<double, double>"  "interlaced<double, double>" 
       [9,] NA                            NA                           
      [10,] NA                            NA                           
      [11,] "interlaced<double, logical>" "interlaced<double, integer>"
      [12,] "interlaced<double, integer>" "interlaced<double, integer>"
      [13,] "interlaced<double, double>"  "interlaced<double, double>" 
      [14,] NA                            NA                           
      [15,] NA                            NA                           
      [16,] NA                            NA                           
      [17,] NA                            NA                           
      [18,] NA                            NA                           
      [19,] NA                            NA                           
      [20,] NA                            NA                           
      [21,] NA                            NA                           
      [22,] NA                            NA                           
      [23,] NA                            NA                           
      [24,] NA                            NA                           
      [25,] NA                            NA                           
            [,13]                        [,14]                              
       [1,] "interlaced<double, double>" NA                                 
       [2,] "interlaced<double, double>" NA                                 
       [3,] "interlaced<double, double>" NA                                 
       [4,] NA                           "interlaced<double, factor<af15a>>"
       [5,] NA                           "interlaced<double, character>"    
       [6,] "interlaced<double, double>" NA                                 
       [7,] "interlaced<double, double>" NA                                 
       [8,] "interlaced<double, double>" NA                                 
       [9,] NA                           "interlaced<double, factor<af15a>>"
      [10,] NA                           "interlaced<double, character>"    
      [11,] "interlaced<double, double>" NA                                 
      [12,] "interlaced<double, double>" NA                                 
      [13,] "interlaced<double, double>" NA                                 
      [14,] NA                           "interlaced<double, factor<af15a>>"
      [15,] NA                           "interlaced<double, character>"    
      [16,] NA                           NA                                 
      [17,] NA                           NA                                 
      [18,] NA                           NA                                 
      [19,] NA                           NA                                 
      [20,] NA                           NA                                 
      [21,] NA                           NA                                 
      [22,] NA                           NA                                 
      [23,] NA                           NA                                 
      [24,] NA                           NA                                 
      [25,] NA                           NA                                 
            [,15]                           [,16]                               
       [1,] NA                              NA                                  
       [2,] NA                              NA                                  
       [3,] NA                              NA                                  
       [4,] "interlaced<double, character>" NA                                  
       [5,] "interlaced<double, character>" NA                                  
       [6,] NA                              NA                                  
       [7,] NA                              NA                                  
       [8,] NA                              NA                                  
       [9,] "interlaced<double, character>" NA                                  
      [10,] "interlaced<double, character>" NA                                  
      [11,] NA                              NA                                  
      [12,] NA                              NA                                  
      [13,] NA                              NA                                  
      [14,] "interlaced<double, character>" NA                                  
      [15,] "interlaced<double, character>" NA                                  
      [16,] NA                              "interlaced<factor<af15a>, logical>"
      [17,] NA                              "interlaced<factor<af15a>, integer>"
      [18,] NA                              "interlaced<factor<af15a>, double>" 
      [19,] NA                              NA                                  
      [20,] NA                              NA                                  
      [21,] NA                              "interlaced<character, logical>"    
      [22,] NA                              "interlaced<character, integer>"    
      [23,] NA                              "interlaced<character, double>"     
      [24,] NA                              NA                                  
      [25,] NA                              NA                                  
            [,17]                                [,18]                              
       [1,] NA                                   NA                                 
       [2,] NA                                   NA                                 
       [3,] NA                                   NA                                 
       [4,] NA                                   NA                                 
       [5,] NA                                   NA                                 
       [6,] NA                                   NA                                 
       [7,] NA                                   NA                                 
       [8,] NA                                   NA                                 
       [9,] NA                                   NA                                 
      [10,] NA                                   NA                                 
      [11,] NA                                   NA                                 
      [12,] NA                                   NA                                 
      [13,] NA                                   NA                                 
      [14,] NA                                   NA                                 
      [15,] NA                                   NA                                 
      [16,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [17,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [18,] "interlaced<factor<af15a>, double>"  "interlaced<factor<af15a>, double>"
      [19,] NA                                   NA                                 
      [20,] NA                                   NA                                 
      [21,] "interlaced<character, integer>"     "interlaced<character, double>"    
      [22,] "interlaced<character, integer>"     "interlaced<character, double>"    
      [23,] "interlaced<character, double>"      "interlaced<character, double>"    
      [24,] NA                                   NA                                 
      [25,] NA                                   NA                                 
            [,19]                                     
       [1,] NA                                        
       [2,] NA                                        
       [3,] NA                                        
       [4,] NA                                        
       [5,] NA                                        
       [6,] NA                                        
       [7,] NA                                        
       [8,] NA                                        
       [9,] NA                                        
      [10,] NA                                        
      [11,] NA                                        
      [12,] NA                                        
      [13,] NA                                        
      [14,] NA                                        
      [15,] NA                                        
      [16,] NA                                        
      [17,] NA                                        
      [18,] NA                                        
      [19,] "interlaced<factor<af15a>, factor<af15a>>"
      [20,] "interlaced<factor<af15a>, character>"    
      [21,] NA                                        
      [22,] NA                                        
      [23,] NA                                        
      [24,] "interlaced<character, factor<af15a>>"    
      [25,] "interlaced<character, character>"        
            [,20]                                  [,21]                           
       [1,] NA                                     NA                              
       [2,] NA                                     NA                              
       [3,] NA                                     NA                              
       [4,] NA                                     NA                              
       [5,] NA                                     NA                              
       [6,] NA                                     NA                              
       [7,] NA                                     NA                              
       [8,] NA                                     NA                              
       [9,] NA                                     NA                              
      [10,] NA                                     NA                              
      [11,] NA                                     NA                              
      [12,] NA                                     NA                              
      [13,] NA                                     NA                              
      [14,] NA                                     NA                              
      [15,] NA                                     NA                              
      [16,] NA                                     "interlaced<character, logical>"
      [17,] NA                                     "interlaced<character, integer>"
      [18,] NA                                     "interlaced<character, double>" 
      [19,] "interlaced<factor<af15a>, character>" NA                              
      [20,] "interlaced<factor<af15a>, character>" NA                              
      [21,] NA                                     "interlaced<character, logical>"
      [22,] NA                                     "interlaced<character, integer>"
      [23,] NA                                     "interlaced<character, double>" 
      [24,] "interlaced<character, character>"     NA                              
      [25,] "interlaced<character, character>"     NA                              
            [,22]                            [,23]                          
       [1,] NA                               NA                             
       [2,] NA                               NA                             
       [3,] NA                               NA                             
       [4,] NA                               NA                             
       [5,] NA                               NA                             
       [6,] NA                               NA                             
       [7,] NA                               NA                             
       [8,] NA                               NA                             
       [9,] NA                               NA                             
      [10,] NA                               NA                             
      [11,] NA                               NA                             
      [12,] NA                               NA                             
      [13,] NA                               NA                             
      [14,] NA                               NA                             
      [15,] NA                               NA                             
      [16,] "interlaced<character, integer>" "interlaced<character, double>"
      [17,] "interlaced<character, integer>" "interlaced<character, double>"
      [18,] "interlaced<character, double>"  "interlaced<character, double>"
      [19,] NA                               NA                             
      [20,] NA                               NA                             
      [21,] "interlaced<character, integer>" "interlaced<character, double>"
      [22,] "interlaced<character, integer>" "interlaced<character, double>"
      [23,] "interlaced<character, double>"  "interlaced<character, double>"
      [24,] NA                               NA                             
      [25,] NA                               NA                             
            [,24]                                  [,25]                             
       [1,] NA                                     NA                                
       [2,] NA                                     NA                                
       [3,] NA                                     NA                                
       [4,] NA                                     NA                                
       [5,] NA                                     NA                                
       [6,] NA                                     NA                                
       [7,] NA                                     NA                                
       [8,] NA                                     NA                                
       [9,] NA                                     NA                                
      [10,] NA                                     NA                                
      [11,] NA                                     NA                                
      [12,] NA                                     NA                                
      [13,] NA                                     NA                                
      [14,] NA                                     NA                                
      [15,] NA                                     NA                                
      [16,] NA                                     NA                                
      [17,] NA                                     NA                                
      [18,] NA                                     NA                                
      [19,] "interlaced<character, factor<af15a>>" "interlaced<character, character>"
      [20,] "interlaced<character, character>"     "interlaced<character, character>"
      [21,] NA                                     NA                                
      [22,] NA                                     NA                                
      [23,] NA                                     NA                                
      [24,] "interlaced<character, factor<af15a>>" "interlaced<character, character>"
      [25,] "interlaced<character, character>"     "interlaced<character, character>"

# base type coercion is symmetric and unchanging

    Code
      mat
    Output
            [,1]                                 [,2]                                
       [1,] "interlaced<logical, logical>"       "interlaced<integer, logical>"      
       [2,] "interlaced<logical, integer>"       "interlaced<integer, integer>"      
       [3,] "interlaced<logical, double>"        "interlaced<integer, double>"       
       [4,] "interlaced<logical, factor<af15a>>" "interlaced<integer, factor<af15a>>"
       [5,] "interlaced<logical, character>"     "interlaced<integer, character>"    
       [6,] "interlaced<integer, logical>"       "interlaced<integer, logical>"      
       [7,] "interlaced<integer, integer>"       "interlaced<integer, integer>"      
       [8,] "interlaced<integer, double>"        "interlaced<integer, double>"       
       [9,] "interlaced<integer, factor<af15a>>" "interlaced<integer, factor<af15a>>"
      [10,] "interlaced<integer, character>"     "interlaced<integer, character>"    
      [11,] "interlaced<double, logical>"        "interlaced<double, logical>"       
      [12,] "interlaced<double, integer>"        "interlaced<double, integer>"       
      [13,] "interlaced<double, double>"         "interlaced<double, double>"        
      [14,] "interlaced<double, factor<af15a>>"  "interlaced<double, factor<af15a>>" 
      [15,] "interlaced<double, character>"      "interlaced<double, character>"     
      [16,] NA                                   NA                                  
      [17,] NA                                   NA                                  
      [18,] NA                                   NA                                  
      [19,] NA                                   NA                                  
      [20,] NA                                   NA                                  
      [21,] NA                                   NA                                  
      [22,] NA                                   NA                                  
      [23,] NA                                   NA                                  
      [24,] NA                                   NA                                  
      [25,] NA                                   NA                                  
            [,3]                               
       [1,] "interlaced<double, logical>"      
       [2,] "interlaced<double, integer>"      
       [3,] "interlaced<double, double>"       
       [4,] "interlaced<double, factor<af15a>>"
       [5,] "interlaced<double, character>"    
       [6,] "interlaced<double, logical>"      
       [7,] "interlaced<double, integer>"      
       [8,] "interlaced<double, double>"       
       [9,] "interlaced<double, factor<af15a>>"
      [10,] "interlaced<double, character>"    
      [11,] "interlaced<double, logical>"      
      [12,] "interlaced<double, integer>"      
      [13,] "interlaced<double, double>"       
      [14,] "interlaced<double, factor<af15a>>"
      [15,] "interlaced<double, character>"    
      [16,] NA                                 
      [17,] NA                                 
      [18,] NA                                 
      [19,] NA                                 
      [20,] NA                                 
      [21,] NA                                 
      [22,] NA                                 
      [23,] NA                                 
      [24,] NA                                 
      [25,] NA                                 
            [,4]                                      
       [1,] NA                                        
       [2,] NA                                        
       [3,] NA                                        
       [4,] NA                                        
       [5,] NA                                        
       [6,] NA                                        
       [7,] NA                                        
       [8,] NA                                        
       [9,] NA                                        
      [10,] NA                                        
      [11,] NA                                        
      [12,] NA                                        
      [13,] NA                                        
      [14,] NA                                        
      [15,] NA                                        
      [16,] "interlaced<factor<af15a>, logical>"      
      [17,] "interlaced<factor<af15a>, integer>"      
      [18,] "interlaced<factor<af15a>, double>"       
      [19,] "interlaced<factor<af15a>, factor<af15a>>"
      [20,] "interlaced<factor<af15a>, character>"    
      [21,] "interlaced<character, logical>"          
      [22,] "interlaced<character, integer>"          
      [23,] "interlaced<character, double>"           
      [24,] "interlaced<character, factor<af15a>>"    
      [25,] "interlaced<character, character>"        
            [,5]                                  
       [1,] NA                                    
       [2,] NA                                    
       [3,] NA                                    
       [4,] NA                                    
       [5,] NA                                    
       [6,] NA                                    
       [7,] NA                                    
       [8,] NA                                    
       [9,] NA                                    
      [10,] NA                                    
      [11,] NA                                    
      [12,] NA                                    
      [13,] NA                                    
      [14,] NA                                    
      [15,] NA                                    
      [16,] "interlaced<character, logical>"      
      [17,] "interlaced<character, integer>"      
      [18,] "interlaced<character, double>"       
      [19,] "interlaced<character, factor<af15a>>"
      [20,] "interlaced<character, character>"    
      [21,] "interlaced<character, logical>"      
      [22,] "interlaced<character, integer>"      
      [23,] "interlaced<character, double>"       
      [24,] "interlaced<character, factor<af15a>>"
      [25,] "interlaced<character, character>"    

# base type casting unwraps / lifts and is unchanging

    Code
      mat
    Output
            [,1]      [,2]      [,3]     [,4]            [,5]       
       [1,] "logical" "integer" "double" NA              NA         
       [2,] "logical" "integer" "double" NA              NA         
       [3,] "logical" "integer" "double" NA              NA         
       [4,] "logical" "integer" "double" NA              NA         
       [5,] "logical" "integer" "double" NA              NA         
       [6,] "logical" "integer" "double" NA              NA         
       [7,] "logical" "integer" "double" NA              NA         
       [8,] "logical" "integer" "double" NA              NA         
       [9,] "logical" "integer" "double" NA              NA         
      [10,] "logical" "integer" "double" NA              NA         
      [11,] "logical" "integer" "double" NA              NA         
      [12,] "logical" "integer" "double" NA              NA         
      [13,] "logical" "integer" "double" NA              NA         
      [14,] "logical" "integer" "double" NA              NA         
      [15,] "logical" "integer" "double" NA              NA         
      [16,] NA        NA        NA       "factor<af15a>" "character"
      [17,] NA        NA        NA       "factor<af15a>" "character"
      [18,] NA        NA        NA       "factor<af15a>" "character"
      [19,] NA        NA        NA       "factor<af15a>" "character"
      [20,] NA        NA        NA       "factor<af15a>" "character"
      [21,] NA        NA        NA       "factor<af15a>" "character"
      [22,] NA        NA        NA       "factor<af15a>" "character"
      [23,] NA        NA        NA       "factor<af15a>" "character"
      [24,] NA        NA        NA       "factor<af15a>" "character"
      [25,] NA        NA        NA       "factor<af15a>" "character"

# interlaced type casting is unchanging

    Code
      mat
    Output
            [,1]                           [,2]                          
       [1,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [2,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [3,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [4,] NA                             NA                            
       [5,] NA                             NA                            
       [6,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [7,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [8,] "interlaced<logical, logical>" "interlaced<logical, integer>"
       [9,] NA                             NA                            
      [10,] NA                             NA                            
      [11,] "interlaced<logical, logical>" "interlaced<logical, integer>"
      [12,] "interlaced<logical, logical>" "interlaced<logical, integer>"
      [13,] "interlaced<logical, logical>" "interlaced<logical, integer>"
      [14,] NA                             NA                            
      [15,] NA                             NA                            
      [16,] NA                             NA                            
      [17,] NA                             NA                            
      [18,] NA                             NA                            
      [19,] NA                             NA                            
      [20,] NA                             NA                            
      [21,] NA                             NA                            
      [22,] NA                             NA                            
      [23,] NA                             NA                            
      [24,] NA                             NA                            
      [25,] NA                             NA                            
            [,3]                          [,4]                                
       [1,] "interlaced<logical, double>" NA                                  
       [2,] "interlaced<logical, double>" NA                                  
       [3,] "interlaced<logical, double>" NA                                  
       [4,] NA                            "interlaced<logical, factor<af15a>>"
       [5,] NA                            "interlaced<logical, factor<af15a>>"
       [6,] "interlaced<logical, double>" NA                                  
       [7,] "interlaced<logical, double>" NA                                  
       [8,] "interlaced<logical, double>" NA                                  
       [9,] NA                            "interlaced<logical, factor<af15a>>"
      [10,] NA                            "interlaced<logical, factor<af15a>>"
      [11,] "interlaced<logical, double>" NA                                  
      [12,] "interlaced<logical, double>" NA                                  
      [13,] "interlaced<logical, double>" NA                                  
      [14,] NA                            "interlaced<logical, factor<af15a>>"
      [15,] NA                            "interlaced<logical, factor<af15a>>"
      [16,] NA                            NA                                  
      [17,] NA                            NA                                  
      [18,] NA                            NA                                  
      [19,] NA                            NA                                  
      [20,] NA                            NA                                  
      [21,] NA                            NA                                  
      [22,] NA                            NA                                  
      [23,] NA                            NA                                  
      [24,] NA                            NA                                  
      [25,] NA                            NA                                  
            [,5]                             [,6]                          
       [1,] NA                               "interlaced<integer, logical>"
       [2,] NA                               "interlaced<integer, logical>"
       [3,] NA                               "interlaced<integer, logical>"
       [4,] "interlaced<logical, character>" NA                            
       [5,] "interlaced<logical, character>" NA                            
       [6,] NA                               "interlaced<integer, logical>"
       [7,] NA                               "interlaced<integer, logical>"
       [8,] NA                               "interlaced<integer, logical>"
       [9,] "interlaced<logical, character>" NA                            
      [10,] "interlaced<logical, character>" NA                            
      [11,] NA                               "interlaced<integer, logical>"
      [12,] NA                               "interlaced<integer, logical>"
      [13,] NA                               "interlaced<integer, logical>"
      [14,] "interlaced<logical, character>" NA                            
      [15,] "interlaced<logical, character>" NA                            
      [16,] NA                               NA                            
      [17,] NA                               NA                            
      [18,] NA                               NA                            
      [19,] NA                               NA                            
      [20,] NA                               NA                            
      [21,] NA                               NA                            
      [22,] NA                               NA                            
      [23,] NA                               NA                            
      [24,] NA                               NA                            
      [25,] NA                               NA                            
            [,7]                           [,8]                         
       [1,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [2,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [3,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [4,] NA                             NA                           
       [5,] NA                             NA                           
       [6,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [7,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [8,] "interlaced<integer, integer>" "interlaced<integer, double>"
       [9,] NA                             NA                           
      [10,] NA                             NA                           
      [11,] "interlaced<integer, integer>" "interlaced<integer, double>"
      [12,] "interlaced<integer, integer>" "interlaced<integer, double>"
      [13,] "interlaced<integer, integer>" "interlaced<integer, double>"
      [14,] NA                             NA                           
      [15,] NA                             NA                           
      [16,] NA                             NA                           
      [17,] NA                             NA                           
      [18,] NA                             NA                           
      [19,] NA                             NA                           
      [20,] NA                             NA                           
      [21,] NA                             NA                           
      [22,] NA                             NA                           
      [23,] NA                             NA                           
      [24,] NA                             NA                           
      [25,] NA                             NA                           
            [,9]                                 [,10]                           
       [1,] NA                                   NA                              
       [2,] NA                                   NA                              
       [3,] NA                                   NA                              
       [4,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
       [5,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
       [6,] NA                                   NA                              
       [7,] NA                                   NA                              
       [8,] NA                                   NA                              
       [9,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
      [10,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
      [11,] NA                                   NA                              
      [12,] NA                                   NA                              
      [13,] NA                                   NA                              
      [14,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
      [15,] "interlaced<integer, factor<af15a>>" "interlaced<integer, character>"
      [16,] NA                                   NA                              
      [17,] NA                                   NA                              
      [18,] NA                                   NA                              
      [19,] NA                                   NA                              
      [20,] NA                                   NA                              
      [21,] NA                                   NA                              
      [22,] NA                                   NA                              
      [23,] NA                                   NA                              
      [24,] NA                                   NA                              
      [25,] NA                                   NA                              
            [,11]                         [,12]                        
       [1,] "interlaced<double, logical>" "interlaced<double, integer>"
       [2,] "interlaced<double, logical>" "interlaced<double, integer>"
       [3,] "interlaced<double, logical>" "interlaced<double, integer>"
       [4,] NA                            NA                           
       [5,] NA                            NA                           
       [6,] "interlaced<double, logical>" "interlaced<double, integer>"
       [7,] "interlaced<double, logical>" "interlaced<double, integer>"
       [8,] "interlaced<double, logical>" "interlaced<double, integer>"
       [9,] NA                            NA                           
      [10,] NA                            NA                           
      [11,] "interlaced<double, logical>" "interlaced<double, integer>"
      [12,] "interlaced<double, logical>" "interlaced<double, integer>"
      [13,] "interlaced<double, logical>" "interlaced<double, integer>"
      [14,] NA                            NA                           
      [15,] NA                            NA                           
      [16,] NA                            NA                           
      [17,] NA                            NA                           
      [18,] NA                            NA                           
      [19,] NA                            NA                           
      [20,] NA                            NA                           
      [21,] NA                            NA                           
      [22,] NA                            NA                           
      [23,] NA                            NA                           
      [24,] NA                            NA                           
      [25,] NA                            NA                           
            [,13]                        [,14]                              
       [1,] "interlaced<double, double>" NA                                 
       [2,] "interlaced<double, double>" NA                                 
       [3,] "interlaced<double, double>" NA                                 
       [4,] NA                           "interlaced<double, factor<af15a>>"
       [5,] NA                           "interlaced<double, factor<af15a>>"
       [6,] "interlaced<double, double>" NA                                 
       [7,] "interlaced<double, double>" NA                                 
       [8,] "interlaced<double, double>" NA                                 
       [9,] NA                           "interlaced<double, factor<af15a>>"
      [10,] NA                           "interlaced<double, factor<af15a>>"
      [11,] "interlaced<double, double>" NA                                 
      [12,] "interlaced<double, double>" NA                                 
      [13,] "interlaced<double, double>" NA                                 
      [14,] NA                           "interlaced<double, factor<af15a>>"
      [15,] NA                           "interlaced<double, factor<af15a>>"
      [16,] NA                           NA                                 
      [17,] NA                           NA                                 
      [18,] NA                           NA                                 
      [19,] NA                           NA                                 
      [20,] NA                           NA                                 
      [21,] NA                           NA                                 
      [22,] NA                           NA                                 
      [23,] NA                           NA                                 
      [24,] NA                           NA                                 
      [25,] NA                           NA                                 
            [,15]                           [,16]                               
       [1,] NA                              NA                                  
       [2,] NA                              NA                                  
       [3,] NA                              NA                                  
       [4,] "interlaced<double, character>" NA                                  
       [5,] "interlaced<double, character>" NA                                  
       [6,] NA                              NA                                  
       [7,] NA                              NA                                  
       [8,] NA                              NA                                  
       [9,] "interlaced<double, character>" NA                                  
      [10,] "interlaced<double, character>" NA                                  
      [11,] NA                              NA                                  
      [12,] NA                              NA                                  
      [13,] NA                              NA                                  
      [14,] "interlaced<double, character>" NA                                  
      [15,] "interlaced<double, character>" NA                                  
      [16,] NA                              "interlaced<factor<af15a>, logical>"
      [17,] NA                              "interlaced<factor<af15a>, logical>"
      [18,] NA                              "interlaced<factor<af15a>, logical>"
      [19,] NA                              NA                                  
      [20,] NA                              NA                                  
      [21,] NA                              "interlaced<factor<af15a>, logical>"
      [22,] NA                              "interlaced<factor<af15a>, logical>"
      [23,] NA                              "interlaced<factor<af15a>, logical>"
      [24,] NA                              NA                                  
      [25,] NA                              NA                                  
            [,17]                                [,18]                              
       [1,] NA                                   NA                                 
       [2,] NA                                   NA                                 
       [3,] NA                                   NA                                 
       [4,] NA                                   NA                                 
       [5,] NA                                   NA                                 
       [6,] NA                                   NA                                 
       [7,] NA                                   NA                                 
       [8,] NA                                   NA                                 
       [9,] NA                                   NA                                 
      [10,] NA                                   NA                                 
      [11,] NA                                   NA                                 
      [12,] NA                                   NA                                 
      [13,] NA                                   NA                                 
      [14,] NA                                   NA                                 
      [15,] NA                                   NA                                 
      [16,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [17,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [18,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [19,] NA                                   NA                                 
      [20,] NA                                   NA                                 
      [21,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [22,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [23,] "interlaced<factor<af15a>, integer>" "interlaced<factor<af15a>, double>"
      [24,] NA                                   NA                                 
      [25,] NA                                   NA                                 
            [,19]                                     
       [1,] NA                                        
       [2,] NA                                        
       [3,] NA                                        
       [4,] NA                                        
       [5,] NA                                        
       [6,] NA                                        
       [7,] NA                                        
       [8,] NA                                        
       [9,] NA                                        
      [10,] NA                                        
      [11,] NA                                        
      [12,] NA                                        
      [13,] NA                                        
      [14,] NA                                        
      [15,] NA                                        
      [16,] NA                                        
      [17,] NA                                        
      [18,] NA                                        
      [19,] "interlaced<factor<af15a>, factor<af15a>>"
      [20,] "interlaced<factor<af15a>, factor<af15a>>"
      [21,] NA                                        
      [22,] NA                                        
      [23,] NA                                        
      [24,] "interlaced<factor<af15a>, factor<af15a>>"
      [25,] "interlaced<factor<af15a>, factor<af15a>>"
            [,20]                                  [,21]                           
       [1,] NA                                     NA                              
       [2,] NA                                     NA                              
       [3,] NA                                     NA                              
       [4,] NA                                     NA                              
       [5,] NA                                     NA                              
       [6,] NA                                     NA                              
       [7,] NA                                     NA                              
       [8,] NA                                     NA                              
       [9,] NA                                     NA                              
      [10,] NA                                     NA                              
      [11,] NA                                     NA                              
      [12,] NA                                     NA                              
      [13,] NA                                     NA                              
      [14,] NA                                     NA                              
      [15,] NA                                     NA                              
      [16,] NA                                     "interlaced<character, logical>"
      [17,] NA                                     "interlaced<character, logical>"
      [18,] NA                                     "interlaced<character, logical>"
      [19,] "interlaced<factor<af15a>, character>" NA                              
      [20,] "interlaced<factor<af15a>, character>" NA                              
      [21,] NA                                     "interlaced<character, logical>"
      [22,] NA                                     "interlaced<character, logical>"
      [23,] NA                                     "interlaced<character, logical>"
      [24,] "interlaced<factor<af15a>, character>" NA                              
      [25,] "interlaced<factor<af15a>, character>" NA                              
            [,22]                            [,23]                          
       [1,] NA                               NA                             
       [2,] NA                               NA                             
       [3,] NA                               NA                             
       [4,] NA                               NA                             
       [5,] NA                               NA                             
       [6,] NA                               NA                             
       [7,] NA                               NA                             
       [8,] NA                               NA                             
       [9,] NA                               NA                             
      [10,] NA                               NA                             
      [11,] NA                               NA                             
      [12,] NA                               NA                             
      [13,] NA                               NA                             
      [14,] NA                               NA                             
      [15,] NA                               NA                             
      [16,] "interlaced<character, integer>" "interlaced<character, double>"
      [17,] "interlaced<character, integer>" "interlaced<character, double>"
      [18,] "interlaced<character, integer>" "interlaced<character, double>"
      [19,] NA                               NA                             
      [20,] NA                               NA                             
      [21,] "interlaced<character, integer>" "interlaced<character, double>"
      [22,] "interlaced<character, integer>" "interlaced<character, double>"
      [23,] "interlaced<character, integer>" "interlaced<character, double>"
      [24,] NA                               NA                             
      [25,] NA                               NA                             
            [,24]                                  [,25]                             
       [1,] NA                                     NA                                
       [2,] NA                                     NA                                
       [3,] NA                                     NA                                
       [4,] NA                                     NA                                
       [5,] NA                                     NA                                
       [6,] NA                                     NA                                
       [7,] NA                                     NA                                
       [8,] NA                                     NA                                
       [9,] NA                                     NA                                
      [10,] NA                                     NA                                
      [11,] NA                                     NA                                
      [12,] NA                                     NA                                
      [13,] NA                                     NA                                
      [14,] NA                                     NA                                
      [15,] NA                                     NA                                
      [16,] NA                                     NA                                
      [17,] NA                                     NA                                
      [18,] NA                                     NA                                
      [19,] "interlaced<character, factor<af15a>>" "interlaced<character, character>"
      [20,] "interlaced<character, factor<af15a>>" "interlaced<character, character>"
      [21,] NA                                     NA                                
      [22,] NA                                     NA                                
      [23,] NA                                     NA                                
      [24,] "interlaced<character, factor<af15a>>" "interlaced<character, character>"
      [25,] "interlaced<character, factor<af15a>>" "interlaced<character, character>"

