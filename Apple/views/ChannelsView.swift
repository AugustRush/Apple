//
//  ContentView.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/6.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

struct ChannelsView : View {
    
    var body: some View {
        NavigationView {
            List(Global.channels) { channel in
                NavigationButton(destination: ChannelNavWrapper(channel: channel)) {
                    Text(channel.name)
                }
             }
            .navigationBarTitle(Text("Channels"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ChannelsView()
    }
}
#endif
