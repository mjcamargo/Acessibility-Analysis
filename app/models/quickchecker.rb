class Quickchecker < ApplicationRecord
    require 'analyser'
    require 'securerandom'

    #Check and call the analysis necessary
    def validate_this(url1,url2,url3)
        @info = []
        @file_nameR = SecureRandom.alphanumeric(10)
        #Checking URLs    
        if (url1 != '')
            getReport(url1,'1') 
        end  
        if (url2 != '')
            getReport(url2,'2') 
        end 
        if (url3 != '')
            getReport(url3,'3')  
        end   
        return @info, @file_nameR
    end    
    
    #Call Tenon.IO to get the analysis result
    # 
    def getReport(url,pos)
    
        
        data = UrlAnalyser.tenon(url)
        info2 = Hash.new
        code = JSON.parse(data)["code"]
        
        puts code
        
        if code == 'success' 
    
            issues = JSON.parse(data)["resultSummary"]["issues"]
            totalIssues = issues["totalIssues"]
            totalErrors = issues["totalErrors"]
            totalWarnings = issues["totalWarnings"]
            
            @info.push(pos)
            @info.push(totalIssues)
            @info.push(totalErrors)
            @info.push(totalWarnings)
    
            resultSet = JSON.parse(data)
           
            for i in 0..totalIssues-1
                standards = "" 
                standards  = resultSet["resultSet"][i]["standards"][0]
                if standards != nil
                    standards = standards.match(/(\d.\d.\d)/)
                else
                    standards =  ["1.1.1"]
                end 
                if resultSet["resultSet"][i]["certainty"] == 100
                    info2[:"error#{i}"] = standards[0]
                else
                    info2[:"warning#{i}"] = standards[0]
                end
            end
            
        #Save the data on fyle 
        
            file_nameR = @file_nameR + '_url'+pos
            open('file/'+file_nameR+'.txt', 'w') do |f|
                    f <<  info2
            end  
        end    
    end   
    
    def countUrl(url2,url3)
        
        count = 1
        if url2 != '' 
            count+=1
        end    
        if url3 != '' 
            count+=1
        end  
        return count
    end    
end

