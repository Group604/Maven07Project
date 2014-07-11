package com.naver.model;

import java.util.Date;

public class NewzipcodeBean {
	

		private String zipcode;
		private String road;
		private String sido;
		private String sigun;
		private String eup;
		private boolean under;
		private int bldgNo1;
		private Integer bldgNo2;
		private String bldg;
		private String num;
		private Date applyDate;

	/*	*//**
		 * 대시("-")가 포함된 우편번호
		 * 
		 * @return
		 *//*
		public String getZipcodeWithDash() {
			String s = "";

			s += zipcode.substring(0, 3);
			s += "-";
			s += zipcode.substring(3, 6);

			return s;
		}

		*//**
		 * 도로명 주소 전체
		 * 
		 * @return
		 *//*
		public String getAddress() {
			StringBuffer sb = new StringBuffer();
			
			//
			sb.append(sido);
			if (isNotEmpty(sigun) == true) {
				sb.append(" ");
				sb.append(sigun);
			}
			//
			sb.append(" ");
			sb.append(road);
			//
			if (under == true) {
				sb.append(" ");
				sb.append("지하");
			}
			//
			sb.append(" ");
			sb.append(bldgNo1);
			if (bldgNo2 != null) {
				sb.append("-");
				sb.append(bldgNo2);
			}
			
			sb.append(" ");
			sb.append("(");
			//
			sb.append(eup);
			//
			if (isNotEmpty(bldg) == true) {
				sb.append(", ");
				sb.append(bldg);
			}
			sb.append(")");

			return sb.toString();
		}

		public String getZipcode() {
			return zipcode;
		}

		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}

		public String getRoad() {
			return road;
		}

		public void setRoad(String road) {
			this.road = road;
		}

		public String getSido() {
			return sido;
		}

		public void setSido(String sido) {
			this.sido = sido;
		}

		public String getSigun() {
			return sigun;
		}

		public void setSigun(String sigun) {
			this.sigun = sigun;
		}

		public String getEup() {
			return eup;
		}

		public void setEup(String eup) {
			this.eup = eup;
		}

		public boolean isUnder() {
			return under;
		}

		public void setUnder(boolean under) {
			this.under = under;
		}

		public int getBldgNo1() {
			return bldgNo1;
		}

		public void setBldgNo1(int bldgNo1) {
			this.bldgNo1 = bldgNo1;
		}

		public Integer getBldgNo2() {
			return bldgNo2;
		}

		public void setBldgNo2(Integer bldgNo2) {
			this.bldgNo2 = bldgNo2;
		}

		public String getBldg() {
			return bldg;
		}

		public void setBldg(String bldg) {
			this.bldg = bldg;
		}

		public String getNum() {
			return num;
		}

		public void setNum(String num) {
			this.num = num;
		}

		public Date getApplyDate() {
			return applyDate;
		}

		public void setApplyDate(Date applyDate) {
			this.applyDate = applyDate;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((num == null) ? 0 : num.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			ZipcodeBean other = (ZipcodeBean) obj;
			if (num == null) {
				if (other.num != null)
					return false;
			} else if (!num.equals(other.num))
				return false;
			return true;
		}

		@Override
		public String toString() {
			return "Zipcode [zipcode=" + zipcode + ", road=" + road + ", sido=" + sido
				+ ", sigun=" + sigun + ", eup=" + eup + ", under=" + under + ", bldgNo1="
				+ bldgNo1 + ", bldgNo2=" + bldgNo2 + ", bldg=" + bldg + ", num=" + num
				+ ", applyDate=" + applyDate + "]";
		}

		private boolean isNotEmpty(String s) {
			return s != null && s.trim().isEmpty() == false;
		}*/

	}

