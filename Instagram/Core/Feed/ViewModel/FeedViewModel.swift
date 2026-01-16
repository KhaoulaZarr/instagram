//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Khawla Zarrami on 15/01/2026.
//

import Foundation
import Combine
import FirebaseFirestore


class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
