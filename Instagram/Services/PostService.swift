//
//  PostService.swift
//  Instagram
//
//  Created by Khawla Zarrami on 16/01/2026.
//

import Foundation
import FirebaseFirestore

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let userPost = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = userPost
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({try $0.data(as: Post.self)})
    }
}
