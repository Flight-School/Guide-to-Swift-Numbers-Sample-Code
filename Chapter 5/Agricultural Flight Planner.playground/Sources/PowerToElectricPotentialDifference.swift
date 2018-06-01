import Foundation

public func /(lhs: Measurement<UnitPower>, rhs: Measurement<UnitElectricCurrent>) -> Measurement<UnitElectricPotentialDifference> {
    return .init(value: lhs.converted(to: .watts).value / rhs.converted(to: .amperes).value, unit: .volts)
}
