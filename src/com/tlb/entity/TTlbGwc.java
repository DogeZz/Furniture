package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_gwc")
public class TTlbGwc extends BaseEntity {

	private static final long serialVersionUID = -1318968024722446765L;

	private String gwcid;
	private String yhid;
	private String jjid;
	private Integer sl;
	private Integer zt;//(0、添加到购物车1、购买了、2、删除了)

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getGwcid() {
		return gwcid;
	}

	public void setGwcid(String gwcid) {
		this.gwcid = gwcid;
	}

	public String getYhid() {
		return yhid;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public String getJjid() {
		return jjid;
	}

	public void setJjid(String jjid) {
		this.jjid = jjid;
	}

	public Integer getSl() {
		return sl;
	}

	public void setSl(Integer sl) {
		this.sl = sl;
	}

	public Integer getZt() {
		return zt;
	}

	public void setZt(Integer zt) {
		this.zt = zt;
	}

}
