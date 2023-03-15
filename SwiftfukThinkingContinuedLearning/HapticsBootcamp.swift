//
//  HapticsBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 14/03/2023.
//

import SwiftUI
class HapticManager {
    static let instance = HapticManager()
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20){
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Divider()
            Button("soft") {HapticManager.instance.impact(style:
                .soft)}
            Button("heavy") {HapticManager.instance.impact(style:
                .heavy)}
            Button("light") {HapticManager.instance.impact(style: .light)}
            Button("rigid") {HapticManager.instance.impact(style: .rigid)}
            Button("medium") {HapticManager.instance.impact(style: .medium)}
        }
    }
}

struct HapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootcamp()
    }
}
