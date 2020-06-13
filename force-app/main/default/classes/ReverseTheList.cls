public class ReverseTheList {
    public static void checkReverseList(){
        List<Integer> rl=new List<Integer>();
        rl.add(5);
        rl.add(8);
        rl.add(89);
        rl.add(67);
        System.debug(rl);
        Integer a=(rl.size()-1);
        System.debug(a);
        List<Integer> rl1=new List<Integer>();
        for(Integer i=a;i>=0;i--){
             rl1.add(rl.get(i));
            // System.debug(rl.get(i));
             
        }
        System.debug(rl1);
    }
}