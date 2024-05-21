# interlaced type coercion is symmetric and unchanging

    Code
      mat
    Output
                           interlaced<lgl, int>   interlaced<lgl, int>  
      interlaced<lgl, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<lgl, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<lgl, fct>   interlaced<lgl, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<lgl, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<int, int>   interlaced<int, int>  
      interlaced<lgl, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<lgl, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<int, fct>   interlaced<int, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<lgl, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<dbl, int>   interlaced<dbl, int>  
      interlaced<lgl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<lgl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<int, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<dbl, fct>   interlaced<dbl, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<lgl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<int, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<fct, int>   interlaced<fct, int>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> "interlaced<fct, int>" "interlaced<fct, int>"
      interlaced<fct, int> "interlaced<fct, int>" "interlaced<fct, int>"
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<chr, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<fct, fct>   interlaced<fct, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> "interlaced<fct, fct>" "interlaced<fct, fct>"
      interlaced<fct, fct> "interlaced<fct, fct>" "interlaced<fct, fct>"
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<chr, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
                           interlaced<chr, int>   interlaced<chr, int>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<fct, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<chr, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<chr, fct>   interlaced<chr, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<fct, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<chr, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"

# base type coercion is symmetric and unchanging

    Code
      mat
    Output
                           logical                integer               
      interlaced<lgl, int> "interlaced<lgl, int>" "interlaced<int, int>"
      interlaced<lgl, int> "interlaced<lgl, int>" "interlaced<int, int>"
      interlaced<lgl, fct> "interlaced<lgl, fct>" "interlaced<int, fct>"
      interlaced<lgl, fct> "interlaced<lgl, fct>" "interlaced<int, fct>"
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           double                 factor<af15a>         
      interlaced<lgl, int> "interlaced<dbl, int>" NA                    
      interlaced<lgl, int> "interlaced<dbl, int>" NA                    
      interlaced<lgl, fct> "interlaced<dbl, fct>" NA                    
      interlaced<lgl, fct> "interlaced<dbl, fct>" NA                    
      interlaced<int, int> "interlaced<dbl, int>" NA                    
      interlaced<int, int> "interlaced<dbl, int>" NA                    
      interlaced<int, fct> "interlaced<dbl, fct>" NA                    
      interlaced<int, fct> "interlaced<dbl, fct>" NA                    
      interlaced<dbl, int> "interlaced<dbl, int>" NA                    
      interlaced<dbl, int> "interlaced<dbl, int>" NA                    
      interlaced<dbl, fct> "interlaced<dbl, fct>" NA                    
      interlaced<dbl, fct> "interlaced<dbl, fct>" NA                    
      interlaced<fct, int> NA                     "interlaced<fct, int>"
      interlaced<fct, int> NA                     "interlaced<fct, int>"
      interlaced<fct, fct> NA                     "interlaced<fct, fct>"
      interlaced<fct, fct> NA                     "interlaced<fct, fct>"
      interlaced<chr, int> NA                     "interlaced<chr, int>"
      interlaced<chr, int> NA                     "interlaced<chr, int>"
      interlaced<chr, fct> NA                     "interlaced<chr, fct>"
      interlaced<chr, fct> NA                     "interlaced<chr, fct>"
                           character             
      interlaced<lgl, int> NA                    
      interlaced<lgl, int> NA                    
      interlaced<lgl, fct> NA                    
      interlaced<lgl, fct> NA                    
      interlaced<int, int> NA                    
      interlaced<int, int> NA                    
      interlaced<int, fct> NA                    
      interlaced<int, fct> NA                    
      interlaced<dbl, int> NA                    
      interlaced<dbl, int> NA                    
      interlaced<dbl, fct> NA                    
      interlaced<dbl, fct> NA                    
      interlaced<fct, int> "interlaced<chr, int>"
      interlaced<fct, int> "interlaced<chr, int>"
      interlaced<fct, fct> "interlaced<chr, fct>"
      interlaced<fct, fct> "interlaced<chr, fct>"
      interlaced<chr, int> "interlaced<chr, int>"
      interlaced<chr, int> "interlaced<chr, int>"
      interlaced<chr, fct> "interlaced<chr, fct>"
      interlaced<chr, fct> "interlaced<chr, fct>"

---

    Code
      mat2
    Output
                    interlaced<lgl, int>   interlaced<lgl, int>  
      logical       "interlaced<lgl, int>" "interlaced<lgl, int>"
      integer       "interlaced<int, int>" "interlaced<int, int>"
      double        "interlaced<dbl, int>" "interlaced<dbl, int>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<lgl, fct>   interlaced<lgl, fct>  
      logical       "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      integer       "interlaced<int, fct>" "interlaced<int, fct>"
      double        "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<int, int>   interlaced<int, int>  
      logical       "interlaced<int, int>" "interlaced<int, int>"
      integer       "interlaced<int, int>" "interlaced<int, int>"
      double        "interlaced<dbl, int>" "interlaced<dbl, int>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<int, fct>   interlaced<int, fct>  
      logical       "interlaced<int, fct>" "interlaced<int, fct>"
      integer       "interlaced<int, fct>" "interlaced<int, fct>"
      double        "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<dbl, int>   interlaced<dbl, int>  
      logical       "interlaced<dbl, int>" "interlaced<dbl, int>"
      integer       "interlaced<dbl, int>" "interlaced<dbl, int>"
      double        "interlaced<dbl, int>" "interlaced<dbl, int>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<dbl, fct>   interlaced<dbl, fct>  
      logical       "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      integer       "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      double        "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<fct, int>   interlaced<fct, int>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<fct, int>" "interlaced<fct, int>"
      character     "interlaced<chr, int>" "interlaced<chr, int>"
                    interlaced<fct, fct>   interlaced<fct, fct>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<fct, fct>" "interlaced<fct, fct>"
      character     "interlaced<chr, fct>" "interlaced<chr, fct>"
                    interlaced<chr, int>   interlaced<chr, int>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<chr, int>" "interlaced<chr, int>"
      character     "interlaced<chr, int>" "interlaced<chr, int>"
                    interlaced<chr, fct>   interlaced<chr, fct>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<chr, fct>" "interlaced<chr, fct>"
      character     "interlaced<chr, fct>" "interlaced<chr, fct>"

# base type casting unwraps / lifts and is unchanging

    Code
      lifts
    Output
                    interlaced<lgl, int>   interlaced<lgl, int>  
      logical       "interlaced<lgl, int>" "interlaced<lgl, int>"
      integer       "interlaced<lgl, int>" "interlaced<lgl, int>"
      double        "interlaced<lgl, int>" "interlaced<lgl, int>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<lgl, fct>   interlaced<lgl, fct>  
      logical       "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      integer       "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      double        "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<int, int>   interlaced<int, int>  
      logical       "interlaced<int, int>" "interlaced<int, int>"
      integer       "interlaced<int, int>" "interlaced<int, int>"
      double        "interlaced<int, int>" "interlaced<int, int>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<int, fct>   interlaced<int, fct>  
      logical       "interlaced<int, fct>" "interlaced<int, fct>"
      integer       "interlaced<int, fct>" "interlaced<int, fct>"
      double        "interlaced<int, fct>" "interlaced<int, fct>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<dbl, int>   interlaced<dbl, int>  
      logical       "interlaced<dbl, int>" "interlaced<dbl, int>"
      integer       "interlaced<dbl, int>" "interlaced<dbl, int>"
      double        "interlaced<dbl, int>" "interlaced<dbl, int>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<dbl, fct>   interlaced<dbl, fct>  
      logical       "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      integer       "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      double        "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      factor<af15a> NA                     NA                    
      character     NA                     NA                    
                    interlaced<fct, int>   interlaced<fct, int>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<fct, int>" "interlaced<fct, int>"
      character     "interlaced<fct, int>" "interlaced<fct, int>"
                    interlaced<fct, fct>   interlaced<fct, fct>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<fct, fct>" "interlaced<fct, fct>"
      character     "interlaced<fct, fct>" "interlaced<fct, fct>"
                    interlaced<chr, int>   interlaced<chr, int>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<chr, int>" "interlaced<chr, int>"
      character     "interlaced<chr, int>" "interlaced<chr, int>"
                    interlaced<chr, fct>   interlaced<chr, fct>  
      logical       NA                     NA                    
      integer       NA                     NA                    
      double        NA                     NA                    
      factor<af15a> "interlaced<chr, fct>" "interlaced<chr, fct>"
      character     "interlaced<chr, fct>" "interlaced<chr, fct>"

---

    Code
      unwraps
    Output
                           logical   integer   double   factor<af15a>   character  
      interlaced<lgl, int> "logical" "integer" "double" NA              NA         
      interlaced<lgl, int> "logical" "integer" "double" NA              NA         
      interlaced<lgl, fct> "logical" "integer" "double" NA              NA         
      interlaced<lgl, fct> "logical" "integer" "double" NA              NA         
      interlaced<int, int> "logical" "integer" "double" NA              NA         
      interlaced<int, int> "logical" "integer" "double" NA              NA         
      interlaced<int, fct> "logical" "integer" "double" NA              NA         
      interlaced<int, fct> "logical" "integer" "double" NA              NA         
      interlaced<dbl, int> "logical" "integer" "double" NA              NA         
      interlaced<dbl, int> "logical" "integer" "double" NA              NA         
      interlaced<dbl, fct> "logical" "integer" "double" NA              NA         
      interlaced<dbl, fct> "logical" "integer" "double" NA              NA         
      interlaced<fct, int> NA        NA        NA       "factor<af15a>" "character"
      interlaced<fct, int> NA        NA        NA       "factor<af15a>" "character"
      interlaced<fct, fct> NA        NA        NA       "factor<af15a>" "character"
      interlaced<fct, fct> NA        NA        NA       "factor<af15a>" "character"
      interlaced<chr, int> NA        NA        NA       "factor<af15a>" "character"
      interlaced<chr, int> NA        NA        NA       "factor<af15a>" "character"
      interlaced<chr, fct> NA        NA        NA       "factor<af15a>" "character"
      interlaced<chr, fct> NA        NA        NA       "factor<af15a>" "character"

# interlaced type casting is unchanging

    Code
      mat
    Output
                           interlaced<lgl, int>   interlaced<lgl, int>  
      interlaced<lgl, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<lgl, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<int, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<dbl, int> "interlaced<lgl, int>" "interlaced<lgl, int>"
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<lgl, fct>   interlaced<lgl, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<lgl, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<int, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<dbl, fct> "interlaced<lgl, fct>" "interlaced<lgl, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<int, int>   interlaced<int, int>  
      interlaced<lgl, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<lgl, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<dbl, int> "interlaced<int, int>" "interlaced<int, int>"
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<int, fct>   interlaced<int, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<lgl, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<int, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<dbl, fct> "interlaced<int, fct>" "interlaced<int, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<dbl, int>   interlaced<dbl, int>  
      interlaced<lgl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<lgl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<int, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, int> "interlaced<dbl, int>" "interlaced<dbl, int>"
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<dbl, fct>   interlaced<dbl, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<lgl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<int, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<dbl, fct> "interlaced<dbl, fct>" "interlaced<dbl, fct>"
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<fct, int>   interlaced<fct, int>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> "interlaced<fct, int>" "interlaced<fct, int>"
      interlaced<fct, int> "interlaced<fct, int>" "interlaced<fct, int>"
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> "interlaced<fct, int>" "interlaced<fct, int>"
      interlaced<chr, int> "interlaced<fct, int>" "interlaced<fct, int>"
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<fct, fct>   interlaced<fct, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> "interlaced<fct, fct>" "interlaced<fct, fct>"
      interlaced<fct, fct> "interlaced<fct, fct>" "interlaced<fct, fct>"
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> "interlaced<fct, fct>" "interlaced<fct, fct>"
      interlaced<chr, fct> "interlaced<fct, fct>" "interlaced<fct, fct>"
                           interlaced<chr, int>   interlaced<chr, int>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<fct, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<fct, fct> NA                     NA                    
      interlaced<fct, fct> NA                     NA                    
      interlaced<chr, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<chr, int> "interlaced<chr, int>" "interlaced<chr, int>"
      interlaced<chr, fct> NA                     NA                    
      interlaced<chr, fct> NA                     NA                    
                           interlaced<chr, fct>   interlaced<chr, fct>  
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, int> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<lgl, fct> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, int> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<int, fct> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, int> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<dbl, fct> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, int> NA                     NA                    
      interlaced<fct, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<fct, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, int> NA                     NA                    
      interlaced<chr, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"
      interlaced<chr, fct> "interlaced<chr, fct>" "interlaced<chr, fct>"

