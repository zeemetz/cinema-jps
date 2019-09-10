/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import java.security.MessageDigest;

/**
 *
 * @author Kelvin
 */
public class Md5 {
    String getHash(String passwd) {
        StringBuffer hashedpasswd = new StringBuffer();
        try {
                MessageDigest alg = MessageDigest.getInstance("MD5");
                alg.reset();
                alg.update(passwd.getBytes());			
                byte[] digest = alg.digest();			
                String hx;
                for (int i=0;i<digest.length;i++){
                        hx =  Integer.toHexString(0xFF & digest[i]);
                        //0x03 is equal to 0x3, but we need 0x03 for our md5sum
                        if(hx.length() == 1){hx = "0" + hx;} 
                        hashedpasswd.append(hx);
                }			
        }
        catch(Exception e) {
                e.printStackTrace();
        }
        return hashedpasswd.toString();
    }      
}
