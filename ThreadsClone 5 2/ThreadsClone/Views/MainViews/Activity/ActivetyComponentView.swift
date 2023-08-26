//
//  ActivetyComponentView.swift
//  ThreadsClone
//
//  Created by Sara Sd on 06/02/1445 AH.
//

import SwiftUI

struct ActivetyComponentView: View {
    var body: some View {
        HStack(alignment: .top){
            AsyncImage(url:URL(string: "https://source.unsplash.com/250x150"))
            { result in
                if let image = result.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    ProgressView()
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(25)
            
            VStack(alignment: .leading){
                HStack {
                    Text("username")
                        .fontWeight(.medium)
                    Text("12S")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                Text("Follow You")
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            Spacer()
            
            Button(action: {
                
            },
                   label: { Text("Follow")
                    .padding(.horizontal,16)
                    .padding(.vertical, 8)
                    .background(RoundedRectangle(cornerRadius: 12.5)
                        .stroke(.gray.opacity(0.25))
                    )
            }
            )
            .buttonStyle(.plain)
            
            
            
        }  .padding(.horizontal)
        
    }
}

struct ActivetyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivetyComponentView()
    }
}
