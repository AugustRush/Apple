//
//  ChannelsViewModel.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/13.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ChannelsViewModel: BindableObject {
    let channels =  [Channel(id: "0", name: "纽约时报", icon: "channel_paper"),Channel(id: "1", name: "小说", icon: "channel_novel"),Channel(id: "2", name: "福利社", icon: "channel_happy")]
    let didChange = PassthroughSubject<Int,Never>()
    var current = Channel(id: "0", name: "纽约时报", icon: "channel_paper")
    var showChannels = false
    
    func updateCurrent(channel: Channel)  {
        self.current = channel
        self.showChannels = false
        didChange.send(0)
    }
}
