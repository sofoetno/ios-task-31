//
//  ContentView.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 27.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        
        HStack {
            Image(systemName: "newspaper")
                .foregroundColor(.blue)
            
            Text("News2Day")
                .font(
                    Font.custom("Comfortaa", size: 22)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.06, green: 0.43, blue: 0.86))
        }
        .dynamicTypeSize(.small...DynamicTypeSize.xLarge)
        .padding()
        
        HStack{
            Text("Top headlines")
                .padding()
                .foregroundStyle(.gray)
                .border(.gray, width: 1)
                .cornerRadius(6)
        }
        
        VStack {
            UiTableRepresentableView(newsViewModel: newsViewModel)
                .dynamicTypeSize(.small...DynamicTypeSize.xLarge)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
