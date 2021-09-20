//
//  Exercise.swift
//  MyWorkout_SUN
//
//  Created by Sunanta Chuathue on 19/9/2564 BE.
//

import Foundation
struct Exercise {
    let exerciseName: String
    let videoName: String

    enum ExerciseEnum: CustomStringConvertible {
        case squat
        case stepUp
        case burpee
        case sunSulate
        case reverseCrunch
        case mountainClimber
        case lung
    
        var description: String {
            switch self {
            case .squat:
                return NSLocalizedString("Squat", comment: "exercise")
            case .stepUp:
                return NSLocalizedString("Step Up", comment: "exercise")
            case .burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
            case .sunSulate:
                return NSLocalizedString("Sun Sulate", comment: "exercise")
            case .reverseCrunch:
                return NSLocalizedString("Reverse Crunch", comment: "exercise")
            case .mountainClimber:
                return NSLocalizedString("Mountain Climber", comment: "exercise")
            case .lung:
                return NSLocalizedString("Lung", comment: "exercise")
            }
        }
    }
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: String(describing: ExerciseEnum.squat), videoName: "squat_s"),
        Exercise(exerciseName: String(describing: ExerciseEnum.stepUp), videoName: "step-up_s"),
        Exercise(exerciseName: String(describing: ExerciseEnum.burpee), videoName: "burpee_s"),
        Exercise(exerciseName: String(describing: ExerciseEnum.sunSulate), videoName: "sun_sulate"),
        Exercise(exerciseName: String(describing: ExerciseEnum.reverseCrunch), videoName: "reverse_crunch"),
        Exercise(exerciseName: String(describing: ExerciseEnum.mountainClimber), videoName: "mountain_climbers"),
        Exercise(exerciseName: String(describing: ExerciseEnum.lung), videoName: "lunge")
    ]
}
