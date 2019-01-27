import Foundation

let 🇺🇸 = Locale(identifier: "en-US")
let 🇫🇷 = Locale(identifier: "fr-FR")
let 🇮🇹 = Locale(identifier: "it-IT")
let 🇯🇵 = Locale(identifier: "ja-JP")

let formatter = NumberFormatter()
formatter.numberStyle = .ordinal

formatter.locale = 🇺🇸
formatter.string(for: 1)

formatter.locale = 🇫🇷
formatter.string(for: 1)

formatter.locale = 🇮🇹
formatter.string(for: 1)

formatter.locale = 🇯🇵
formatter.string(for: 8)
