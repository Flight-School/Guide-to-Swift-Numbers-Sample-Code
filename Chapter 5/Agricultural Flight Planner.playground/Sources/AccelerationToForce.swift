import Foundation

public func *(lhs: Measurement<UnitAcceleration>, rhs: Measurement<UnitMass>) -> Measurement<UnitForce> {
    return .init(value: lhs.converted(to: .metersPerSecondSquared).value * rhs.converted(to: .kilograms).value, unit: .newtons)
}
