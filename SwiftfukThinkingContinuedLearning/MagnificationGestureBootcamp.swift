//
//  MagnificationGestureBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 13/03/2023.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount : CGFloat = 0
    @State var lastAmount : CGFloat = 0
    
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                Circle().frame(width: 35, height: 35)
                Text("Thinking")
                Spacer()
                Image("ellipsis")
            }
            .padding(.horizontal)
            Rectangle().frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                    }
                        .onEnded { value in
                            currentAmount = 0
                    }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
                    .padding(.horizontal)
                    .font(.headline)
            Text("This is the caption for my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        
        
        
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.gray.cornerRadius(10))
//            .scaleEffect(1 + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//            }
//                    .onChanged { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//            }
//        )
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
