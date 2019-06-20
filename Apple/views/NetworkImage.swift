//
//  NetworkImage.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/17.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

private final class Loader : BindableObject {
    let didChange = PassthroughSubject<Int,Never>()
    var image = UIImage()
    let url : String
    var subscriber : Subscribers.Sink<URLSession.DataTaskPublisher>?
    
    init(url : String) {
        self.url = url
    }
    
    func _download() {
        guard let Url = URL(string: self.url)  else {
            return
        }
        var request = URLRequest(url: Url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        request.httpMethod = "GET"
        let publisher = URLSession.shared.dataTaskPublisher(for: request)
        subscriber = publisher.sink { (data, response) in
            if let image = UIImage(data: data) {
                self.image = image
                DispatchQueue.main.async {
                    self.didChange.send(0)
                }
            }
        }
    }
    
    func download() {
        DispatchQueue.global().async {
            self._download()
        }
    }
    
    func cancel()  {
        subscriber?.cancel()
    }
}

struct NetworkImage : View {
    
    @ObjectBinding private var loader : Loader
    
    init(_ url: String) {
        loader = Loader(url: url)
    }
    
    var body: some View {
        Image(uiImage: loader.image).resizable(resizingMode:.stretch).onAppear { self.loader.download()  } .onDisappear { self.loader.cancel() }
    }
}
