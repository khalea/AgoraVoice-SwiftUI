import Foundation
import AgoraRtcKit

class AgoraViewController: UIViewController {
    
    var agoraKit: AgoraRtcEngineKit?
    var agoraDelegate: AgoraRtcEngineDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAgoraEngine()
        joinChannel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        leaveChannel()
        destroyInstance()
    }
    
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "YOUR_APP_ID", delegate: agoraDelegate)
    }
    
    func joinChannel() {
        agoraKit?.joinChannel(byToken: "Token", channelId: "TestChannel", info: nil, uid: 0, joinSuccess: {(channel, uid, elapsed) in
        })
    }
    
    func leaveChannel() {
        agoraKit?.leaveChannel(nil)
    }
    
    func destroyInstance() {
        AgoraRtcEngineKit.destroy()
    }
    
    func didClickMuteButton(isMuted: Bool) {
        agoraKit?.muteLocalAudioStream(isMuted)
    }
}
