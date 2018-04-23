package com.tlb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_tlb_gg")
public class TTlbGg extends BaseEntity{

	private static final long serialVersionUID = 1L;
	private String ggid; // 类型id
	private String ggbt; // 公告标题
	private String ggnr; // 公告内容
	private boolean ggsfsc; // 公告是否删除
	
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(length = 32, nullable = false)
	
	public String getGgid() {
		return ggid;
	}
	
	public void setGgid(String ggid) {
		this.ggid = ggid;
	}
	
	public String getGgbt() {
		return ggbt;
	}
	
	public void setGgbt(String ggbt) {
		this.ggbt = ggbt;
	}
	
	public String getGgnr() {
		return ggnr;
	}
	
	public void setGgnr(String ggnr) {
		this.ggnr = ggnr;
	}
	
	public boolean isGgsfsc() {
		return ggsfsc;
	}

	public void setGgsfsc(boolean ggsfsc) {
		this.ggsfsc = ggsfsc;
	}

}
