//
//  ContentView.swift
//  myDiary
//
//  Created by Abdallah Alshemeri on 19/09/2022.
//

import SwiftUI

struct bgView: View {
    @Binding var diary: String
    @Binding  var chosenColor: Color
    var body: some View {
            Text(diary)
                .foregroundColor(Color.black)
                .frame(width: 1000, height: 1000)
                .background(chosenColor)
    }
}

struct ContentView: View {
    @State var bgColors = [Color.cyan, Color.yellow, Color.purple, Color.red]
    @State var diary = ""
    @State var chosenColor = Color("")
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray
                    .ignoresSafeArea(.all)
                VStack{
                    Spacer()
                    Text("إختر لونك المفضل")
                        .font(.title2)
                    HStack{
                    ForEach(bgColors, id: \.self) { bgColor in
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(bgColor)
                            .onTapGesture {
                                chosenColor = bgColor
                            }
                        }
                    }.padding()
                    Text("ماذا تريد ان تكتب؟")
                        .font(.title2)
                    TextField("اكتب هنا", text: $diary)
                        .frame(width: 250, height: 40)
                        .multilineTextAlignment(.trailing)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Spacer()
                    NavigationLink(destination: bgView(diary: $diary, chosenColor: $chosenColor)) {
                        Text("احفظ")
                            .font(.largeTitle)
                            .frame(width: 300, height: 50)
                            .foregroundColor(Color.white)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .navigationTitle(Text("دفتر يوميات"))
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
