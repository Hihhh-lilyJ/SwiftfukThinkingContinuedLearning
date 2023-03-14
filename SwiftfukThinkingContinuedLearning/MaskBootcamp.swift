//
//  MaskBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 14/03/2023.
//

import SwiftUI

struct MaskBootcamp: View {
    @State var rating: Int = 2
    var body: some View {
        ZStack{
            starsViews
                .overlay(overlayView.mask(starsViews))
        }
    }
    
    private var overlayView : some View {
        GeometryReader { geometry in
        ZStack(alignment: .leading) {
            Rectangle()
//                .foregroundColor(.yellow)'
                .fill(LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.red]), startPoint: .leading, endPoint: .trailing))
                .frame(width: CGFloat(rating) / 5 * geometry.size.width)
        }
    }
        .allowsHitTesting(false)
}
    
    
    
    private var starsViews : some View {
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(Color.gray)
                    .font(.largeTitle)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                    }
                }
            }
        }
    }
}



struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
