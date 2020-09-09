///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/5/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
class AddNewTodoViewModel {
    func saveTodo(todoVM: TodoViewModel) {
        CoreDataManager.shared.saveTodo(id: todoVM.id, text: todoVM.text, completed: todoVM.completed)
    }
}
