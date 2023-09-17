package user.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class DateTime {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String date;
	private String signintime;
	private String signouttime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSignintime() {
		return signintime;
	}
	public void setSignintime(String signintime) {
		this.signintime = signintime;
	}
	public String getSignouttime() {
		return signouttime;
	}
	public void setSignouttime(String signouttime) {
		this.signouttime = signouttime;
	}
	
}
