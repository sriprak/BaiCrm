package com.bai.baicrm.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "clients")
public class Client implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "client_id")
	private String id;
	@Column(name = "client_name")
	private String name;
	@Column(name = "client_address")
	private String address;
	@Column(name = "client_turnover")
	private String turnover;
	@Column(name = "client_employees")
	private long noe;
	@Column(name = "client_location")
	private String location;
	@Column(name = "client_country")
	private String country;
	@Column(name = "bai_poc")
	private String contactperson;
	@Column(name = "client_type")
	private String typeofclient;
	@Column(name = "assignment_taken")
	private String assignment;
	@Column(name = "sector_of_assignment")
	private String assignsector;
	@Column(name = "year_of_assignment")
	private String assignyear;
	@Column(name = "client_poc")
	private String clientcontact;
	@Column(name = "client_poc_no")
	private String clientnumber;
	@Column(name = "client_poc_email")
	private String clientemail;
	@Column(name = "service_type")
	private String servicetype;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<ClientCommunications> comm;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<AttachedFiles> files;

	public String getClientcontact() {
		return clientcontact;
	}

	public void setClientcontact(String clientcontact) {
		this.clientcontact = clientcontact;
	}

	public String getClientnumber() {
		return clientnumber;
	}

	public void setClientnumber(String clientnumber) {
		this.clientnumber = clientnumber;
	}

	public String getClientemail() {
		return clientemail;
	}

	public void setClientemail(String clientemail) {
		this.clientemail = clientemail;
	}

	public String getServicetype() {
		return servicetype;
	}

	public void setServicetype(String servicetype) {
		this.servicetype = servicetype;
	}

	public String getAssignment() {
		return assignment;
	}

	public void setAssignment(String assignment) {
		this.assignment = assignment;
	}

	public String getAssignsector() {
		return assignsector;
	}

	public void setAssignsector(String assignsector) {
		this.assignsector = assignsector;
	}

	public String getAssignyear() {
		return assignyear;
	}

	public void setAssignyear(String assignyear) {
		this.assignyear = assignyear;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTurnover() {
		return turnover;
	}

	public void setTurnover(String turnover) {
		this.turnover = turnover;
	}

	public long getNoe() {
		return noe;
	}

	public void setNoe(long noe) {
		this.noe = noe;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getContactperson() {
		return contactperson;
	}

	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}

	public String getTypeofclient() {
		return typeofclient;
	}

	public void setTypeofclient(String typeofclient) {
		this.typeofclient = typeofclient;
	}

	public Set<ClientCommunications> getComm() {
		return comm;
	}

	public void setComm(Set<ClientCommunications> comm) {
		this.comm = comm;
	}

	public Set<AttachedFiles> getFiles() {
		return files;
	}

	public void setFiles(Set<AttachedFiles> files) {
		this.files = files;
	}

}