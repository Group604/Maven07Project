package com.naver.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.dao.CategoryDAO;
import com.naver.dao.GoodsDAO;
import com.naver.dao.MemberDAO;
import com.naver.model.CategoryBean;
import com.naver.model.GoodsBean;
import com.naver.model.MemberBean;

@Controller
public class GoodsAction {
	/* 상품 Service */
	private GoodsDAO goodsService;
	public void setGoodsService(GoodsDAO goodsService) {
		this.goodsService = goodsService;
	}//setter DI
	
	/* 상품카테고리 */
	private CategoryDAO categoryService;
	public void setCategoryService(CategoryDAO categoryService) {
		this.categoryService = categoryService;
	}//category setter DI
	
	/*회원 정보 */
	private MemberDAO memberService;
	public void setMemberService(MemberDAO memberService) {
		this.memberService = memberService;
	}//Member setter DI

	@RequestMapping(value="/GoodsList.do")
	public String goods_list(HttpServletRequest request, 
			                 HttpServletResponse response,
			                 HttpSession session,
			                 @ModelAttribute GoodsBean gb,
			                 Model listM) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		
		/*카테고리 */
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		/*농도 */
		List<CategoryBean> lvlist=this.categoryService.getLevels();
		
		String admin_id = (String) session.getAttribute("admin_id");/* 장바구니로 이동하기위해서도 사용됨 */
		
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
		
			MemberBean mb =this.memberService.idcheck(admin_id);
			
			int page = 1;
			int limit = 5;

			String find_category = null;
			int find_level = 0;
			String find_name = null;

			
			 if(request.getParameter("limit")!=null){
				 limit=Integer.parseInt(request.getParameter("limit"));
			 }
			 
			if (request.getParameter("find_name") != null) {
				find_name = request.getParameter("find_name").trim();
				find_name = new String(find_name.getBytes("ISO-8859-1"),"utf-8");
				
				if(find_name.length()==0) {
					gb.setFind_name("%"+"ALL"+"%");
				}else{
				gb.setFind_name("%" + find_name + "%");
				}
			}

			find_category = request.getParameter("find_category");
			if(find_category==null||find_category=="ALL"){
				gb.setFind_category("%");
			}else{	
				gb.setFind_category("%"+find_category+"%");
			}
			
			if((request.getParameter("find_level")==null) || (request.getParameter("find_level") == "0")){ 
				find_level=0;
			}else {
				find_level= Integer.parseInt(request.getParameter("find_level"));
			}
			gb.setFind_level(find_level);
			
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			// 총 레코드 개수를 반환
			int listcount = this.goodsService.getListCount(gb);
			System.out.println("listcount():"+listcount);

			gb.setStartrow((page - 1) * limit + 1);
			gb.setEndrow(gb.getStartrow() + limit - 1);

			System.out.println("find_level:"+gb.getFind_level());
			System.out.println("find_category:"+gb.getFind_category());
			System.out.println("find_name:"+gb.getFind_name());
			
			List<GoodsBean> glist = this.goodsService.getGoodsList(gb);
			//목록

			// 총 페이지 수.
			int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
																		// 더해서
																		// 올림
																		// 처리.
			// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
			int startpage = (((int) ((double) page /limit + 0.9)) - 1) * limit + 1;
			// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
			int endpage = maxpage;

			if (endpage > startpage + 10 - 1)
				endpage = startpage + 10 - 1;

			System.out.println("startrow:"+gb.getStartrow());
			System.out.println("endrow:"+gb.getEndrow());
			System.out.println("maxpage:"+maxpage);
			System.out.println("startpage:"+startpage);
			System.out.println("endpage:"+endpage);
			
			
			listM.addAttribute("admin_name",mb.getMember_name());
			listM.addAttribute("glist", glist);
			listM.addAttribute("clist",clist);//카테고리
			listM.addAttribute("lvlist",lvlist);//농도			
			listM.addAttribute("page", page);
			listM.addAttribute("startpage", startpage);
			listM.addAttribute("endpage", endpage);
			listM.addAttribute("maxpage", maxpage);
			listM.addAttribute("listcount", listcount);
			/* paging 끝 */
			listM.addAttribute("find_category", find_category);
			listM.addAttribute("find_level", find_level);
			// find_field 키값에 board_title,board_cont저장
			listM.addAttribute("find_name", find_name);
			// find_name 키값에 검색어를 저장
		}
			return "goods/goods_list";
			// admin폴더의 admin_bbs_list.jsp 뷰페이지로 이동
		}

	@RequestMapping(value="/GoodsDetail")
	public String goods_detail(@ModelAttribute GoodsBean gb,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception{
		session=request.getSession();
		response.setContentType("text/html;utf-8");
		
		PrintWriter out=response.getWriter();
		
		String admin_id = (String) session.getAttribute("admin_id");
		
		System.out.println("amdin_id:?"+admin_id);
		
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		
		int page=1;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		/*카테고리 */
		List<CategoryBean> clist=this.categoryService.getCategoryList();
		/*농도 */
		List<CategoryBean> lvlist=this.categoryService.getLevels();
		
		gb=this.goodsService.getGoodsCont(goods_num);
		
		request.setAttribute("gb", gb);
		request.setAttribute("page", page);
		request.setAttribute("clist",clist );
		request.setAttribute("vlist", lvlist);
		
		
		}
     return "goods/goods_detail";	
	}	
}

