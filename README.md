# News App

A feature-rich News App that implements the **MVVM** architectural pattern and uses **Provider** for state management. The app includes functionality like a splash screen, category browsing, localization, detailed news viewing, and a web view to show the full article from the source. Additionally, it includes a search feature for finding news articles.

---



## 📱 Features


1. **Splash Screen**  
   Displays a splash screen with the app logo while the app initializes.

2. **Categories Page**  
   Lists categories like Technology, Sports, Business, and Entertainment.

3. **Localization**  
   Supports multiple languages, with localization setup in the `l10n/` folder.

4. **News Details Screen**  
   Provides detailed news content, including headlines, images, and summaries.

5. **Web View**  
   Allows users to view the full news article directly from the source.

6. **Search Feature**  
   Enables searching for specific news articles using keywords.

   <div align="center">
    <video src="https://github.com/user-attachments/assets/c7d137c7-5061-442d-8e41-2b980e745663" controls="controls" style="max-width: 100%; height: auto;">
        Your browser does not support the video tag.
    </video>
</div>

🛠 Technologies and Patterns
----------------------------

### 1\. **MVVM Pattern**

*   **Model**: Contains data models and API services.
    
*   **View**: Defines UI components and layouts.
    
*   **ViewModel**: Manages the business logic and interacts with Providers to supply data to the View.
    

### 2\. **State Management with Provider**

*   Utilized for dependency injection and reactive state updates.
    

🖼 Screens Overview
-------------------

### 1\. Splash Screen

*   Displays the app's branding while initializing resources.
    

### 2\. Categories Page

*   Allows users to browse news by categories.
    

### 3\. News Details Screen

*   Detailed view of a selected news article with a "Read More" button to open the article in a web view.
    

### 4\. Search Page

*   Search for news articles using keywords.
    

🌐 Localization

Localization setup is managed in the l10n/ folder. Use the following steps to add support for a new language:

🖌 Theming

Themes and colors are configured in the utils/ folder:

*   app\_colors.dart: Defines the color palette.
    
*   app\_theme.dart: Manages light and dark theme configurations.
    

🔍 Search Feature

The search functionality is implemented in the search/ folder:

*   search\_view.dart: Displays the search interface.
    
*   Connected to the API for live search results.
    

📖 Dependencies

Key dependencies used in this project:

*   provider: For state management.
    
*   flutter\_localizations: For localization support.
    
*   http: For API requests.
    
*   webview\_flutter: For displaying news articles in a web view.
## 🗂 Folder Structure

The project is organized as follows:

```plaintext
lib/
├── api/                            # API-related utilities
├── cubits/                         # State management (Cubit classes)
│   └── your_cubit.dart             # Example Cubit implementation
├── home/                           # Home screen components
│   └── home_view.dart              # Main view for the home screen
├── l10n/                           # Localization files
│   └── app_localizations.dart      # Localization setup
├── model/                          # Data models for the application
│   └── user_model.dart             # User data model
├── news/                           # News-related components
│   └── news_article.dart           # News article model
├── search/                         # Search functionality
│   └── search_view.dart            # UI for search
├── utils/                          # Utility functions
│   ├── app_colors.dart             # Color palette configuration
│   ├── app_theme.dart              # Application theme configuration
│   ├── images.dart                 # Image assets management
│   └── main_bloc_observer.dart     # Bloc observer for state management
└── main.dart                       # Entry point of the application
