//
//  MainView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//

import SwiftUI

struct MainView: View {
    //    @State var post: PostModel
    
    enum Screen: String, CaseIterable {
        case home
        case search
        case newPost
        case activity
        case profile
        
        var title: String {
            switch self {
            case.home: return "Home"
            case.search: return "Search"
            case.newPost: return "NewPost"
            case.activity: return "Activity"
            case.profile: return "Profile"
            }
        }
        
        var body: AnyView {
            switch self {
            case.home: return AnyView(HomeView())
            case.search: return AnyView(SearchView())
            case.newPost: return AnyView(NewPostView())
            case.activity: return AnyView(ActivityView())
            case.profile: return AnyView(ProfileView())
            }
            
        }
        var image: String {
            switch self {
            case.home: return "house"
            case.search: return "magnifyingglass"
            case.newPost: return "plus"
            case.activity: return "heart"
            case.profile: return "person"
            }
        }
    }
    @State var currentTitle: String = "Home"
    //    @State var shouldPresentNewPostModel: Bool = false
    var body: some View {
        NavigationView {
            TabView{
                ForEach(Screen.allCases, id: \.self) { screen in
                    //                    if screen == .newPost {
                    //                        Rectangle()
                    //                            .fill(.clear)
                    //                            .tabItem {
                    //                                Label(
                    //                                    screen.title,
                    //                                    systemImage: screen.image
                    //                                )
                    //                            }
                    //                            .onAppear {
                    //                                shouldPresentNewPostModel = true
                    //                            }
                    //                    } else {
                    
                    
                    screen.body
                        .tabItem {
                            Label(
                                screen.title,
                                systemImage: screen.image
                            )
                        }
                        .onAppear {
                            currentTitle = screen.title
                        }
                    //                    }
                }
                
            }
            //            .background(Color.white)
            .navigationTitle(currentTitle)
            //            .sheet(isPresented: $shouldPresentNewPostModel){
            //
            //            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
