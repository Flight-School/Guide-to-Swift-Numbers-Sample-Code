import Foundation

let formatter = NumberFormatter()
formatter.string(for: 4)

formatter.numberStyle = .spellOut
formatter.string(for: 4)

formatter.numberStyle = .none
formatter.string(for: -456)

formatter.locale = Locale(identifier: "ar-SA")
formatter.string(for: 1234567890)

formatter.numberStyle = .spellOut
formatter.locale = Locale(identifier: "zh-Hans")
formatter.string(for: 12345)
