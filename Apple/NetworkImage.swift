//
//  NetworkImage.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/17.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

class ImageDownloader: BindableObject {
    var didChange = PassthroughSubject<ImageDownloader,Never>()
    var image = UIImage()
    var url : String
    
    init(url: String) {
        self.url = url
    }
    
    func download() {
        let qurl = URL(string: url)
        guard let url = qurl else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let imageData = data {
                if let image = UIImage(data: imageData) {
                    self.image = image
                    DispatchQueue.main.async {
                        self.didChange.send(self)
                    }
                }
            } else {
                
            }
        }.resume()
    }
}

struct NetworkImage : View {
    
    @ObjectBinding var downloader : ImageDownloader
    
    init(_ url: String) {
        downloader = ImageDownloader(url: url)
    }
    
    var body: some View {
        Image(uiImage: downloader.image).resizable(resizingMode:.stretch).onAppear {
            self.downloader.download()
            }.onDisappear {
                
        }
    }
}
