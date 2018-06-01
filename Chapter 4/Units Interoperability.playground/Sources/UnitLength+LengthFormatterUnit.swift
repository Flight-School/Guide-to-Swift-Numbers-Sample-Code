import Foundation

extension UnitLength {
    public convenience init(_ lengthFormatterUnit: LengthFormatter.Unit) {
        var unit: UnitLength
        switch lengthFormatterUnit {
        case .centimeter: unit = .centimeters
        case .foot: unit = .feet
        case .inch: unit = .inches
        case .kilometer: unit = .kilometers
        case .meter: unit = .meters
        case .mile: unit = .miles
        case .millimeter: unit = .millimeters
        case .yard: unit = .yards
        }
        
        self.init(symbol: unit.symbol, converter: unit.converter)
    }
}
