import Foundation

public func /(lhs: Measurement<UnitLength>, rhs: Measurement<UnitDuration>) -> Measurement<UnitSpeed> {
    return .init(value: lhs.converted(to: .meters).value / rhs.converted(to: .seconds).value, unit: .metersPerSecond)
}
