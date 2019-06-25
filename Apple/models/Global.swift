//
//  Global.swift
//  Apple
//
//  Created by August on 2019/6/20.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI

struct Global {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let channels =  [Channel(id: 0, name: "纽约时报", icon: "channel_paper"),Channel(id: 1, name: "小说", icon: "channel_novel"),Channel(id: 2, name: "福利社", icon: "channel_happy")]
    
    static let color1 = Color(red: 238, green: 244, blue: 249)
    static let color2 = Color(red: 205, green: 222, blue: 237)
    static let color3 = Color(red: 145, green: 182, blue: 199)
    static let color4 = Color(red: 81, green: 102, blue: 154)
    static let color5 = Color(red: 132, green: 166, blue: 243)
    static let color6 = Color(red: 219, green: 192, blue: 200)
}

struct Unsplash {
    static let accessKey = "a2f8563a119a002ebf9c3f6db7abab76eea38c931efec0fd04a710823021614d"
    static let secretKey = "f292f4d1079b5f11cefbe2739ab13662c46015c980b5b3f7c8468b470641af64"
}
