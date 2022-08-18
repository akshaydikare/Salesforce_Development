@isTest
private class EventUtilityTest {
    @isTest static void TestEventStatusLenghth(){
        String res = EventUtility.EventPrority('IND');
        System.assertEquals(null, res);
    }
    @isTest static void TestHighPriority(){
        String res = EventUtility.EventPrority('CA');
        System.assertEquals('High', res);
    }
    @isTest static void TestMediumPriority(){
        String res = EventUtility.EventPrority('LA');
        System.assertEquals('Medium', res);
    }
}