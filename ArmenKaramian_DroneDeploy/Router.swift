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
		return LoginScreen()
	}
	
	func loginButtonPressed() -> Page1
	{
		return  Page1()
	}
		
	func pushPage2Pressed() -> Page2
	{
		return Page2()
	}
		
}
