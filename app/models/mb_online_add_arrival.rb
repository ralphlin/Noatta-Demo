class MbOnlineAddArrival
  attr_reader :status, :message

  def initialize(mbid)
    client = Savon::Client.new("http://clients.mindbodyonline.com/api/0_5/ClientService.asmx?WSDL")
	response = client.request :_5, :add_arrival, body: { "Request" => { "SourceCredentials" => { "SourceName" => "MbiusFit", "Password" => "Fitness101", "SiteIDs" => { "int" => "21050" }}, "XMLDetail" => "Full", "PageSize" => "1000", "CurrentPageIndex" => "1", "ClientID" => mbid, "LocationID" => "1"}}
	if response.success?
      data = response.to_array(:add_arrival_response,:add_arrival_result).first
      if data
        @status = data[:status] # could be "Success" or "InvalidParameters"
        @message = data[:message] # "Client XXX does not exist."
      end
    end
  end
end
