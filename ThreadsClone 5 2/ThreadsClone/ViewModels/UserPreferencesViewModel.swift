//
//  UserPreferencesViewModel.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//

import Foundation
import SwiftUI
class UserPreferencesViewModel: ObservableObject{
    @AppStorage("userSessionToken") var token: String = ""
}


