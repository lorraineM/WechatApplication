import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
	public static void main(String[] args){
		/*String ss="1411812395000";
		Date date = new Date(Long.parseLong(ss));  
	    
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		  
		System.out.println("毫秒数转化后的时间为："+ sdf.format(date));  */
		String ss1 = "2014-09-27 18:06:35";
		System.out.println(ss1.substring(0,1));
		System.out.println(ss1.substring(11,15));
	}
}
