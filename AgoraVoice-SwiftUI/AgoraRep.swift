import Foundation
import SwiftUI
import AgoraRtcKit

struct AgoraRep: UIViewControllerRepresentable {
    
    @Binding var isMuted: Bool
    
    func makeUIViewController(context: Context) -> AgoraViewController {
        let agoraViewController = AgoraViewController()
        agoraViewController.agoraDelegate = context.coordinator
        return agoraViewController
    }
    
    func updateUIViewController(_ uiViewController: AgoraViewController, context: Context) {
        isMuted ? (uiViewController.didClickMuteButton(isMuted: true)) : (uiViewController.didClickMuteButton(isMuted: false))
    }
    
    

    class Coordinator: NSObject, AgoraRtcEngineDelegate {
        var parent: AgoraRep
        init(_ agoraRep: AgoraRep) {
            self.parent = agoraRep
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

