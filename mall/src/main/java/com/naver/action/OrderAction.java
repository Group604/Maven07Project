package com.naver.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
			OrderBean orderinfo = new OrderBean();//주문bean 생성
			String ordertype = request.getParameter("order");//주문타입("goods:상품상세에서,basket:장바구니에서)

			int goods_num = 1;
			if (request.getParameter("goods_num") != null) {
				goods_num = Integer.parseInt(request.getParameter("goods_num"));
			}
			int amount = 0;//상품수량
			if (request.getParameter("amount") != null) {
				amount = Integer.parseInt(request.getParameter("amount"));
			}

			if (ordertype.equals("goods")) {/*
										     * order가 "goods"인경우 상품상세에서, 
										     * "basket"인 경우 장바구니에서 주문함
										     */
				orderinfo.setOrder_goods_num(goods_num);//주문bean에 상품번호 저장
				orderinfo.setOrder_goods_amount(amount);//주문bean에 상품수량 저장

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

				gb = this.goodsService.getGoodsCont(goods_num);//상품bean에 상품정보 저장

				System.out.println("goods_image:" + gb.getGoods_image());
				request.setAttribute("ordertype", "goods");//주문형태
				request.setAttribute("orderinfo", orderinfo);//주문정보
				//request.setAttribute("goods_info", gb);

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
				ob.setOrder_sum_money(gb.getGoods_amount() * gb.getGoods_price());// 가격=단가*수량
				ob.setOrder_trade_payer(member.getMember_name());// 결제(입금)자 성명
				ob.setOrder_status(0);/*
									 * 주문진행상태(0:대기,1:발송준비,2:발송완료,3:배송중,4:배송완료,5:주문취소
									 */
				BasketBean basket=new BasketBean();//장바구니 생성
				
				basket.setBasket_goods_num(goods_num);//상품번호
				basket.setBasket_goods_amount(amount);//상품수량
				basket.setBasket_member_id(member_id);//주문자 아이디
				basket.setGoods_image(gb.getGoods_image());//상품이미지경로
				System.out.println(gb.getGoods_image());
				basket.setGoods_price_amount(gb.getGoods_price() * gb.getGoods_amount());//상품단가*수량
				
				
				System.out.println("장바구니상품확인");
				
				if(this.basketService.getBasketGoods(basket)!=null){/* 장바구니에 상품 존재 여부 확인 */
					System.out.println("상품있음");
					this.basketService.addQuantity(basket);/* 있으면 수량 추가 */
				}else if(this.basketService.getBasketGoods(basket)==null){
					System.out.println("상품없음");
					this.basketService.insGoods(basket);/* 없으면 신규 상품 추가 */
				}
				/* 상품 추가 후 장바구니 리스트 가져오기 */
				 List<BasketBean> basketlist=this.basketService.getBasketList(member_id);
				 request.setAttribute("ordertype", "goods");//주문타입
				 request.setAttribute("basketlist", basketlist);//장바구니 리스트
				 request.setAttribute("ob", ob);//주문정보

			} else if (ordertype.equals("basket")) {/* 장바구니에서 주문 한 경우 */
				List<BasketBean> basketlist = this.basketService.getBasketList(member_id);
				
				for (BasketBean basketBean : basketlist) {
					System.out.println(basketBean.getGoods_image());
				}
				
				request.setAttribute("ordertype", "basket");//주문타입
				request.setAttribute("basketlist", basketlist);//장바구니 리스트
			}

			request.setAttribute("member", member);

			return "goods_order/goods_buy";
		}
		return null;
	}

/*	@RequestMapping(value = "/Orderbuy")
	public String order_buy(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@ModelAttribute MemberBean member) {

		member = (MemberBean) request.getAttribute("admin_id");
		String ordertype = (String) request.getAttribute("ordertype");
		List orderinfo = null;
		List basketlist = null;
		List goodslist = null;

		if (ordertype.equals("goods")) { ordertype이 "goods"즉, 상품상세에서 왔으면.. 
			orderinfo = (ArrayList) request.getAttribute("orderinfo");
		} else { ordertype이 "basket"즉, 장바구니에서 왔으면... 
			basketlist = (ArrayList) request.getAttribute("basketlist");
			goodslist = (ArrayList) request.getAttribute("goodslist");
		}

		return null;
	}*/

	@RequestMapping(value = "/OrderAdd")
	public String order_add(HttpServletRequest request,
							HttpServletResponse response, 
							HttpSession session
							) throws Exception {

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
			/* 수신처용 회원정보 */
			MemberBean member = (MemberBean) memberService.idcheck(member_id);// 회원정보
			
			BasketBean basket = new BasketBean();
			OrderBean orderinfo = new OrderBean();
		    GoodsBean gb=new GoodsBean();
		    
			/* 장바구니 리스트 */ 
			List<BasketBean> orderlist = this.basketService.getBasketList(member_id);
            			
			for (BasketBean b : orderlist) {
				  gb=this.goodsService.getGoodsCont(b.getBasket_goods_num());//상품정보
				  
				  orderinfo.setOrder_goods_num(gb.getGoods_num());
			      orderinfo.setOrder_goods_name(gb.getGoods_name());
			      orderinfo.setOrder_goods_amount(gb.getGoods_amount());
			      orderinfo.setOrder_goods_color(gb.getGoods_color());
			      orderinfo.setOrder_goods_size(gb.getGoods_size());
			      orderinfo.setOrder_member_id(member_id);
			      orderinfo.setOrder_receive_name(request.getParameter("order_rceive_name"));
			      orderinfo.setOrder_receive_addr1(request.getParameter("member_addr"));
			      orderinfo.setOrder_receive_addr2(request.getParameter("member_addr2"));
			      orderinfo.setOrder_receive_phone(request.getParameter("order_receive_mobile"));
			      orderinfo.setOrder_receive_mobile(request.getParameter("order_receive_mobile"));
			      orderinfo.setOrder_memo(request.getParameter("order_memo"));
			      orderinfo.setOrder_sum_money(gb.getGoods_amount()*gb.getGoods_price());/* 수량 * 단가  */
			      orderinfo.setOrder_trade_type("온라인 입금");
			      orderinfo.setOrder_trade_payer(request.getParameter("order_trade_payer"));
			      
			    this.orderService.insOrder(orderinfo);//주문테이블에 데이타 저장
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
			List<OrderBean> golist=this.orderService.getOrderList(member_id);
			request.setAttribute("member_id", member_id);
			request.setAttribute("golist", golist);
			request.setAttribute("ordercount", golist.size());
			
			
			
			/* 상품 주문 상태 플래그 */
			List<Map<Integer,String>> lstat=this.orderService.sel_stat();

			
			request.setAttribute("order_stat", lstat);
			
			/*			
			
			int ordercount=((Integer)request.getAttribute("ordercount")).intValue();
			int nowpage=((Integer)request.getAttribute("page")).intValue();
			int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
			int startpage=((Integer)request.getAttribute("startpage")).intValue();
			int endpage=((Integer)request.getAttribute("endpage")).intValue();
			int totalmoney=((Integer)request.getAttribute("totalmoney")).intValue();*/
			
			return "goods_order/goods_my_order";
		}

		return null;

		
		
	}
}
