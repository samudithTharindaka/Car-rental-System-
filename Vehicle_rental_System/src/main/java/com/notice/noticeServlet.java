package com.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class notice1Servlet
 */
@WebServlet("/noticeServlet")
public class noticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		if ("addNotice".equals(task)) {
			
			String msg = request.getParameter("notice");
			response.getWriter().print(msg);
			notice1 n1= new notice1(msg);
			boolean res = noticeUtil.addNotice(n1);
			if(res) {
				response.getWriter().print("Added");
				request.setAttribute("message", "successfully Added");
				RequestDispatcher dis = request.getRequestDispatcher("moderatorAddsNotice.jsp");
				dis.forward(request, response);
			}else {
				response.getWriter().print("not");
				request.setAttribute("message", "Insert failed");
				RequestDispatcher dis = request.getRequestDispatcher("moderatorAddsNotice.jsp");
				dis.forward(request, response);
			}
		}
		if ("updateNotice".equals(task)) {
			String newmsg = request.getParameter("notice");
			String id = request.getParameter("noticeid");
			
			notice1 n1 = new notice1(newmsg);
			
			boolean res = noticeUtil.updateNotice(n1,id);
			
			if(res) {
				response.getWriter().print("updated");
				request.setAttribute("message", "updated");
				RequestDispatcher dis = request.getRequestDispatcher("moderatorUpdatesNotice.jsp?id="+id+"&msg="+newmsg);
				dis.forward(request, response);
			}
			
			
			
		}
		if ("viewNotice".equals(task)) {
			List<notice1> noticeList = noticeUtil.getAllNotices();
			response.getWriter().print("hi");
			if(!noticeList.isEmpty()) {
				request.setAttribute("notices",noticeList);
				RequestDispatcher dis = request.getRequestDispatcher("moderatorSseeNotice.jsp");
				dis.forward(request, response);
			}
		}
		if ("deleteNotice".equals(task)) {
			String id = request.getParameter("noticeId");
			boolean res=noticeUtil.deleteNoticeById(id);
			
			if(res) {
				List<notice1> noticeList = noticeUtil.getAllNotices();
				request.setAttribute("notices",noticeList);
				RequestDispatcher dis = request.getRequestDispatcher("moderatorSseeNotice.jsp?res=deleted");
				dis.forward(request, response);
			
			}
			
		}
		
	}



}
