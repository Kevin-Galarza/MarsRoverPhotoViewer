# MarsRoverPhotoViewer-SwiftUI

## Overview
A client that can be used to search and view the data/images offered by NASA's public Mars Rovers Photos API. With the photo viewer users can select from the three rovers (Curiosity, Opportunity and Spirit), search by Earth date and filter the returned images by available camera options.

![demo.gif](https://github.com/Kevin-Galarza/MarsRoverPhotoViewer/blob/main/demo.gif)

## Features
- View photos from Curiosity, Opportunity and Spirit
- Search by Earth date range available for each mission
- View all of the selected rover's photos for a given day or filter by a camera type (if used that day)

## Architecture
- Swift and SwiftUI
- MVVM
- Networking Service
- Combine

## Getting Started
### Prerequisites
- A valid API Key from [NASA](https://api.nasa.gov/)
- A Mac running macOS Catalina or higher
- XCode 12

### Installation
1. Clone or download the project to your local machine
2. Open the project in XCode
3. Replace `DEMO_KEY` with your valid NASA API key in `APIClient.swift`

```
final class APIClient {

    // REQUEST AND REPLACE PLACEHOLDER API KEY WITH ISSUED KEY FROM "https://api.nasa.gov".
    let apiKey = "DEMO_KEY"
```
4. Run the Simulator or build on an iOS device

## Acknowledgements
The following resources were used when building this project:
- [GitHub Async Image](https://github.com/V8tr/AsyncImage) && [Asynchronous Image Loading from URL in SwiftUI](https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/)
- My `APIClient.swift` was heavily influenced by the `APIService.swift` in this project [GitHub MovieSwiftUI](https://github.com/Dimillian/MovieSwiftUI)
