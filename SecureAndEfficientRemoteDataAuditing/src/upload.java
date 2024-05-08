import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

@WebServlet("/upload")
public class upload extends HttpServlet {

	File file;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = null;
			PreparedStatement pstm = null;

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/identitybasedremotedata", "root", "root");
			
			Statement mst = con.createStatement();
			ResultSet mrt = mst.executeQuery("SELECT MAX(idupload_file) FROM upload_file");
			
			int max_id=0;
			
			while (mrt.next()) {
				max_id=mrt.getInt(1);
			}
			
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

			diskFileItemFactory.setRepository(file);

			diskFileItemFactory.setSizeThreshold(1 * 1024 * 1024);

			ServletFileUpload newHUpload = new ServletFileUpload(diskFileItemFactory);

			List items = newHUpload.parseRequest(new ServletRequestContext(request));

			Iterator iterator = items.iterator();

			FileItem fileItem = (FileItem) iterator.next();

			HttpSession session1=request.getSession();
			String user=(String)session1.getAttribute("userid");

			InputStream fis=(InputStream)fileItem.getInputStream();

			String sql = "insert into upload_file (userid,file,filename,status)values(?,?,?,?)";
			pstm = con.prepareStatement(sql);
			
			String filename=fileItem.getName();
			System.out.println("Filename 1 :"+filename);
			String[] tokens=filename.split("\\.");
			System.out.println("Len:"+tokens.length);
			filename=tokens[0]+"_"+(max_id+1)+"."+tokens[1];
			System.out.println("Filename 2 :"+filename);

			pstm.setString(1, user);
			pstm.setBinaryStream(2,fis,fileItem.getSize());
			pstm.setString(3,filename);
			pstm.setString(4, "no");

			if(pstm.executeUpdate()==1)
			{
				String path="D:\\appuploads\\"+filename;

				FileOutputStream myos=new FileOutputStream(path);

				Random r=new Random();

				String key="";

				String pattern="ABCDEFGHIJLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

				for(int i=0;i<9;i++)
				{
					key=key+pattern.charAt(r.nextInt(60));

				}

				try {
					
					Statement st = con.createStatement();
					
					ResultSet rt = st
							.executeQuery("select * from identitybasedremotedata.upload_file where status='no' and filename='"+filename+"'");

					while (rt.next()) {
						fis=rt.getBinaryStream("file");
					}
					
					BlowFishService.encrypt(fis, myos,key);
					
					System.out.println("After Encryption...");

				} catch (Exception e) {

					e.printStackTrace();
				}

				if(FileUpload.fileUpload(path))
				{
					PreparedStatement ps = con.prepareStatement("update upload_file set skey='"+ key + "',status='yes' where idupload_file='"+ (max_id+1) + "'");
					ps.execute();

					response.sendRedirect("owner_page.jsp?db='uploaded'");

				}

			}

		}catch(Exception e){

			e.printStackTrace();

		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}
