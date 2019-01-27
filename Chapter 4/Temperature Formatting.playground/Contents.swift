import Foundation

let 🇺🇸 = Locale(identifier: "en-US")
let 🇫🇷 = Locale(identifier: "fr-FR")


let temperatureInF = Measurement<UnitTemperature>(value: 72, unit: .fahrenheit)
let temperatureInC = Measurement<UnitTemperature>(value: 20.5, unit: .celsius)

let formatter = MeasurementFormatter()
formatter.locale = 🇺🇸
formatter.string(from: temperatureInF) // 72°F
formatter.string(from: temperatureInC) // 68.9°F

formatter.locale = 🇫🇷
formatter.string(from: temperatureInF) // 22,222 °C
formatter.string(from: temperatureInC) // 20,5 °C

formatter.unitOptions = .temperatureWithoutUnit

formatter.locale = 🇺🇸
formatter.string(from: temperatureInF) // 72°
formatter.string(from: temperatureInC) // 20.5° (!)

formatter.locale = 🇫🇷
formatter.string(from: temperatureInF) // 72° (!)
formatter.string(from: temperatureInC) // 20,5°
