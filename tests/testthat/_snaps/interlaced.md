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

