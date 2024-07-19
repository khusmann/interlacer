# cfactor type coercion is unchanging

    Code
      mat
    Output
                         logical   integer   double   character  
      logical            "logical" "integer" "double" NA         
      integer            "integer" "integer" "double" NA         
      double             "double"  "double"  "double" NA         
      character          NA        NA        NA       "character"
      factor<4d52a>      NA        NA        NA       "character"
      factor<38051>      NA        NA        NA       "character"
      factor<af15a>      NA        NA        NA       "character"
      factor<dc80e>      NA        NA        NA       "character"
      cfactor<int+22f9f> NA        NA        NA       "character"
      cfactor<int+d3b05> NA        NA        NA       "character"
      cfactor<int+14e2f> NA        NA        NA       "character"
      cfactor<int+c6214> NA        NA        NA       "character"
      cfactor<int+7aea3> NA        NA        NA       "character"
      cfactor<int+cb0a5> NA        NA        NA       "character"
      cfactor<int+ac835> NA        NA        NA       "character"
      cfactor<int+471fa> NA        NA        NA       "character"
      cfactor<chr+94e2a> NA        NA        NA       "character"
      cfactor<chr+f84d5> NA        NA        NA       "character"
      cfactor<chr+f4edf> NA        NA        NA       "character"
      cfactor<chr+5b271> NA        NA        NA       "character"
      cfactor<chr+a1722> NA        NA        NA       "character"
      cfactor<chr+23595> NA        NA        NA       "character"
      cfactor<chr+1e0d5> NA        NA        NA       "character"
      cfactor<chr+1b2ef> NA        NA        NA       "character"
                         factor<4d52a>        factor<38051>       
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "factor<4d52a>"      "factor<38051>"     
      factor<38051>      "factor<38051>"      "factor<38051>"     
      factor<af15a>      "factor<af15a>"      "factor<af15a>"     
      factor<dc80e>      "factor<122ed>"      "factor<e0a9c>"     
      cfactor<int+22f9f> "cfactor<int+22f9f>" "factor<38051>"     
      cfactor<int+d3b05> "cfactor<int+d3b05>" "cfactor<int+d3b05>"
      cfactor<int+14e2f> "cfactor<int+14e2f>" "cfactor<int+14e2f>"
      cfactor<int+c6214> "factor<122ed>"      "factor<e0a9c>"     
      cfactor<int+7aea3> "cfactor<int+7aea3>" "factor<38051>"     
      cfactor<int+cb0a5> "cfactor<int+cb0a5>" "cfactor<int+cb0a5>"
      cfactor<int+ac835> "cfactor<int+ac835>" "cfactor<int+ac835>"
      cfactor<int+471fa> "factor<122ed>"      "factor<e0a9c>"     
      cfactor<chr+94e2a> "cfactor<chr+94e2a>" "factor<38051>"     
      cfactor<chr+f84d5> "cfactor<chr+f84d5>" "cfactor<chr+f84d5>"
      cfactor<chr+f4edf> "cfactor<chr+f4edf>" "cfactor<chr+f4edf>"
      cfactor<chr+5b271> "factor<122ed>"      "factor<e0a9c>"     
      cfactor<chr+a1722> "cfactor<chr+a1722>" "factor<38051>"     
      cfactor<chr+23595> "cfactor<chr+23595>" "cfactor<chr+23595>"
      cfactor<chr+1e0d5> "cfactor<chr+1e0d5>" "cfactor<chr+1e0d5>"
      cfactor<chr+1b2ef> "factor<122ed>"      "factor<e0a9c>"     
                         factor<af15a>        factor<dc80e>       
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "factor<af15a>"      "factor<38d3d>"     
      factor<38051>      "factor<af15a>"      "factor<b746a>"     
      factor<af15a>      "factor<af15a>"      "factor<8781e>"     
      factor<dc80e>      "factor<d46d4>"      "factor<dc80e>"     
      cfactor<int+22f9f> "factor<af15a>"      "factor<38d3d>"     
      cfactor<int+d3b05> "factor<af15a>"      "factor<b746a>"     
      cfactor<int+14e2f> "cfactor<int+14e2f>" "factor<8781e>"     
      cfactor<int+c6214> "factor<d46d4>"      "cfactor<int+c6214>"
      cfactor<int+7aea3> "factor<af15a>"      "factor<38d3d>"     
      cfactor<int+cb0a5> "factor<af15a>"      "factor<b746a>"     
      cfactor<int+ac835> "cfactor<int+ac835>" "factor<8781e>"     
      cfactor<int+471fa> "factor<d46d4>"      "cfactor<int+471fa>"
      cfactor<chr+94e2a> "factor<af15a>"      "factor<38d3d>"     
      cfactor<chr+f84d5> "factor<af15a>"      "factor<b746a>"     
      cfactor<chr+f4edf> "cfactor<chr+f4edf>" "factor<8781e>"     
      cfactor<chr+5b271> "factor<d46d4>"      "cfactor<chr+5b271>"
      cfactor<chr+a1722> "factor<af15a>"      "factor<38d3d>"     
      cfactor<chr+23595> "factor<af15a>"      "factor<b746a>"     
      cfactor<chr+1e0d5> "cfactor<chr+1e0d5>" "factor<8781e>"     
      cfactor<chr+1b2ef> "factor<d46d4>"      "cfactor<chr+1b2ef>"
                         cfactor<int+22f9f>   cfactor<int+d3b05>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<int+22f9f>" "cfactor<int+d3b05>"
      factor<38051>      "factor<38051>"      "cfactor<int+d3b05>"
      factor<af15a>      "factor<af15a>"      "factor<af15a>"     
      factor<dc80e>      "factor<38d3d>"      "factor<b746a>"     
      cfactor<int+22f9f> "cfactor<int+22f9f>" "cfactor<int+d3b05>"
      cfactor<int+d3b05> "cfactor<int+d3b05>" "cfactor<int+d3b05>"
      cfactor<int+14e2f> "cfactor<int+14e2f>" "cfactor<int+14e2f>"
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> "cfactor<int+b417b>" "cfactor<int+6f66f>"
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> "cfactor<chr+7490c>" "cfactor<chr+87ffd>"
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> "cfactor<chr+c9016>" "cfactor<chr+c7552>"
                         cfactor<int+14e2f>   cfactor<int+c6214>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<int+14e2f>" "factor<122ed>"     
      factor<38051>      "cfactor<int+14e2f>" "factor<e0a9c>"     
      factor<af15a>      "cfactor<int+14e2f>" "factor<d46d4>"     
      factor<dc80e>      "factor<8781e>"      "cfactor<int+c6214>"
      cfactor<int+22f9f> "cfactor<int+14e2f>" NA                  
      cfactor<int+d3b05> "cfactor<int+14e2f>" NA                  
      cfactor<int+14e2f> "cfactor<int+14e2f>" NA                  
      cfactor<int+c6214> NA                   "cfactor<int+c6214>"
      cfactor<int+7aea3> NA                   "cfactor<int+d7fef>"
      cfactor<int+cb0a5> NA                   "cfactor<int+e0b26>"
      cfactor<int+ac835> NA                   "cfactor<int+18541>"
      cfactor<int+471fa> "cfactor<int+16862>" NA                  
      cfactor<chr+94e2a> NA                   "cfactor<chr+048be>"
      cfactor<chr+f84d5> NA                   "cfactor<chr+25ec9>"
      cfactor<chr+f4edf> NA                   "cfactor<chr+75461>"
      cfactor<chr+5b271> "cfactor<chr+1b001>" NA                  
      cfactor<chr+a1722> NA                   "cfactor<chr+e505f>"
      cfactor<chr+23595> NA                   "cfactor<chr+4550f>"
      cfactor<chr+1e0d5> NA                   "cfactor<chr+bc60e>"
      cfactor<chr+1b2ef> "cfactor<chr+8992b>" NA                  
                         cfactor<int+7aea3>   cfactor<int+cb0a5>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<int+7aea3>" "cfactor<int+cb0a5>"
      factor<38051>      "factor<38051>"      "cfactor<int+cb0a5>"
      factor<af15a>      "factor<af15a>"      "factor<af15a>"     
      factor<dc80e>      "factor<38d3d>"      "factor<b746a>"     
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> "cfactor<int+82f74>" "cfactor<int+753b8>"
      cfactor<int+7aea3> "cfactor<int+7aea3>" "cfactor<int+cb0a5>"
      cfactor<int+cb0a5> "cfactor<int+cb0a5>" "cfactor<int+cb0a5>"
      cfactor<int+ac835> "cfactor<int+ac835>" "cfactor<int+ac835>"
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> "cfactor<chr+8cf4a>" "cfactor<chr+a473a>"
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> "cfactor<chr+41176>" "cfactor<chr+ddc45>"
                         cfactor<int+ac835>   cfactor<int+471fa>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<int+ac835>" "factor<122ed>"     
      factor<38051>      "cfactor<int+ac835>" "factor<e0a9c>"     
      factor<af15a>      "cfactor<int+ac835>" "factor<d46d4>"     
      factor<dc80e>      "factor<8781e>"      "cfactor<int+471fa>"
      cfactor<int+22f9f> NA                   "cfactor<int+ea3f3>"
      cfactor<int+d3b05> NA                   "cfactor<int+4df87>"
      cfactor<int+14e2f> NA                   "cfactor<int+1b417>"
      cfactor<int+c6214> "cfactor<int+e20a0>" NA                  
      cfactor<int+7aea3> "cfactor<int+ac835>" NA                  
      cfactor<int+cb0a5> "cfactor<int+ac835>" NA                  
      cfactor<int+ac835> "cfactor<int+ac835>" NA                  
      cfactor<int+471fa> NA                   "cfactor<int+471fa>"
      cfactor<chr+94e2a> NA                   "cfactor<chr+f5417>"
      cfactor<chr+f84d5> NA                   "cfactor<chr+03a0d>"
      cfactor<chr+f4edf> NA                   "cfactor<chr+4c088>"
      cfactor<chr+5b271> "cfactor<chr+23f35>" NA                  
      cfactor<chr+a1722> NA                   "cfactor<chr+d3e1c>"
      cfactor<chr+23595> NA                   "cfactor<chr+708bb>"
      cfactor<chr+1e0d5> NA                   "cfactor<chr+9fe96>"
      cfactor<chr+1b2ef> "cfactor<chr+6744e>" NA                  
                         cfactor<chr+94e2a>   cfactor<chr+f84d5>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<chr+94e2a>" "cfactor<chr+f84d5>"
      factor<38051>      "factor<38051>"      "cfactor<chr+f84d5>"
      factor<af15a>      "factor<af15a>"      "factor<af15a>"     
      factor<dc80e>      "factor<38d3d>"      "factor<b746a>"     
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> "cfactor<chr+8eeb6>" "cfactor<chr+f9aa9>"
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> "cfactor<chr+dcfde>" "cfactor<chr+19f8d>"
      cfactor<chr+94e2a> "cfactor<chr+94e2a>" "cfactor<chr+f84d5>"
      cfactor<chr+f84d5> "cfactor<chr+f84d5>" "cfactor<chr+f84d5>"
      cfactor<chr+f4edf> "cfactor<chr+f4edf>" "cfactor<chr+f4edf>"
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> "cfactor<chr+ce070>" "cfactor<chr+1e0d8>"
                         cfactor<chr+f4edf>   cfactor<chr+5b271>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<chr+f4edf>" "factor<122ed>"     
      factor<38051>      "cfactor<chr+f4edf>" "factor<e0a9c>"     
      factor<af15a>      "cfactor<chr+f4edf>" "factor<d46d4>"     
      factor<dc80e>      "factor<8781e>"      "cfactor<chr+5b271>"
      cfactor<int+22f9f> NA                   "cfactor<chr+af905>"
      cfactor<int+d3b05> NA                   "cfactor<chr+f972f>"
      cfactor<int+14e2f> NA                   "cfactor<chr+e7389>"
      cfactor<int+c6214> "cfactor<chr+9b6ba>" NA                  
      cfactor<int+7aea3> NA                   "cfactor<chr+fb2be>"
      cfactor<int+cb0a5> NA                   "cfactor<chr+b4de1>"
      cfactor<int+ac835> NA                   "cfactor<chr+4675e>"
      cfactor<int+471fa> "cfactor<chr+93ce2>" NA                  
      cfactor<chr+94e2a> "cfactor<chr+f4edf>" NA                  
      cfactor<chr+f84d5> "cfactor<chr+f4edf>" NA                  
      cfactor<chr+f4edf> "cfactor<chr+f4edf>" NA                  
      cfactor<chr+5b271> NA                   "cfactor<chr+5b271>"
      cfactor<chr+a1722> NA                   "cfactor<chr+6bbdb>"
      cfactor<chr+23595> NA                   "cfactor<chr+f3383>"
      cfactor<chr+1e0d5> NA                   "cfactor<chr+27f12>"
      cfactor<chr+1b2ef> "cfactor<chr+1d4f6>" NA                  
                         cfactor<chr+a1722>   cfactor<chr+23595>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<chr+a1722>" "cfactor<chr+23595>"
      factor<38051>      "factor<38051>"      "cfactor<chr+23595>"
      factor<af15a>      "factor<af15a>"      "factor<af15a>"     
      factor<dc80e>      "factor<38d3d>"      "factor<b746a>"     
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> "cfactor<chr+361d1>" "cfactor<chr+3c5db>"
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> "cfactor<chr+5e083>" "cfactor<chr+005ec>"
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> "cfactor<chr+ead0c>" "cfactor<chr+f8fd3>"
      cfactor<chr+a1722> "cfactor<chr+a1722>" "cfactor<chr+23595>"
      cfactor<chr+23595> "cfactor<chr+23595>" "cfactor<chr+23595>"
      cfactor<chr+1e0d5> "cfactor<chr+1e0d5>" "cfactor<chr+1e0d5>"
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<chr+1e0d5>   cfactor<chr+1b2ef>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          "character"          "character"         
      factor<4d52a>      "cfactor<chr+1e0d5>" "factor<122ed>"     
      factor<38051>      "cfactor<chr+1e0d5>" "factor<e0a9c>"     
      factor<af15a>      "cfactor<chr+1e0d5>" "factor<d46d4>"     
      factor<dc80e>      "factor<8781e>"      "cfactor<chr+1b2ef>"
      cfactor<int+22f9f> NA                   "cfactor<chr+2c645>"
      cfactor<int+d3b05> NA                   "cfactor<chr+245de>"
      cfactor<int+14e2f> NA                   "cfactor<chr+c7065>"
      cfactor<int+c6214> "cfactor<chr+f5ca0>" NA                  
      cfactor<int+7aea3> NA                   "cfactor<chr+afcf0>"
      cfactor<int+cb0a5> NA                   "cfactor<chr+c8abd>"
      cfactor<int+ac835> NA                   "cfactor<chr+65aec>"
      cfactor<int+471fa> "cfactor<chr+88899>" NA                  
      cfactor<chr+94e2a> NA                   "cfactor<chr+92e27>"
      cfactor<chr+f84d5> NA                   "cfactor<chr+5f5e9>"
      cfactor<chr+f4edf> NA                   "cfactor<chr+88a45>"
      cfactor<chr+5b271> "cfactor<chr+c9f69>" NA                  
      cfactor<chr+a1722> "cfactor<chr+1e0d5>" NA                  
      cfactor<chr+23595> "cfactor<chr+1e0d5>" NA                  
      cfactor<chr+1e0d5> "cfactor<chr+1e0d5>" NA                  
      cfactor<chr+1b2ef> NA                   "cfactor<chr+1b2ef>"

# cfactor type casting is unchanging

    Code
      mat
    Output
                         logical   integer   double   character   factor<4d52a>  
      logical            "logical" "integer" "double" NA          NA             
      integer            "logical" "integer" "double" NA          NA             
      double             "logical" "integer" "double" NA          NA             
      character          NA        NA        NA       "character" "factor<4d52a>"
      factor<4d52a>      NA        NA        NA       "character" "factor<4d52a>"
      factor<38051>      NA        NA        NA       "character" "factor<4d52a>"
      factor<af15a>      NA        NA        NA       "character" "factor<4d52a>"
      factor<dc80e>      NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+22f9f> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+d3b05> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+14e2f> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+c6214> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+7aea3> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+cb0a5> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+ac835> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<int+471fa> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+94e2a> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+f84d5> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+f4edf> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+5b271> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+a1722> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+23595> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+1e0d5> NA        NA        NA       "character" "factor<4d52a>"
      cfactor<chr+1b2ef> NA        NA        NA       "character" "factor<4d52a>"
                         factor<38051>   factor<af15a>   factor<dc80e>  
      logical            NA              NA              NA             
      integer            NA              NA              NA             
      double             NA              NA              NA             
      character          "factor<38051>" "factor<af15a>" "factor<dc80e>"
      factor<4d52a>      "factor<38051>" "factor<af15a>" "factor<dc80e>"
      factor<38051>      "factor<38051>" "factor<af15a>" "factor<dc80e>"
      factor<af15a>      "factor<38051>" "factor<af15a>" "factor<dc80e>"
      factor<dc80e>      "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+22f9f> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+d3b05> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+14e2f> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+c6214> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+7aea3> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+cb0a5> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+ac835> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<int+471fa> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+94e2a> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+f84d5> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+f4edf> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+5b271> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+a1722> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+23595> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+1e0d5> "factor<38051>" "factor<af15a>" "factor<dc80e>"
      cfactor<chr+1b2ef> "factor<38051>" "factor<af15a>" "factor<dc80e>"
                         cfactor<int+22f9f>   cfactor<int+d3b05>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<int+22f9f>" "cfactor<int+d3b05>"
      factor<38051>      NA                   "cfactor<int+d3b05>"
      factor<af15a>      NA                   NA                  
      factor<dc80e>      NA                   NA                  
      cfactor<int+22f9f> "cfactor<int+22f9f>" "cfactor<int+d3b05>"
      cfactor<int+d3b05> NA                   "cfactor<int+d3b05>"
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<int+14e2f>   cfactor<int+c6214>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<int+14e2f>" NA                  
      factor<38051>      "cfactor<int+14e2f>" NA                  
      factor<af15a>      "cfactor<int+14e2f>" NA                  
      factor<dc80e>      NA                   "cfactor<int+c6214>"
      cfactor<int+22f9f> "cfactor<int+14e2f>" NA                  
      cfactor<int+d3b05> "cfactor<int+14e2f>" NA                  
      cfactor<int+14e2f> "cfactor<int+14e2f>" NA                  
      cfactor<int+c6214> NA                   "cfactor<int+c6214>"
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<int+7aea3>   cfactor<int+cb0a5>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<int+7aea3>" "cfactor<int+cb0a5>"
      factor<38051>      NA                   "cfactor<int+cb0a5>"
      factor<af15a>      NA                   NA                  
      factor<dc80e>      NA                   NA                  
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> "cfactor<int+7aea3>" "cfactor<int+cb0a5>"
      cfactor<int+cb0a5> NA                   "cfactor<int+cb0a5>"
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<int+ac835>   cfactor<int+471fa>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<int+ac835>" NA                  
      factor<38051>      "cfactor<int+ac835>" NA                  
      factor<af15a>      "cfactor<int+ac835>" NA                  
      factor<dc80e>      NA                   "cfactor<int+471fa>"
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> "cfactor<int+ac835>" NA                  
      cfactor<int+cb0a5> "cfactor<int+ac835>" NA                  
      cfactor<int+ac835> "cfactor<int+ac835>" NA                  
      cfactor<int+471fa> NA                   "cfactor<int+471fa>"
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<chr+94e2a>   cfactor<chr+f84d5>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<chr+94e2a>" "cfactor<chr+f84d5>"
      factor<38051>      NA                   "cfactor<chr+f84d5>"
      factor<af15a>      NA                   NA                  
      factor<dc80e>      NA                   NA                  
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> "cfactor<chr+94e2a>" "cfactor<chr+f84d5>"
      cfactor<chr+f84d5> NA                   "cfactor<chr+f84d5>"
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<chr+f4edf>   cfactor<chr+5b271>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<chr+f4edf>" NA                  
      factor<38051>      "cfactor<chr+f4edf>" NA                  
      factor<af15a>      "cfactor<chr+f4edf>" NA                  
      factor<dc80e>      NA                   "cfactor<chr+5b271>"
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> "cfactor<chr+f4edf>" NA                  
      cfactor<chr+f84d5> "cfactor<chr+f4edf>" NA                  
      cfactor<chr+f4edf> "cfactor<chr+f4edf>" NA                  
      cfactor<chr+5b271> NA                   "cfactor<chr+5b271>"
      cfactor<chr+a1722> NA                   NA                  
      cfactor<chr+23595> NA                   NA                  
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<chr+a1722>   cfactor<chr+23595>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<chr+a1722>" "cfactor<chr+23595>"
      factor<38051>      NA                   "cfactor<chr+23595>"
      factor<af15a>      NA                   NA                  
      factor<dc80e>      NA                   NA                  
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> "cfactor<chr+a1722>" "cfactor<chr+23595>"
      cfactor<chr+23595> NA                   "cfactor<chr+23595>"
      cfactor<chr+1e0d5> NA                   NA                  
      cfactor<chr+1b2ef> NA                   NA                  
                         cfactor<chr+1e0d5>   cfactor<chr+1b2ef>  
      logical            NA                   NA                  
      integer            NA                   NA                  
      double             NA                   NA                  
      character          NA                   NA                  
      factor<4d52a>      "cfactor<chr+1e0d5>" NA                  
      factor<38051>      "cfactor<chr+1e0d5>" NA                  
      factor<af15a>      "cfactor<chr+1e0d5>" NA                  
      factor<dc80e>      NA                   "cfactor<chr+1b2ef>"
      cfactor<int+22f9f> NA                   NA                  
      cfactor<int+d3b05> NA                   NA                  
      cfactor<int+14e2f> NA                   NA                  
      cfactor<int+c6214> NA                   NA                  
      cfactor<int+7aea3> NA                   NA                  
      cfactor<int+cb0a5> NA                   NA                  
      cfactor<int+ac835> NA                   NA                  
      cfactor<int+471fa> NA                   NA                  
      cfactor<chr+94e2a> NA                   NA                  
      cfactor<chr+f84d5> NA                   NA                  
      cfactor<chr+f4edf> NA                   NA                  
      cfactor<chr+5b271> NA                   NA                  
      cfactor<chr+a1722> "cfactor<chr+1e0d5>" NA                  
      cfactor<chr+23595> "cfactor<chr+1e0d5>" NA                  
      cfactor<chr+1e0d5> "cfactor<chr+1e0d5>" NA                  
      cfactor<chr+1b2ef> NA                   "cfactor<chr+1b2ef>"

