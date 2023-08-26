//
//  AuthViewModel.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//

//import Foundation
//import SwiftUI
//
//class AuthViewModel: ObservableObject {
//    @AppStorage ("token") var token : String = ""
//
//    func signIn()->Bool {
//        return true
//    }
//
//    func signOut() {
//
//    }
//}

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @AppStorage ("currentUserId") var currentUserId : String = ""
    func signIn(_ id: UserModel.ID) -> Bool {
        currentUserId = id.uuidString
        return true
    }
    
    func signOut() {
      currentUserId = ""
        
    }
    func reset() {
        currentUserId = ""
        
    }
}
