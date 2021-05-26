//
//  Interactor.swift
//  ArmenKaramian_DroneDeploy
//
//  Created by armen karamian on 5/25/21.
//

import UIKit

class Interactor
{
	public static let shared = Interactor()
	
	public func getLoginButtonText() -> String
	{
		return Entity.shared.loginButtonName
	}
	
	public func getLoginScreenText() -> String
	{
		return Entity.shared.loginScreenText
	}
	
	public func getPage1Text() -> String
	{
		return Entity.shared.page1Text
	}

	public func getPage2ButtonText() -> String
	{
		return Entity.shared.page2ButtonText
	}
	
	public func getPage2Text() -> String
	{
		return Entity.shared.page2Text
	}
	
	public func getLogoutButtonText() -> String
	{
		return Entity.shared.logoutButtonText
	}
}
