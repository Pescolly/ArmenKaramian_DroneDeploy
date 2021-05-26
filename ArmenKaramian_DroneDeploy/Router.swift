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

	public func setLoginScreen(_login : LoginScreen)
	{
		login = _login
	}
	
	func logoutButtonPressed()// -> LoginScreen
	{
//		page2?.dismiss()
//		page1?.dismiss()
//		login?.navigationOnScreen = false
	}
	
	func loginButtonPressed() -> Page1
	{
		let p =  Page1(presenter: Presenter.shared, logoutButtonText: Interactor.shared.getLogoutButtonText(), page1Text: Interactor.shared.getPage1Text(), page2ButtonText: Interactor.shared.getPage2ButtonText())
		page1 = p
		return p
	}
		
	func pushPage2Pressed() -> Page2
	{
		let p = Page2(presenter: Presenter.shared, logout: Interactor.shared.getLogoutButtonText(), text: Interactor.shared.getPage2Text())
		page2 = p
		return p
	}
		
}
