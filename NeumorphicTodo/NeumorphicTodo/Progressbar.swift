///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/3/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct Progressbar: View {
    // 0 to 1
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geo.size.width, height: geo.size.height)
                    .opacity(0.3)
                .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                
                Rectangle().frame(width: self.getProgressWidth(geo: geo), height: geo.size.height)
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                    .animation(.linear)
            }.cornerRadius(45)
        }
    }
    
    private func getProgressWidth(geo: GeometryProxy) -> CGFloat {
        return min(CGFloat(self.value) * geo.size.width, geo.size.width)
    }
}

struct Progressbar_Previews: PreviewProvider {
    static var previews: some View {
        Progressbar(value: .constant(0.5))
    }
}
