import java.io.File;

import Cloudme.CloudmeFolderNode;
import Cloudme.CloudmeUser;

public class FileDownload {

	public static synchronized boolean fileDownload(String filepath)
	{
		System.out.println("1:"+new File(filepath).getName());
		System.out.println("11:"+filepath);
		try
        {
			CloudmeUser user = new CloudmeUser("tkrc4","tkrcet@c4");
			
			CloudmeFolderNode node = user.getFolderManager().getFolderTree();
			
			for(CloudmeFolderNode n : node.getChildren()){
				
				if(n.getFolder().getName().equals("audit"))
				{
					n.getFolder().getFile(new File(filepath).getName()).downloadFile(filepath);
					
					return true;
				}
			}
			
			user.killUser();
	    }
		catch(Exception e)
		{
			e.printStackTrace();
			
			return false;
		}
		
		return false;
	}
}
