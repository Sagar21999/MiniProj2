package com.example.project.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="test")
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@NotBlank(message="Patient Name cannot be empty")
	private String patientName;
	
	@NotNull(message="Age cannot be empty")
	@Min(value=1, message="Age cannot be less than 0")
	private Integer age;
	
	@NotBlank(message="Gender cannot be empty")
	private String gender;
	
	@NotBlank(message="Blood Group cannot be empty")
	private String bloodGroup;
	
	@NotNull(message="Adhaar Card Number  cannot be empty")
	private Long adhaar;
	
	@NotNull(message="Contact Number  cannot be empty")
	private Long contact;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfTest;
	
	private String status;

	public Test(Integer id, @NotBlank(message = "Patient Name cannot be empty") String patientName,
			@NotNull(message = "Age cannot be empty") Integer age,
			@NotBlank(message = "Gender cannot be empty") String gender,
			@NotBlank(message = "Blood Group cannot be empty") String bloodGroup,
			@NotNull(message = "Adhaar Card Number  cannot be empty") Long adhaar,
			@NotNull(message = "Contact Number  cannot be empty") Long contact,
			@NotNull(message = "Date Of Test cannot be empty") Date dateOfTest, String status) {
		super();
		this.id = id;
		this.patientName = patientName;
		this.age = age;
		this.gender = gender;
		this.bloodGroup = bloodGroup;
		this.adhaar = adhaar;
		this.contact = contact;
		this.dateOfTest = dateOfTest;
		this.status = status;
	}

	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Test [id=" + id + ", patientName=" + patientName + ", age=" + age + ", gender=" + gender
				+ ", bloodGroup=" + bloodGroup + ", adhaar=" + adhaar + ", contact=" + contact + ", dateOfTest="
				+ dateOfTest + ", status=" + status + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public Long getAdhaar() {
		return adhaar;
	}

	public void setAdhaar(Long adhaar) {
		this.adhaar = adhaar;
	}

	public Long getContact() {
		return contact;
	}

	public void setContact(Long contact) {
		this.contact = contact;
	}

	public Date getDateOfTest() {
		return dateOfTest;
	}

	public void setDateOfTest(Date dateOfTest) {
		this.dateOfTest = dateOfTest;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
