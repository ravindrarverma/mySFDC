public class LargestOccurenceElement {
    public static void checkElement(){
        List<Integer> ab=new List<Integer>();
        ab.add(5);
        ab.add(5);ab.add(5);ab.add(3);ab.add(3);ab.add(3);
        ab.add(3);ab.add(3);ab.add(3);ab.add(8);ab.add(55);
        ab.add(8);ab.add(9);ab.add(9);ab.add(9);ab.add(3);
        ab.sort();
        System.debug(ab);
        Integer a=(ab.size()-1);
        System.debug(a);
        Integer maxCounter=1,pstCounter=1; 
        List<Integer> rl1=new List<Integer>();
        for(Integer i=1;i<=a;i++)
        {
            if(ab.get(i)==ab.get(i-1))
                {
              pstCounter++;
                }
            else{
                 if(pstCounter>maxCounter)
                    {
                       maxCounter=pstCounter;
                       rl1.add(ab.get(i-1)); 
                       
                     } 
                
                 pstCounter=1;
                }
            
           }
         System.debug(maxCounter);
         System.debug(rl1);
     }  
  }