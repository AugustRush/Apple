//
//  ContentView.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/6.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

internal let screenWidth = UIScreen.main.bounds.size.width
let allChannels =  [Channel(id: 0, name: "纽约时报", icon: "channel_paper"),Channel(id: 1, name: "小说", icon: "channel_novel"),Channel(id: 2, name: "福利社", icon: "channel_happy")]

struct ChannelsView : View {
    
    var body: some View {
        NavigationView {
            List(allChannels) { channel in
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
