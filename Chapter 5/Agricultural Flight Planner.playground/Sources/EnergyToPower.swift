import Foundation

public func /(lhs: Measurement<UnitEnergy>, rhs: Measurement<UnitDuration>) -> Measurement<UnitPower> {
    return .init(value: lhs.converted(to: .joules).value / rhs.converted(to: .seconds).value, unit: .watts)
}

public func *(lhs: Measurement<UnitEnergy>, rhs: Measurement<UnitFrequency>) -> Measurement<UnitPower> {
    return .init(value: lhs.converted(to: .joules).value * rhs.converted(to: .hertz).value, unit: .watts)
}
