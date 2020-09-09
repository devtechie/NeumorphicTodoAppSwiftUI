///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/4/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct NeumorphicCheckbox: View {
    @State private var isChecked: Bool
    var text: String
    var completion: (Bool) -> Void
    
    init(isChecked: Bool, text: String, completion: @escaping (Bool) -> Void) {
        self._isChecked = State(initialValue: isChecked)
        self.text = text
        self.completion = completion
    }
    
    var body: some View {
        Button(action: {
            self.isChecked.toggle()
            self.completion(self.isChecked)
        }) {
            HStack {
                Image(systemName: self.isChecked ? "checkmark" : "minus")
                Text(self.text)
                Spacer()
            }
            .foregroundColor(Color.darkBluish)
        .padding()
            .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 10)
        }
    }
}
