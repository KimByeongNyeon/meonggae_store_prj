package com.store.meonggae.product.vo;


/*
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
*/
public class SteamVO {
	private String goodsNum;
	private int memNum;
	
	
	public SteamVO() {
	}

	public SteamVO(String goodsNum, int memNum) {
		super();
		this.goodsNum = goodsNum;
		this.memNum = memNum;
	}

	public String getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	@Override
	public String toString() {
		return "SteamVO [goodsNum=" + goodsNum + ", memNum=" + memNum + "]";
	}
	
}
