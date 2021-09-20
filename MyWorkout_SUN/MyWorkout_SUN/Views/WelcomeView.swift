//
//  WelcomeView.swift
//  MyWorkout_SUN
//
//  Created by by Sunanta Chuathue on 19/9/2564 BE.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
    
    var body: some View {
        VStack {
            HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "Greeting"))
            
            Spacer()
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("Get fit", comment: "invitation to exercise"))
                        .font(.largeTitle)
                    Text("with high intensity interval training")
                }
                Image("step-up")
                    .resizedToFill(width: 240, height: 240)
                    .clipShape(Circle())
            }
            
            Button(action: { selectedTab = 0}) {
                Text(NSLocalizedString("Get Started", comment: "invitation"))
                Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
            
            Spacer()
            
            Button(NSLocalizedString("History", comment: "view user activity")) { showHistory.toggle() }
                .padding(.bottom)
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory : $showHistory)
                }
        }.padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
