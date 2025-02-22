//
//  SideMenuView.swift
//  TabbarWithSideBar_SwiftUI
//
//  Created by Krunal Maisuriya on 21/02/2025.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var showMenu: Bool
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.black.opacity(0.8)
                .clipShape(CustomCorner(radius: 35, corners: [.topRight, .bottomRight]))
                .shadow(color: .black.opacity(0.3), radius: 15, x: 8, y: 8)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading) {
                Button(action: {
                    print("Home tapped")
                    withAnimation {
                        showMenu = false
                        selectedIndex = 0
                    }
                }) {
                    Text("Home")
                        .font(.title2)
                        .padding()
                }
                Divider().frame(height: 0.5).background(.secondary.opacity(0.6))

                Button(action: {
                    print("Settings tapped")
                    withAnimation {
                        showMenu = false
                        selectedIndex = 4
                    }
                }) {
                    Text("Settings")
                        .font(.title2)
                        .padding()
                }
                Divider().frame(height: 0.5).background(.secondary.opacity(0.6))
                
                Button(action: {
                    print("Profile tapped")
                    withAnimation {
                        showMenu = false
                        selectedIndex = 3
                    }
                }) {
                    Text("Profile")
                        .font(.title2)
                        .padding()
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.leading, 10)
            .ignoresSafeArea(edges: .bottom)
        }
        .frame(maxWidth: 300.0, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    SideMenuView(showMenu: .constant(false), selectedIndex: .constant(1))
}



struct CustomCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
