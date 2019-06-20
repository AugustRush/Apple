//
//  PhotosChannelView.swift
//  Apple
//
//  Created by pingwei liu on 2019/6/17.
//  Copyright © 2019 pingwei liu. All rights reserved.
//

import SwiftUI
import Combine

struct Photo : Codable, Identifiable {
    let id : String
    let author : String
    let width : CGFloat
    let height : CGFloat
    let url : String
    let download_url : String
}

class PicsumViewModel: BindableObject {
    let didChange = PassthroughSubject<PicsumViewModel,Never>()
    var photos = [Photo]()
    var pageIndex = 0
    var limit = 50
    
    init() {
        fetchMorePhotos()
    }
    
    func fetchMorePhotos() {
        let qurl = URL(string: "https://picsum.photos/v2/list?page=\(pageIndex)&limit=\(limit)")
        guard let url = qurl else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data!)
                if(photos.count > 0) {
                    self.photos.append(contentsOf: photos)
                    DispatchQueue.main.async {
                        self.didChange.send(self)
                    }
                }
            } catch let err {
                print(err)
            }
        }.resume()
    }
}

struct PicsumView : View {
    
    @ObjectBinding var viewModel = PicsumViewModel()
    let width = screenWidth - 40
    
    var body: some View {
        List {
            ForEach(self.viewModel.photos) { photo in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Author: \(photo.author)").font(.headline)
                    NetworkImage("https://picsum.photos/id/\(photo.id)/\(Int(self.width))/\(Int((photo.height / photo.width) * self.width))").frame(width: self.width, height: (photo.height / photo.width) * self.width, alignment: .leading).cornerRadius(4, antialiased: true)
                }
            }
        }
        .navigationBarTitle(Text("Photos"))
    }
}

#if DEBUG
struct PhotosChannelView_Previews : PreviewProvider {
    static var previews: some View {
        PicsumView()
    }
}
#endif
