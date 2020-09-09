///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/5/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation

class TodoViewModel: Identifiable {
    var id: UUID
    var text: String
    var completed: Bool
    
    init(id: UUID, text: String, completed: Bool) {
        self.id = id
        self.text = text
        self.completed = completed
    }
    
    init(todo: Todo) {
        self.id = todo.id!
        self.completed = todo.completed
        self.text = todo.text!
    }
}
