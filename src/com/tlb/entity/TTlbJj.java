package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_jj")
public class TTlbJj extends BaseEntity {

	private static final long serialVersionUID = -3936554156197762593L;
	private String jjid; // 家具id
	private String sdid; // 商店id
	private String jjbt; // 家具标题
	private String jjsl; // 家具数量
	private String jjjg; // 家具单价
	private String jjtp; // 家具图片
	private boolean sfky; // 是否可用
	private String jjdj; // 家具等级
	private String jjlx; // 家具类型
	private String jjxq; // 家具详情
	private Integer djl; //点击量
	private boolean sfsc; // 是否删除

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	public String getJjid() {
		return jjid;
	}

	public void setJjid(String jjid) {
		this.jjid = jjid;
	}

	public String getSdid() {
		return sdid;
	}

	public void setSdid(String sdid) {
		this.sdid = sdid;
	}

	public String getJjbt() {
		return jjbt;
	}

	public void setJjbt(String jjbt) {
		this.jjbt = jjbt;
	}

	public String getJjsl() {
		return jjsl;
	}

	public void setJjsl(String jjsl) {
		this.jjsl = jjsl;
	}

	public String getJjjg() {
		return jjjg;
	}

	public void setJjjg(String jjjg) {
		this.jjjg = jjjg;
	}

	public String getJjtp() {
		return jjtp;
	}

	public void setJjtp(String jjtp) {
		this.jjtp = jjtp;
	}

	public boolean isSfky() {
		return sfky;
	}

	public void setSfky(boolean sfky) {
		this.sfky = sfky;
	}

	public String getJjdj() {
		return jjdj;
	}

	public void setJjdj(String jjdj) {
		this.jjdj = jjdj;
	}

	public String getJjlx() {
		return jjlx;
	}

	public void setJjlx(String jjlx) {
		this.jjlx = jjlx;
	}

	public String getJjxq() {
		return jjxq;
	}

	public void setJjxq(String jjxq) {
		this.jjxq = jjxq;
	}

	public boolean isSfsc() {
		return sfsc;
	}

	public void setSfsc(boolean sfsc) {
		this.sfsc = sfsc;
	}

	public Integer getDjl() {
		return djl;
	}

	public void setDjl(Integer djl) {
		this.djl = djl;
	}
	
}
