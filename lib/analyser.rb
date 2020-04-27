module UrlAnalyser

    include HTTParty

    def self.tenon(url)
        key = 'YOUR KEY'
        tenon_uri= 'https://tenon.io/api/'
        projectID = 'YPUR PROJECT ID (OPTIONAL)'

        tenon_response = HTTParty.post(tenon_uri, body: { url: url, key: key, projectID: projectID},
                                                   headers: { 'Content-Type'  => 'application/x-www-form-urlencoded',
                                                              'Cache-Control' => 'no-cache' },timeout: 100)
             
        return tenon_response.body
    end    
end


