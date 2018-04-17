package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_yhsc")
public class TTlbYhsc extends BaseEntity {

	private static final long serialVersionUID = 3612744673007372078L;

	private String yhscid; // 用户收藏id
	private String yhid; // 用户id
	private String jjid; // 家具id
	private Boolean zt; // 状态（ 0、取消收藏 1、收藏）

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getYhscid() {
		return yhscid;
	}

	public void setYhscid(String yhscid) {
		this.yhscid = yhscid;
	}

	@Column(length = 32)
	public String getYhid() {
		return yhid;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	@Column(length = 32)
	public String getJjid() {
		return jjid;
	}

	public void setJjid(String jjid) {
		this.jjid = jjid;
	}

	public Boolean getZt() {
		return zt;
	}

	public void setZt(Boolean zt) {
		this.zt = zt;
	}

}
