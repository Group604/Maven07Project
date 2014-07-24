package com.naver.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.dao.BasketDAO;
import com.naver.model.BasketBean;

@Controller
public class BasketAction {

	/* 장바구니 dao 설정 */
	private BasketDAO basketService;

	public void setBasketService(BasketDAO basketService) {
		this.basketService = basketService;
	}//setter DI 설정

	/* 장바구니 추가 */
	@RequestMapping(value = "/BasketAdd")
	public String add(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@ModelAttribute BasketBean bg) throws Exception {
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
	
		session = request.getSession();
		String member_id = (String) session.getAttribute("admin_id");// 회원정보
		int page=1;
		int goods_num=1;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
        if (member_id == null) {
			out.println("<script>");
			out.println("alert('다시로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
	
			if(request.getParameter("goods_num")==null){
				out.println("<script>");
				out.println("alert('해당고객의 장바구니 내역이 없습니다!')");
				out.println("location='GoodsList.do?page="+page);
				out.println("</script>");
			}else{
				 goods_num = Integer.parseInt(request.getParameter("goods_num"));
			}
			/* 추가상품 정보 */
			int quantity = Integer.parseInt(request.getParameter("amount"));

			System.out.println(quantity);
			System.out.println(goods_num);

			/* 장바구니 조회용 상품 저장 */
			bg.setBasket_member_id(member_id);
			bg.setBasket_goods_num(goods_num);
			
			System.out.println("goods_num:"+bg.getBasket_goods_num());

			/* 장바구니에 해당 아이디로 해당상품 존재여부 확인 */
			BasketBean big = this.basketService.getBasketGoods(bg);

			if (big != null) {
				
				bg.setBasket_goods_amount(quantity);
				if (this.basketService.addQuantity(bg) > 0) {
					out.println("<script>");
					out.println("alert('상품수량을 추가하였습니다!')");
					out.println("history.back()");
					out.println("</script>");
				} 
			}else {
					System.out.println("null");
					bg.setBasket_goods_amount(quantity);
					if (this.basketService.insGoods(bg) > 0) {
						out.println("<script>");
						out.println("alert('상품을 추가하였습니다!')");
						out.println("history.back()");
						out.println("</script>");
					}
				}

		List<BasketBean> blist = this.basketService.getBasketList(member_id);// 장바구니
																			// 조회

		request.setAttribute("blist", blist);
		request.setAttribute("goods_num", goods_num);/*상품번호 저장 */
				
		return "goods_order/goods_basket";
			}
			

		return null;
	}

	/* 장바구니 리스트 */
	@RequestMapping(value="/BasketList")
	public String basket_list(HttpServletRequest request,
							  HttpServletResponse response,
							  HttpSession session
							) throws Exception {
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
	
		session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");// 회원정보

/*		String member_id=request.getParameter("admin_id");*/
		
		if (member_id == null) {
			out.println("<script>");
			out.println("alert('로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			
		List<BasketBean> blist=this.basketService.getBasketList(member_id);
		
		int page=1;
		int goods_num=1;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("goods_num")==null){
			out.println("<script>");
			out.println("alert('해당고객의 장바구니 내역이 없습니다!')");
			out.println("location='GoodsList.do?page="+page);
			out.println("</script>");
		}else{
			 goods_num = Integer.parseInt(request.getParameter("goods_num"));
		}
		request.setAttribute("blist", blist);
		request.setAttribute("goods_num", goods_num);/*상품번호 저장 */
		 return "goods_order/goods_basket";
		}
		return null;
	}
	

	/* 장바구니 삭제 */
	@RequestMapping(value="/BasketDel")
	public String basket_del(HttpServletRequest request,
							  HttpServletResponse response,
							  HttpSession session,
							  @RequestParam("basket_num") int basket_num
							) throws Exception {
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
	
		session = request.getSession();
		String member_id = (String) session.getAttribute("admin_id");// 회원정보
		System.out.println("basket_num:"+basket_num);
		int page=1;
		int goods_num=1;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		if(this.basketService.basket_del(basket_num)>0){//장바구니 상품 삭제여부 확인
			out.println("<script>");
			out.println("alert('해당 상품을 삭제하였습니다!')");
			out.println("location='BasketList.do?admin_id="+member_id+"'");
			out.println("</script>");
		}else{
		 return "goods_order/goods_basket";
		}
		return null;
	}
}
