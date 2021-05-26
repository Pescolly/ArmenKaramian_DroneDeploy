//
//  ArmenKaramian_DroneDeployApp.swift
//  ArmenKaramian_DroneDeploy
//
//  Created by armen karamian on 5/25/21.
//

import SwiftUI

@main
struct ArmenKaramian_DroneDeployApp: App
{
	var body: some Scene
	{
		WindowGroup
		{
			LoginScreen(presenter: Presenter.shared)
		}
    }
}
