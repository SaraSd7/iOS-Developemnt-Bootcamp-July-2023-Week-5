//
//  PostComponentView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//

import SwiftUI

struct PostComponentView: View {
    @EnvironmentObject var auth : AuthViewModel
    let postModel: PostModel
    let userModel: UserModel
    var body: some View {
        //        ScrollView(showsIndicators: false) {
        HStack{
            VStack{
                AsyncImage(url: userModel.image) {
                    result in
                    if let image = result.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else {
                        ProgressView()
                    }
                }
                .cornerRadius(25)
                .frame(width: 50, height: 50)
                Spacer()
            }
            .padding(4)
            //post info
            VStack(alignment: .leading){
                HStack{
                    Text(userModel.username)
                        .bold()
                    Spacer()
                    Text(makePrettyDate())
                        .foregroundColor(.gray)
                    Image(systemName: "ellipsis")
                }
                if let content = postModel.content {
                    Text(content)
                }
                
                if postModel.attachement.count > 0 {
                    ScrollView(.horizontal ,showsIndicators: false) {
                        HStack{
                            ForEach(postModel.attachement, id: \.self) { attachment in
                                AsyncImage(url: attachment) { result in
                                    if let image = result.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    }else {
                                        ProgressView()
                                        
                                    }
                                }
                                .frame(width: 300 , height: 200)
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                HStack {
                    if postModel.likes.contains(UUID(uuidString: auth.currentUserId)!){
                        
                        Image(systemName: "heart.fill")
                        
                    } else {
                        Image(systemName: "heart")
                    }
                    Image(systemName: "message")
                    
                    Image(systemName: "arrow.2.squarepath")
                    
                    Image(systemName: "paperplane")
                }
                //  .foregroundColor(.black)
                
                HStack{
                    //                         if postModel replies.count > 0 {
                    //                        }
                    Text("\(postModel.replies.count) replies . \(postModel.likes.count) likes")
                        .foregroundColor(.gray)
                }
            }
            .padding(4)
        }
        .padding(8)
    }
    //        Text(postModel.likes.description)
    //            .foregroundColor(.gray)
    //            .padding(.top, 4)
    
    //.padding(.horizontal)
    
    func makePrettyDate() -> String {
        //        var postDate: PostModel
        let formatter: DateIntervalFormatter = .init()
        formatter.timeStyle = .short
        //           return  postModel.createdAt.formatted(date : .long , time : .omitted)
        let components = Calendar.current.dateComponents([.minute, .hour, .day], from: postModel.createdAt, to: Date())
        
        if let minuteCount = components.minute {
            if minuteCount >= 60 {
                if let hoursCount = components.hour {
                    if hoursCount >= 24 {
                        if let dayCount = components.day {
                            if dayCount >= 28 {
                                return postModel.createdAt.formatted(date: .long, time: .omitted)
                            } else {
                                return" \(dayCount) d"
                            }
                        }
                        
                    } else {
                        return " \(hoursCount)h"
                    }
                    
                }
            } else {
                return "\(minuteCount) m"
            }
            
        }
        return ""
        
    }
}
//struct PostComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostComponentView()
//    }
//}


