//
//  ImageExtension.swift
//  MyWorkout_SUN
//
//  Created by Sunanta Chuathue on 19/9/2564 BE.
//

import SwiftUI

extension Image{
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .scaledToFill()
            .frame(width: width, height: height)
    }
}
