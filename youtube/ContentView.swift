//
//  ContentView.swift
//  youtube
//
//  Created by 박요한 on 2022/04/15.
//

import SwiftUI
import AVKit
import YouTubePlayerKit

struct ContentView: View {
    let youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=PN8fjzXY-Jw"
    
    var successHandler: (() -> Void)?
        var errorHandler: ((Error) -> Void)?

    
    var videoView: some View {
    
        VStack{
            Text("Hello, SwiftUI")
                       .padding()
                       .background(Color.red)
                       .foregroundColor(.white)
                       .clipShape(Capsule())
//            VideoView(videoID: "PN8fjzXY-Jw").frame(
//                   minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
//               .cornerRadius(12)
//               .padding(.horizontal, 24)
            
            YouTubePlayerView(self.youTubePlayer) { state in
                // Overlay ViewBuilder closure to place an overlay View
                // for the current `YouTubePlayer.State`
                switch state {
                case .idle:
                    ProgressView()
                case .ready:
                    EmptyView()
                case .error(let error):
                    Text(verbatim: "YouTube player couldn't be loaded")
                }
            }
            Text("End Button")
                       .padding()
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .clipShape(Capsule())
        }
        
       
    }
    
   

        var body: some View {
            VStack{
                videoView
                Button("save "){
                   let image = videoView.snapshot()
                    //let image = videoView.snapshot01()
                   // let image = videoView.snapshotiOS15()
                    //let renderer = UIGraphicsImageRenderer(bounds: videoView.imageRendererFormat.bounds)
                    
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    print("succ")
                  
                    
                  
                }

            }
        }
    
    
    
   
    
    
}



extension View {
    func snapshotiOS15() -> UIImage {

        let controller = UIHostingController(rootView: self)
        let view = controller.view
    
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.opaque = true
            
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
            
        let window = UIWindow(frame: view!.bounds)
        window.addSubview(controller.view)
        window.makeKeyAndVisible()
            
        let renderer = UIGraphicsImageRenderer(bounds: view!.bounds, format: format)
        return renderer.image { rendererContext in
                view?.layer.render(in: rendererContext.cgContext)
        }
    }
}

//extension View { //성공
//    func snapshot01() -> UIImage {
//
//        let renderer = UIGraphicsImageRenderer(
//        )
//
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//}
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
