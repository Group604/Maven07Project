package com.naver.model;

public class OrderBean {
	private int order_num; /* 주문순번 */
	private String order_trade_num;/* 주문번호 (예:20140711-xxxxxx) */
	private String 	order_trans_num;/* 운송장 */
	private int 	order_goods_num;/* 주문한 상품 번호 */
	private String  order_goods_name;/* 주문 상품 이름 */
	private int 	order_goods_amount;/* 주문 상품 수량 */
	private String 	order_goods_size;/* 주문 상품 크기 */
	private String 	order_goods_color;/* 주문 상품 색깔 */
	private String 	order_member_id;/* 주문자 아이디 */
	private String 	order_receive_name;/* 수취인 이름 */
	private String 	order_receive_addr1;/* 수취인 주소1 */
	private String 	order_receive_addr2;/* 수취인 주소 상세 */
	private String 	order_receive_phone;/* 수취인 집 전화 */
	private String 	order_receive_mobile;/* 수취인 휴대폰 */
	private String 	order_memo;/* 주문 요구사항 */
	private int 	order_sum_money;/* 주문 합계 금액 */
	private String 	order_trade_type;/* 결제방법(온라인 입금,카드결제 등...) */
	private String 	order_trade_date;/* 결제날짜(온라인입금일 경우 입금일자) */
	private String 	order_trade_payer;/* 입금자명(온라인입금일 경우만 해당) */
	private String 	order_date;/* 상품 주무일자 */
	private int	order_status;/*주문상태(0:대기중,1:발송준비,2:발송완료,3:배송중,4:배송완료,5:주문취소) */

	
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_trade_num() {
		return order_trade_num;
	}
	public void setOrder_trade_num(String order_trade_num) {
		this.order_trade_num = order_trade_num;
	}
	public String getOrder_trans_num() {
		return order_trans_num;
	}
	public void setOrder_trans_num(String order_trans_num) {
		this.order_trans_num = order_trans_num;
	}
	public int getOrder_goods_num() {
		return order_goods_num;
	}
	public void setOrder_goods_num(int order_goods_num) {
		this.order_goods_num = order_goods_num;
	}
	public String getOrder_goods_name() {
		return order_goods_name;
	}
	public void setOrder_goods_name(String order_goods_name) {
		this.order_goods_name = order_goods_name;
	}
	public int getOrder_goods_amount() {
		return order_goods_amount;
	}
	public void setOrder_goods_amount(int order_goods_amount) {
		this.order_goods_amount = order_goods_amount;
	}
	public String getOrder_goods_size() {
		return order_goods_size;
	}
	public void setOrder_goods_size(String order_goods_size) {
		this.order_goods_size = order_goods_size;
	}
	public String getOrder_goods_color() {
		return order_goods_color;
	}
	public void setOrder_goods_color(String order_goods_color) {
		this.order_goods_color = order_goods_color;
	}
	public String getOrder_member_id() {
		return order_member_id;
	}
	public void setOrder_member_id(String order_member_id) {
		this.order_member_id = order_member_id;
	}
	public String getOrder_receive_name() {
		return order_receive_name;
	}
	public void setOrder_receive_name(String order_receive_name) {
		this.order_receive_name = order_receive_name;
	}
	public String getOrder_receive_addr1() {
		return order_receive_addr1;
	}
	public void setOrder_receive_addr1(String order_receive_addr1) {
		this.order_receive_addr1 = order_receive_addr1;
	}
	public String getOrder_receive_addr2() {
		return order_receive_addr2;
	}
	public void setOrder_receive_addr2(String order_receive_addr2) {
		this.order_receive_addr2 = order_receive_addr2;
	}
	public String getOrder_receive_phone() {
		return order_receive_phone;
	}
	public void setOrder_receive_phone(String order_receive_phone) {
		this.order_receive_phone = order_receive_phone;
	}
	public String getOrder_receive_mobile() {
		return order_receive_mobile;
	}
	public void setOrder_receive_mobile(String order_receive_mobile) {
		this.order_receive_mobile = order_receive_mobile;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public int getOrder_sum_money() {
		return order_sum_money;
	}
	public void setOrder_sum_money(int order_sum_money) {
		this.order_sum_money = order_sum_money;
	}
	public String getOrder_trade_type() {
		return order_trade_type;
	}
	public void setOrder_trade_type(String order_trade_type) {
		this.order_trade_type = order_trade_type;
	}
	public String getOrder_trade_date() {
		return order_trade_date;
	}
	public void setOrder_trade_date(String order_trade_date) {
		this.order_trade_date = order_trade_date;
	}
	public String getOrder_trade_payer() {
		return order_trade_payer;
	}
	public void setOrder_trade_payer(String order_trade_payer) {
		this.order_trade_payer = order_trade_payer;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
	
	
	
}
