@isTest
private class ParkLocatorTest {
	
    @isTest static void TestCallOut(){
        Test.setMock(WebServiceMock.Class, new ParkServiceMock());
        String country = 'United States';
       List<String> expectedValue = new List<String>{'Yellowstone', 'Mackinac National Park', 'Yosemite'};
           System.assertEquals(expectedValue, ParkLocator.country(country));
    }
}