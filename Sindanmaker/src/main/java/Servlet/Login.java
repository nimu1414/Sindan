package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginLogic;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name =request.getParameter("name");

		//Userインスタンスの生成
		User user = new User(name);

		//ログイン処理
		LoginLogic loginLogic = new LoginLogic();
		boolean isLogin = loginLogic.execute(user);
		//ログイン成功
		if (isLogin) {
//			Sindan sindan = new Sindan();
//			String job = sindan.SindanJob();
//			String weapon = sindan.SindanWeapon();
//			String jobId = sindan.SindanJobId(job);
//			System.out.println(job);
//			System.out.println(jobId);
//			System.out.println(weapon);
//			user.setJob(job);
//			user.setWeapon(weapon);
//			user.setJobId(jobId);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", user);

		}
		//ログイン結果画面にフォワード
		RequestDispatcher dis =
				request.getRequestDispatcher("SindanServlet");
		dis.forward(request, response);

	}

}
