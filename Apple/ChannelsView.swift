//
//  ChannelsView.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/10.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

struct Channel: Identifiable {
    var id: String = ""
    var name = ""
    var icon = ""
}

struct ChannelsView : View {
    
    @EnvironmentObject var viewModel: ChannelsViewModel
    
    var body: some View {
        HStack {
            List(self.viewModel.channels.identified(by: \.id)) { channel in
                HStack {
                    Image(channel.icon).resizable(capInsets: EdgeInsets(), resizingMode: .stretch).renderingMode(.template).frame(width: 40, height: 40, alignment: .leading).foregroundColor(.gray)
                    Text(channel.name).font(.callout)
                    }
                    .tapAction {
                        self.viewModel.updateCurrent(channel: channel)
                    }
            }.shadow(color: .gray, radius: 2, x: 2, y: 2)
            
            Spacer()
        }.background(Color.clear)
    }
}

#if DEBUG
struct ChannelsView_Previews : PreviewProvider {
    static var previews: some View {
        ChannelsView()
    }
}
#endif
