# stocks
A mobile application that interacts with a stock market data API

## Installing
To install this app


```
git clone https://github.com/Rhemi7/stocks.git
```

And then in terminal install the required dependencies

```
flutter pub get
```
Run the app in the project's root folder of the terminal

```
flutter run 
```

## Running the tests
Open a test file and run test cases in terminal

```
flutter test --no-sound-null-safety
```

## Screenshots
![Screenshot_2022-11-02-12-58-00-967_com example stock_data](https://user-images.githubusercontent.com/54381642/199486688-430676e5-513e-4c71-b3de-0ab705bb4531.jpg)
![Screenshot_2022-11-02-12-58-14-839_com example stock_data](https://user-images.githubusercontent.com/54381642/199486722-5cf36b9b-f9d2-481b-b1f3-096698e9f58f.jpg)
![Screenshot_2022-11-02-12-58-23-045_com example stock_data](https://user-images.githubusercontent.com/54381642/199486764-70602de9-19e6-45dc-9040-68e4d144d3e3.jpg)
![Screenshot_2022-11-02-12-55-14-700_com example stock_data](https://user-images.githubusercontent.com/54381642/199486816-f4ba1493-b95c-45da-a328-0e03b1387412.jpg)
![Screenshot_2022-11-02-12-58-37-349_com example stock_data](https://user-images.githubusercontent.com/54381642/199486873-cc1d9d16-451e-478f-8c5b-d5629062e4b7.jpg)
![Screenshot_2022-11-02-12-58-44-066_com example stock_data](https://user-images.githubusercontent.com/54381642/199486912-d04af4e0-65f0-44c4-a047-0aa91f93c492.jpg)
![Screenshot_2022-11-02-12-58-52-151_com example stock_data](https://user-images.githubusercontent.com/54381642/199486937-ddb9a416-3ba9-45f9-ac69-ce6f439bf67a.jpg)
![Screenshot_2022-11-02-12-59-07-024_com example stock_data](https://user-images.githubusercontent.com/54381642/199487048-509ff24f-e26e-4228-9b99-0e88d81567eb.jpg)
![Screenshot_2022-11-02-13-06-03-019_com example stock_data](https://user-images.githubusercontent.com/54381642/199487108-600fb3e0-bca2-4b60-a341-e5fe079334e7.jpg)
![Screenshot_2022-11-02-13-16-22-996_com example stock_data](https://user-images.githubusercontent.com/54381642/199487754-0b3874d6-f0f9-467c-ad13-02c127e6bad0.jpg)


## App Development Info
Folder Structure

  - Core: This contains things that were reused throughout the project.
  - Feature: This is where every major feature in the project is located.
     - data: all calls made to the remote data/api are included here.
     - domain: represents bridge between the data layer and presentation layer, here all abstractions are made before being sent to the presentation layer
     - presentation: includes all classes and methods that make up the screens/pages of the app.
     
     
 ## Plugins
| Name | Description |
| --- | --- |
| Hooks Riverpod | Used for state management |
| Get it | Dependency Injection |
| Dartz | Functional programming in Dart |
| Mockito | Used for testing |
| Http | Used for making network requests|
| Equatable | used for showing equality between objects |
| Shared preferences | Used for local storage on device |
| Internet Connection Checker | Used for checking the connectivity of internet on the device |
| Connectivity plus | Used to listening to network availability |
| Flutter toast | Displays notification |
| Date format | Used to format date |
     
    
