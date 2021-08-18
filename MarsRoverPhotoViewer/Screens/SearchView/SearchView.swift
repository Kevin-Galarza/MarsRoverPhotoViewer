//
//  SearchView.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/9/21.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var searchViewModel = SearchViewModel(networkManager: NetworkManager())
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(image: "mars")
                
                VStack {
                    SearchFormView(searchViewModel: searchViewModel)
                    
                    NavigationLink(destination: SearchDetailView(searchDetailViewModel: makeSearchDetailViewModel())) {
                        Text("Search Photos")
                            .frame(width: 340, height: 50)
                            .background(Color(.white.withAlphaComponent(0.05)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func makeSearchDetailViewModel() -> SearchDetailViewModel {
        return SearchDetailViewModel(networkManager: NetworkManager(),
                                     selectedRover:  searchViewModel.selectedRover,
                                     selectedDate:   searchViewModel.selectedDate,
                                     selectedCamera: searchViewModel.selectedCamera)
    }
}

struct BackgroundView: View {
    
    var image: String
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            Image(image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct SearchFormView: View {
    
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        Form {
            Section(header: Text("SEARCH")) {
                HStack {
                    Text("Rover Type")

                    Spacer()

                    Picker(selection: $searchViewModel.selectedRover, label: Text(searchViewModel.selectedRover.rawValue)) {
                        ForEach(Rover.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .foregroundColor(.blue)
                }
                
                // Date picker workaround, bug where date label cycles between .short and .medium date formats when changing date in-app.
                HStack {
                    Text("Date")
                    
                    Spacer()
                    
                    DatePicker(
                        "Date",
                        selection: $searchViewModel.selectedDate,
                        in: searchViewModel.dateRange,
                        displayedComponents: [.date]
                    )
                    .labelsHidden()
                    .id(searchViewModel.selectedDate)
                    .accentColor(.blue)
                    
                }
                
                HStack {
                    Text("Camera Type")
                    
                    Spacer()
                    
                    Picker(selection: $searchViewModel.selectedCamera, label: Text(searchViewModel.selectedCamera.rawValue)) {
                        ForEach(searchViewModel.availableCameras, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .listRowBackground(Color(.black.withAlphaComponent(0.95)))
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
