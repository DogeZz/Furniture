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

	private String yhscid; // 用户收藏
	private String yhid; // 用户id
	private String shid; // 商户id

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
	public String getShid() {
		return shid;
	}

	public void setShid(String shid) {
		this.shid = shid;
	}

}
