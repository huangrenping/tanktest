<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.activity.Huodong"%>
<%@ page import = "web.webSocket.activity2.Activity2Manager"%>
<%@ page import = "web.webSocket.message.MessageManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.util.Util"%>

<%@ page import = "java.io.BufferedWriter"%>
<%@ page import = "java.io.File"%>
<%@ page import = "java.io.FileWriter"%>
<%@ page import = "java.io.IOException"%>
<% 
		String data=System.currentTimeMillis()+"\r\n";
		File file =new File("/data/javalog/1-2016-12-11.txt");
		if(!file.exists()){
			try {
				file.createNewFile();
				file.setReadable(true, false);
				file.setExecutable(true, false);
				file.setWritable(true, false);
				file.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 FileWriter fileWritter;
		try {
			fileWritter = new FileWriter(file.getName(),true);
	        BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
	        bufferWritter.write(data);
	        bufferWritter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("#####2");	

	
%>