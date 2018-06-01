import Foundation

let formatter = NumberFormatter()
formatter.numberStyle = .decimal

// Format with thousands and decimal separator
// that rounds to the nearest five tenths
formatter.format = "#,##0.5"

formatter.locale = Locale(identifier: "en-US")
formatter.string(for: 1234.567)

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(for: 1234.567)
