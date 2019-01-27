import Foundation

let 🇺🇸 = Locale(identifier: "en-US")
let 🇫🇷 = Locale(identifier: "fr-FR")
let 🇮🇳 = Locale(identifier: "hi-IN")

let formatter = NumberFormatter()
formatter.numberStyle = .decimal

formatter.locale = 🇺🇸
formatter.string(for: 1234567.89)

formatter.locale = 🇫🇷
formatter.string(from: 1234567.89)

formatter.locale = 🇮🇳
formatter.string(from: 1234567.89)

