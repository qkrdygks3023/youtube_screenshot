//
//  SwiftUIView.swift
//  youtube
//
//  Created by 박요한 on 2022/04/15.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable{
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(videoID)")
        else{
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest ( url: youtubeURL))
    }
}
