//
//  Homepage.swift
//  Slider UI
//
//  Created by Rasul Mammadov on 03.02.22.
//

import SwiftUI

struct Homepage: View {
    
    //Our tabs comes right here ->
    
    @State var tabs: [Tab] = [
    
        Tab(title: "Learn with Fisy!"),
        Tab(title: "Check your knowledge!"),
        Tab(title: "Improve your skills!"),
        Tab(title: "Discover new people!"),
        Tab(title: "Exchange language and culture!"),
        Tab(title: "With Fisy Lang - Everything is Easy!")
    
    ]
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            HStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                        
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                        
                        )
                }
                
                Spacer()
                
                Button {
                    
                    
                } label: {
                    Text ("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
            }
            .overlay (
            
                HStack(spacing: 4) {
                    
                    
                }
            
            )
            .padding()
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    Text("FISY LANG")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.6))
                        .padding(.top,20)
                    
                    Text ("Let's learn a language!")
                        .font(.system(size: 38, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .foregroundColor(.white)
                    
                    //Here comes the carousel
                    
                    SliderView(tabs: $tabs, currentIndex: $currentIndex)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            
            //Bottom part
            
            HStack {
                
                Text("Sign Up")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                        
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        
                        )
                }
            }
        
            .padding(.top,25)
            .padding(.horizontal,30)
            .padding(.bottom, 12)
            .background(
            
                Color.black
                    .clipShape(CustomerCorner(corners:[.topLeft, .topRight], radius:38))
                    .ignoresSafeArea()
              )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        
            LinearGradient(colors: [
            
                Color(.red),
                Color(.blue)
                
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        
        
        
        )
        
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
