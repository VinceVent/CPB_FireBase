//
//  TaskVeiwModel.swift
//  ToDoFirebase
//
//  Created by vincent chen on 11/2/23.
//
import FirebaseDatabase
import FirebaseDatabaseSwift
import Foundation

class TaskVeiwModel: ObservableObject {
    @Published var tasks: [Task] = []
    init(){
        PullfromFirebase()
        
        
    }
    
    func AddTask(currentTask: Task){
        tasks.append(currentTask)
        AddtoFirebase(task: currentTask)
        
    }
    func AddtoFirebase(task: Task) {
        
        let database = Database.database().reference()
        database.child("Tasks").child(task.name).child("complete").setValue(task.completed)
        
    }
    func PullfromFirebase(){
        
        let databaseRef = Database.database().reference().child("Tasks")
        databaseRef.getData {myError, myDataSnapshot in
  
            var newList: [Task] = []
            
            for task in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let nameOfcollege = task.key
                let Loc = task.key
                let URL = task.key
                let number = task.key
                let dictionary = task.value as! [String:Bool]
                guard let complete = dictionary["complete"] else {return}

           //     let currentTask = Task(Name: nameOfcollege, completed: complete)
                //let currentTask = Task(name: nameOfcollege, location: Loc, Url: URL, numberofstu: number, completed: complete)
                let currentTask = Task(name: nameOfcollege, location: Loc, Url: URL, numberofstu: number, completed: complete)
                newList.append(currentTask)
                
            }
            self.tasks = newList
           
        }
    }
}
