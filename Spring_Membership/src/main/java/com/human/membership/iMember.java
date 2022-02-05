package com.human.membership;

import java.util.ArrayList;

public interface iMember {
	void insertMember(String name,String gender,String userid,String passcode,String interest);
	ArrayList<Member> getMember();
	void login(String userid);
	void logout(String userid);
}
