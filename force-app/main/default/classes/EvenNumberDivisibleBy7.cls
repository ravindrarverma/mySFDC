public class EvenNumberDivisibleBy7 {
    public static void checkNumber(){
        for(Integer i=0;i<=100;i++){
            if(math.mod(i, 2)==0 && math.mod(i, 7)==0){
                System.debug(i);
            }
        }
    }

}