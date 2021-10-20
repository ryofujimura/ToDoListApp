//
//  CardView.swift
//  TaskManagingApp
//
//  Created by ryo fujimura on 10/19/21.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    @State private var motionOffset: Double = 0.0
    @State private var motionScale: Double = 0.0
    
    var body: some View {
        GeometryReader{
            geometry in
            ZStack(alignment: .center){
                VStack{
                    Spacer()
                    Spacer()
                    Image(systemName: "person.fill")
                        .frame(width: 150, height: 150)
                        .scaleEffect(9)
                    Spacer()
                    Text("TASK ONE")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.yellow)
                        .kerning(5)
                    Spacer()
                    Spacer()

                }
            }
            .frame(width: geometry.size.width, height: geometry.size.width*1.05)
            .background(Color.white)
            .cornerRadius(15)
            .rotationEffect(
                .degrees(Double(self.translation.width / geometry.size.width * 20)),
                anchor: .bottom
            )
            .offset(x: self.translation.width, y: self.translation.height)
            .animation(.interactiveSpring(
                response: 0.35,
                blendDuration: 0.5)
            )
            .gesture(
                DragGesture()
                    .onChanged
                    {
                        gesture in
                            self.translation = gesture.translation
                            self.motionOffset = Double(gesture.translation.width / geometry.size.width)
                    }
                    .onEnded
                    {
                        gesture in
                            self.translation = .zero
                            self.motionScale = 0.0
                    }
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CardView()
                .padding(/*@START_MENU_TOKEN@*/.all, 50.0/*@END_MENU_TOKEN@*/)
                
                
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}
