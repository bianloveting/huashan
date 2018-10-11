package com.bian.spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Component;

@Component
public class FileHandler {
	
	/**
	 * 文件复制
	 * @param srcPath
	 * @param desPath
	 * @return
	 */
	public boolean copyFile(File srcFile, File desFile){
    	boolean result=false;
    	
    	FileInputStream fis=null;
    	FileOutputStream fos=null;
    	
    	
    	//通过缓冲流BufferedInputStream和BufferOutputStream
    	BufferedInputStream bis=null;
    	BufferedOutputStream bos=null;
    	
    	
    	try {
			fis=new FileInputStream(srcFile);
		   	fos=new FileOutputStream(desFile);

	    	bis= new BufferedInputStream(fis);
	    	bos=new BufferedOutputStream(fos);
	    	
	    	byte[] b = new byte[1024];
	    	int len = 0;
	    	
	    	while ((len=bis.read(b)) != -1){
	    		bos.write(b,0,len);
	    		result=true;
	    	}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		} 
    	 finally {
	    	
	    	if(bos != null){
	    		try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
	    	if(bis != null){
	    		try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
	    	
		}
 
       
    	return result;
    			
    	
    }
}
