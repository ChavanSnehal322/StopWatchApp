# StopWatchApp - SwuiftUI


__Summary:__

This is a simple Stopwatch app built using SwiftUI, allowing users to start, pause, and reset a timer. It also includes a lap timer functionality to record individual lap times while the stopwatch is running.


__Features:__
1] Start the Stopwatch: Begin timing with the "Start" button.
2] Pause the Stopwatch: Pause the stopwatch with the "Pause" button.
3] Stop the Stopwatch: Reset the stopwatch to zero with the "Stop" button.
4] Record Laps: Tap the "Lap" button to record the time for each lap.
5] Lap Time List: View a list of lap times with timestamps.


__Working of App:__

1] Modes:
- The app has three modes: stopped, running, and paused.
- The stopwatch starts in the stopped mode.
- When the "Play" button is pressed, the timer starts and the mode switches to running.
- Pressing the "Pause" button will pause the timer and switch to paused.
- Pressing "Stop" will stop the timer, reset it, and return the app to the stopped mode.

2] Lap Functionality:
- While the stopwatch is running, you can press the "Lap" button to record a lap time.
- Each lap time is added to the list of recorded laps and displayed below the main timer.

3] Timer Logic:
- The timer updates every 0.1 seconds. It is managed by a Timer object that schedules the update.
- The lap times are stored as instances of LapCls, a custom struct, which records the lap time as a Double.


__Steps to Use the App: __

1] Starting the Stopwatch:
- Press the "Play" button to start the stopwatch.
- The timer will begin counting from zero.

2] Pausing the Stopwatch:
- Press the "Pause" button to pause the stopwatch at any point.
- The stopwatch will hold its current time until you either restart or stop it.

3] Stopping the Stopwatch:
- Press the "Stop" button to reset the timer to zero and stop the stopwatch.
- All lap times will also be cleared upon stopping.

4] Recording Laps:
- While the stopwatch is running, tap the "Lap" button to record the current time as a lap.
- Each lap time is added to the list below the main timer and displayed with the lap number and time.


__Future Improvements__

- Add Features: You can add features like an alarm when a certain lap time is reached, or the ability to export lap times.
- Visual Enhancements: Improve the UI design, adding more interactive elements or animations for a better user experience.
  
