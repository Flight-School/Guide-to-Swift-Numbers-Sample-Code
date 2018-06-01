import Foundation

let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.string(for: 1234567.89)

formatter.locale = Locale(identifier: "en-GB")
formatter.string(from: 1234567.89)

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(from: 1234567.89)

formatter.locale = Locale(identifier: "hi-IN")
formatter.string(from: 1234567.89)

