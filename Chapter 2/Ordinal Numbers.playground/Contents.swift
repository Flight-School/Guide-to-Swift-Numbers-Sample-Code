import Foundation

let formatter = NumberFormatter()
formatter.numberStyle = .ordinal
formatter.string(for: 1)

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(for: 1)

formatter.locale = Locale(identifier: "it-IT")
formatter.string(for: 1)

formatter.locale = Locale(identifier: "ja-JP")
formatter.string(for: 8)
