//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: AuthViewModel
    @EnvironmentObject var userData: UserDataViewModel
    
    @State var currentUser: UserModel?
    @State var currentUserPosts: [PostModel] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            if let currentUser = currentUser {
                // User is logged in
                VStack(alignment: .leading) {
                    // Header
                    HStack {
                        Spacer()
                        Button(action: {
                            auth.signOut()
                        }) {
                            Text("LogOut")
                        }
                    }
                    
                    // User info section
                    HStack {
                        VStack(alignment: .leading) {
                            if let fullname = currentUser.fullname {
                                Text(fullname)
                                    .font(.title)
                            }
                            
                            Text(currentUser.username)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        AsyncImage(url: currentUser.image) { result in
                            if let image = result.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                ProgressView()
                            }
                        }
                        .clipShape(Circle())
                        .frame(width: 75, height: 75)
                    }
                    
                    // Bio
                    if let bio = currentUser.bio {
                        Text(bio)
                    }
                    Text("\(currentUser.followers.count) followers")
                    
                    // User Actions
                    HStack {
                        Button(action: {
                            // Show Edit Profile Screen
                        }) {
                            Text("Edit profile")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(6.25)
                        }
                        
                        Button(action: {
                            // Show Activity Sharing Method
                        }) {
                            Text("Share profile")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 6.25).stroke(.gray.opacity(0.25)))
                        }
                        .buttonStyle(.plain)
                        .disabled(true)
                    }
                }
                .padding(.horizontal)
            } else {
                // User is not logged in
                VStack(alignment: .leading) {
                    // Header
                    HStack {
                        Spacer()
                        Button(action: {
                            auth.signOut()
                        }) {
                            Text("LogOut")
                        }
                    }
                    
                    // User info section
                    HStack {
                        VStack(alignment: .leading) {
                            Text(String(repeating: "*", count: 16))
                                .font(.title)
                            Text(String(repeating: "*", count: 24))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Circle()
                            .frame(width: 75, height: 75)
                    }
                    
                    // Bio
                    Text(String(repeating: "*", count: 128))
                    Text("12 followers")
                    
                    // User Actions
                    HStack {
                        Button(action: {
                            // Show Edit Profile Screen
                        }) {
                            Text("Edit profile")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(6.25)
                        }
                        
                        Button(action: {
                            // Show Activity Sharing Method
                        }) {
                            Text("Share profile")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 6.25).stroke(.gray.opacity(0.25)))
                        }
                        .buttonStyle(.plain)
                        .disabled(true)
                    }
                }
                .padding(.horizontal)
            }
            
            // Profile info section
            
            // Posts
            ScrollView(showsIndicators: false) {
                ForEach(currentUserPosts) { post in
                    if let user = userData.fetchUserById(post.createdBy) {
                        NavigationLink(destination: {
                            PostScreenView(postModel: post, userModel: user)
                        }) {
                            PostComponentView(postModel: post, userModel: user)
                        }
                        .buttonStyle(.plain)
                        Divider()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                if let uuid = UUID(uuidString: auth.currentUserId) {
                    if let user = userData.fetchUserById(uuid) {
                        self.currentUser = user
                    }
                    self.currentUserPosts = userData.posts.filter { post in
                        return post.createdBy == uuid
                    }
                }
            }
        }
    }
}

