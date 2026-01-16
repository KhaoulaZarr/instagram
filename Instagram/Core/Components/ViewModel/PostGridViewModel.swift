//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Khawla Zarrami on 16/01/2026.
//

import Foundation
import Combine

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws{
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< self.posts.count {
            self.posts[i].user = self.user
        }
    }
}
