//
//  SoundsBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 14/03/2023.
//

import SwiftUI
import AVKit

class SoundManager{
    
    static let instance = SoundManager()
    
    var player : AVAudioPlayer?
    
    enum soundOption : String {
        case tada
        case badum
        case dust
    }
    
    func playSound(sound: soundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3")
        else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play  Sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
            Button("Play Sound 3") {
//                SoundManager.instance.playSound(sound: .dust)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
