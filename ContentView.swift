//
//  ContentView.swift
//  AgoraSwiftUI
import SwiftUI

struct ContentView: View {
    @State private var showCall: Bool = false
    
    var body: some View {
        Button(action: {showCall = true}) {
            Text("Join Call")
                .font(.title)
                .foregroundColor(.white)
                .padding(.all)
        }
        .background(Color.green)
        .cornerRadius(8.0)
        .fullScreenCover(isPresented: $showCall, content: {
            CallView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
