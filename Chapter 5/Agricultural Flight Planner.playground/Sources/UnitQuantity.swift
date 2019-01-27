import Foundation

public final class UnitQuantity: Unit {
    public class var moles: UnitQuantity {
        return .init(symbol: "mol")
    }
}
