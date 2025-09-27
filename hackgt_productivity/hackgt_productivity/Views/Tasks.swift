//
//  Tasks.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//

import SwiftUI


struct Tasks: View {
    @State private var myTasks: [String] = [
        "Buy groceries",
        "Finish homework",
        "Call Alice"
    ]
    
    @State private var allTasks: [String] = [
        "Buy groceries",
        "Finish homework",
        "Call Alice",
        "Read book",
        "Meditate",
        "Go for a walk",
        "Finish HW"
    ]
    
    @State private var isMyTasksExpanded: Bool = false
    @State private var isAllTasksExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // MARK: My Tasks
            collapsibleSection(
                title: "My Tasks",
                tasks: myTasks,
                isExpanded: $isMyTasksExpanded
            )
            
            // MARK: All Tasks
            collapsibleSection(
                title: "All Tasks",
                tasks: allTasks,
                isExpanded: $isAllTasksExpanded
            )
        }
        .padding()
        Spacer()
    }
    
    // Reusable collapsible section
    @ViewBuilder
    private func collapsibleSection(
        title: String,
        tasks: [String],
        isExpanded: Binding<Bool>
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isExpanded.wrappedValue.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded.wrappedValue ? 90 : 0))
                        .foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            if isExpanded.wrappedValue {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(tasks, id: \.self) { task in
                            Text("• \(task)")
                                .font(.title3)
                                .padding(.leading, 15)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 150) // can tweak per section
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct Tasks_Previews: PreviewProvider {
    static var previews: some View {
        Tasks()
    }
}

#Preview {
    Tasks()
}
