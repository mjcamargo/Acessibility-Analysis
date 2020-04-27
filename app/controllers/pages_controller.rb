class PagesController < ApplicationController
  def home
  end
  
  def report
   @report = Page.new
   url = params[:url]
   pos = params[:pos]
   file_name = 'file/'+url+'_url'+pos+'.txt'
   @totalissues = @report.totalissues(file_name) 
  end 
  
  def compare
    @report = Page.new
    
    count = params[:count]
    url = params[:url]
    
    if count == "2" 
      file1 = 'file/'+url+'_url1.txt'
      file2 = 'file/'+url+'_url2.txt'
      @totalissues = @report.compareURL(file1,file2,'')
      @allLevels = @report.infoLevels(file1,file2,'')
      @allPrinciples = @report.infoPrinciples(file1,file2,'') 
    elsif count == "3"
      file1 = 'file/'+url+'_url1.txt'
      file2 = 'file/'+url+'_url2.txt'
      file3 = 'file/'+url+'_url3.txt'
      @totalissues = @report.compareURL(file1,file2,file3)
      @allLevels = @report.infoLevels(file1,file2,file3)
      @allPrinciples = @report.infoPrinciples(file1,file2,'') 
    else
      respond_to do |format|
        format.html { redirect_to '/quickchecker', notice: "Invalid Comparation. Try again, please" }
      end
    end
    if (@totalissues != nil) && (@allLevels !=nil) && (@allPrinciples!=nil)
      #Bar Chart
      length = (@totalissues[0].length / 3)
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
  
end