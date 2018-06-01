import Foundation

let formatter = NumberFormatter()
formatter.numberStyle = .percent
formatter.string(for: 0.12)

formatter.locale = Locale(identifier: "fr")
formatter.string(for: 0.12)

formatter.locale = Locale(identifier: "tr")
formatter.string(for: 0.12)

formatter.locale = Locale(identifier: "eu")
formatter.string(for: 0.12)

formatter.locale = Locale(identifier: "ar")
formatter.string(for: 0.12)
