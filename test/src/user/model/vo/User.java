package user.model.vo;

public class User {
private int userNo;
private String userId;
private String userName;
private int userAge;



public User() {}



public User(int userNo, String userId, String userName, int userAge) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userName = userName;
	this.userAge = userAge;
}



public int getUserNo() {
	return userNo;
}



public void setUserNo(int userNo) {
	this.userNo = userNo;
}



public String getUserId() {
	return userId;
}



public void setUserId(String userId) {
	this.userId = userId;
}



public String getUserName() {
	return userName;
}



public void setUserName(String userName) {
	this.userName = userName;
}



public int getUserAge() {
	return userAge;
}



public void setUserAge(int userAge) {
	this.userAge = userAge;
}



}
