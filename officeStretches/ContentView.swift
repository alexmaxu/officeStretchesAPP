//
//  ContentView.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var profileVM: ProfileVM
    @EnvironmentObject var vm: MainViewVM
    
    @State var showSheet: Bool = false
    
    @State var showCreateRoutine: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileCell(profile: $profileVM.profile)
                Spacer()
                DailyRoutineCard(dailyRoutine: vm.dailyRoutine)
                Spacer()
                ExerciseListScrollView()
                Spacer()
                MyStretches(arrayStretches: vm.myExercises, showCreateRoutine: $showCreateRoutine)
                TitleRow(title: "History", gradientOpacity: 0.7)
                    .onTapGesture {
                        showSheet.toggle()
                    }
            }
            .navigationDestination(for: Profile.self, destination: { profile in
                ProfileSettingsView()
            })
            .navigationDestination(for: [Exercise].self, destination: { routine in
                ExerciseRoutine(routineExercises: vm.dailyRoutine, exerciseLvl: profileVM.profile.levelSets, title: "Daily Routine", description: "Stay motivated and fit with our daily updated exercise routines. Each day, discover new workouts designed to challenge and energize you, tailored for all fitness levels. Never get bored with your fitness journey. Fresh sets of exercises awaits you every morning!", titleList: "Today's routine")
            })
            .navigationDestination(for: Muscles.self, destination: { muscle in
                    MuscleExercisesList(muscleExerciseListVM: MuscleExerciseListVM(muscleTag: muscle))
            })
            .navigationDestination(for: Exercise.self, destination: { exercise in
                ExerciseDetailView(exercise: exercise)
            })
            .navigationDestination(for: MyExerciseModel.self, destination: { myExercise in
                MyExerciseRoutine(myExercise: myExercise, exerciseLvl: profileVM.profile.levelSets)
                    
            })
            .navigationDestination(isPresented: $showCreateRoutine, destination: {
                CreateYourRoutineView()
            })
            .sheet(isPresented: $showSheet, content: {
                HistoryView(history: $vm.history)
            })
            .gradientBackground(opacity1: 0.1, opacity2: 0.5)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileVM())
        .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
