public class StringIsGreaterThan10InLength {
    public static void checkString(){
        String myStr = 'abcdefghijklmn';
        Integer len = myStr.length();
        System.debug(len);
        if(len>10){
            System.debug('String is greater than 10');
            }
        else{
            System.debug('String is not greater than 10');
        }
    }
    
}