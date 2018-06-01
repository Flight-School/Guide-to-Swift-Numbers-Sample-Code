import Foundation

public func *(lhs: Measurement<UnitElectricCurrent>, rhs: Measurement<UnitDuration>) -> Measurement<UnitElectricCharge> {
    return .init(value: lhs.converted(to: .amperes).value * rhs.converted(to: .seconds).value, unit: .coulombs)
}
