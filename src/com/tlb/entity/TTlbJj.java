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
//	private String shid; // 商店id
	private String jjbt; // 家具标题
	private String jjfbt; // 家具标题
	private Integer jjsl; // 家具数量
	private Double jjjg; // 家具单价
	private String jjtp; // 家具图片
	private Integer jjdj; // 家具等级
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

//	public String getShid() {
//		return shid;
//	}
//
//	public void setShid(String shid) {
//		this.shid = shid;
//	}

	public String getJjbt() {
		return jjbt;
	}

	public void setJjbt(String jjbt) {
		this.jjbt = jjbt;
	}

	public String getJjfbt() {
		return jjfbt;
	}

	public void setJjfbt(String jjfbt) {
		this.jjfbt = jjfbt;
	}

	public Integer getJjsl() {
		return jjsl;
	}

	public void setJjsl(Integer jjsl) {
		this.jjsl = jjsl;
	}

	public Double getJjjg() {
		return jjjg;
	}

	public void setJjjg(Double jjjg) {
		this.jjjg = jjjg;
	}

	public String getJjtp() {
		return jjtp;
	}

	public void setJjtp(String jjtp) {
		this.jjtp = jjtp;
	}

	public Integer getJjdj() {
		return jjdj;
	}

	public void setJjdj(Integer jjdj) {
		this.jjdj = jjdj;
	}

	public String getJjlx() {
		return jjlx;
	}

	public void setJjlx(String jjlx) {
		this.jjlx = jjlx;
	}

	@Column(columnDefinition = "Text")
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
