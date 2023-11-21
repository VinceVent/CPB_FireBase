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
    
        let dictionary = ["college":["location":"Loc","URL": "URL","numberofstudents": 30]]
        database.child("Students").child(task.name).setValue(dictionary)
        //add more children
          //  .child(task.name).child("numberofstudents").child("URL").child("Location")
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
                let dictionary = task.value as! [String:Any]
               
                guard let complete = dictionary["numberofstudents"] else {return}
                guard let complete = dictionary["URL"] else {return}
                guard let Location = dictionary["Location"] else {return}
           //     let currentTask = Task(Name: nameOfcollege, completed: complete)
                //let currentTask = Task(name: nameOfcollege, location: Loc, Url: URL, numberofstu: number, completed: complete)
                let currentTask = Task(name: nameOfcollege, location: Loc as! String, Url: URL as! String, numberofstu: number as! String as! String) 
                newList.append(currentTask)
                
            }
            self.tasks = newList
           
        }
    }
}
