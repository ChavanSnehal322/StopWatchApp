//
//  ContentView.swift
//  StopWatch
//
//  Created by Snehal Chavan on 6/30/25.
//

import SwiftUI


struct LapCls: Identifiable{
    
    var id = UUID()
    let Lap:Double
    
    init( _ Lap: Double)
    {
        self.Lap = Lap
    }
}
struct ContentView: View {
    
    @ObservedObject var ManagerClss = manager()
    
    // state that stores lap times in array of LapCls initialized to empty array
    @State private var LapTime : [LapCls] = []
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                
                Text(String(format : "%.2f", ManagerClss.secondsElapsed))
                
                    .font(.largeTitle)
                
                // add space between the timer and the button
                Spacer()
                
                // Switch for handling different modes
                switch ManagerClss.mode{
                    
                case .stopped:
                    withAnimation {
                        Button (action :{
                            ManagerClss.start()
                        }, label : {
                            Image (systemName: "play.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .background(Color.pink)
                                .cornerRadius(150)
                        })
                    }
                    
                case .running:
                    
                    HStack{
                        
                        withAnimation{
                            
                            Button (action :{
                                ManagerClss.stopped()
                                
                                // set laptime  button to empty array
                                LapTime = []
                            }, label : {
                                Image (systemName: "stop.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .background(Color.green)
                                    .cornerRadius(150)
                            })
                        }
                        
                        // button to add a lap
                        withAnimation{
                            Button(action : {
                                ManagerClss.paused()
                                
                                // creating a new lap and adding time in it
                                let newLap = LapCls(ManagerClss.secondsElapsed)
                                
                                LapTime.append(newLap)
                                
                            }, label: {
                                Image(systemName: "stopwatch.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .background(Color.blue)
                                    .cornerRadius(100)
                            })
                        }
                        
                        
                        // add a button for  paused
                        
                        withAnimation{
                            
                            Button(action : {
                                ManagerClss.paused()
                            }, label: {
                                Image(systemName: "pause.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .background(Color.orange)
                                    .cornerRadius(100)
                            })
                        }
                    }
                    
                    
                case .paused:
                    
                    HStack{
                        
                        // stop button
                        withAnimation{
                            
                            Button (action :{
                                ManagerClss.stopped()
                                LapTime = []
                                
                            }, label : {
                                Image (systemName: "stop.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .background(Color.pink)
                                    .cornerRadius(150)
                            })
                        }
                        
                        // start button
                        withAnimation {
                            Button (action :{
                                ManagerClss.start()
                            }, label : {
                                Image (systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .background(Color.green)
                                    .cornerRadius(150)
                            })
                        }
                        
                        
                        
                        
                        
                    } // Hstack
                    
                } // switch
                
                // create a list that takes a laptime, array and gives a lap name
                List ( LapTime){
                    laps in
                    
                    // takee the text and convert it to string in float format
                    Text(" Lap : \(String(format: " %.2f", laps.Lap)) s")
                }
                
                
                
            } // Vstack
            
            .navigationTitle("StopWatch App")
            .padding()
            
        }// navigation View
        .padding()
    }
    // Var body
}

enum mode{
    
    case running
    case stopped
    case paused
}


class manager : ObservableObject{
    
    // update the view everytime the seonds are changed
    @Published var secondsElapsed = 0.0
    
    // initially the watch is in stop mode
    @Published var mode : mode = .stopped
    
    var timer = Timer()
    
    func start(){
        mode = .running
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func stopped(){
        
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    
    func paused(){
        
        timer.invalidate()
        mode = .paused
    }
}
#Preview {
    ContentView()
}
