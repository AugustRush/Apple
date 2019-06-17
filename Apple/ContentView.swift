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

internal let screenWidth = UIScreen.main.bounds.size.width

struct ContentView : View {
    @State var channelOffset: CGFloat =  -UIScreen.main.bounds.size.width / 2
    @State var userDraged = false
    @EnvironmentObject var viewModel : ChannelsViewModel
    
    var body: some View {
        
        let dragGesture = DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged{ (value) in
                if(!self.userDraged) {
                    self.userDraged = true
                }
                
                if(self.viewModel.showChannels) {
                    self.channelOffset = min(0, value.location.x - value.startLocation.x)
                } else {
                    self.channelOffset = min(0, value.location.x - value.startLocation.x - screenWidth / 2)
                }
            }
            .onEnded { (value) in
                self.userDraged = false
                if(value.startLocation.x <= value.location.x) {
                        self.viewModel.showChannels = true
                        self.channelOffset = 0
                } else {
                    self.viewModel.showChannels = false
                    self.channelOffset = -screenWidth / 2
                }
            }
        
        let channelView = ChannelsView()
        
        return ZStack(alignment: .leading) {
            NavigationView {
                List {
                    Text("Just test")
                }.navigationBarTitle(Text(self.viewModel.current.name))
            }
            channelView.offset(x: userDraged ?  (self.channelOffset) : (self.viewModel.showChannels ? 0 : -screenWidth/2), y: 0).animation(.spring(initialVelocity: 0.6))
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
