@isTest
public class SeeAllDataTest {
	@isTest(SeeAllData =true)
    static void SeeAllData1(){
        List<account> accList = [Select Id, Name, Rating, Industry from Account Limit 15];
        system.assertEquals(15, accList.size());
    }
}