//
//  ExerciseView.swift
//  MyWorkout_SUN
//
//  Created by by Sunanta Chuathue on 19/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @AppStorage("rating") private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    let index: Int
    @State private var timerDone = false
    @State private var showTimer = false
    @State private var noDone = -1
    @EnvironmentObject var history: HistoryStore
    var body: some View {
        GeometryReader { geometry in
                VStack {
                    HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
                    
                    if let url = Bundle.main.url (forResource: Exercise.exercises[index].videoName,
                    withExtension: "mp4") {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geometry.size.height * 0.45)
                    } else {
                        Text("Couldn't find \(Exercise.exercises[index].videoName).mp4")
                            .foregroundColor(.red)
                    }
                    
                    HStack(spacing: 150){
                        Button(NSLocalizedString("Start", comment: "begin exercise")){showTimer.toggle()}
                        
                        Button(NSLocalizedString("Done", comment: "mark as finished")){
                            history.addDoneExercise(Exercise.exercises[index].exerciseName)
                            timerDone = false
                            showTimer.toggle()
                            if lastExercise {
                                showSuccess.toggle()
                            } else {
                                //selectedTab += 1
                                if noDone != -1 {
                                    selectedTab = noDone
                                }else {
                                    selectedTab += 1
                                }
                            }
                        }
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                        }
                    }
                    .font(.title3)
                    .padding()
                    
                    if showTimer {
                        TimerView(timeDone: $timerDone)
                    }
                    
                    Spacer()
                    
                    RatingView(exerciseIndex: index)
                        .padding()

                    

                    Button(NSLocalizedString("History", comment: "view user activity")){showHistory.toggle()}
                        .padding(.bottom)
                        .sheet(isPresented: $showHistory){
                            HistoryView(showHistory: $showHistory)
                        }
                }
            }
    }
   
    var lastExercise: Bool {
        let ex = ["Squat", "Step Up", "Burpee", "Sun Sulate", "Reverse Crunch", "Mountain Climber", "Lung"]
        var count = 0
        var check = true
        for i in 0...ex.count - 1{
            for j in 0...history.exerciseDays[0].exercises.count - 1 {
                if ex[i] != history.exerciseDays[0].exercises[j] {
                    count += 1
                }
                
                if count == history.exerciseDays[0].exercises.count {
                    check = false
                    noDone = i
                    count = 0
                    return check

                }
            }
            count = 0
        }
        return check
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 1)
            .environmentObject(HistoryStore())
    }
}
