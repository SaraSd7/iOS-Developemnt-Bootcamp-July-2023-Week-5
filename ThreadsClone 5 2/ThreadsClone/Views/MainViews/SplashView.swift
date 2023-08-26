//
//  SplashView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 11/02/1445 AH.
//

import Foundation

import SwiftUI

struct splashView: View {
    @EnvironmentObject var userPrefrences: UserPreferencesViewModel
    @State var showSplah = true
    var body: some View {
        
        ZStack{
            Image("at")
                .imageScale(.medium)
                .foregroundColor(.accentColor)
            VStack{
                Spacer()
                HStack{
                    Text("From Meta")
                        .font(.title2)
                }
            }
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                withAnimation{
                    self.showSplah = false
                }
            }
        }
    }
}

struct splashView_Previews: PreviewProvider {
    static var previews: some View {
        splashView().environmentObject(UserPreferencesViewModel())
        
    }
}
