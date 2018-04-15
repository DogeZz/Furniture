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
	
	private String yhgzid; // 用户关注
	private String yhid; // 用户id
	private String jjid; // 商户id

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

	public String getJjid() {
		return jjid;
	}

	public void setJjid(String jjid) {
		this.jjid = jjid;
	}

}
