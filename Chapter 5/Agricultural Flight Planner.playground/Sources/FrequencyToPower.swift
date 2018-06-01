import Foundation

public func *(lhs: Measurement<UnitFrequency>, rhs: Measurement<UnitEnergy>) -> Measurement<UnitPower> {
    return .init(value: lhs.converted(to: .hertz).value * rhs.converted(to: .joules).value, unit: .watts)
}
