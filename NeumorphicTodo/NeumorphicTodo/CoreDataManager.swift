///**
/**

NeumorphicTodo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/5/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

final class CoreDataManager {
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
    // get records
    func getTodos() -> [Todo] {
        var todos = [Todo]()
        let todoRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            todos = try self.managedContext.fetch(todoRequest)
        } catch {
            print(error)
        }
        
        return todos
    }
    
    // save Todo
    func saveTodo(id: UUID, text: String, completed: Bool) {
        let todo = Todo(context: self.managedContext)
        todo.text = text
        todo.id = id
        todo.completed = completed
        
        do {
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // remove todo
    func removeTodo() {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        fetchRequest.predicate = NSPredicate.init(format: "completed == YES")
        
        do {
            let todos = try self.managedContext.fetch(fetchRequest)
            for todo in todos {
                self.managedContext.delete(todo)
            }
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // update todo
    func updateTodo(id: UUID, text: String, completed: Bool) {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        
        do {
            let todo = try self.managedContext.fetch(fetchRequest).first
            todo?.completed = completed
            todo?.text = text
            
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
}
