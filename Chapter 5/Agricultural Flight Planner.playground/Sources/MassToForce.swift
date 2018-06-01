import Foundation

public func *(lhs: Measurement<UnitMass>, rhs: Measurement<UnitAcceleration>) -> Measurement<UnitForce> {
    return .init(value: lhs.converted(to: .kilograms).value * rhs.converted(to: .metersPerSecondSquared).value, unit: .newtons)
}
