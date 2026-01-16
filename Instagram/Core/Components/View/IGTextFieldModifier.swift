//
//  IGTextFieldModifier.swift
//  Instagram
//
//  Created by Khawla Zarrami on 02/12/2025.
//

import Foundation
import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
             .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 24)
    }
    
}
