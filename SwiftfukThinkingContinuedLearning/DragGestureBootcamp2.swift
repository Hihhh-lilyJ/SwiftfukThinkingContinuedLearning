//
//  DragGestureBootcamp2.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 13/03/2023.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State var startingOffSetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY:CGFloat = 0
    @State var endingOffSetY:CGFloat = 0
    
   
    
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            MySignUpView()
                .offset(y: startingOffSetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffSetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                            if currentDragOffsetY < -150 {
                                endingOffSetY =
                                -startingOffSetY
                            } else if
                                endingOffSetY != 0 && currentDragOffsetY > 150 {
                                endingOffSetY = 0
                            }
                        currentDragOffsetY = 0
                    }
                }
            )
            Text("\(currentDragOffsetY)")
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DragGestureBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp2()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign In")
                .font(.title3)
                .fontWeight(.bold)
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("This is the description for our app.Thisnis my favourite SwiftUI course and I reconmend to all my friend to subscribe to Swiftful Thinking")
                .multilineTextAlignment(.center)
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.black).cornerRadius(10)
            Spacer()
        }
        .frame()
        .background(.white)
        .cornerRadius(20)
    }
}
