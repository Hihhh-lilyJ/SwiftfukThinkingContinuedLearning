//
//  HashableBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 15/03/2023.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash (into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
    ]
    var body: some View {
        ScrollView {
            VStack(spacing: 49 ) {
                ForEach(data, id: \.self) {
                    item in
                    Text (item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
