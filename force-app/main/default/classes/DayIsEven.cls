public class DayIsEven {
    public static void checkDayEven(){
        Date myDate = Date.today();
        Integer day = myDate.day();
        System.debug(day);
        if(math.mod(day, 2)==0){
            System.debug('day is even');
            }
        else{
            System.debug('day is odd');
        }
        
    }
}