package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaginationServlet extends HttpServlet {
	Connection con;
	Statement stmt;
	private static final long serialVersionUID = 1L;

	public PaginationServlet() {
		super();
	}

	@Override
	public void init() throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sada", "root", "root");
			System.out.println("connection opend");
			stmt = con.createStatement(1005, 1007);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		process(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	public void distroy() {
		try {
			stmt.close();
			con.close();
			System.out.println("Connection closed");
		} catch (Exception e) {

		}
	}

	public void process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		int pageNumber = 0;
		int totalNumberOfRecords = 0;
		int recordPerPage = 3;
		int startIndex = 0;
		int numberOfPages = 0;
		/*
		 * read pageNumber parameter wrap it into integer store it in page
		 * number variable
		 */
		String sPageNo = req.getParameter("pageno");
		pageNumber = Integer.parseInt(sPageNo);
		try {
			// find starting point to display the records select employee from
			// table move the cursor to starting point use loop and display
			// employee on browser (3 employee)
			startIndex = (pageNumber * recordPerPage) - recordPerPage + 1;
			
			ResultSet rs1 = stmt.executeQuery("select * from emp");
			PrintWriter pw = res.getWriter();
			pw.println("<center><table border=3>");
			pw.println("<tr>");
			pw.println("<b>");
			pw.println("<th>empno</th><th>ename</th><th>sal</th><th>deptno</th>");
			pw.println("</b>");
			pw.println("</tr>");
			rs1.absolute(startIndex);
			int i = 0;
			do {
				i++;
				pw.println("<tr>");
				pw.println("<td>" + rs1.getString(1) + "</td>");
				pw.println("<td>" + rs1.getString(2) + "</td>");
				pw.println("<td>" + rs1.getString(3) + "</td>");
				pw.println("<td>" + rs1.getString(4) + "</td>");
				pw.println("</tr>");
			} while (rs1.next() && i != recordPerPage);
			pw.println("</table>");
			rs1.close();

			// find total number of records in table store it in total number of
			// records variable
			ResultSet rs2 = stmt.executeQuery("select count(*) from emp");
			rs2.next();
			totalNumberOfRecords = rs2.getInt(1);
			rs2.close();

			// find number of pages if total number of records os not exactly
			// divisible then increamene number of page by one
			numberOfPages = totalNumberOfRecords / recordPerPage;
			if (totalNumberOfRecords > numberOfPages * recordPerPage) {
				numberOfPages = numberOfPages + 1;
			}

			// display hyperlinks for each page to view the records
			for (int k = 1; k <= numberOfPages; k++) {
				pw.println("<b><a href=ps?pageno=" + k + ">" + k + "</a></b>");
				pw.println("&nbsp;&nbsp;&nbsp;&nbsp;");
			}
			pw.println("</center>");
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

