import Foundation

let 🇺🇸 = Locale(identifier: "en-US")
let 🇫🇷 = Locale(identifier: "fr-FR")

let formatter = NumberFormatter()
formatter.numberStyle = .decimal

// Format with thousands and decimal separator
// that rounds to the nearest five tenths
formatter.format = "#,##0.5"

formatter.locale = 🇺🇸
formatter.string(for: 1234.567)

formatter.locale = 🇫🇷
formatter.string(for: 1234.567)
