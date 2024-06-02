//
//  CustomToolbar.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

struct CustomToolbar: ToolbarContent {
    
    let title: String
    let leadingTitle: String?
    let leadingAction: () -> Void?
    
    enum TrailingContent {
        case text(String, () -> Void?)
        case image(String, () -> Void?)
    }
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.text.primary)
        }
        
        if let leadingTitle = leadingTitle, !leadingTitle.isEmpty {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    leadingAction()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.callout)
                        
                        Text(leadingTitle)
                            .font(.subheadline)
                    }
                    .foregroundStyle(Color.blue)
                }
            }
        }
    }
}
