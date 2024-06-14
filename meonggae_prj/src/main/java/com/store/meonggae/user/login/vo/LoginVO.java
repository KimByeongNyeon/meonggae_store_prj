package com.store.meonggae.user.login.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LoginVO {
	private String id, pass;

	public LoginVO(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
}