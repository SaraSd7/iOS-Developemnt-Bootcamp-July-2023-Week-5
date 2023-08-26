//
//  OnboardingView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//

import SwiftUI

struct OnboardingView: View {
    enum CurrentPresentedView {
        case authentication
        case mainView
    }
    @State var presentdView : CurrentPresentedView = .authentication
    // @State var presentdView2 : CurrentPresentedView = .mainView
    @EnvironmentObject var auth : AuthViewModel
    @EnvironmentObject var UserData : UserDataViewModel
    
    var body: some View {
        switch presentdView {
        case .authentication:
            VStack{
                Image("Background")
                    .resizable()
                    .scaledToFill()
                Spacer()
                Button (
                    action: {
                        if auth.signIn(UserData.users.randomElement()!.id){
                            presentdView = .mainView
                        }
                        else {
                            presentdView = .authentication
                        }
                    },   label: {
                        Text("Sign in ")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray)
                            .cornerRadius(12)
                            .padding()
                            .foregroundColor(.white)
                    }
                )
            }
            .onAppear {
                if auth.currentUserId.isEmpty == false {
                    presentdView = .mainView
                }
            }
        case .mainView:
            MainView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
