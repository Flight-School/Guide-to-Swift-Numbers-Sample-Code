import Foundation

public class UnitLuminousFlux: Dimension {
    public class var lumens: UnitLuminousFlux {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "lm", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitLuminousFlux {
        return .lumens
    }
}
