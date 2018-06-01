import Foundation

public func /(lhs: Measurement<UnitElectricCharge>, rhs: Measurement<UnitElectricPotentialDifference>) -> Measurement<UnitElectricCapacitance> {
    return .init(value: lhs.converted(to: .coulombs).value * rhs.converted(to: .volts).value, unit: .farads)
}
