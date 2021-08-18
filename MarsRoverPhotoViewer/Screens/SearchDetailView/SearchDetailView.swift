//
//  SearchDetailView.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/17/21.
//

import SwiftUI

struct SearchDetailView: View {
    
    @StateObject var searchDetailViewModel: SearchDetailViewModel
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(searchDetailViewModel.photos, id: \.id) { photo in
                        AsyncImage(url: photo.imgSrc,
                                   placeholder: { Text("Loading...").foregroundColor(.white) },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(height: UIScreen.main.bounds.width)
                    }
                }
            }
        }
    }
}
