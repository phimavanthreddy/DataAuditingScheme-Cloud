import Cloudme.CloudmeFolderNode;
import Cloudme.CloudmeUser;

public class FileUpload {

	public static synchronized boolean fileUpload(String filePath)
	{
		try {
		
			CloudmeUser user = new CloudmeUser("tkrc4","tkrcet@c4");
			
			CloudmeFolderNode node = user.getFolderManager().getFolderTree();
			
			for(CloudmeFolderNode n : node.getChildren()){
			
				if(n.getFolder().getName().equals("audit"))
				{
					n.getFolder().uploadFile(filePath);
				}
			}		
				
			user.killUser();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
