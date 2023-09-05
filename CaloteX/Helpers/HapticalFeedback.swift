//
//  HapticalFeedback.swift
//  CaloteX
//
//  Created by Mateus Marinho on 05/09/23.
//

import Foundation
import UIKit

func successHapticalFeedback() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}

func tapHapticalFeedback() {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    feedbackGenerator.impactOccurred()
}
