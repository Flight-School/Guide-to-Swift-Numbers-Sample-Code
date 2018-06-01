import Foundation

public func *(lhs: Measurement<UnitSpeed>, rhs: Measurement<UnitDuration>) -> Measurement<UnitLength> {
    return .init(value: lhs.converted(to: .metersPerSecond).value * rhs.converted(to: .seconds).value, unit: .meters)
}
