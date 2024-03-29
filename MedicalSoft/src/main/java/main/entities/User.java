package main.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "users")
public class User {

	private Long id;
	private String username;
    
	private String password;
    private String passwordConfirm;
    private String name;
    private float salary;
    private Set<Role> roles;
    
    public User( String username, String password, String passwordConfirm, String name, float salary) {
		this.username = username;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.name = name;
		this.salary = salary;
		
	}

	public User(String username){
    	this.username=username;
    }
    
    public User(){
    	this(null);
    }
    
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "username"), inverseJoinColumns = @JoinColumn(name = "role"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    
    public String printRoles(){
    	String result="";
    	for (Role r:roles){
    		result=result.concat(r.getName()+" ");
    	}
    	return result;
    }
    
}
