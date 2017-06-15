package dbsearch.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity(name = "measures")
public class Measures {
	public  Measures() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String failurecause;

	private  String  improvement_method;
	
	public String getCause(){
		return failurecause;
	}
	
	public  String  getMethod() {
		return improvement_method;
	}
	
}
