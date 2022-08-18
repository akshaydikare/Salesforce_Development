public class Apex_Messages_Example {
    
    public Apex_Messages_Example(){
        Apexpages.Message msg1 = new Apexpages.Message(Apexpages.Severity.CONFIRM, 'CONFIRM');
        Apexpages.Message msg2 = new Apexpages.Message(Apexpages.Severity.ERROR, 'ERROR');
        Apexpages.Message msg3 = new Apexpages.Message(Apexpages.Severity.WARNING, 'WARNING');
        Apexpages.Message msg4 = new Apexpages.Message(Apexpages.Severity.INFO, 'INFO');
     	Apexpages.Message msg5 = new Apexpages.Message(Apexpages.Severity.FATAL, 'FATAL');
        
            Apexpages.addMessage(msg1);
            Apexpages.addMessage(msg2);
            Apexpages.addMessage(msg3);
            Apexpages.addMessage(msg4);
     		Apexpages.addMessage(msg5);
    }
	
}