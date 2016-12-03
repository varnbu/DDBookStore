package com.ddbook.util;

import java.util.Date;

public class StringUtil {

	public static String getOrderId(){
		String orderid = new Date().getTime()+"";
		return orderid;
	}
	
	
}
