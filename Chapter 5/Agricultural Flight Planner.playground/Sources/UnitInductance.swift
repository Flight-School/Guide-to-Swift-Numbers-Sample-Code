import Foundation

public final class UnitInductance: Dimension {
    public class var henrys: UnitInductance {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "H", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitInductance {
        return .henrys
    }
}
