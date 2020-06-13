public class SumAllNumbersExceptMinAndMax {
    public static void checkList(){
      List<Integer> li=new List<Integer>();
        li.add(4);li.add(5);li.add(6);li.add(7);
        li.add(24);li.add(25);li.add(9);li.add(15);
        li.add(2);
        li.sort(); 
       Integer a =li.size(); //System.debug(a);Integer lnumber= li.get(a-1);
      //  System.debug('Largest Number of list is'+ lnumber);
      System.debug('Minimum Number of list is =' + li.get(0));
      System.debug('Maximum Number of list is =' + li.get(li.size()-1));
        Integer w =li.get(0) + li.get(li.size()-1);
        Integer s=0;
        for(Integer j=0;j<a;j++){
             s = s+ li.get(j);
        }
        System.debug(s);
        System.debug('sum of max and min number=' + w);
        System.debug('sum of the elements in the List<Integer> except minimum and maximum number is='+ (s-w));

       
            
    }
}