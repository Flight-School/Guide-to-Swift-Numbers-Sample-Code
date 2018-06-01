import Foundation

let temperatureInF = Measurement<UnitTemperature>(value: 72, unit: .fahrenheit)
let temperatureInC = Measurement<UnitTemperature>(value: 20.5, unit: .celsius)

let formatter = MeasurementFormatter()
formatter.locale = Locale(identifier: "en-US")
formatter.string(from: temperatureInF) // 72°F
formatter.string(from: temperatureInC) // 68.9°F

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(from: temperatureInF) // 22,222 °C
formatter.string(from: temperatureInC) // 20,5 °C

formatter.unitOptions = .temperatureWithoutUnit

formatter.locale = Locale(identifier: "en-US")
formatter.string(from: temperatureInF) // 72°
formatter.string(from: temperatureInC) // 20.5° (!)

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(from: temperatureInF) // 72° (!)
formatter.string(from: temperatureInC) // 20,5°
