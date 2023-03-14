//
//  GeometryReaderBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 14/03/2023.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach (0..<20) {
                    index in
                        GeometryReader {
                            geometry in
                            RoundedRectangle(cornerRadius: 20)
                                .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(width: 300, height: 250)
                .padding()
            }
        })
        
        
        
//        ScrollView(
//            .horizontal,
//            showsIndicators: true,
//            content: {
//                HStack{
//                    ForEach(0..<20) { index in {
//                            GeometryReader {
//                                geometry in
//                                RoundedRectangle(cornerRadius: 20)
//                                    .rotation3DEffect(Angle(degrees: 30), axis: (x: 0, y: 1, z: 0) )
//                            }
//                    }
//                    .frame()
//                    .padding()
//                    }
//                }
//        })
//
        
        
        
        
        
        
        
        
        
        
        
//        GeometryReader {
//            geometry in
//            HStack(spacing: 0){
//                Rectangle()
//                    .fill(.gray)
//                    .frame(width: geometry.size.width * 0.666)
//                Rectangle()
//            }
//        }
//        .ignoresSafeArea()
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
