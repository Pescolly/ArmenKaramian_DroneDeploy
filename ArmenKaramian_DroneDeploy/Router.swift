//
//  Router.swift
//  ArmenKaramian_DroneDeploy
//
//  Created by armen karamian on 5/25/21.
//

import SwiftUI

class Router
{
	private var login : LoginScreen?
	private var page1 : Page1?
	private var page2 : Page2?
	
	init()
	{}

	func logoutButtonPressed() -> LoginScreen
	{
		let l = LoginScreen(presenter: Presenter.shared)
		login = l
		return l
	}
	
	func loginButtonPressed() -> Page1
	{
		let p =  Page1(presenter: Presenter.shared)
		page1 = p
		return p
	}
		
	func pushPage2Pressed() -> Page2
	{
		let p = Page2(presenter: Presenter.shared)
		page2 = p
		return p
	}
		
}
