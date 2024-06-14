import Foundation

/*
let title = "iOS"
if title == "iOS" || title == "Android" {
    print("Good Choice")
} else {
    print("Maybe next time")
}
*/

/*
let values: [Int] = [1,2,3]
for value in values {
    print(value)
}
*/


/*
class Track {
    let name: String
    let instructor: String
    
    init (name: String, instructor: String){
        self.name = name;
        self.instructor = instructor;
    }
    
}
 */
 
 /*
  let airports: [String:String] = [
      "SFO" : "San Francisco",
      "BOS" : "Boston"
  ]
  for (code, name) in airports {
      print("\(code): \(name)")
  }
  */


/*
 func sayHello(name : String) -> String {
     let message = "Hello, \(name)"
     //print(message)
     return message
 }

print(sayHello(name: "Ron"))
*/


/*
class Person {
    var name: String
    init(name: String){
        self.name = name
    }
    func sayHello(){
        print("I'm \(name)")
    }
}

let person = Person(name: "Tommy")
person.sayHello()
*/

class Vehicle {
    func wheels() -> Int {
        return 4
    }
    func go() {
        print("Zoom!")
    }
}

class Motorcycle : Vehicle {
    override func wheels() -> Int {
        return 2
    }
}

 
 
 
 
 
 
 
 
 
/*
let tracks = [
    Track(name: "Mobile", instructor: "Tommy"),
    Track(name: "Web", instructor: "Brian"),
    Track(name: "Games", instructor: "Colton")
]

let students = ["Harry", "Ron", "Hermione"]

var assignments: [String : Track] = [ : ]
for student in students {
    let track = Int.random(in: 0 ..< tracks.count)
    assignments[student] = tracks[track]
}

for (student,track) in assignments {
    print("\(student) got \(track.name) with \(track.instructor)")
}
*/


