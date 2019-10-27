global class ParkServiceMock implements WebServiceMock{

    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = 
            new ParkService.byCountryResponse();
               List<String> countries = new List<String>{'Germany','India','Japan','United States'};
        response_x.return_x = countries;
        // end
        response.put('response_x', response_x); 
   }
}