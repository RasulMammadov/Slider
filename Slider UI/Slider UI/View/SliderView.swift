//
//  SliderView.swift
//  Slider UI
//
//  Created by Rasul Mammadov on 03.02.22.
//

import SwiftUI

struct SliderView: View {
        
        @Binding var tabs: [Tab]
        @Binding var currentIndex: Int
        
        @State var fakeIndex: Int = 0
    
        @State var offset: CGFloat = 0
    
    @State var genericTabs: [Tab] = []
        
        var body: some View {
            TabView(selection: $fakeIndex) {
                ForEach(genericTabs) {
                    tab in
                    VStack(spacing: 18) {
                        
                        Spacer()
                        
                        Text("Fisy Lang")
                            .font(.title3.bold())
                            .foregroundColor(.gray)
                        
                        Text(tab.title)
                            .font(.largeTitle.bold())
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 75, weight: .light))
                            .foregroundColor(.green)
                            .padding(.bottom)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .clipShape(BeautifulView())
                    .cornerRadius(30)
                    .padding(.horizontal,50)
                    .overlay(
                    
                             GeometryReader { proxy in
                        Color.clear
                        
                            .preference(key: OffsetKey.self, value: proxy.frame(in: .global).minX)
                        
                    }
                    )
                    .onPreferenceChange(OffsetKey.self, perform: { offset in
                        
                        self.offset = offset
                        
                    })
                    .tag(getIndex(tab: tab))
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            .frame(height: 350)
            .padding(.top, 20)
            .onChange(of: offset) { newValue in
                
                if fakeIndex == 0 && offset == 0 {
                    fakeIndex = genericTabs.count - 2
                    
                }
                if fakeIndex == genericTabs.count - 1 && offset == 0 {
                    fakeIndex = 1
                }
                
            }
            
            .onAppear {
                genericTabs = tabs
                
                guard var first = genericTabs.first else {
                    return
                }
                
                guard var last = genericTabs.last else {
                    return
                }
                
                
                first.id = UUID().uuidString
                last.id = UUID().uuidString
                
                genericTabs.append(first)
                genericTabs.insert(last, at: 0)
                
                fakeIndex = 1
            }
            .onChange(of: tabs) { newValue in
                
                genericTabs = tabs
                
                guard var first = genericTabs.first else {
                    return
                }
                
                guard var last = genericTabs.last else {
                    return
                }
                
                
                first.id = UUID().uuidString
                last.id = UUID().uuidString
                
                genericTabs.append(first)
                genericTabs.insert(last, at: 0)
                
            }
            
            .onChange(of: fakeIndex) { newValue in
                
                currentIndex = fakeIndex - 1
                
            }
            
        }
    
    func getIndex(tab: Tab) -> Int {
        let index = genericTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
    
    }

struct Homepage_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        
        value = nextValue()
    }
    
}
