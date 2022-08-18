public class ReturnTypeHelper {
    public Integer salary =50000;
    public Decimal bonus =10000;
    public Decimal totalSalary{get; set;}
    public Decimal Calculate(Integer age, Decimal exp){
        if(age >= 40 && exp >=10){
             //return 'Employee salary is = '+salary+ 'Rs And bonus = '+bonus+' Rs';
             totalSalary = salary + bonus;//60000
        }
        else{
			//return 'Employee salary is = '+ salary *  0.6+' Rs And bonus = ' + bonus * 0.5 +' Rs';
             totalSalary =  (salary *  0.6) + (bonus * 0.5);//35000
        }
        return totalSalary;
    }
}