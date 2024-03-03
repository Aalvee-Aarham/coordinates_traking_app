# Flutter Coordinate Recording and Exporting App

This Flutter application is designed to record and export coordinate data based on user interactions. The app features a coordinate detector that captures X and Y coordinates as the user interacts with a designated area on the screen. This document outlines the main features of the app and provides instructions on how to use it.

## Features

- **Coordinate Recording**: The app can record X and Y coordinates based on the user's touch interactions. It tracks these interactions in real-time and logs the coordinates along with timestamps.
- **Start/Stop Recording**: Users can start and stop the recording of coordinates at any time using a button in the UI.
- **Data Export**: The recorded data can be exported as a CSV file, which includes timestamps and the corresponding X and Y coordinates.
- **Visual Feedback**: The app provides a visual area for interaction, showing a grid where the user can touch to generate coordinates.
- **Error Handling**: Basic error handling is included, such as prompting the user to start recording before trying to record coordinates.

## How to Use

1. **Starting the App**: Launch the app on your device. You will see a grid area where you can interact to generate coordinates.

2. **Start Recording**: Open the drawer menu by tapping on the drawer icon and press the "Start Recording" button to begin recording coordinates. The button will change to "Stop Recording" once pressed.

3. **Interacting with the Grid**: Tap or drag your finger across the grid area. As you do this, the app records the X and Y coordinates of your interactions along with timestamps.

4. **Stopping the Recording**: To stop recording, open the drawer menu again and press the "Stop Recording" button.

5. **Exporting Data**: After stopping the recording, you can export the recorded data by pressing the "Export Data" button in the drawer menu. This will save the data as a CSV file and, depending on your platform, may automatically open the file for you.

## Platform Compatibility

- The export feature is specifically designed with iOS in mind, utilizing the `getApplicationDocumentsDirectory` method to save the CSV file in the app's documents directory. For platforms other than iOS, additional implementation might be necessary to handle file storage and access appropriately.

## Development Considerations

- The app uses packages like `csv` for CSV file generation and `intl` for formatting timestamps. Ensure these dependencies are included in your `pubspec.yaml` file.
- It's built to handle basic touch interactions and data recording. For more advanced features or customization, you might need to modify or extend the existing code.

## Final Notes

This app serves as a basic template for recording and exporting coordinate data in Flutter. It demonstrates handling touch interactions, managing state, and working with file systems in Flutter. Feel free to customize and expand upon this template to suit your specific needs.
