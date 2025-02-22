//
//  TabbarView.swift
//  TabbarWithSideBar_SwiftUI
//
//  Created by Krunal Maisuriya on 20/02/2025.
//

import SwiftUI


struct TabbarView: View {
    
    @State private var showMenu = false
    @State var selectedIndex: Int = 1

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            ZStack(alignment: .leading) {
                
                switch selectedIndex {
                case 0:
                    Color.accentColor
                        .edgesIgnoringSafeArea(.vertical)
                case 1:
                    VStack {
                        ZStack(alignment: .leading) {
                            Color.brown
                                .edgesIgnoringSafeArea(.vertical)
                            
                            VStack(alignment: .leading) {
                                Button(action: {
                                    withAnimation {
                                        showMenu.toggle()
                                    }
                                }) {
                                    Image("ic_menu")
                                        .resizable()
                                        .frame(width: 35, height: 30, alignment: .center)
                                }.padding(.leading, 25)
                                
                                Spacer()
                                
                                Text("Hello Map View")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundStyle(.red)
                                    .padding(.bottom, -5)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    
                case 2:
                    Color.blue
                        .edgesIgnoringSafeArea(.vertical)
                case 3:
                    Color.cyan
                        .edgesIgnoringSafeArea(.vertical)
                default:
                    Color.red
                        .edgesIgnoringSafeArea(.vertical)
                }
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Spacer()
                    
                    ZStack {
                        Color.clear
                    
                        HStack {
                            TabbarItems(icon: "house.fill", isSelected: selectedIndex == 0) {
                                withAnimation { selectedIndex = 0 }
                            }
                            
                            TabbarItems(icon: "map.fill", isSelected: selectedIndex == 1) {
                                withAnimation { selectedIndex = 1 }
                            }
                            
                            TabbarItems(icon: "cart.fill", isSelected: selectedIndex == 2) {
                                withAnimation { selectedIndex = 2 }
                            }
                            
                            TabbarItems(icon: "person.fill", isSelected: selectedIndex == 3) {
                                withAnimation { selectedIndex = 3 }
                            }

                            TabbarItems(icon: "gearshape.fill", isSelected: selectedIndex == 4) {
                                withAnimation { selectedIndex = 4 }
                            }
                        }
                        .padding(8.0)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .padding(.horizontal, 25.0)
                        .padding(.bottom, 10.0)

                    }
                    .frame(height: 80.0)
                }
                
                if showMenu {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                }
                
                SideMenuView(showMenu: $showMenu, selectedIndex: $selectedIndex)
                    .offset(x: showMenu ? 0 : -300)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TabbarView()
}


struct TabbarItems: View {
    
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: isSelected ? 26 : 24, height: isSelected ? 26 : 24, alignment: .center)
                        .foregroundColor(isSelected ? .white : .black)
                        .padding()
                        .background(isSelected ? .black : .clear)
                        .clipShape(Circle())
                }
            }.frame(maxWidth: .infinity)
        }
    }
}
