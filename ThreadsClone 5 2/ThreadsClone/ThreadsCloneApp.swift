//
//  ThreadsCloneApp.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//

import SwiftUI

@main
struct ThreadsCloneApp: App {
    @ObservedObject var userprefernces = UserPreferencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var userData = UserDataViewModel()
    
    init() {
        auth.reset()
    }
    var body: some Scene {
        WindowGroup {
            //            NavigationView{
            RootScreenView()
                .environmentObject(userprefernces)
                .environmentObject(auth)
                .environmentObject(userData)
        }
        //        }
    }
}
