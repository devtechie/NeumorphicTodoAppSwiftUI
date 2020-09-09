///**
/**
 
 NeumorphicTodo
 CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 7/6/20
 COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC
 
 */

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel = TodoListViewModel()
    
    @State private var addNewSheet: Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.bluish
            
            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    // top headline
                    HStack {
                        Text("Task Manager")
                            .font(.largeTitle)
                            .bold()
                            .gradientText(colors: [Color.blue, Color.darkBluish], startPoint: .top, endPoint: .bottom)
                        
                        Spacer()
                        
                        // trash button
                        Button(action: {
                            self.viewModel.removeCompleted()
                        }) {
                            Image(systemName: "trash.fill")
                                .font(.body)
                                .foregroundColor(.white)
                        }.buttonStyle(DarkCircleButtonStyle(colors: [Color.pink, Color.red], startPoint: .leading, endPoint: .trailing, padding: 20))
                    }
                    
                    // progress text
                    Text(viewModel.progressDisplayValue)
                        .font(.largeTitle)
                        .bold()
                        .gradientText(colors: [Color.blue, Color.darkBluish], startPoint: .top, endPoint: .bottom)
                }.padding(.top, 50)
                    .padding(.leading)
                
                // progress bar
                NeumorphicProgressBar(value: $viewModel.progressValue)
                    .frame(height: 20)
                    .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 20)
                    .padding()
                
                // list
                List {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            // check box
                            NeumorphicCheckbox(isChecked: todo.completed, text: todo.text) { checked in
                                todo.completed = checked
                                self.viewModel.toggleComplete(todo: todo)
                            }
                        }// hstack ends
                    }// foreach
                }.padding(.top, 40)
            }// vstack
                .padding()
            
            Button(action: {
                self.addNewSheet.toggle()
            }) {
                Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                    .font(.body)
                    .foregroundColor(.white)
            }.buttonStyle(DarkCircleButtonStyle(colors: [Color.darkBluish, Color.blue], startPoint: .leading, endPoint: .trailing, padding: 30))
                .padding(.bottom, 40)
                .padding(.trailing, 20)
                .sheet(isPresented: $addNewSheet) {
                    AddNewTodoView(addSheetPresented: self.$addNewSheet).onDisappear {
                        self.viewModel.fetchAll()
                    }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
