import Foundation

extension Measurement where UnitType == UnitDuration {
    public init(timeInterval: TimeInterval) {
        self.init(value: timeInterval, unit: .seconds)
    }
}
