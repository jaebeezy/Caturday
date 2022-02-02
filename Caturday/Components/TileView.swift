//
//  TileView.swift
//  Caturday
//
//  Created by Jae Young Choi on 2/1/22.
//

import SwiftUI

struct TileView: View {
    
    var fact: String
    
    @State private var animate = false
    @State private var date = Date()
    
    // formating time to add seconds
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
    
    // transform date obj to string
    func timeString(_ date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    // function to live update timer
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.date = Date()
        }
    }
    
    
    var body: some View {
        Group {
            
            ZStack {
                Circle()
                    .fill(.red)
                    .blur(radius: 10)
                    .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink)
                    .blur(radius: 20)
                    .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
                    .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                Rectangle()
                    .fill(.orange)
                    .blur(radius: 30)
                    .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                    .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                Capsule()
                    .fill(.yellow)
                    .blur(radius: 40)
                    .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                    .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                Circle()
                    .fill(.yellow)
                    .blur(radius: 50)
                    .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
                    .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink)
                    .blur(radius: 60)
                    .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
                    .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
                Capsule()
                    .fill(.orange)
                    .blur(radius: 70)
                    .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
                    .opacity(0.4)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Welcome!")
                        .bold()
                        .font(.system(size: 40, weight: .heavy))
                        
                    Text("Today is")
                        .font(.caption)
                    Text(date, style: .date)
                        .font(.title)
                    Text("The current time is")
                        .font(.caption)
                    Text(timeString(date))
                        .font(.system(size: 40))
                        .onAppear {
                            let _ = self.updateTimer
                        }
                    Text("And just like every other day it is")
                        .font(.caption)
                    Text("Caturday.")
                        .font(.system(size: 60))
                        .fontWeight(.semibold)
                    
                    
                    
                    Text("Random Cat Fact")
                        .font(.caption)
                        .fontWeight(.heavy)
                        .padding(5)
                        .foregroundColor(.red.opacity(0.75))
                        .background(.white)
                        .clipShape(Capsule())
                        .padding(.top, UIScreen.main.bounds.height / 20)
                    
                    ScrollView(showsIndicators: false) {
                        Text(fact)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical, 10)
                            .padding(.trailing, 30)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 30)
                .padding(.leading, 30)
                
                
            }
            
            
            
        }
        
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width - 50,height: UIScreen.main.bounds.height / 1.7)
        .cornerRadius(2)
        .cornerRadius(50, corners: [.topLeft, .bottomRight])
        .shadow(color: Color.black.opacity(0.25), radius: 25, x: 0, y: 20)
        .onAppear() {
            withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                animate.toggle()
            }
        }
    }
}


struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(fact: "A cat is a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. ")
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
