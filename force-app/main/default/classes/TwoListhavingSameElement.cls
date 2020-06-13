public class TwoListhavingSameElement {
    public static void checkList(){
         List<Integer> li=new List<Integer>();
        li.add(4);li.add(5);li.add(6);li.add(7);
        li.add(24);li.add(25);li.add(9);li.add(15);
        li.add(2);
        List<Integer> lii=new List<Integer>();
        lii.add(4);lii.add(5);lii.add(6);lii.add(7);
        lii.add(24);lii.add(25);lii.add(9);lii.add(15);
        lii.add(2);
        //li.equals(lii);
        System.debug('list are equals then print true otherwise false=' + li.equals(lii));
    }

}