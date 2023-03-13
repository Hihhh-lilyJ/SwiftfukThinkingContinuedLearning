//
//  ScrollViewReaderBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 13/03/2023.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var scrollToIndex:  Int = 0
    @State var textFieldText: String = ""
    var body: some View {
        VStack{
            TextField("Enter a # here...",
                      text: $textFieldText)
            .padding()
                .frame(height: 50)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("SCROLL NOW") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            ScrollView{
                ScrollViewReader {proxy in
                    ForEach(0..<50) {
                        index in
                        Text ("This is the item # \(index)")
                            .font(.title3)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(
                        of: scrollToIndex,
                        perform: { value in
                            withAnimation(.spring()) {
                                proxy.scrollTo(value, anchor: .top)
                        }
                    })
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
