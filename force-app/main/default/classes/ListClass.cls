public class ListClass {
    public static void checkList(){
        List<Integer> li=new List<Integer>();
        li.add(4);
        li.add(24);
        li.add(2);
        li.sort();
       // Integer a =li.size();
       // System.debug(a);
      // Integer lnumber= li.get(a-1);
      //  System.debug('Largest Number of list is'+ lnumber);
      System.debug('Largest Number of list is' + li.get(li.size()-1));
    }
}