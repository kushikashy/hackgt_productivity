//
//  Features.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/26/25.
//

import SwiftUI

struct Features: View {
    let tasksPriority = ["task1", "task2"]
    var body: some View {
        VStack {
            Text("Features")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.gray)
//                .frame(width: 360, height: 650)
            ForEach(tasksPriority, id: \.self) { task in
                Text(task).background(.gray).frame(maxWidth: .infinity).foregroundStyle(.white)
            }
            Spacer()
        
        }.padding(.top, 45).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 40)
    }
}

#Preview {
    Features()
}
