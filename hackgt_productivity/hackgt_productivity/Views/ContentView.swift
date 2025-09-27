//
//  ContentView.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var endDate: Date = Date()
    var body: some View {
//        VStack {
//            TabView {
//                Features()
//                    .tabItem {
//                        Label("Features", systemImage: "list.triangle")
//                    }
//                Dashboard()
//                    .tabItem {
//                        Label("Dashboard", systemImage: "house")
//                    }
//                Tasks()
//                    .tabItem {
//                        Label("Tasks", systemImage:"list.bullet.clipboard")
//                    }
//            }
//        }
//        TabView {
//            Features()
//                .tabItem {
//                    Label("Features", systemImage: "list.triangle")
//                }
//            Dashboard(endDate: Date())
//                .tabItem {
//                    Label("Dashboard", systemImage: "house")
//                }
//            Tasks()
//                .tabItem {
//                    Label("Tasks", systemImage:"list.bullet.clipboard")
//                }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
        TabView {
                    Features()
                        .tabItem {
                            Label("Features", systemImage: "list.triangle")
                        }

                    // Pass binding to Dashboard
                    Dashboard(endDate: $endDate)
                        .tabItem {
                            Label("Dashboard", systemImage: "house")
                        }

                    Tasks()
                        .tabItem {
                            Label("Tasks", systemImage:"list.bullet.clipboard")
                        }
                }
            }
        }

        #Preview {
            ContentView()
        }
