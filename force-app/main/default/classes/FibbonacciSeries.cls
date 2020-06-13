public class FibbonacciSeries {
    public static void checkFibonacciSeries(){
        Integer i=0,j=1;
        for(Integer k=1;k<=10;k++){
            Integer z=i+j;
            i=j;
            j=z;
            System.debug(z);
        }
    }
}