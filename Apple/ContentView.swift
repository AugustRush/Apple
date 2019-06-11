//
//  ContentView.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/6.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

struct WhitespaceView : View {
    var body :  some View {
        Text("White space")
    }
}

struct ContentView : View {
    let screenWidth = UIScreen.main.bounds.size.width
    @State var showChannels = false
    @State var channelOffset: CGFloat =  -UIScreen.main.bounds.size.width / 2
    @State var userDraged = false
    
    var body: some View {
        
        let dragGesture = DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged{ (value) in
                if(!self.userDraged) {
                    self.userDraged = true
                }
                
                if(self.showChannels) {
                    self.channelOffset = min(0, value.location.x - value.startLocation.x)
                } else {
                    self.channelOffset = min(0, value.location.x - value.startLocation.x - self.screenWidth / 2)
                }
            }
            .onEnded { (value) in
                self.userDraged = false
                if(value.startLocation.x <= value.location.x) {
                        self.showChannels = true
                        self.channelOffset = 0
                } else {
                    self.showChannels = false
                    self.channelOffset = -self.screenWidth / 2
                }
            }
        
        let channelView = ChannelsView()
        
        return ZStack(alignment: .leading) {
            NavigationView {
                List {
                    Text("Just test")
                }.navigationBarTitle(Text("Home"))
            }
            
            channelView.offset(x: userDraged ?  (self.channelOffset) : (showChannels ? 0 : -screenWidth/2), y: 0).animation(showChannels ? .spring(initialVelocity: 0.6) : nil)
        }.gesture(dragGesture)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
