// Select "View ⯈ Navigators ⯈ Show Project Navigator…" (⌘1)
// and open Sources/FloatingPoint+Approximatation.swift to see implementation

0.1 + 0.2 == 0.3
0.1 + 0.2 ==~ 0.3

(0.1 + 0.2).isApproximatelyEqual(to: 0.3, within: .ulpOfOne)
