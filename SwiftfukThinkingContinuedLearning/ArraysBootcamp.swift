//
//  ArraysBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 15/03/2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject{
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
        
       func updateFilteredArray() {
            // sort
            
            // filter
            
            // map
            
            mappedArray = dataArray
                .sorted(by: {$0.points > $1.points})
                .filter({$0.isVerified})
                .compactMap({$0.name})
        }
        
        func getUsers() {
            let user1 = UserModel(name: "Rinn", points: 5, isVerified: true)
            let user2 = UserModel(name: "Eggy", points: 0, isVerified: false)
            let user3 = UserModel(name: "Hih Lily", points: 20, isVerified: false)
            let user4 = UserModel(name: "Lilyy", points: 50, isVerified: true)
            let user5 = UserModel(name: "Nick", points: 45, isVerified: false)
            let user6 = UserModel(name: nil, points: 23, isVerified: true)
            let user7 = UserModel(name: "Amanda", points: 6, isVerified: true)
            let user8 = UserModel(name: nil, points: 28, isVerified: false)
            let user9 = UserModel(name: "Bay", points: 79, isVerified: false)
            let user10 = UserModel(name: "Chi Chi", points: 92, isVerified: false)
            self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
            ])
        }
    }

struct ArraysBootcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) {
                    name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
