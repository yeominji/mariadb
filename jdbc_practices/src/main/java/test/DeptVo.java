package test;

public class DeptVo {
 private Long no;
 @Override
public String toString() {
	return "DeptVo [no=" + no + ", name=" + name + ", getNo()=" + getNo() + ", getName()=" + getName() + "]";
}
public Long getNo() {
	return no;
}
public void setNo(Long no) {
	this.no = no;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
private String name;
 
}
