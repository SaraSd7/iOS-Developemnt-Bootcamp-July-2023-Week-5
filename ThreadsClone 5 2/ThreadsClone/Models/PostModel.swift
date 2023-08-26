//
//  PostModel.swift
//  ThreadsClone
//
//  Created by Sara Sd on 04/02/1445 AH.
//
import Foundation
import SwiftUI

struct PostModel: Identifiable {
    typealias ID = UUID
    let id: UUID = .init()
    let content: Optional<String>
    let attachement: Array<URL>
    var likes: Array<UserModel.ID>
    var replies: Array<PostModel.ID>
    let createdAt: Date
    let createdBy: UserModel.ID
}


