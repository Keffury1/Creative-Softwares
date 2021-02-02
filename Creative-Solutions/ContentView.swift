//
//  ContentView.swift
//  Creative-Solutions
//
//  Created by Bobby Keffury on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10, content: {
                Text("Projects")
                    .font(.custom("Poppins-Black.ttf", size: 24))
                    .bold()
                    .frame(width: 101, height: 125, alignment: .center)
                AddView()
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .background(Color.init("OffWhite"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Placeholder")
    }
}


struct AddView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: DetailView(),
                label: {
                    Image(systemName: "plus")
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(
                            ZStack{
                                Circle()
                                    .fill(Color.init("ButtonBlue"))
                                    .shadow(color: Color.init("ButtonBlue").opacity(0.2), radius: 5, x: 0, y: 0)
                            })
                })
        }.accentColor(.white)
        .frame(width: 343, height: 163, alignment: .center)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray), lineWidth: 0.5))
    }
}

struct ProjectView: View {
    var body: some View {
        Text("Placeholder")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
