package kh.ajax.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import first.member.model.service.MemberService;
import first.member.model.vo.Member;
import first.member.model.vo.Member2;

/**
 * Servlet implementation class AjaxTestServlet
 */
@WebServlet("/ajaxtest")
public class AjaxTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTestServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String source = request.getParameter("source");
		System.out.println(source);
		
		Member2 m2 = new Member2();
		m2.setMlist(new MemberService().selectSearch("id", source));
//		ArrayList<Member> searchlist = new MemberService().selectSearch("id", source);
		
		//예시 1. VO Class->json
//		Member vo = new Member("aaa", "bbb", "ccc", "ddd", "22", 'f', null);
		Gson gson =new GsonBuilder().create();
//		String json = gson.toJson(searchlist);
		String json = gson.toJson(m2.getMlist());
		System.out.println(json);     
		
		//예시 2. Json String -> VO class
		String str = "{'id':'aaa','passwd':'bbb','name':'ccc','email':'ddd','grade':'22','gender':'f'}";
		Gson  gson2 = new GsonBuilder().create();
		Member vo2 = gson2.fromJson(str, Member.class);
//		vo2.toString();
		System.out.println(vo2);
		
		
		//예시 3. String 자체가 json 포맷을 띠고 있음.
		String str2 = "{\"id\" :\"jack\" , \"nane\":\"jackson\" }";
		String str3 ="{title: 'member', list :{m1 : ['a1','a2'], m2 : ['b1','b2']}}";
		JsonParser p1 = new JsonParser();
		JsonArray root =p1.parse(str3).getAsJsonArray();
		
		out.println(str2);
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
