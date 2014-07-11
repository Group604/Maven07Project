package com.naver.model;

import java.util.List;

public class GoodsBean {
	private int goods_num;
	private String goods_category;
	private String goods_name;
	private String goods_content;
	private String goods_size;
	private String goods_color;
	private String goods_image;
	private int goods_amount;
	private int goods_price;
	private int goods_best;
	private String goods_date;
	private int goods_inuse;
	private int goods_level;
	
	
	
	/* 페이징 변수 */
	private int startrow=0;
	private int endrow=10;


	/*검색어 와 검색필드 */
	private String find_category;
	private int find_level;
	private String find_name;

	/*파일 */
	private List boardFiles = null;
	private BoardFile file1 = null;
	private BoardFile file2 = null;
	private BoardFile file3 = null;
	private List file = null;
	
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getGoods_size() {
		return goods_size;
	}
	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}
	public String getGoods_color() {
		return goods_color;
	}
	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public int getGoods_amount() {
		return goods_amount;
	}
	public void setGoods_amount(int goods_amount) {
		this.goods_amount = goods_amount;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_best() {
		return goods_best;
	}
	public void setGoods_best(int goods_best) {
		this.goods_best = goods_best;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	
	public String getFind_name() {
		return find_name;
	}
	public String getFind_category() {
		return find_category;
	}
	public void setFind_category(String find_category) {
		this.find_category = find_category;
	}
	
	
	
	public int getFind_level() {
		return find_level;
	}
	public void setFind_level(int find_level) {
		this.find_level = find_level;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public List getBoardFiles() {
		return boardFiles;
	}
	public void setBoardFiles(List boardFiles) {
		this.boardFiles = boardFiles;
	}
	public BoardFile getFile1() {
		return file1;
	}
	public void setFile1(BoardFile file1) {
		this.file1 = file1;
	}
	public BoardFile getFile2() {
		return file2;
	}
	public void setFile2(BoardFile file2) {
		this.file2 = file2;
	}
	public BoardFile getFile3() {
		return file3;
	}
	public void setFile3(BoardFile file3) {
		this.file3 = file3;
	}
	public List getFile() {
		return file;
	}
	public void setFile(List file) {
		this.file = file;
	}
	
	public int getGoods_inuse() {
		return goods_inuse;
	}
	public void setGoods_inuse(int goods_inuse) {
		this.goods_inuse = goods_inuse;
	}
	public String getGoods_date() {
		return goods_date;
	}
	public void setGoods_date(String goods_date) {
		this.goods_date = goods_date;
	}
	
	public int getGoods_level() {
		return goods_level;
	}
	public void setGoods_level(int goods_level) {
		this.goods_level = goods_level;
	}
}
