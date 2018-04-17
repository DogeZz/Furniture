package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_yhgz")
public class TTlbYhgz extends BaseEntity {

	private static final long serialVersionUID = 8815210514568395205L;
	
	private String yhgzid; // 用户关注id
	private String yhid; // 用户id
	private String shid; // 商户id
	private Boolean zt; //状态（ 0、取消关注 1、关注）

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getYhgzid() {
		return yhgzid;
	}

	public void setYhgzid(String yhgzid) {
		this.yhgzid = yhgzid;
	}

	@Column(length = 32)
	public String getYhid() {
		return yhid;
	}

	@Column(length = 32)
	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public String getShid() {
		return shid;
	}

	public void setShid(String shid) {
		this.shid = shid;
	}
	
	public Boolean getZt() {
		return zt;
	}

	public void setZt(Boolean zt) {
		this.zt = zt;
	}
	
}
