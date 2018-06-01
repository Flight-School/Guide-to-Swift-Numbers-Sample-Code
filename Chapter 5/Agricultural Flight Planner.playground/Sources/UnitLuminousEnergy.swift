import Foundation

public class UnitLuminousEnergy: Dimension {
    public class var lumenSeconds: UnitLuminousEnergy {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "lm s", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitLuminousEnergy {
        return .lumenSeconds
    }
}
