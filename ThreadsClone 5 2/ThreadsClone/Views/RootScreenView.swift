//
//  RootScreenView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 06/02/1445 AH.
//

//import SwiftUI
//
//struct RootScreenView: View {
//  let timer = Timer
//    .TimerPublisher(
//      interval: 2,
//      runLoop: .main,
//      mode: .default
//    )
//    .autoconnect()
//
//  @State var finishedLoadingSplashScreen: Bool = false
//
//  var body: some View {
//    if finishedLoadingSplashScreen {
//      OnboardingView()
//    } else {
//      ZStack {
//        Image("at")
//          .imageScale(.large)
//          .foregroundColor(.accentColor)
//        VStack {
//          Spacer()
//          Text("From Swift-Bootcamp")
//        }
//      }
//      .onReceive(timer) { _ in
//        timer.upstream.connect().cancel()
//        finishedLoadingSplashScreen = true
//      }
//    }
//  }
//}

import SwiftUI

struct RootScreenView: View {
    @EnvironmentObject var userPrefrences: UserPreferencesViewModel
    @State var showSplah = true
    var body: some View {
        VStack {
            if showSplah{
                splashView()
            }
            else{
                OnboardingView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootScreenView().environmentObject(UserPreferencesViewModel())
        
    }
}
