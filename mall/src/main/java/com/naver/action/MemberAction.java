package com.naver.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pwdconv.PwdChange;

import com.naver.dao.MemberDAO;
import com.naver.dao.PhoneMailDAO;
import com.naver.dao.ZipcodeDAO;
import com.naver.model.MemberBean;
import com.naver.model.PhoneMailBean;
import com.naver.model.ZipcodeBean;
import com.naver.model.ZipcodeBean2;

@Controller
public class MemberAction {

	private MemberDAO memberService;

	public void setMemberService(MemberDAO memberService) {
		this.memberService = memberService;
	}// setter DI 설정

	private ZipcodeDAO zipcodeService;

	public void setZipcodeService(ZipcodeDAO zipcodeService) {
		this.zipcodeService = zipcodeService;
	}

	private PhoneMailDAO phonemailService;

	public void setPhonemailService(PhoneMailDAO phonemailService) {
		this.phonemailService = phonemailService;
	}// setter DI 설정

	/* List<PhoneMailBean> phone= this.phonemailService.getPhoneList(); */

	/* 아이디 체크 메소드 */
	public int member_check(MemberBean mb) {
		return this.memberService.member_check(mb);
	}

	/* 로그인 페이지 */
	@RequestMapping(value = "/MemberLogin")
	public String member_login(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (request.getParameter("id") != null) {
			out.println("<script>");
			out.println("alert('" + request.getParameter("id")
					+ "님 회원가입이 완료되었습니다')");
			out.println("location='/MemberLogin.do'");
			out.println("</script>");
		}
		return "member/member_login";
	}

	/* 회원 아이디 체크 */
	@RequestMapping(value = "/MemberFind")
	public String MemberFind(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "member/member_find";
	}

	/* 회원 아이디 체크 확인 */
	@RequestMapping(value = "/MemberFindOk")
	public String MemberFindOk(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		MemberBean member = new MemberBean();
		String name = request.getParameter("member_name");
		String jumin1 = request.getParameter("member_jumin1");
		String jumin2 = request.getParameter("member_jumin2");

		member.setMember_name(name);
		member.setMember_jumin1(jumin1);
		member.setMember_jumin2(jumin2);

		member = memberService.findId(member);

		if (member != null) {
			request.setAttribute("id", member.getMember_id());
			request.setAttribute("passwd", member.getMember_pwd());

			return "./member/member_find_ok.jsp";
		} else {

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력한 정보가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}

		return null;
	}

	/* 비번찾기 */
	@RequestMapping(value = "/PwdFind")
	public String pwd_find() {
		return "member/pwd_find";
	}

	/* 비번찾기 결과 */
	@RequestMapping(value = "/PwdFindOk")
	public String pwd_find_ok(@RequestParam("member_id") String pwd_id,
			@RequestParam("member_name") String pwd_name,
			HttpServletResponse response, @ModelAttribute MemberBean pm, Model m)
			throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		pm.setMember_id(pwd_id);
		pm.setMember_name(pwd_name);

		if (member_check(pm) > 0) {// member테이블이 비어있을 때 회원여부 체크
			MemberBean dm = this.memberService.pwd_find(pm);
			System.out.println("????");
			// 아이디와 이름을 기준으로 비번 발번
			if (dm != null) {
				Random r = new Random();
				int random = r.nextInt(100000);// 임시비번 난수 발생
				MemberBean rm = new MemberBean();
				rm.setMember_id(pwd_id);
				rm.setMember_pwd(PwdChange.getPassWordToXEMD5String(Integer
						.toString(random)));// md5로 암호화 해서
				// 임시 비번을 저장,toString()메서드가 정수형 숫자를 문자열로 바꿈.

				this.memberService.edit_pm(rm);// 임시비번 수정

				m.addAttribute("dm", dm);
				m.addAttribute("random", random);// 임시 비번 저장
				return "member/pwd_find";

			} else if (dm == null) {
				System.out.println("!");
				out.println("<script>");
				out.println("alert('회원이 아닙니다!')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('회원이 아닙니다!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

	/* 회원 가입 */
	@RequestMapping(value = "/MemberJoin")
	public String member_join(Model m) {
		List<PhoneMailBean> phone = this.phonemailService.getPhoneList();
		List<PhoneMailBean> email = this.phonemailService.getEmailList();

		m.addAttribute("phone", phone);
		m.addAttribute("email", email);
		return "member/member_join";
	}

	/* 우편 검색 폼 */
	@RequestMapping(value = "/ZipFind")
	public String zip_find() {
		return "member/zip_find";
	}

	/* 우편번호 검색 결과 */
	@RequestMapping(value = "/ZipFindOk")
	public ModelAndView zip_find_ok(@RequestParam("dong") String dong)
			throws Exception {
		List<ZipcodeBean> zlist = this.memberService.zip("%" + dong + "%");

		List<ZipcodeBean2> zlist2 = new ArrayList<ZipcodeBean2>();

		for (ZipcodeBean z : zlist) {// 확장 for

			z.setRi(z.getRi() == null ? "" : z.getRi());
			z.setBunji(z.getBunji() == null ? "" : z.getBunji());

			String addr = z.getSido() + " " + z.getGugun() + " " + z.getDong()
					+ " " + z.getRi() + " " + z.getBunji();// 주소 저장

			ZipcodeBean2 z2 = new ZipcodeBean2();
			z2.setZipcode(z.getZipcode());// 우편번호 저장
			z2.setAdd(addr);// 시도 구군 동을 저장

			zlist2.add(z2);// 컬렉션에 추가
		}
		ModelAndView zm = new ModelAndView("member/zip_find");
		zm.addObject("zipcodelist", zlist2);
		zm.addObject("dong", dong);

		return zm;
	}

	/* 회원가입시 아이디 중복 체크 */
	@RequestMapping(value = "/JoinIDCheck")
	public String join_idcheck(@RequestParam("join_id") String join_id,
			HttpServletResponse response, @ModelAttribute MemberBean db_id)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		db_id = this.memberService.idcheck(join_id);
		// 아이디 중복 체크
		int re = -1;
		if (db_id != null) {
			re = 1;
		}
		out.println(re);// 값이 반환
		return null;
	}

	/* 회원저장 */
	@RequestMapping(value = "/MemberJoinOk")
	public String member_join_ok(@ModelAttribute MemberBean m,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		System.out.println("회원아이디:" + m.getMember_id());
		System.out.println("회원비번:" + m.getMember_pwd());
		System.out.println("회원이름:" + m.getMember_name());
		System.out.println("회원주소:" + m.getMember_zip());
		System.out.println("회원주소2:" + m.getMember_zip2());
		System.out.println("회원주소1:" + m.getMember_addr());
		System.out.println("회원주소2:" + m.getMember_addr2());
		System.out.println("회원전번1:" + m.getMember_phone01());
		System.out.println("회원전번2:" + m.getMember_phone02());
		System.out.println("회원전번3:" + m.getMember_phone03());
		System.out.println("회원email:" + m.getMember_emailid());
		System.out.println("회원domain:" + m.getMember_emaildomain());
		System.out.println("회원del_cont:" + m.getMember_delcont());
		System.out.println("회원del_date:" + m.getMember_deldate());
		System.out.println("회원jumin1:" + m.getMember_jumin1());
		System.out.println("회원jumin2:" + m.getMember_jumin2());
		System.out.println("회원상태:" + m.getMember_state());
		System.out.println("회원admin:" + m.getMember_admin());
		System.out.println("회원탈퇴일자:" + m.getMember_deldate());

		MemberBean db_id = this.memberService.idcheck(m.getMember_id());
		// 중복 아이디 검색
		if (db_id != null) {
			out.println("<script>");
			out.println("alert('중복아이디 입니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			String join_pwd = PwdChange.getPassWordToXEMD5String(m
					.getMember_pwd());
			// 비번을 md5로 암호화 함.
			m.setMember_pwd(join_pwd);
			this.memberService.insertMember(m);// 회원저장
			out.println("<script>");
			out.println("alert('" + m.getMember_id() + "님 회원가입이 완료되었습니다')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		}
		return null;
	}

	/* 로그인 인증 */

	@RequestMapping(value = "/MemberLoginOk")
	public String member_login_ok(@RequestParam("member_id") String login_id,
			@RequestParam("member_pwd") String login_pwd,
			HttpServletResponse response, @ModelAttribute MemberBean db_id,
			HttpSession session, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		db_id = this.memberService.loginCheck(login_id); // 로그인 인증
		if (db_id == null) {
			out.println("<script>");
			out.println("alert('가입 안된 회원입니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			String pwd = PwdChange.getPassWordToXEMD5String(login_pwd); // 입력비번을
																		// MD5로
																		// 암호화
			if (!db_id.getMember_pwd().equals(pwd)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!')");
				out.println("history.go(-1)");
				out.println("</script>");
			} else {
				session.setAttribute("id", login_id);
				System.out.println("go to index.do!");
				return "redirect:/Index.do";
			}
		}
		return null;
	}

	/* 메인 화면 */
	@RequestMapping(value = "/Index")
	public String index(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		System.out.println("come in index.do");
		String id = (String) session.getAttribute("id");
		System.out.println("id:"+id);
		
		boolean isAdm=(this.memberService.IsAdm(id)==1?true:false);//1이면 어드민,2면 일반
		
		System.out.println("isAdmin?"+isAdm);
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			session.setAttribute("admin_id", id); //
			if(isAdm){
				out.println("<script>");
				out.println("alert('관리자 화면으로 이동합니다!')");
				out.println("location='AdminGoodsList.do'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('사용자화면으로 이동합니다!')");
				out.println("location='GoodsList.do?item=new_item'");
				out.println("</script>");
			}
		}
	 return null;
	}

	/* 회원 정보수정 폼 */

	@RequestMapping(value = "/MemberEdit")
	public String member_eidt(HttpServletResponse response,
			HttpSession session, HttpServletRequest request, Model j)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요!')");
			out.println("lcation='MemberLogin.do'");
			out.println("</script>");
		} else {
			List<PhoneMailBean> phone = this.phonemailService.getPhoneList();
			List<PhoneMailBean> email = this.phonemailService.getEmailList();
			j.addAttribute("phone", phone);
			j.addAttribute("email", email);

			MemberBean dm = this.memberService.idcheck(id);
			j.addAttribute("em", dm);
			return "member/member_edit";
		}
		return null;
	}

	/* 회원 정보수정 완료 */

	@RequestMapping(value = "/MemberEditOk")
	public String member_edit_ok(@ModelAttribute MemberBean eb,
			HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요!')");
			out.println("lcation='MemberLogin.do'");
			out.println("</script>");
		} else {
			eb.setMember_id(id);
			String pwd = PwdChange.getPassWordToXEMD5String(eb.getMember_pwd()); // md5로
																					// 암호화
			eb.setMember_pwd(pwd);// 암호화 된 패스워드 저장

			if (this.memberService.editMember(eb) > 0) {// 수정메서드 호출
				out.println("<script>");
				out.println("alert('수정 되었습니다!')");
				out.println("location='MemberLogin.do'");
				out.println("</script>");
			}
		}
		return null;
	}

	/* 로그아웃 */
	@RequestMapping(value = "/MemberLogout")
	public String member_logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		session.invalidate();// 세션 종료

		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!')");
		out.println("location='MemberLogin.do'");
		out.println("</script>");

		return null;
	}

	 /* 회원 탈퇴 폼 */
	 @RequestMapping(value = "/MemberDel") 
	 public String member_del(HttpServletResponse response, 
			 				  HttpServletRequest request,
			 				  HttpSession session, 
			 				  Model dm) throws Exception {
		 response.setContentType("text/html;charset=utf-8"); 
		 PrintWriter out =response.getWriter(); 
		 String id = (String) session.getAttribute("id"); 
	 if(id == null) { 
		 out.println("<script>");
		 out.println("alert('다시 로그인 하세요!')");
		 out.println("location='MemberLogin.do'"); 
		 out.println("</script>"); 
	  }else { 
		 MemberBean name = this.memberService.idcheck(id);
		 dm.addAttribute("name", name.getMember_name()); 
		 return "member/member_del";
	 } 
	 return null; 
	}
	 
	 
	/* 회원탈퇴 */
	@RequestMapping(value = "/MemberDelOk")
	public String member_del_ok(@RequestParam("member_pwd") String del_pwd,
			@RequestParam("member_delcont") String del_cont,
			@ModelAttribute MemberBean db_pwd, HttpServletResponse response,
			HttpServletRequest request, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			db_pwd = this.memberService.idcheck(id);
			String pwd = PwdChange.getPassWordToXEMD5String(del_pwd);
			if (!db_pwd.getMember_pwd().equals(pwd)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				MemberBean dm = new MemberBean();
				dm.setMember_id(id);
				dm.setMember_delcont(del_cont);

				if (this.memberService.delMember(dm)>0) {// 회원탈퇴

					session.invalidate();// 세션만료

					out.println("<script>");
					out.println("alert('회원 탈퇴 했습니다!')");
					out.println("location='MemberLogin.do'");
					out.println("</script>");
				}
			}
		}
		return null;
	}


}
