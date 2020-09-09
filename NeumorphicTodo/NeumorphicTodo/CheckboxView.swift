///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/3/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked: Bool
    var onTap: (_ isChecked: Bool) -> Void
    
    func toggle() {
        self.isChecked.toggle()
        self.onTap(self.isChecked)
    }
    
    var body: some View {
        Button(action: toggle) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square").frame(width: 30, height: 30)
            }
        }
    }
}

