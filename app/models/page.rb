class Page < ApplicationRecord
    
    def guideline
        guideline = ["1.1.1 - Non-text Content",
                    "1.2.2 - Captions (Prerecorded)",
                    "1.3.1 - Info and Relationships",
                    "1.3.2 - Meaningful Sequence",
                    "2.1.1 - Keyboard",
                    "2.1.2 - No Keyboard Trap",
                    "2.2.1 - Timing Adjustable",
                    "2.3.1 - Three Flashes or Below Threshold",
                    "2.4.1 - Bypass Blocks",
                    "2.4.2 - Page Titled",
                    "2.4.3 - Focus Order",
                    "2.4.4 - Link Purpose (In Context)",
                    "3.1.1 - Language of Page",
                    "3.2.1 - On Focus",
                    "3.3.2 - Labels or Instructions",
                    "4.1.1 - Parsing",
                    "4.1.2 - Name, Role, Value",
                    "1.4.3 - Contrast (Minimum)",
                    "1.4.4 - Resize text",
                    "1.4.5 - Images of Text",
                    "2.4.6 - Headings and Labels",
                    "3.1.2 - Language of Parts",
                    "3.2.4 - Consistent Identification",
                    "1.4.6 - Contrast (Enhanced)",
                    "1.4.8 - Visual Presentation",
                    "2.1.3 - Keyboard (No Exception)",
                    "2.2.4 - Interruptions",
                    "2.3.2 - Three Flashes",
                    "2.4.10 - Section Headings",
                    "2.4.9 - Link Purpose (Link Only)",
                    "2.5.5 - Target Size",
                    "3.1.4 - Abbreviations",
                    "3.1.5 - Reading Level",
                    "3.2.5 - Change on Request"
                    ]
        return guideline
    end
    
    def hash_issuesWarnings
       issues_warnings = {
                    :"1.1.1" => 0,
                    :"1.2.2" => 0,
                    :"1.3.1" => 0,
                    :"1.3.2" => 0,
                    :"2.1.1" => 0,
                    :"2.1.2" => 0,
                    :"2.2.1" => 0,
                    :"2.3.1" => 0,
                    :"2.4.1" => 0,
                    :"2.4.2" => 0,
                    :"2.4.3" => 0,
                    :"2.4.4" => 0,
                    :"3.1.1" => 0,
                    :"3.2.1" => 0,
                    :"3.3.2" => 0,
                    :"4.1.1" => 0,
                    :"4.1.2" => 0,
                    :"1.4.3" => 0,
                    :"1.4.4" => 0,
                    :"1.4.5" => 0,
                    :"2.4.6" => 0,
                    :"3.1.2" => 0,
                    :"3.2.4" => 0,
                    :"1.4.6" => 0,
                    :"1.4.8" => 0,
                    :"2.1.3" => 0,
                    :"2.2.4" => 0,
                    :"2.3.2" => 0,
                    :"2.4.10" => 0,
                    :"2.4.9" => 0,
                    :"2.5.5" => 0,
                    :"3.1.4" => 0,
                    :"3.1.5" => 0,
                    :"3.2.5" => 0
                }
        return issues_warnings          
    end
    
    #Level A   [0..16]
    #Level AA  [17..22]
    #Level AAA [23..33]
    def levels
        levels = [
                "1.1.1",
                "1.2.2",
                "1.3.1",
                "1.3.2",
                "2.1.1",
                "2.1.2",
                "2.2.1",
                "2.3.1",
                "2.4.1",
                "2.4.2",
                "2.4.3",
                "2.4.4",
                "3.1.1",
                "3.2.1",
                "3.3.2",
                "4.1.1",
                "4.1.2",
                "1.4.3",
                "1.4.4",
                "1.4.5",
                "2.4.6",
                "3.1.2",
                "3.2.4",
                "1.4.6",
                "1.4.8",
                "2.1.3",
                "2.2.4",
                "2.3.2",
                "2.4.10",
                "2.4.9",
                "2.5.5",
                "3.1.4",
                "3.1.5",
                "3.2.5"
            ]
        return levels
    end   
    
    def principles
        principles = [
                    "1.1.1",
                    "1.2.2",
                    "1.3.1",
                    "1.3.2",
                    "1.4.3",
                    "1.4.4",
                    "1.4.5",
                    "1.4.6",
                    "1.4.8",
                    "2.1.1",
                    "2.1.2",
                    "2.1.3",
                    "2.2.1",
                    "2.2.4",
                    "2.3.1",
                    "2.3.2",
                    "2.4.1",
                    "2.4.10",
                    "2.4.2",
                    "2.4.3",
                    "2.4.4",
                    "2.4.6",
                    "2.4.9",
                    "2.5.5",
                    "3.1.1",
                    "3.1.2",
                    "3.1.4",
                    "3.1.5",
                    "3.2.1",
                    "3.2.4",
                    "3.2.5",
                    "3.3.2",
                    "4.1.1",
                    "4.1.2"
                ]
        return principles
    end    
    
    def totalissues(file_name)
    
        data = loadData(file_name)
        totalIS = data.length  
        issues = hash_issuesWarnings
        warnings = hash_issuesWarnings
        for i in 0..totalIS-1
            key = data.keys[i].to_s
            if key  == "error#{i}"
                key = data.values[i].to_sym
                issues[key]= issues[key]+1
            elsif key  == "warning#{i}"
                key = data.values[i].to_sym
                warnings[key]= warnings[key]+1
            end     
        end
        return issues,warnings
    end
    
    
    def compareURL(url1,url2,url3)

        dividedBy = 0
        avTotalError =0
        avIssues = 0
        avWarnings = 0
        report =[]
        
        if(url1!='') 
            report1 = getReport(url1)
            dividedBy+=1
            avTotalError+=report1[0]
            avIssues += report1[1][0]
            avWarnings += report1[1][1]
            report = [report1[1][0],report1[1][1],report1[0]]
        end
        if(url2!='') 
            report2 = getReport(url2)
            dividedBy+=1
            avTotalError+=report2[0]
            avIssues += report2[1][0]
            avWarnings += report2[1][1]
            report = report.concat([report2[1][0],report2[1][1],report2[0]])
        end
        if(url3!='') 
            report3 = getReport(url3)
            dividedBy+=1
            avTotalError+=report3[0]
            avIssues += report3[1][0]
            avWarnings += report3[1][1]
            report = report.concat([report3[1][0],report3[1][1],report3[0]])
        end
        avTotalError = avTotalError / dividedBy
        avIssues = avIssues / dividedBy
        avWarnings = avWarnings / dividedBy
        
        return report,avIssues,avWarnings,avTotalError
        
    end
    
    def getReport(url)
        data = loadData(url)
        totalError = data.length
        totalIssuesWarnings = totalIssuesWarnings(data,totalError)
        return totalError,totalIssuesWarnings
    end    
    
    def loadData(file_name)
            data = File.read(file_name)
            #Transform String(Hash format) into Hash
            data = JSON.parse(data.gsub(':','"').gsub('=>','":'))
        return data     
    end  
    
    
    def totalIssuesWarnings(data,totalError)
        issues = 0
        warnings = 0
        for i in 0..totalError-1
            key = data.keys[i].to_s
            if key  == "error#{i}"
                issues+=1
            elsif key  == "warning#{i}"
                warnings+=1
            end    
        end 
        return issues,warnings
    end
    
    def infoLevels(url1,url2,url3)
        
        report = []
        avErrorA,avErrorAA, avErrorAAA, avWarnA,avWarnAA,avWarnAAA, dividedBy =
        0,0,0,0,0,0,0
        
        if(url1!='') 
            report1 = getReportLevel(url1)
            report = report.concat(report1)
            avErrorA += report1[0]
            avErrorAA += report1[1]
            avErrorAAA += report1[2]
            avWarnA += report1[3]
            avWarnAA += report1[4]
            avWarnAAA += report1[5]
            dividedBy +=1
        end
        if(url2!='') 
            report2 = getReportLevel(url2)
            report = report.concat(report2)
            avErrorA += report2[0]
            avErrorAA += report2[1]
            avErrorAAA += report2[2]
            avWarnA += report2[3]
            avWarnAA += report2[4]
            avWarnAAA += report2[5]
            dividedBy +=1
        end
        if(url3!='') 
            report3 = getReportLevel(url3)
            report = report.concat(report3)
            avErrorA += report3[0]
            avErrorAA += report3[1]
            avErrorAAA += report3[2]
            avWarnA += report3[3]
            avWarnAA += report3[4]
            avWarnAAA += report3[5]
            dividedBy +=1
        end
        
        avErrorA = avErrorA/dividedBy
        avErrorAA = avErrorAA/dividedBy
        avErrorAAA = avErrorAAA/dividedBy
        avWarnA = avWarnA/dividedBy
        avWarnAA = avWarnAA/dividedBy
        avWarnAAA = avWarnAAA/dividedBy
        
        return report,avErrorA,avWarnA,avErrorAA,avWarnAA,avErrorAAA,avWarnAAA
    end   
    
    def getReportLevel(url)
        data = loadData(url)
        totalIssuesWarningsByLevel = totalIssuesWarningsByLevel(data)
        
        return totalIssuesWarningsByLevel
    end 
    

    def totalIssuesWarningsByLevel(data)
        
        j,k,issuesA, issuesAA, issuesAAA, warningA, warningAA, warningAAA = 
        0,0,0,0,0,0,0,0
        error, warning = [],[]
        totalIS = data.length 
        levels =  levels()
        
        for i in 0..totalIS-1
            key = data.keys[i].to_s
           
            if key  == "error#{i}"
                 
                error[j] = data.values[i]
                j+=1
            elsif key  == "warning#{i}"
                warning[k] = data.values[i]
                k+=1
            end     
        end
        
        for i in 0..error.length-1
            j = 0
            while levels[j] != error[i]
               j += 1
            end
            if j <= 16
                issuesA += 1
            elsif (j>=17) && (j<=22)  
                issuesAA += 1
            else 
                issuesAAA += 1
            end    
        end
        
        for i in 0..warning.length-1
            j = 0
            while levels[j] != warning[i]
               j += 1
            end
            if j <= 16
                warningA += 1
            elsif (j>=17) && (j<=22)  
                warningAA += 1
            else 
                warningAAA += 1
            end    
        end
        return issuesA,issuesAA,issuesAAA,warningA,warningAA,warningAAA
    end
    
    def infoPrinciples(url1,url2,url3)
        
        report = []
        avErrorP,avWarnP,avErrorO,avWarnO,avErrorU,avWarnU,avErrorR,avWarnR, dividedBy =
        0,0,0,0,0,0,0,0,0
      
        if url1 !=''
            report1 = getReportPrinciples(url1)
            report = report.concat(report1)
            avErrorP += report1[0]
            avErrorO += report1[2]
            avErrorU += report1[4]
            avErrorR += report1[6]
            avWarnP += report1[1]
            avWarnO += report1[3]
            avWarnU += report1[5]
            avWarnR += report1[7]
            dividedBy +=1
            
        end  
        if url2 !=''
            report2 = getReportPrinciples(url2)
            report = report.concat(report2)
            avErrorP += report2[0]
            avErrorO += report2[2]
            avErrorU += report2[4]
            avErrorR += report2[6]
            avWarnP += report2[1]
            avWarnO += report2[3]
            avWarnU += report2[5]
            avWarnR += report2[7]
            dividedBy +=1
        end  
        if url3 !=''
            report3 = getReportPrinciples(url3)
            report = report.concat(report3)
            avErrorP += report3[0]
            avErrorO += report3[2]
            avErrorU += report3[4]
            avErrorR += report3[6]
            avWarnP += report3[1]
            avWarnO += report3[3]
            avWarnU += report3[5]
            avWarnR += report3[7]
            dividedBy +=1
        end  
        avErrorP = avErrorP/dividedBy
        avErrorO = avErrorO/dividedBy
        avErrorU = avErrorU/dividedBy
        avErrorR = avErrorR/dividedBy
        avWarnP = avWarnP/dividedBy
        avWarnO = avWarnO/dividedBy
        avWarnU = avWarnU/dividedBy
        avWarnR = avWarnR/dividedBy
        
        return report,avErrorP,avWarnP,avErrorO,avWarnO,avErrorU,avWarnU,avErrorR,avWarnR
    end
    
    def getReportPrinciples(url)
        data = loadData(url)
        totalIssuesWarningsByPrinciples = totalIssuesWarningsByPrinciples(data)
       
        return totalIssuesWarningsByPrinciples
    end
    
    def totalIssuesWarningsByPrinciples(data)
         
        j,k,ePerceivable,eOperable,eUnderstandable,eRobust,wPerceivable,wOperable,wUnderstandable,wRobust = 
        0,0,0,0,0,0,0,0,0,0
        error, warning = [],[]
        totalIS = data.length 
        principles =  principles()
        
        for i in 0..totalIS-1
            key = data.keys[i].to_s
           
            if key  == "error#{i}"
                 
                error[j] = data.values[i]
                j+=1
            elsif key  == "warning#{i}"
                warning[k] = data.values[i]
                k+=1
            end     
        end
        
        for i in 0..error.length-1
            j = 0
            while principles[j] != error[i]
               j += 1
            end
            if j <= 8
                ePerceivable += 1
            end    
            if (j>=9) && (j<=23)  
                eOperable += 1
            end    
            if (j>=24) && (j<=31)
                eUnderstandable += 1
            end    
            if (j>=32) && (j<=33)
                eRobust += 1
            end    
        end
        
        for i in 0..warning.length-1
            j = 0
            while principles[j] != warning[i]
               j += 1
            end
            if j <= 8
                wPerceivable += 1
            end    
            if (j>=9) && (j<=23)  
                wOperable += 1
            end    
            if (j>=24) && (j<=31)
                wUnderstandable += 1
            end    
            if (j>=32) && (j<=33)
                wRobust += 1
            end    
        end
        return ePerceivable,wPerceivable,eOperable,wOperable,eUnderstandable,wUnderstandable,eRobust,wRobust
        
    end    


    def charts(length)
      #Bar Chart
      j = 0
      data = []
      for i in 0..length-1 do
        website = [ {
                  :"seriesname" => 'Website ' + (i+1).to_s,
                  :"data" => [
                { :"value" => @totalissues[0][j] },
                { :"value" => @totalissues[0][j+1] },
                { :"value" => @totalissues[0][j+2] },
              ]
            }]
        j += 3      
        data.concat(website)
      end  
      average = [ {
                :"seriesname" => 'Average',
                :"data" => [
                { :"value" => @totalissues[1] },
                { :"value" => @totalissues[2] },
                { :"value" => @totalissues[3] },
              ]
      }]
      data.concat(average)
  
      #First Chart
      
      @chart =
      Fusioncharts::Chart.new(
      {
        width: '600',
        height: '400',
        type: 'mscolumn2d',
        renderAt: 'chartContainer',
        dataSource: {
            :"chart" => {
            :"caption" => 'Amount of Issues and Warnings by Website',
            :"xaxisname" => '',
            :"yaxisname" => '',
            :"formatnumberscale" => '1',
            :"plottooltext" => '',
            :"theme" => 'candy',
            :"drawcrossline" => '1'
          },
          :"categories" => [
            {
              :"category" => [
                { :"label" => 'Issues' },
                { :"label" => 'Warnings' },
                { :"label" => 'Total Error' },
              ]
            }
          ],
          :"dataset" => data
        }
      }
      )
      
      
      
      #Second Chart
      a = @allLevels[1] + @allLevels[2]
      aa = @allLevels[3] + @allLevels[4]
      aaa = @allLevels[5] + @allLevels[6]
      @chart2 =
      Fusioncharts::Chart.new(
      {
        width: '600',
        height: '400',
        type: 'pie3d',
        renderAt: 'chartContainer2',
        dataSource: {
        "chart": {
          "caption": "Average of Issues and Warnings by Level",
          "captionFontSize": "18",
          "captionFontColor": "#FFFFFF",
          "captionFontBold": "1",
          "numberPrefix": "Total of Error:",
          "showPercentInTooltip": "0",
          "decimals": "1",
          "baseFontSize": "16",
          "bgColor": "#000000",
          "legendposition" => 'bottom',
          "showLegend": "1",
          "useDataPlotColorForLabels": "1",
          "theme": "fusion"
        },
        "data": [
            {
                "label": "Level A",
                "value": a
            },
            {
                "label": "Level AA",
                "value": aa
            },
            {
                "label": "Level AAA",
                "value": aaa
            }
          ]
        }
      }
      ) 
      
      @chart3 =
        Fusioncharts::Chart.new(
          {
            width: '600',
            height: '400',
            type: 'pie2d',
            renderAt: 'chartContainer3',
            dataSource: {
              :"chart" => {
                :"caption" => 'Average by Principles (Issues)',
                :"captionFontSize" => "18",
                :"baseFontSize" => "16",
                :"showpercentvalues" => '1',
                :"usedataplotcolorforlabels" => '1',
                :"theme" => 'fusion',
                :"pieRadius"=> "93"
              },
              :"data" => [
                { :"label" => 'Perceivable', :"value" => @allPrinciples[1]  },
                { :"label" => 'Operable', :"value" => @allPrinciples[3] },
                { :"label" => 'Understandable', :"value" => @allPrinciples[5]  },
                { :"label" => 'Robust', :"value" => @allPrinciples[7]  }
              ]
            }
          }
        ) 
        
        @chart4 =
        Fusioncharts::Chart.new(
          {
            width: '600',
            height: '400',
            type: 'pie2d',
            renderAt: 'chartContainer4',
            dataSource: {
              :"chart" => {
                :"caption" => 'Average by Principles (Warnings)',
                :"captionFontSize" => "18",
                :"baseFontSize" => "16",
                :"showpercentvalues" => '1',
                :"usedataplotcolorforlabels" => '1',
                :"theme" => 'fusion',
                :"pieRadius"=> "93"
  
              },
              :"data" => [
                { :"label" => 'Perceivable', :"value" => @allPrinciples[2] },
                { :"label" => 'Operable', :"value" => @allPrinciples[4]  },
                { :"label" => 'Understandable', :"value" => @allPrinciples[6] },
                { :"label" => 'Robust', :"value" => @allPrinciples[8] }
              ]
            }
          }
        ) 
    end
    
end
