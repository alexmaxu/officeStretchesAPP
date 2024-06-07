//
//  ResumeExerciseRoutineList.swift
//  officeStretches
//
//  Created by Alex  on 7/6/24.
//

import SwiftUI

struct ResumeExerciseRoutineList: View {
    let routineExercises: [Exercise]
    var body: some View {
        ScrollView {
            ForEach(routineExercises) { exercise in
                NavigationLink(value: exercise) {
                    HStack {
                        Spacer()
                        Text(exercise.workOut)
                            .font(.headline)
                            .tint(.black)
                            .padding()
                        Spacer()
                        Image(exercise.muscles.rawValue)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 10)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.4)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ResumeExerciseRoutineList(routineExercises: Exercise.previewExercisesList)
}
