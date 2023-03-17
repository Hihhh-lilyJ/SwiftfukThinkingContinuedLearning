//
//  TimerBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 17/03/2023.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3,on: .main, in: .common).autoconnect()
    
    @State var count: Int = 1
    
    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [Color.gray, Color.black]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
               .ignoresSafeArea()
            
            TabView(selection: $count,
                    content: {
                Rectangle()
                    .foregroundColor(.indigo)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.red)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.brown)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
        .onReceive(timer, perform: {
            _ in  withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
