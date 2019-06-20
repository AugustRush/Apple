//
//  ChannelsView.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/10.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

struct ChannelNavWrapper : View {
    var channel : Channel
    
    var body: AnyView {
        switch channel.id {
        case 0:
            return AnyView(PicsumView())
        default:
            return AnyView(Text(channel.name))
        }
    }
}
