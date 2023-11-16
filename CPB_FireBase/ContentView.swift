//
//  ContentView.swift
//  ToDoFirebase
//
//  Created by vincent chen on 10/12/23.
//

import SwiftUI
import FirebaseDatabaseSwift
import FirebaseDatabase
struct ContentView: View {
    @ObservedObject var ViewModel = TaskVeiwModel()
    @State var Name = ""
    @State var Location = ""
    @State var URl = ""
    @State var Num = ""
    @State private var showalert = false
    var body: some View {
        NavigationStack {
            
            List{
                ForEach(
                    ViewModel.tasks,id:\.name){ currentTask in Text(currentTask.name)
                        Text(currentTask.Url)
                        Text(currentTask.location)
                        Text(currentTask.numberofstu)
                
                
            }
        }
            .alert("add college", isPresented: $showalert){
               
                TextField("college", text: $Name)
    TextField("location", text: $Location)

    TextField("URL", text: $URl)
    TextField("Student number", text: $Num)


Button("Submit"){
let college = Task( name:Name,location: Location, Url: URl, numberofstu: Num, completed: false)
ViewModel.AddTask(currentTask: college)
Name = ""
Location = ""
URl = ""
Num = ""

                
            }
                                  
      
            //.navigationTitle("CPB FIrebase")
               
            }
           
        }
        
    }
}

#Preview {
    ContentView()
}
