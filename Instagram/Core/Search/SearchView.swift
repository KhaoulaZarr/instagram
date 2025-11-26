//
//  SearchView.swift
//  Instagram
//
//  Created by Khawla Zarrami on 26/11/2025.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0 ... 15, id: \.self) { user in
                        HStack {
                            Image("batman-2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("batman")
                                    .fontWeight(.semibold)
                                Text("Bruce Wayne")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search ...")
        
            
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
