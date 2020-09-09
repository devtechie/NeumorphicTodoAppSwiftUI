///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/3/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

extension Color {
    static let bluish = Color(#colorLiteral(red: 0.3333333333, green: 0.7254901961, blue: 0.9529411765, alpha: 1))
    static let darkBluish = Color(#colorLiteral(red: 0.09706708962, green: 0.2112278744, blue: 0.2641180203, alpha: 1))
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
