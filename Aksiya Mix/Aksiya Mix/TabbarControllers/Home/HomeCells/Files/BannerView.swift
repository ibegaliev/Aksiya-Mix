//
//  BannerView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                GeometryReader { geo in
                    let size = geo.size
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(locations) { location in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    
                                    let minX = min((proxy.frame(in: .scrollView).minX - 30) * 1.4, size.width * 1.4)
                                    
                                    Image(location.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                                }
                                .frame(width: size.width - 60, height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                }
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 20)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
        .background(Color.init(uiColor: .backColor))
    }
}

#Preview {
    BannerView()
}

struct Location: Identifiable, Hashable {
    var id = UUID()
    var image: String
}

var locations: [Location] = [
    Location(image: "MarketAd"),
    Location(image: "SamsungAd"),
    Location(image: "YandexAd")
]
