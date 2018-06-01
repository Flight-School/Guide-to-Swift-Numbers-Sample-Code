infix operator ==~ : ComparisonPrecedence
public func ==~<T> (lhs: T, rhs: T) -> Bool where T: FloatingPoint  {
    return lhs == rhs || lhs.nextDown == rhs || lhs.nextUp == rhs
}

infix operator !=~ : ComparisonPrecedence
public func !=~<T> (lhs: T, rhs: T) -> Bool where T: FloatingPoint {
    return !(lhs ==~ rhs)
}

extension FloatingPoint {
    public func isApproximatelyEqual(to other: Self,
                                     within margin: Self?,
                                     maximumULPs ulps: Int = 1) -> Bool
    {
        precondition(margin?.sign != .minus && ulps > 0)
        
        guard self != other else {
            return true
        }
        
        let distance = abs(self - other)
        
        if let margin = margin, distance > margin {
            return false
        } else {
            return distance <= (self.ulp * Self(ulps))
        }
    }
}
