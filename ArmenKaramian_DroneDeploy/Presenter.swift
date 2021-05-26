//
//  Presenter.swift
//  ArmenKaramian_DroneDeploy
//
//  Created by armen karamian on 5/25/21.
//

/*
Clicking on “Go to Page 2” should push “Page 2” on to the UI.
Clicking on “Logout” from either page should present the “Login Screen” as a modal.
Clicking on “Login” should always present “Page 1” even if “Page 2” was where “Logout” was clicked.

*/

import SwiftUI

class Presenter : ViewDelegate
{
	public static let shared = Presenter()
	
	
	public var logout = false
	private let router : Router

	init()
	{
		router = Router()
	}
	
	func setLoginScreen(_login : LoginScreen)
	{
		router.setLoginScreen(_login: _login)
	}
	
	///login screen

	func loginButtonPressed() -> Page1
	{
		print("login button pressed")
		return router.loginButtonPressed()
	}
	
	//////// page 2
	func pushPage2Pressed() -> Page2
	{
		print("push page 2 pressed")
		return router.pushPage2Pressed()
	}
	
	//////////logout
	func logoutButtonPressed()
	{
		print("logout pressed")
		router.logoutButtonPressed()
	}
}
