public class Class_AggregateResult {
    public static void print(){
        AggregateResult  a = [Select SUM(Amount) from Opportunity];
        System.debug(a);
    }
    
}