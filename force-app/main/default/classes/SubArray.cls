public class SubArray {
    public static void checkSubArray(){
        List<Integer> ab=new List<Integer>();
        ab.add(5);
        ab.add(5);ab.add(5);ab.add(3);ab.add(3);ab.add(3);
        ab.add(3);ab.add(3);ab.add(3);ab.add(8);
        System.debug(ab);
        Integer a=(ab.size()-1);
        System.debug(a);
         List<Integer> rl1=new List<Integer>();
        for(Integer i=0;i<=a;i++){
            for(Integer j=0;j<=i;j++){
                 rl1.add(ab.get(j));
                //System.debug(rl1);
            }
            System.debug(rl1);
            rl1.clear();
            System.debug('');
        }
    }
}