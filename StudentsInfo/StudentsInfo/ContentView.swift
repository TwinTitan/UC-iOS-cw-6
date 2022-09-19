//
//  ContentView.swift
//  StudentsInfo
//
//  Created by Abdallah Alshemeri on 19/09/2022.
//

import SwiftUI

struct StudentDetails: Identifiable {
    let id = UUID()
    var fullName: String
    var age: Int
    var year: Int
}

struct ContentView: View {
    @State var students = [
        StudentDetails(fullName: "Ahmad Adel", age: 19, year: 1),
        StudentDetails(fullName: "Mohammad Saad", age: 22, year: 4),
        StudentDetails(fullName: "Abdallah Dawood", age: 21, year: 3)
    ]
    var body: some View {
        VStack{
            Image("id")
                .resizable()
                .frame(width: 350, height: 200)
                .padding()
            Text("Students register")
                .padding()
                .font(.largeTitle)
            
                    List(students) { student in
                        VStack{
                            HStack{
                            Text("Name:")
                            Text(student.fullName)
                            }.frame(width: 200, height: 13, alignment: .leading)
                            HStack{
                            Text("Age:")
                            Text("\(student.age)")
                            }.frame(width: 200, height: 13, alignment: .leading)
                            HStack{
                            Text("Year:")
                            Text("\(student.year)")
                            }.frame(width: 200, height: 13, alignment: .leading)
                        }.padding()
                }.frame(width: 380, height: 380)
            HStack{
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                Text("# of Registered students: \(students.count)")
                    .foregroundColor(Color.white)
                }
                    .frame(width: 300, height: 40)
                    .background(.gray)
                    .clipShape(Capsule())
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
