package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_sh")
public class TTlbSh extends BaseEntity {

	private static final long serialVersionUID = 6402064447978249670L;

	private String shid;//商户id
	private String yhid;//用户id
	private String shmc;//商户名称
	private String shms;//商户描述
	private String shtx;//商户头像
	private String shdj;//商户等级
	private Boolean shzt; //商户状态（0、不可用；1、正常）

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getShid() {
		return shid;
	}

	public void setShid(String shid) {
		this.shid = shid;
	}

	@Column(length = 32)
	public String getYhid() {
		return yhid;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public String getShmc() {
		return shmc;
	}

	public void setShmc(String shmc) {
		this.shmc = shmc;
	}

	public String getShms() {
		return shms;
	}

	public void setShms(String shms) {
		this.shms = shms;
	}

	public String getShtx() {
		return shtx;
	}

	public void setShtx(String shtx) {
		this.shtx = shtx;
	}

	public String getShdj() {
		return shdj;
	}

	public void setShdj(String shdj) {
		this.shdj = shdj;
	}

	public Boolean getShzt() {
		return shzt;
	}

	public void setShzt(Boolean shzt) {
		this.shzt = shzt;
	}

}
