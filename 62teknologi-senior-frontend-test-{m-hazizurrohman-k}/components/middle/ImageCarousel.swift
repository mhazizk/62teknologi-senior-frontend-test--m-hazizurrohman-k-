//
//  ImageCarousel.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

/**
 Custom image carousel to show array of images in horizontal way.
 Also holds the popup to show selected image in fullscreen
 */
struct ImageCarousel: View {
    var imageUrl: [String]
    @State private var selectionIndex: Int = 0
    @State private var isFullScreen: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(imageUrl, id: \.self) { url in
                        ZStack {
                            AsyncImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                            .clipped()
                            
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .onTapGesture {
                            isFullScreen = true
                            selectionIndex = imageUrl.firstIndex(of: url) ?? 0
                        }
                    }
                }
            }
            .background(Color.black)
            .sheet(isPresented: $isFullScreen) {
                VStack {
                    TabView(selection: $selectionIndex) {
                        ForEach(imageUrl.indices, id: \.self) { index in
                            AsyncImage(url: URL(string: imageUrl[index])) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .onAppear {
                        selectionIndex = imageUrl.firstIndex(of: imageUrl[selectionIndex]) ?? 0
                    }
                    
                    Button("Close") {
                        isFullScreen = false
                    }
                    .padding(.bottom)
                }
                .background(.black)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}
