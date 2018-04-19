package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_jjlx")
public class TTlbJjlx extends BaseEntity {

	private static final long serialVersionUID = -4034788267828306007L;
	private String lxid; // 类型id
	private String lxmc; // 类型名称
	private Integer dj; //等级
	private boolean sfsc; // 是否删除

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getLxid() {
		return lxid;
	}

	public void setLxid(String lxid) {
		this.lxid = lxid;
	}

	public String getLxmc() {
		return lxmc;
	}

	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}

	public boolean isSfsc() {
		return sfsc;
	}

	public void setSfsc(boolean sfsc) {
		this.sfsc = sfsc;
	}

	public Integer getDj() {
		return dj;
	}

	public void setDj(Integer dj) {
		this.dj = dj;
	}

}
