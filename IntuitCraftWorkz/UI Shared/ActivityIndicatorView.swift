//
//  ActivityIndicatorView.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import SwiftUI

/// Apple still doesn't seem to have one... so...
struct ActivityIndicatorView: UIViewRepresentable {
    typealias  UIViewType = UIActivityIndicatorView
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

/// Standard Lodingscreen Overlay
struct LoadingDataView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack {
            Text("Loading...")
            ActivityIndicatorView(shouldAnimate: $isLoading)
        }
        .frame(width: 140, height: 100)
        .background(Color.secondary.opacity(0.6))
        .foregroundColor(Color.primary)
        .cornerRadius(20)
        .opacity(isLoading ? 1.0 : 0)
    }
}
