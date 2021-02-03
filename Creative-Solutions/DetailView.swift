//
//  DetailView.swift
//  Creative-Solutions
//
//  Created by Bobby Keffury on 2/3/21.
//

import SwiftUI
import CoreData

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

struct DetailView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    @State private var colorChoice: ColorChoice?
    @State private var colorWasChosen: Bool = false
    @State private var selectedButton: Int?
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }
    @State var selectedDate = Date()
    @State var showingDatePicker: Bool = false
    
    @State private var saved: Bool = false
    
    @Binding var project: Project?
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        if saved {
            ContentView()
        } else {
            if showingDatePicker {
                VStack {
                    DatePicker("", selection: $selectedDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(width: 300, height: 300, alignment: .center)
                    Button(action: {
                        showingDatePicker.toggle()
                    }, label: {
                        Text("Save Date")
                    })
                }
            } else {
                VStack(alignment: .center, spacing: 20, content: {
                    Text("Create Project")
                        .font(.custom("Poppins-Black.ttf", size: 24))
                        .bold()
                        .frame(width: 180, height: 125, alignment: .center)
                    VStack(alignment: .center, spacing: 5, content: {
                        Spacer()
                        Button(action: {
                            self.showingImagePicker = true
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
                                colorChoice = .one()
                                colorWasChosen = true
                                selectedButton = 1
                            }, label: {
                                Image(systemName: selectedButton == 1 ? "checkmark" : "")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .accentColor(.white)
                                    .background(Color.init("1"))
                                    .clipShape(Circle())
                            })
                            Button(action: {
                                self.colorChoice = .two()
                                colorWasChosen = true
                                selectedButton = 2
                            }, label: {
                                Image(systemName: selectedButton == 2 ? "checkmark" : "")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .accentColor(.white)
                                    .background(Color.init("2"))
                                    .clipShape(Circle())
                            })
                            Button(action: {
                                self.colorChoice = .three()
                                colorWasChosen = true
                                selectedButton = 3
                            }, label: {
                                Image(systemName: selectedButton == 3 ? "checkmark" : "")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .accentColor(.white)
                                    .background(Color.init("3"))
                                    .clipShape(Circle())
                            })
                            Button(action: {
                                self.colorChoice = .four()
                                colorWasChosen = true
                                selectedButton = 4
                            }, label: {
                                Image(systemName: selectedButton == 4 ? "checkmark" : "")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .accentColor(.white)
                                    .background(Color.init("4"))
                                    .clipShape(Circle())
                            })
                            Button(action: {
                                self.colorChoice = .five()
                                colorWasChosen = true
                                selectedButton = 5
                            }, label: {
                                Image(systemName: selectedButton == 5 ? "checkmark" : "")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .accentColor(.white)
                                    .background(Color.init("5"))
                                    .clipShape(Circle())
                            })
                            Button(action: {
                                self.colorChoice = .six()
                                colorWasChosen = true
                                selectedButton = 6
                            }, label: {
                                Image(systemName: selectedButton == 6 ? "checkmark" : "")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .accentColor(.white)
                                    .background(Color.init("6"))
                                    .clipShape(Circle())
                            })
                        })
                        Spacer()
                    }).frame(width: 343, height: 163, alignment: .center)
                    .background(colorChoice?.color ?? .white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray), lineWidth: 0.5)
                        )
                    Button(action: {
                        showingDatePicker.toggle()
                    }, label: {
                        HStack(alignment: .center, spacing: nil, content: {
                            Image(systemName: "calendar")
                            Text("\(selectedDate, formatter: dateFormatter)")
                                .font(.custom("Avenir", size: 14))
                                .fontWeight(.heavy)
                        }).accentColor(Color.init("TextOrange"))
                        .frame(width: 343, height: 43, alignment: .center)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray), lineWidth: 0.5)
                            )
                    })
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Title")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.heavy)
                        TextField("Type here", text: $title)
                            .background(Color.white)
                            .frame(width: 343, height: 38, alignment: .center)
                            .font(.custom("Avenir", size: 14))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }).frame(width: 363, height: 67, alignment: .leading)
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Description")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.heavy)
                        TextEditor(text: $description)
                            .frame(width: 343, height: 57, alignment: .center)
                            .font(.custom("Avenir", size: 14))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray), lineWidth: 0.5)
                                )
                    }).frame(width: 363, height: 84, alignment: .leading)
                    Spacer()
                    Button(action: {
                        if project != nil {
                            project?.title = title
                            project?.descript = description
                            project?.image = inputImage?.jpegData(compressionQuality: 1.0)
                            project?.color = UIColor(colorChoice?.color ?? .white)
                            project?.date = dateFormatter.string(from: selectedDate)
                        } else {
                            project = Project(context: self.managedObjectContext)
                            project?.title = title
                            project?.descript = description
                            project?.image = inputImage?.jpegData(compressionQuality: 1.0)
                            project?.color = UIColor(colorChoice?.color ?? .white)
                            project?.date = dateFormatter.string(from: selectedDate)
                        }
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                           print("Error saving to moc: \(error)")
                        }
                        saved.toggle()
                    }, label: {
                        Text("Save")
                            .font(.custom("Poppins-Black.ttf", size: 16))
                            .fontWeight(.semibold)
                    }).accentColor(.white)
                    .frame(width: 300, height: 43, alignment: .center)
                    .background(Color.init("ButtonBlue"))
                    .cornerRadius(10)
                    .shadow(color: Color.init("ButtonBlue").opacity(0.5), radius: 10, x: 0, y: 5)
                    .padding()
                    .padding()
                }).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                .background(Color.init("OffWhite"))
                .edgesIgnoringSafeArea(.all)
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(project: .constant(nil))
    }
}
