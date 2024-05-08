import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class BlowFishService {
	
	public static void encrypt(InputStream inStream, FileOutputStream outStream,String keyText) {
		
	    SecretKey secret_key =null;
	    Cipher cipher =null;
	    
		try {
			
	    	secret_key=new SecretKeySpec(keyText.getBytes(),"Blowfish");
	    	
	    	try {
				
	    		cipher=Cipher.getInstance("Blowfish/ECB/PKCS5Padding");
	    		
			} catch (Exception e) {
				
				e.printStackTrace();
			}

			cipher.init(Cipher.ENCRYPT_MODE, secret_key);

			byte[] buffer = new byte[1024];
			
			int len;
			
			while ((len = inStream.read(buffer)) > 0) {
				outStream.write(cipher.update(buffer, 0, len));
				outStream.flush();
			}
			
			outStream.write(cipher.doFinal());
			inStream.close();
			outStream.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void decrypt(FileInputStream inStream, FileOutputStream outStream,String keyText) {

		 SecretKey secret_key =null;
		 Cipher cipher =null;
		    
		try {
			
	    	secret_key=new SecretKeySpec(keyText.getBytes(),"Blowfish");
	    	
	    	try {
				
	    		cipher=Cipher.getInstance("Blowfish/ECB/PKCS5Padding");
	    		
			} catch (Exception e) {
				
				e.printStackTrace();
			}
	    	
			cipher.init(Cipher.DECRYPT_MODE, secret_key);
			
			byte[] buffer = new byte[1024];
			
			int len;
			
			while ((len = inStream.read(buffer)) > 0) {
				outStream.write(cipher.update(buffer, 0, len));
				outStream.flush();
			}
			
			outStream.write(cipher.doFinal());
			inStream.close();
			outStream.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
