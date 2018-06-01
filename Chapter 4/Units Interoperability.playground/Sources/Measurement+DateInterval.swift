import Foundation

extension Measurement where UnitType == UnitDuration {
    public init(_ dateInterval: DateInterval) {
        self.init(timeInterval: dateInterval.duration)
    }
}
