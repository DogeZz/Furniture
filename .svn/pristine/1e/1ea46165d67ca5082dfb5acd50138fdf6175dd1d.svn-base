package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_dz")
public class TTlbDz extends BaseEntity {

	private static final long serialVersionUID = -4816735352884951183L;

	private String dzid; // 地址id
	private String yhid; // 用户id
	private String shdz; // 收货地址
	private Boolean sfmr; // 是否默认
	private Boolean sfky; // 是否可用

	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name = "uuid",strategy="uuid")
	@Column(length = 32, nullable = false)
	public String getDzid() {
		return dzid;
	}

	public void setDzid(String dzid) {
		this.dzid = dzid;
	}

	@Column(length = 32)
	public String getYhid() {
		return yhid;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public String getShdz() {
		return shdz;
	}

	public void setShdz(String shdz) {
		this.shdz = shdz;
	}

	public Boolean getSfmr() {
		return sfmr;
	}

	public void setSfmr(Boolean sfmr) {
		this.sfmr = sfmr;
	}

	public Boolean getSfky() {
		return sfky;
	}

	public void setSfky(Boolean sfky) {
		this.sfky = sfky;
	}

}
