package com.naver.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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

import com.naver.dao.AdminGoodsDAO;
import com.naver.dao.CategoryDAO;
import com.naver.dao.MemberDAO;
import com.naver.model.CategoryBean;
import com.naver.model.GoodsBean;
import com.naver.model.MemberBean;
import com.oreilly.servlet.MultipartRequest;

@Controller
public class AdminGoodsAction {
	/* 관리자 상품  */
	private AdminGoodsDAO admingoodsService;
	public void setAdmingoodsService(AdminGoodsDAO admingoodsService) {
		this.admingoodsService = admingoodsService;
	}//setter DI
	
	/* 회원 */
	private MemberDAO memberService;
	public void setMemberService(MemberDAO memberService) {
		this.memberService = memberService;
	}// setter DI 설정
	
	/* 상품카테고리 */
	private CategoryDAO categoryService;
	public void setCategoryService(CategoryDAO categoryService) {
		this.categoryService = categoryService;
	}//category setter DI
	
/*	 카테고리 출력 메소드 
	public List<CategoryBean> getCategory(){
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		return clist;
	}*/
	
	/* 관리자 로그인 */
	@RequestMapping(value="/AdminLoginOk")
	public String adminLoginOk(HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session,
								@ModelAttribute GoodsBean b,
								Model listM
								) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		session = request.getSession();

		System.out.println("여기로!");
		
//		String admin_id = (String) session.getAttribute("admin_id");
		String admin_id = request.getParameter("admin_id");
		
		System.out.println("admin_id:"+admin_id);
		
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			
			request.setAttribute("admin_id", admin_id);
		MemberBean mb =this.memberService.idcheck(admin_id);
		
			int page=1;
			int limit=5;
		 if(request.getParameter("page")!=null){
			 page=Integer.parseInt(request.getParameter("page"));
		 }
		 
		 int listcount=admingoodsService.getListCount();
		 
		 b.setStartrow((page-1)*5+1);
	     b.setEndrow(b.getStartrow() + limit -1);
		 //총레코드/수 반환
	     
		List<GoodsBean> glist=admingoodsService.getGoodsList(b);

	    System.out.println("listcount:"+listcount);
	    /* 카테고리 */
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		/*농도 */
		List<CategoryBean> lvlist=this.categoryService.getLevels();
		 
	     
	     		// 총 페이지 수.
	  			int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리.
	  			// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	  			int startpage = (((int) ((double) page / limit + 0.9)) - 1) * limit + 1;
	  			// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	  			int endpage = maxpage;
	  			

	  			if (endpage > startpage + 5 - 1)
	  				endpage = startpage +5 - 1;

	  			System.out.println("page:"+page);
	  			System.out.println("startpage:"+startpage);
	  			System.out.println("endpage:"+endpage);
	  			System.out.println("maxpage:"+maxpage);
	  			System.out.println("admin_name:"+mb.getMember_name());
	  			listM.addAttribute("admin_name",mb.getMember_name());
	  			listM.addAttribute("list", glist);
	  			listM.addAttribute("page", page);
	  			listM.addAttribute("startpage", startpage);
	  			listM.addAttribute("endpage", endpage);
	  			listM.addAttribute("maxpage", maxpage);
	  			listM.addAttribute("listcount", listcount);
	  			listM.addAttribute("clist", clist);
	  			listM.addAttribute("lvlist", lvlist);   
	  		   
	  			/* paging 끝 */
	return "admingoods/admin_main";
		}
		return null;
	}
	
	/* 상품 조회 */
	@RequestMapping(value="/AdminGoodsList")
	public String adminGoodsList(HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session,
								@ModelAttribute GoodsBean b,
								Model listM
								) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String admin_id = (String) session.getAttribute("admin_id");
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			
		MemberBean mb =this.memberService.idcheck(admin_id);
		
			int page=1;
			int limit=5;
		 if(request.getParameter("page")!=null){
			 page=Integer.parseInt(request.getParameter("page"));
		 }
		 
		 int listcount=admingoodsService.getListCount();
		 
		 b.setStartrow((page-1)*5+1);
	     b.setEndrow(b.getStartrow() + limit -1);
		 //총레코드/수 반환
	     
		List<GoodsBean> glist=admingoodsService.getGoodsList(b);

	    System.out.println("listcount:"+listcount);
	    /* 카테고리 */
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		/*농도 */
		List<CategoryBean> lvlist=this.categoryService.getLevels();
		 
	     
	     		// 총 페이지 수.
	  			int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리.
	  			// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	  			int startpage = (((int) ((double) page / limit + 0.9)) - 1) * limit + 1;
	  			// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	  			int endpage = maxpage;
	  			

	  			if (endpage > startpage + 5 - 1)
	  				endpage = startpage +5 - 1;

	  			System.out.println("page:"+page);
	  			System.out.println("startpage:"+startpage);
	  			System.out.println("endpage:"+endpage);
	  			System.out.println("maxpage:"+maxpage);
	  			System.out.println("admin_name:"+mb.getMember_name());
	  			listM.addAttribute("admin_name",mb.getMember_name());
	  			listM.addAttribute("list", glist);
	  			listM.addAttribute("page", page);
	  			listM.addAttribute("startpage", startpage);
	  			listM.addAttribute("endpage", endpage);
	  			listM.addAttribute("maxpage", maxpage);
	  			listM.addAttribute("listcount", listcount);
	  			listM.addAttribute("clist", clist);
	  			listM.addAttribute("lvlist", lvlist);   
	  		   
	  			/* paging 끝 */
	return "admingoods/admin_goods_list";
	/*return "admingoods/admin_main";*/
		}
		return null;
	}
	
	/* 상품 등록 */
	@RequestMapping(value="/AdminGoodsAdd")
	public String adminGoodsAdd(HttpServletRequest request,
			 HttpServletResponse response) {
		
		/* 카테고리 */
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		/*농도 */
		List<CategoryBean> lvlist=this.categoryService.getLevels();
		request.setAttribute("clist", clist);
		request.setAttribute("lvlist", lvlist);
		 return "admingoods/admin_goods_write";
	}
	
	/* 상품 등록 완료*/
	@RequestMapping(value="/AdminGoodsAddOk")
	public String adminGoodsAddOk(@ModelAttribute GoodsBean b,
								  HttpServletRequest request, 
								  HttpServletResponse response,
								  HttpSession session) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();


		String admin_id = (String) session.getAttribute("admin_id");
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			String saveFolder = "C:/Users/Administrator/git/MavenMall07001/mall/src/main/webapp/upload";// 이진파일
			
			int fileSize = 5 * 1025 * 1024;// 이진파일 업로드 최대크기,5mb
			MultipartRequest multi = null;// 이진파일 업로드 변수선언
			multi = new MultipartRequest(request, saveFolder, fileSize, "utf-8");
			// 이진파일 업로드 multi객체 생성
			// 생성자 첫번째 전달인자 request는 사용자폼에서 입력한 것을 서버로 전달
			// 두번째 전달인자는 이진파일 업로드 서버 경로
			// 세번째 전달인자는 이진파일 최대크기
			// 네번째 전달인자는 언어코딩 타입

			String goods_name = multi.getParameter("goods_name").trim();
			String goods_category = multi.getParameter("goods_category").trim();
			String goods_color = multi.getParameter("goods_color").trim();
			String goods_size = multi.getParameter("goods_size").trim();
			String goods_content = multi.getParameter("goods_content").trim();
			int goods_price = Integer.parseInt(multi.getParameter("goods_price").trim());
			int goods_amount = Integer.parseInt(multi.getParameter("goods_amount").trim());
			/*int goods_best = Integer.parseInt(multi.getParameter("goods_best").trim());*/
			int goods_best = 0;
			int goods_level=Integer.parseInt(multi.getParameter("goods_level"));

			
			b.setGoods_name(goods_name);
			b.setGoods_category(goods_category);
			b.setGoods_color(goods_color);
			b.setGoods_size(goods_size);
			b.setGoods_content(goods_content);
			b.setGoods_price(goods_price);
			b.setGoods_amount(goods_amount);
			b.setGoods_level(goods_level);
			
			File UpFile = multi.getFile("file4");// 첨부한 이진파일을 가져옴.


			if (UpFile != null) {
				String fileName = UpFile.getName();// 첨부한 이진파일명을 구함
				Calendar c = Calendar.getInstance();
				String year = String.format("%04d", c.get(Calendar.YEAR));// 년도
				String month = String.format("%02d", c.get(Calendar.MONTH) + 1);//월 0으로 반환되기 때문이다.
				String date = String.format("%02d", c.get(Calendar.DATE));// 일
				String hour = String.format("%02d", c.get(Calendar.HOUR_OF_DAY));//시
				String minute = String.format("%02d", c.get(Calendar.MINUTE));//분
				String second = String.format("%02d", c.get(Calendar.SECOND));//시
				String hms="-"+hour+minute+second+"-";
				
				String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
				// 새로운 이진파일 폴더 경로를 저장
				File path1 = new File(homedir);
				if (!(path1.exists())) {// 폴더경로가 없으면
					path1.mkdir();// 폴더생성
				}
				Random r = new Random();// 난수를 발생시키는 클래스
				int random = r.nextInt(10000);
				// 1억사이의 정수형 난수를 발생시킴
				/********** 확장자 구하기 *******************/
				int index = fileName.lastIndexOf(".");
				// File 클래스의 getName()메서드는 이진파일명을 받아온다.
				// lastIndexOf("문자")는 String클래스의 메서드로 해당문자
				// 를 문자열 끝 즉 우츠에서 헤아려 문자의 위치번로를 반환한다.
				String fileExtension = fileName.substring(index + 1);
				// 파일의 확장자를 구한다.
				/*********** 확장자 구하기 끝 *********************/
				String refileName = "Goods" + year + month + date + hms+random + "." + fileExtension;// 새로운 파일명을 저장
				System.out.println("새로운파일명:" + refileName);
				String fileDBName = "/" + year + "-" + month + "-" + date + "/"+ refileName;// 데이터베이스에 저장될 레코드 값
				System.out.println("데이터베이스파일명:" + fileDBName);

				System.out.println(UpFile.renameTo(new File(homedir + "/" + refileName)));


				// 새롭게 생성된 폴더에 바뀐 이진파일명으로 업로드
				b.setGoods_image(fileDBName);
			} else {// 이진파일을 첨부하지 않았을 때
				String fileDBName = "";// 첨부하지 않은 경우는 빈공백을 저장시킴
				b.setGoods_image(fileDBName);
			}

			if(this.admingoodsService.insertGoods(b)>0){// 저장메서드 호출
				out.println("<script>");
				out.println("alert('상품이 등록되었습니다.!')");
				out.println("location='AdminGoodsList.do'");
				out.println("</script>");
			}	
		}	
		return null;

}
	
	/*관리자 상품 수정 */
	@RequestMapping(value="AdminGoodsModify")
	public String adminGoodsModify(HttpServletRequest request,
			HttpServletResponse response){
		
		int goods_num=Integer.parseInt(request.getParameter("goods_num"));
		GoodsBean agb=this.admingoodsService.getGoodsCont(goods_num);
		
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		
		request.setAttribute("clist", clist);
		request.setAttribute("agb", agb);	 
		return "admingoods/admin_goods_modify";
	}
	

	/* 관리자 상품수정 완료 */
	@RequestMapping(value="/AdminGoodsModifyOk")
	public String adminGoodsModifyOk(
			                  HttpServletRequest request, 
			                  @ModelAttribute GoodsBean b,
			                  HttpServletResponse response,
			                  HttpSession session)
	 throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();


		String admin_id = (String) session.getAttribute("admin_id");
		
		String saveFolder="C:/Users/Administrator/git/MavenMall07001/mall/src/main/webapp/upload";//서버 업로드경로 저장
		int fileSize = 5*1024*1024;//이진파일 업로드 최대 크기
		MultipartRequest multi=null;//이진파일 받아올 변수
	    multi=new MultipartRequest(request, saveFolder, fileSize, "utf-8");
	
		int goods_num=Integer.parseInt(multi.getParameter("goods_num"));

		int page=1;
        if(multi.getParameter("page")!=null){
        	page=Integer.parseInt(multi.getParameter("page"));
        }
		
		String goods_name = multi.getParameter("goods_name").trim();
		String goods_category = multi.getParameter("goods_category").trim();
		String goods_color = multi.getParameter("goods_color").trim();
		String goods_size = multi.getParameter("goods_size").trim();
		String goods_content = multi.getParameter("goods_content").trim();
		int goods_price = Integer.parseInt(multi.getParameter("goods_price").trim());
		int goods_amount = Integer.parseInt(multi.getParameter("goods_amount").trim());
		int goods_best = Integer.parseInt(multi.getParameter("goods_best").trim());
 
	    GoodsBean gb=this.admingoodsService.getGoodsCont(goods_num);

		File UpFile = multi.getFile("file");
		//첨부한 이진파일을 가져옴.
		if (UpFile != null) {
			String fileName = UpFile.getName();// 첨부한 이진파일명을 구함
			Calendar c = Calendar.getInstance();
			String year = String.format("%04d", c.get(Calendar.YEAR));// 년도
			String month = String.format("%02d", c.get(Calendar.MONTH) + 1);//월 0으로 반환되기 때문이다.
			String date = String.format("%02d", c.get(Calendar.DATE));// 일
			String hour = String.format("%02d", c.get(Calendar.HOUR_OF_DAY));//시
			String minute = String.format("%02d", c.get(Calendar.MINUTE));//분
			String second = String.format("%02d", c.get(Calendar.SECOND));//시
			String hms="-"+hour+minute+second+"-";
			
			String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
			// 새로운 이진파일 폴더 경로를 저장
			File path1 = new File(homedir);
			if (!(path1.exists())) {// 폴더경로가 없으면
				path1.mkdir();// 폴더생성
			}
			Random r = new Random();// 난수를 발생시키는 클래스
			int random = r.nextInt(10000);
			// 1억사이의 정수형 난수를 발생시킴
			/********** 확장자 구하기 *******************/
			int index = fileName.lastIndexOf(".");
			String fileExtension = fileName.substring(index + 1);
			/*********** 확장자 구하기 끝 *********************/
			String refileName = "Goods" + year + month + date + hms+random + "." + fileExtension;// 새로운 파일명을 저장
			System.out.println("새로운파일명:" + refileName);
			String fileDBName = "/" + year + "-" + month + "-" + date + "/"+ refileName;// 데이터베이스에 저장될 레코드 값
			System.out.println("데이터베이스파일명:" + fileDBName);

			System.out.println(UpFile.renameTo(new File(homedir + "/" + refileName)));

			b.setGoods_image(fileDBName);
			System.out.println(fileDBName);
		} else {// 이진파일을 첨부하지 않았을 때
			String fileDBName = "";// 첨부하지 않은 경우는 빈공백을 저장시킴
			b.setGoods_image(fileDBName);
			System.out.println(fileDBName);
		}

		b.setGoods_num(goods_num);
		b.setGoods_category(goods_category);
		b.setGoods_name(goods_name); 
		b.setGoods_price(goods_price);
		b.setGoods_color(goods_color);
		b.setGoods_amount(goods_amount); 
	    b.setGoods_size(goods_size); 
	    b.setGoods_content(goods_content);
	    b.setGoods_best(goods_best);
	    

		if(this.admingoodsService.updateGoods(b)>0){//수정메서드
		  out.println("<script>");
		  out.println("alert('수정완료!')");
		  out.println("location='AdminGoodsList.do'");
		  out.println("</script>");
		}else{
			out.println("<script>");
			  out.println("alert('수정실패!')");
			  out.println("history.back()");
			  out.println("</script>");
		}
		/* return "redirect:/AdminGoodsList.do?page="+page;*/
  return null;
	}

	/* 상품 삭제 */
	@RequestMapping(value="/AdminGoodsDelete")
	public String adminGoodsDelete(HttpServletRequest request,
			HttpServletResponse response){
		
		int goods_num=Integer.parseInt(request.getParameter("goods_num"));
		
		request.setAttribute("goods_num", goods_num);
		return "/AdminGoodsDeleteOk";
	}
	
	
	/* 관리자 상품수정 완료 */
	@RequestMapping(value="/AdminGoodsDeleteOk")
	public String adminGoodsDeleteOk(
			                  HttpServletRequest request, 
			                  @ModelAttribute GoodsBean b,
			                  HttpServletResponse response,
			                  HttpSession session,
			                  @RequestParam("goods_num") int goods_num,
			      			  @RequestParam("page") int page,
			      			  @RequestParam("Admin_pass") String del_pwd,
			      			  @ModelAttribute MemberBean admin_pwd
			                  ) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String admin_id = (String) session.getAttribute("admin_id");       

		if(admin_id==null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("location='/MemberLogin.do'");
			out.println("</script>");
		}else{
			admin_pwd.setMember_id(admin_id);
			admin_pwd=this.memberService.findId(admin_pwd);
			//디비로 부터 비번을 가져옴.
			if(admin_pwd.equals(del_pwd)){
				out.println("<script>");
				out.println("alert('비번이 다릅니다!')");
				out.println("history.back()");
				out.println("</script>");
			}else{
				if(this.admingoodsService.delGoods(goods_num)>0){//상품삭제
				return "redirect:/AdminGoodsList.do?page="+page;
				}
			}
		}
		return null;
	}

/**********************************************************************/	
	
	/* 상품 내용보기+수정폼+삭제폼 */
	@RequestMapping(value = "/AdminGoodsContent")
	public ModelAndView adminGoodsContent(
			@RequestParam("goods_num") int goods_no,
			@RequestParam("state") String state, 
			HttpSession session,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		String admin_id = (String) session.getAttribute("member_id");

		ModelAndView cm = new ModelAndView();//뷰생성
		
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("self.close()");
			out.println("</script>");
		} else {
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			GoodsBean gb = this.admingoodsService.getGoodsCont(goods_no);
			String goods_cont = gb.getGoods_content().replace("\n", "<br/>");
			// textarea박스에서 엔터키 친부분을 다음줄로 개행

			List<CategoryBean> clist=this.categoryService.getCategoryList();
			
			
			
			cm.addObject("clist",clist);
			cm.addObject("agb", gb);//gb set
			cm.addObject("goods_cont", goods_cont);
			
			cm.addObject("page", page);


			if (state.equals("cont")) {
				cm.setViewName("admingoods/admin_goods_content");
			}else if (state.equals("edit")) {
				cm.setViewName("admingoods/admin_goods_modify");
			}else if (state.equals("del")) {
				cm.setViewName("admingoods/admin_goods_delete");
			}

			return cm;
	}

		return null;
}

	@RequestMapping(value="AdminLogin")
	public String admin_Login(HttpServletRequest request,
			                  HttpServletResponse response) 
			                	throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		return "member/admin_login";
	}
	
	
}


