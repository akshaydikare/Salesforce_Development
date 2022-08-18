@isTest
global class ParkServiceMock implements WebServiceMock {
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
            ParkService.byCountryResponse countryParkSvc = new ParkService.byCountryResponse();
            countryParkSvc.return_x = new List<String>{'Yellowstone', 'Mackinac National Park', 'Yosemite'};
            response.put('response_x', countryParkSvc); 
        }
}