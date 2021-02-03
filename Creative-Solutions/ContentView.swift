//
//  ContentView.swift
//  Creative-Solutions
//
//  Created by Bobby Keffury on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var GoToDetailView: Bool = false
    var body: some View {
        ZStack {
            if GoToDetailView {
                DetailView()
            } else {
                VStack(alignment: .center, spacing: 10, content: {
                    Text("Projects")
                        .font(.custom("Poppins-Black.ttf", size: 24))
                        .bold()
                        .frame(width: 101, height: 125, alignment: .center)
                    Button(action: {
                        self.GoToDetailView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .frame(width: 60, height: 60, alignment: .center)
                            .background(
                                ZStack{
                                    Circle()
                                        .fill(Color.init("ButtonBlue"))
                                        .shadow(color: Color.init("ButtonBlue").opacity(0.2), radius: 5, x: 0, y: 0)
                                })
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
}

struct DetailView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Text("Create Project")
                .font(.custom("Poppins-Black.ttf", size: 24))
                .bold()
                .frame(width: 180, height: 125, alignment: .center)
            HeaderView()
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .background(Color.init("OffWhite"))
        .edgesIgnoringSafeArea(.all)
    }
}

enum ColorChoice {
    case one(color: Color = Color.init("1"))
    case two(color: Color = Color.init("2"))
    case three(color: Color = Color.init("3"))
    case four(color: Color = Color.init("4"))
    case five(color: Color = Color.init("5"))
    case six(color: Color = Color.init("6"))
    
    var color: Color {
        switch self {
        case .one(let color):
            return color
        case .two(let color):
            return color
        case .three(let color):
            return color
        case .four(let color):
            return color
        case .five(let color):
            return color
        case .six(let color):
            return color
        }
    }
}

struct HeaderView: View {
    
    @State private var colorChoice: ColorChoice?
    @State private var colorWasChosen: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 5, content: {
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .accentColor(colorWasChosen ? Color.white : Color.gray)
            })
            Text("Upload header image or choose color")
                .foregroundColor(colorWasChosen ? Color.white : Color.gray)
                .font(.custom("Avenir", size: 12))
                .fontWeight(.medium)
            Spacer()
            HStack(alignment: .center, spacing: 20, content: {
                Button(action: {
                    self.colorChoice = .one()
                    colorWasChosen = true
                }, label: {
                    Image("")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("1"))
                            })
                })
                Button(action: {
                    self.colorChoice = .two()
                    colorWasChosen = true
                }, label: {
                    Text("")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("2"))
                            })
                })
                Button(action: {
                    self.colorChoice = .three()
                    colorWasChosen = true
                }, label: {
                    Text("")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("3"))
                            })
                })
                Button(action: {
                    self.colorChoice = .four()
                    colorWasChosen = true
                }, label: {
                    Text("")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("4"))
                            })
                })
                Button(action: {
                    self.colorChoice = .five()
                    colorWasChosen = true
                }, label: {
                    Text("")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("5"))
                            })
                })
                Button(action: {
                    self.colorChoice = .six()
                    colorWasChosen = true
                }, label: {
                    Text("")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("6"))
                            })
                })
            })
            Spacer()
        })
        .frame(width: 343, height: 163, alignment: .center)
        .background(colorChoice?.color ?? .white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray), lineWidth: 0.5)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
