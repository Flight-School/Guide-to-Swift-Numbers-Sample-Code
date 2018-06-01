import Foundation

public func *(lhs: Measurement<UnitLength>, rhs: Measurement<UnitForce>) -> Measurement<UnitEnergy> {
    return .init(value: lhs.converted(to: .meters).value * rhs.converted(to: .newtons).value, unit: .joules)
}
