import Foundation

public final class UnitForce: Dimension {
    public class var newtons: UnitForce {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "N", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitForce {
        return .newtons
    }
}
