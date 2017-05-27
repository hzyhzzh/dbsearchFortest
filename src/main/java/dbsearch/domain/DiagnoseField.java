package dbsearch.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "diagnosefield")
@Table
public class DiagnoseField {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String name;
	@ManyToOne
	@JoinColumn(name = "parent")
	private DiagnoseField parent;
	
	public DiagnoseField() {
		super();
	}

	@OneToMany(mappedBy = "parent")
	private Set<DiagnoseField> children;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String DiagnoseFieldName) {
		this.name = DiagnoseFieldName;
	}

	public DiagnoseField getParent() {
		return parent;
	}

	public void setParent(DiagnoseField parent) {
		this.parent = parent;
	}
	public Set<DiagnoseField> getChildren() {
		return children;
	}

	public void setChildren(Set<DiagnoseField> children) {
		this.children = children;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof DiagnoseField))
			return false;
		DiagnoseField other = (DiagnoseField) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
}
