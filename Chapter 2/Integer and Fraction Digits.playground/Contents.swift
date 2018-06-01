import Foundation

let formatter = NumberFormatter()
formatter.usesSignificantDigits = false // default

formatter.minimumIntegerDigits = 4
formatter.minimumFractionDigits = 2

formatter.string(from: 123)
formatter.string(from: 123456)
formatter.string(from: 123.456)
formatter.string(from: 1.230000)
formatter.string(from: 0.00123)
