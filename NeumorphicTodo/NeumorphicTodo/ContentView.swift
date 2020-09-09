///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/3/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 0.0
    @State private var isChecked: Bool = false
    
    var body: some View {
        HomeScreen()
        
//        ZStack {
//            Color.bluish
//
//          //  RoundedRectangle(cornerRadius: 20)
////                .fill(Color.bluish)
////                .frame(width: 200, height: 200)
////                .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 20)
//
//            VStack(spacing: 30) {
//                Text("Hello DevTechie!")
//                    .font(.largeTitle)
//                .bold()
//                    .gradientText(colors: [Color.orange, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing)
//
//                NeumorphicProgressBar(value: $value).frame(height: 20).padding()
//
//                Button("My button"){self.value += 0.25}
//                    .foregroundColor(.white)
//                    .buttonStyle(DarkCapsuleButtonStyle(colors: [Color.red, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing, padding: 20))
//
//                NeumorphicCheckbox(isChecked: isChecked, text: "Value is checked") { checkedState in
//                    self.isChecked = checkedState
//                }.padding(40)
//            }
//        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
