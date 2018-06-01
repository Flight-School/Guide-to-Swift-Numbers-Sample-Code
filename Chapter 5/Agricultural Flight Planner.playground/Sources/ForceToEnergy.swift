import Foundation

public func *(lhs: Measurement<UnitForce>, rhs: Measurement<UnitLength>) -> Measurement<UnitEnergy> {
    return .init(value: lhs.converted(to: .newtons).value * rhs.converted(to: .meters).value, unit: .joules)
}
