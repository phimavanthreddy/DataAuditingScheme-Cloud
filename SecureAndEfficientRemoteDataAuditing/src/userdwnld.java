import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userdownload")
public class userdwnld extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();

		try {
			
			String userID=(String)request.getSession().getAttribute("userid");
			
			String isDownloaded="no";

			String path = "D:\\appdownloads\\";

			String file=request.getParameter("file");

			String key=request.getParameter("key");
			
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/identitybasedremotedata", "root","root");

			Statement st = con.createStatement();

			int count=0;
			
			String userid=(String)request.getSession().getAttribute("userid");
			
			System.out.println(file+"\t"+userid);
			
			ResultSet rt2 = st.executeQuery("select * from access where filename='"+file+"' and username='"+userid+"'");
			
			boolean isHavingAccess=false;

			while(rt2.next())
			{
				System.out.println("in while verified..");
				isHavingAccess=true;
			}

			if(isHavingAccess)
			{
				ResultSet rt1 = st.executeQuery("select count(*) from upload_file where filename='"+file+"' and skey='"+key+"'");

				while(rt1.next())
				{
					count=rt1.getInt(1);
				}

				if(count==1)
				{
					if (FileDownload.fileDownload(path+request.getParameter("file"))) {

						FileInputStream fis=new FileInputStream(path+request.getParameter("file"));

						FileOutputStream fos=new FileOutputStream(path+"new"+request.getParameter("file"));

						try {
							BlowFishService.decrypt(fis, fos,key);
						} catch (Throwable e) {
							e.printStackTrace();
						}

						response.setContentType("text/html");    
						response.setContentType("APPLICATION/OCTET-STREAM");   
						response.setHeader("Content-Disposition","attachment; filename=\"" +request.getParameter("file")+ "\"");   

						FileInputStream fileInputStream = new FileInputStream(path+"new"+request.getParameter("file"));  

						int i;   
						while ((i=fileInputStream.read()) != -1) {  
							out.write(i);   
						}   
					
						fileInputStream.close();   
						out.close();   
						
						isDownloaded="yes";
					}
				}
				else
				{
					isDownloaded="in valid key";
				}
				
				st.executeUpdate("insert into auditingresults(username,filename,filekey,isDownloaded) values('"+userID+"','"+file+"','"+key+"','"+isDownloaded+"')");
				
				response.sendRedirect("user_download.jsp?dwnn="+isDownloaded);
			}
			else
			{
				response.sendRedirect("user_download.jsp?dwnn=failed");
			}
		
		}  catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}
