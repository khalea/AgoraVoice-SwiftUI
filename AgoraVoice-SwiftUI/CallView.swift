import SwiftUI

struct CallView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isMuted: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to the call!")
                .bold()
            Spacer()
            AgoraRep(isMuted: $isMuted)
                .frame(width: 0, height: 0, alignment: .center)
            HStack {
                Image(systemName: "mic.circle.fill")
                    .font(.system(size: 64.0))
                    .foregroundColor(isMuted ? Color.yellow : Color.blue)
                    .padding()
                    .onTapGesture {
                        isMuted ? (isMuted = false) : (isMuted = true)
                    }
                
                Spacer()
                
                Image(systemName: "phone.circle.fill")
                    .font(.system(size: 64.0))
                    .foregroundColor(.red)
                    .padding()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding()
            
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
            .previewLayout(.device)
            .previewDevice("iPhone 12 Pro")
    }
}
