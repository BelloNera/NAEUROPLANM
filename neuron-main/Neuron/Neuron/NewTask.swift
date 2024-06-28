import SwiftUI
import SwiftData

struct NewTask: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskTitle: String = ""
    @State private var taskCaption: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: String = "taskColour1"
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                
                Label("Add New Task", systemImage: "arrow.left")
                    .padding(20)
                    .onTapGesture {
                        dismiss()
                    }
                    .foregroundColor(.purple)
            }
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.white.opacity(0.1))
                    .padding(.horizontal)
            )
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                TextField("Task Title", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Task Caption", text: $taskCaption)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack{Spacer()
                        Text("Timeline")
                            .font(.title2)
                        Spacer()
                    }
                    DatePicker("", selection: $taskDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack{
                            Spacer()
                            Text("Task Color")
                                .font(.title3)
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            let colors: [(String, String)] = [
                                ("taskColour1", "taskColour1"),
                                ("taskColour2", "taskColour2"),
                                ("taskColour3", "taskColour3"),
                                ("taskColour4", "taskColour4")
                            ]
                            
                            HStack(spacing: 10) {
                                ForEach(colors, id: \.0) { colorName, color in
                                    Circle()
                                        .fill(Color(color))
                                        .opacity(0.4)
                                        .frame(width: 30, height: 30)
                                        .overlay(
                                            Circle()
                                                .stroke(taskColor == colorName ? Color.black : Color.clear, lineWidth: 2)
                                        )
                                        .onTapGesture {
                                            taskColor = colorName
                                        }
                                }
                            }
                            Spacer()
                        }
                    }
               Spacer() }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    
            )
            .padding()
            
           
            HStack{
                Spacer()
                Button(action: {
                    let task = Task(title: taskTitle, caption: taskCaption, date: taskDate, tint: taskColor)
                    do {
                        context.insert(task)
                        try context.save()
                        dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Create Task")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .opacity(0.8)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                }
                .padding()
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTask()
    }
}
