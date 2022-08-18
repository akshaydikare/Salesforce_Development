public class EncapsulationDemo {
    private integer AtmPin=1001;
    private string UserId;
    Private string Password;
    Private decimal balance=0;
    private boolean IsLoggedIn =False;
    public class Encapsulationexception extends Exception {}
    
    public EncapsulationDemo()
    {
      this.UserID='Shweta1';
        this.Password = 'Rainbow7';
    }
    
    public Boolean CheckLOgin(String UI, String Pass){
       Boolean result;
          if(this.UserId==UI && this.Password==Pass)
        {
           
            //system.debug('You have successfully logged in...');
            result = true;
            this.IsLoggedIn = true;
            System.debug(this.IsLoggedIn);
           // setAtmPin(1001,2001,2001);
        }
        else{
           // system.debug('Login Failed!, You have got problem logged in...');
               result = false;
            this.IsLoggedIn = true;
            
        }
        return result;
    }
    
    
    Public void Unauthorizeduser()
    {
        if(this.Isloggedin = false)
        {
            throw new Encapsulationexception('Unauthorised Access....');   
        }
        
    }
    public decimal getbalance()
    {
        Unauthorizeduser();
        return this.balance;
    }
    public void setbalance(decimal amount)
    {
        balance=this.balance+amount;
    }
    
    public decimal getAtmPin()
    {
        Unauthorizeduser();
        return this.AtmPin;
    }
    
    

    public void setAtmPin(integer currentPin, Integer newPin, Integer confirmPin)
    {
        if(this.AtmPin!=currentPin)
        {
            throw new Encapsulationexception('You have entered incorrect PIN');
        }
        else if(newPin!=confirmPin)
        {
            throw new Encapsulationexception('New PIN and Confirm PIN should be same');
        }
        
        else if (this.AtmPin==currentPin && newPin==confirmPin)
        {
            this.AtmPin= newPin;
            system.debug('Pin Changed with NewPin: '+ newPin);
        }
    
    }
    public void display()
    {
        system.debug('Your New ATM Pin: '+ AtmPin);
        system.debug('Updated Balance: '+balance);
    }
}