//
//  AnalyticsManager.swift
//  MovieSearchCase
//
//  Created by Ertugrul Berber on 11.02.2024.
//

import Foundation
import FirebaseAnalytics

class TagManagerEvent {
    static func logEvent(eventName: String, key: String, value: String) {
        Analytics.logEvent(eventName, parameters: [
            key: value
        ])
    }
}
