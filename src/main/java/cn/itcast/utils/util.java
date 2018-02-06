package cn.itcast.utils;
 
import java.util.UUID;

 
  
public final class util {
	public static String createUUID(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

}