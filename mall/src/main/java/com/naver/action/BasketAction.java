package com.naver.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dao.BasketDAO;
import com.naver.model.BasketBean;

@Controller
public class BasketAction {

	private BasketDAO basketService;

	public void setBasketService(BasketDAO basketService) {
		this.basketService = basketService;
	}

	@RequestMapping(value = "/BasketAdd")
	public String add(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@ModelAttribute BasketBean bg) throws Exception {
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();

//		ModelAndView cm = new ModelAndView();
		
		session = request.getSession();
		String member_id = (String) session.getAttribute("admin_id");// 회원정보

		if (member_id == null) {
			out.println("<script>");
			out.println("alert('다시로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			System.out.println("member_id:" + member_id);
			int goods_num = Integer.parseInt(request.getParameter("goods_num"));
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

				BasketBean bb = this.basketService.getBasketList(member_id);// 장바구니
																			// 조회

				request.setAttribute("bb", bb);
				/*
				cm.setViewName("goods_order/goods_basket");
				cm.addObject("bb", bb);*/
				/*
				 * String goods_num = request.getParameter("goods_num"); String
				 * isitem = request.getParameter("isitem");
				 */

				// return "goods_order/goods_basket";
				
				return "goods_order/goods_basket";
			}
			

		return null;
	}

	/*
	 * @RequestMapping(value="/BasketAdd") public ModelAndView
	 * del(HttpServletRequest request, HttpServletResponse response, HttpSession
	 * session) throws Exception{ session=request.getSession(); String
	 * member_id=(String)session.getAttribute("member_id");
	 * 
	 * BasketBean bb=this.basketService.getBasketList(member_id);
	 * request.setAttribute("bb", bb);
	 * 
	 * 
	 * List basketList = request.getAttribute("basketlist"); List goodsList =
	 * request.getAttribute("goodslist");
	 * 
	 * String goods_num = request.getParameter("goods_num"); String isitem =
	 * request.getParameter("isitem");
	 * 
	 * return "goods_order/goods_basket";
	 * 
	 * }
	 * 
	 * @RequestMapping(value="/BasketAdd") public ModelAndView
	 * list(HttpServletRequest request, HttpServletResponse response,
	 * HttpSession session) throws Exception{ session=request.getSession();
	 * String member_id=(String)session.getAttribute("member_id");
	 * 
	 * BasketBean bb=this.basketService.getBasketList(member_id);
	 * request.setAttribute("bb", bb);
	 * 
	 * 
	 * List basketList = request.getAttribute("basketlist"); List goodsList =
	 * request.getAttribute("goodslist");
	 * 
	 * String goods_num = request.getParameter("goods_num"); String isitem =
	 * request.getParameter("isitem");
	 * 
	 * return "goods_order/goods_basket";
	 * 
	 * }
	 */

}
