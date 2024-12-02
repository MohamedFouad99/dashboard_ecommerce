**Project Architecture
This app is built using the Clean Architecture pattern, ensuring a clear separation of concerns:

lib/                             
├── core/                        
│   ├── animations/                                      # Custom animations and transitions                                                                       
│   ├── config/                                          # App-wide configurations (constants, environments)                              
│   ├── error/                                           # Error handling (exceptions, failures)                                         
│   ├── helpers/                                         # General utility/helper classes and functions                                     
│   ├── theme/                                           # Themes, colors, typography, etc.                              
├── data/                           
│   ├── datasources/                                     # Local/remote data source implementations                             
│   ├── models/                                          # Data models (DTOs, serialization)                               
│   └── repositories/                                    # Data layer implementations of repositories                                    
├── domain/                                       
│   ├── entities/                                        # Core business entities                                       
│   ├── repositories/                                    # Abstract repository definitions                                         
│   └── usecases/                                        # Application-specific use cases                                  
├── presentation/                                            
│   ├── controllers/                                     # GetX controllers or equivalent state management                                       
│   ├── pages/                                           # Screens and pages                                  
│   ├── widgets/                                         # Reusable widgets/components                               
└── main.dart                                            # App entry point                                                        





About the Project
The Order Analytics App is a Flutter-based application designed to help businesses analyze and visualize their order data. The app provides insights such as:

Total number of orders.
Average price of orders.
Number of returned orders.
A graph showing order trends over time.
This app utilizes Clean Architecture principles, ensuring scalability, testability, and maintainability. It also employs GetX for state management and Charts for data visualization.



**Features
Dashboard Metrics:
 Total orders, average order price, and count of returned orders.
Graphical Insights:
 Visualize order trends over time using interactive charts.
Real-time Performance:
 Seamless performance with GetX's reactive state management.




