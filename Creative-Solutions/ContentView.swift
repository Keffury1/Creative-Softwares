//
//  ContentView.swift
//  Creative-Solutions
//
//  Created by Bobby Keffury on 2/1/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var GoToDetailView: Bool = false
    @State var project: Project?
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Project.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Project.date, ascending: true)
        ]
    ) var projects: FetchedResults<Project>
    
    var body: some View {
        ZStack {
            if GoToDetailView {
                DetailView(project: $project)
            } else {
                VStack(alignment: .center, spacing: 10, content: {
                    Text("Projects")
                        .font(.custom("Poppins-Black.ttf", size: 24))
                        .bold()
                        .frame(width: 101, height: 125, alignment: .center)
                    ForEach(projects) { project in
                        VStack(alignment: .center, spacing: 10, content: {
                            if project.image != nil {
                                Image(uiImage: UIImage(data: project.image!)!)
                                    .frame(width: 343, height: 117, alignment: .center)
                                    .cornerRadius(10)
                            } else {
                                VStack(alignment: .center, spacing: nil, content: {
                                    Text("")
                                }).background(self.getColour(data: project.color!))
                                .frame(width: 343, height: 117, alignment: .center)
                                .cornerRadius(10)
                            }
                            HStack(alignment: .center, spacing: 0, content: {
                                padding()
                                Text(project.title!)
                                    .font(.custom("Avenir", size: 14))
                                    .fontWeight(.medium)
                                Spacer()
                                Text(project.date!)
                                    .font(.custom("Avenir", size: 14))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init("TextOrange"))
                                padding()
                            })
                        }).frame(width: 343, height: 163, alignment: .center)
                        .background(Color.white)
                        .onTapGesture {
                            self.project = project
                            GoToDetailView.toggle()
                        }
                        .cornerRadius(10)
                    }
                    Button(action: {
                        self.GoToDetailView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .frame(width: 60, height: 60, alignment: .center)
                            .background(Color.init("ButtonBlue"))
                            .shadow(color: Color.init("ButtonBlue").opacity(0.2), radius: 5, x: 0, y: 0)
                            .clipShape(Circle())
                    }).accentColor(.white)
                    .frame(width: 343, height: 163, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray), lineWidth: 0.5)
                        )
                })
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                .background(Color.init("OffWhite"))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    func getColour(data: Data) -> Color {
        do {
            return try Color(NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)!)
        } catch {
            print(error)
        }

        return Color.clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
