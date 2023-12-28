//
//  DetailsView.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 29.12.23.
//

import SwiftUI

struct DetailsView: View {
    var newsModel: NewsModel
    
    var body: some View {
        DetailsRepresentableView(newsModel: newsModel)
    }
}

#Preview {
    DetailsView(newsModel: NewsModel(title: "", description: "", urlToImage: ""))
}
