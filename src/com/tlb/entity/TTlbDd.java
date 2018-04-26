package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_dd")
public class TTlbDd extends BaseEntity {

	private static final long serialVersionUID = -5670113720631275058L;

	private String ddid; // 订单id
	private String jjid; // 家具id
	private String yhid; // 用户id
	private String dzid; // 地址id
	private Integer sl; // 数量
	private Double ze; // 总额
	private int ddzt; // 订单状态（0、待付款 1、待发货2、待收货 3、已收货 4、删除）
	private String sszb; // 所属组别

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getDdid() {
		return ddid;
	}

	public void setDdid(String ddid) {
		this.ddid = ddid;
	}

	public String getJjid() {
		return jjid;
	}

	public void setJjid(String jjid) {
		this.jjid = jjid;
	}

	public String getYhid() {
		return yhid;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public String getDzid() {
		return dzid;
	}

	public void setDzid(String dzid) {
		this.dzid = dzid;
	}

	public Integer getSl() {
		return sl;
	}

	public void setSl(Integer sl) {
		this.sl = sl;
	}

	public Double getZe() {
		return ze;
	}

	public void setZe(Double ze) {
		this.ze = ze;
	}

	public int getDdzt() {
		return ddzt;
	}

	public void setDdzt(int ddzt) {
		this.ddzt = ddzt;
	}

	public String getSszb() {
		return sszb;
	}

	public void setSszb(String sszb) {
		this.sszb = sszb;
	}

}
