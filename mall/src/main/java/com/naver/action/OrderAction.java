package com.naver.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.dao.BasketDAO;
import com.naver.dao.GoodsDAO;
import com.naver.dao.MemberDAO;
import com.naver.dao.OrderDAO;
import com.naver.model.BasketBean;
import com.naver.model.GoodsBean;
import com.naver.model.MemberBean;
import com.naver.model.OrderBean;

@Controller
public class OrderAction {

	/* 주문 서비스 */
	private OrderDAO orderService;

	public void setOrderService(OrderDAO orderService) {
		this.orderService = orderService;
	}// 주문 setter DI

	/* 상품 서비스 */
	private GoodsDAO goodsService;

	public void setGoodsService(GoodsDAO goodsService) {
		this.goodsService = goodsService;
	}// 상품 setter DI 	  T6

	/* 장바구니 서비스 */
	private BasketDAO basketService;

	public void setBasketService(BasketDAO basketService) {
		this.basketService = basketService;
	}// 장바구니 setter DI

	/* 회원 서비스 */
	private MemberDAO memberService;

	public void setMemberService(MemberDAO memberService) {
		this.memberService = memberService;
	}// 회원 setter DI

	/* 주문 시작 */
	@RequestMapping(value = "OrderStart")
	public String order_start(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@ModelAttribute GoodsBean gb) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();

		session = request.getSession();
		String member_id = (String) session.getAttribute("admin_id");// 회원아이디 저장

		if (member_id == null) {
			out.println("<script>");
			out.println("alert('다시로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {

			MemberBean member = (MemberBean) memberService.idcheck(member_id);// 회원정보
			OrderBean orderinfo = new OrderBean();
			String ordertype = request.getParameter("order");
			System.out.println("order?" + ordertype);

			int goods_num = 1;
			if (request.getParameter("goods_num") != null) {
				goods_num = Integer.parseInt(request.getParameter("goods_num"));
			}
			int amount = 0;
			if (request.getParameter("amount") != null) {
				amount = Integer.parseInt(request.getParameter("amount"));
			}

			if (ordertype.equals("goods")) {/*
										 * order가 "goods"인경우 상품상세에서, "basket"인
										 * 경우 장바구니에서 주문함
										 */
				System.out.println("goods_num:" + goods_num);
				System.out.println("amount:" + amount);

				orderinfo.setOrder_goods_num(goods_num);
				orderinfo.setOrder_goods_amount(amount);

				System.out.println("Order_goods_num:"
						+ orderinfo.getOrder_goods_num());
				System.out.println("Order_goods_name:"
						+ orderinfo.getOrder_goods_name());
				System.out.println("Order_goods_amount:"
						+ orderinfo.getOrder_goods_amount());
				System.out.println("Order_goods_size:"
						+ orderinfo.getOrder_goods_size());
				System.out.println("Order_goods_color:"
						+ orderinfo.getOrder_goods_color());
				System.out.println("Order_member_id:"
						+ orderinfo.getOrder_member_id());
				System.out.println("Order_receive_phone:"
						+ orderinfo.getOrder_receive_phone());

				gb = this.goodsService.getGoodsCont(goods_num);

				System.out.println("goods_image:" + gb.getGoods_image());
				request.setAttribute("ordertype", "goods");
				request.setAttribute("orderinfo", orderinfo);
				request.setAttribute("goods_info", gb);

				OrderBean ob = new OrderBean();// 주문순번
				// ob.setOrder_num(order_num);
				/* ob.setOrder_trade_num(this.orderService.getTrade_num()); */// 주문번호
				/* ob.setOer_tran_num(order_trans_num); *//* 운송장 번호는 관리자가 발송시 입력 */
				ob.setOrder_goods_num(goods_num);// 상품번호
				ob.setOrder_goods_name(gb.getGoods_name());// 상품명
				ob.setOrder_goods_amount(gb.getGoods_amount());// 상품수량
				ob.setOrder_goods_size(gb.getGoods_size());// 상품사이즈
				ob.setOrder_goods_color(gb.getGoods_color());// 상품색상
				ob.setOrder_member_id(member_id);// 상품주문 아이디
				ob.setOrder_receive_name(member.getMember_name());// 주문자 성명
				ob.setOrder_receive_addr1(member.getMember_addr());// 주문자 회원 주소1
				ob.setOrder_receive_addr2(member.getMember_addr2());// 주문자 회원
																	// 주소2
				ob.setOrder_receive_mobile(member.getMember_phone01() + '-'
						+ member.getMember_phone02() + '-'
						+ member.getMember_phone03());// 회원 전화번호
				ob.setOrder_sum_money(gb.getGoods_amount()
						* gb.getGoods_price());// 가격=단가*수량
				ob.setOrder_trade_payer(member.getMember_name());// 결제(입금)자 성명
				ob.setOrder_status(0);/*
									 * 주문진행상태(0:대기,1:발송준비,2:발송완료,3:배송중,4:배송완료,5:주문취소
									 */

				request.setAttribute("ob", ob);

			} else if (ordertype.equals("basket")) {/* 장바구니에서 주문 한 경우 */
				List<BasketBean> basketlist = this.basketService.getBasketList(member_id);
				// List<BasketBean>
				// goodslist=this.basketService.getBasketGoods(gb);

				for (int i = 0; i < basketlist.size(); i++) {
					System.out.println(basketlist.get(i));
				}

				request.setAttribute("ordertype", "basket");
				request.setAttribute("basketlist", basketlist);
				// request.setAttribute("goodslist", goodslist);
			}

			request.setAttribute("member", member);

			return "goods_order/goods_buy";
		}
		return null;
	}

	@RequestMapping(value = "/Orderbuy")
	public String order_buy(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@ModelAttribute MemberBean member) {

		member = (MemberBean) request.getAttribute("admin_id");
		String ordertype = (String) request.getAttribute("ordertype");
		List orderinfo = null;
		List basketlist = null;
		List goodslist = null;

		if (ordertype.equals("goods")) {/* ordertype이 "goods"즉, 상품상세에서 왔으면.. */
			orderinfo = (ArrayList) request.getAttribute("orderinfo");
		} else {/* ordertype이 "basket"즉, 장바구니에서 왔으면... */
			basketlist = (ArrayList) request.getAttribute("basketlist");
			goodslist = (ArrayList) request.getAttribute("goodslist");
		}

		return null;
	}

	@RequestMapping(value = "/OrderAdd")
	public String order_add(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@RequestParam("goods_num") int goods_num,
			@RequestParam("ordertype") String ordertype,
			@ModelAttribute GoodsBean gb) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();

		session = request.getSession();
		String member_id = (String) session.getAttribute("admin_id");// 회원아이디 저장

		if (member_id == null) {
			out.println("<script>");
			out.println("alert('다시로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			
			System.out.println("ordertype:"+ordertype);
			MemberBean member = (MemberBean) memberService.idcheck(member_id);// 회원정보
			BasketBean basket = new BasketBean();
			OrderBean orderinfo = new OrderBean();

			OrderBean ob = new OrderBean();// 주문순번

			ob.setOrder_member_id(member_id);// 상품주문 아이디
			ob.setOrder_receive_name(member.getMember_name());// 주문자 성명
			ob.setOrder_receive_addr1(member.getMember_addr());// 주문자 회원 주소1
			ob.setOrder_receive_addr2(member.getMember_addr2());// 주문자 회원 주소2
			ob.setOrder_receive_mobile(member.getMember_phone01() + '-'
					+ member.getMember_phone02() + '-'
					+ member.getMember_phone03());// 회원 전화번호
			ob.setOrder_sum_money(gb.getGoods_amount() * gb.getGoods_price());// 가격=단가*수량
			ob.setOrder_trade_payer(member.getMember_name());// 결제(입금)자 성명
			ob.setOrder_status(0);/* 주문진행상태(0:대기,1:발송준비,2:발송완료,3:배송중,4:배송완료,5:주문취소 */

			if (ordertype.equals("goods")) {
				basket.setBasket_goods_num(goods_num);
				basket.setBasket_goods_amount(Integer.parseInt(request.getParameter("goods_amount")));
				basket.setBasket_member_id(member_id);
				basket.setGoods_image(gb.getGoods_image());
				basket.setGoods_price_amount(gb.getGoods_price() * gb.getGoods_amount());
				System.out.println("장바구니상품확인");
				if(this.basketService.getBasketGoods(basket)!=null){/* 장바구니에 상품 존재 여부 확인 */
					System.out.println("상품있음");
					this.basketService.addQuantity(basket);/* 있으면 수량 추가 */
				}else{
					System.out.println("상품없음");
					this.basketService.insGoods(basket);/* 없으면 신규 상품 추가 */
				}
				
			} else {
				this.basketService.getBasketList(member_id);
			}

			int orderCnt = this.orderService.getOrderCount(member_id);

			List<OrderBean> olist = this.orderService.getOrderList(member_id);
			
			for (int i = 0; i < olist.size(); i++) {
				this.orderService.addOrder(olist);
			}
			return "goods_order/goods_order_ok";
		}
		return null;
	}
	
	@RequestMapping(value="/OrderList")
	public String order_list(HttpServletRequest request,
			                 HttpServletResponse response,
			                 HttpSession session,
			                 @ModelAttribute OrderBean ob) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();

		session = request.getSession();
		String member_id = (String) session.getAttribute("admin_id");// 회원아이디 저장

		if (member_id == null) {
			out.println("<script>");
			out.println("alert('다시로그인 하세요!')");
			out.println("location='MemberLogin.do'");
			out.println("</script>");
		} else {
			List goods_order_list=(List)request.getAttribute("goods_order_list");
			int ordercount=((Integer)request.getAttribute("ordercount")).intValue();
			int nowpage=((Integer)request.getAttribute("page")).intValue();
			int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
			int startpage=((Integer)request.getAttribute("startpage")).intValue();
			int endpage=((Integer)request.getAttribute("endpage")).intValue();
			int totalmoney=((Integer)request.getAttribute("totalmoney")).intValue();
		}
	
		
		
		
		return null;

		
		
	}
}
