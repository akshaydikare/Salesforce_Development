public class actionPoller_Demo {
	Integer count = 0;
    
    public PageReference incrementCounter(){
        count++;     
        return null;         
    }
    
    public integer getCount(){
        return count;
    }
}