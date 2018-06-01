import Foundation

extension UnitDuration {
    public class var nanoseconds: UnitDuration {
        let converter = UnitConverterLinear(coefficient: 0.0000000001)
        return .init(symbol: "ns", converter: converter)
    }
}

extension Measurement where UnitType == UnitDuration {
    public init?(_ dateComponents: DateComponents) {
        guard dateComponents.era == nil,
            dateComponents.year == nil,
            dateComponents.month == nil,
            dateComponents.day == nil,
            dateComponents.weekday == nil,
            dateComponents.weekdayOrdinal == nil,
            dateComponents.weekOfYear == nil,
            dateComponents.yearForWeekOfYear == nil
            else {
                return nil
        }
        
        let nanoseconds = Measurement<UnitDuration>(value: Double(dateComponents.nanosecond ?? 0), unit: .nanoseconds)
        let seconds = Measurement<UnitDuration>(value: Double(dateComponents.second ?? 0), unit: .seconds)
        let minutes = Measurement<UnitDuration>(value: Double(dateComponents.minute ?? 0), unit: .minutes)
        let hours = Measurement<UnitDuration>(value: Double(dateComponents.minute ?? 0), unit: .hours)
        let total = nanoseconds + seconds + minutes + hours
        
        self.init(value: total.value, unit: total.unit)
    }
}
