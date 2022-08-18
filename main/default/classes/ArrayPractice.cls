public class ArrayPractice {
    /*Integer[] in = new Integer[4];  
    in[0] = 10;
      in[1] = 2;
      in[2] = 3;
      in[3] = 4;*/
    public static void Print(){
    Integer[] evenNum = new Integer[]{78,589,8,10,45};    
        
        //system.debug(evenNum[0]);
        
        /*for(integer i=0; i < evenNum.size(); i++ ){
            system.debug(evenNum[i]);
        }*/
        System.debug('----------------------------------------------');
        
        integer min= 0;
        for(integer i=0; i < evenNum.size(); i++ ){
            if(evenNum[i] < evenNum[min]){
                min= i;
            }
        }
        System.debug(evenNum[min]);
    }
}