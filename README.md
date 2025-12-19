# MO Marketplace – Fullstack Take-Home Assignment (Flutter + Mock Node.js Backend)

This repository is my submission for the MO Marketplace Mobile Application Developer take-home assignment.

The goal is to deliver a clean, modern mobile UI with strong code structure, responsive design, and a scalable architecture.  
**I’m developing the solution incrementally with small commits to reflect real-world engineering workflow.** Also per each step I will add an entry to this Readme.md so my ususal development pattern may reflect with a glance. 

---

## What I am going to include at the submittion(Scope) 
 
### Core Requirements
- Home screen redesign (header/banner, categories, featured products + UX improvements)
- Product list page (at least 6 dummy products: image, title, price)
- Product details page (image, name, price, description)
- UX/UI improvement document (pain points + solutions + suggested flows)

### Bonus Targets (If time permits)
- Animations / page transitions
- Dark mode
- Reusable widgets
- Mock API layer

- Additionally I am planing to include these
  - A dummy level Node.js backend created for this. it will serve the app.

  - **TODO** (I will incrementally update this once I add a significant feature apart of above)

---

## Repository Structure
- `mobile-frontend/` – Flutter mobile app 
- `backend/` – Mock Node.js backend (planned; will provide local API + local image hosting)
---

## Development Approach
- Build step-by-step with small commits to reflect my knowladge. Some works will take a very less time due to I alrady have templated some implementations. 
- Use **Provider** for state management since it is simple.
- Keep UI modular with reusable widgets and clear separation of concerns.

---

## Progress Log (will be updated)
- [x] Repository initialized with Flutter mobile frontend
- [x] .gitignore created and relevent init entries included to it.
- [x] `Readme.md` markdown is added. Planing to document progress in it.
- [x] Introduced `dark/light Theme` **(Optional)**,  `Page Transition Animations`, `Router`
  - Added optional Dark/Light theme support (implemented early for easier scalability)
  - Centralized routing with animated page transitions
  - pageTransitionsTheme property set at with easeInOut curve. (Check out lib/core/transitions/slide_transition.dart)
- [x] At this stage I added 3 utilities, `API Caller`, `Global Configs`, `Global Errors`

- [x] At the moment I have created the bridge between the node.js backend and the mobile app. I tested it with a simle UI. (lib\screens\demo\demo_page_one.dart)
<br><br>
`Now my main target is. developing the app while developing the Mock bakcend.`

- [x] Introduced the application shell (Home layout, bottom navigation, drawer, and theme setup)
  - Home navigation supports swipe gestures and animated transitions between tabs; bottom navigation and theme switching remain fully in sync

- [x] Added animated Splash Screen with persisted theme support
  - Introduced a **splash screen** with fade + settle-down animation (**Images generated using Gemini**)
  - Theme preference is saved using SharedPreferences and restored on app launch
  - Ensures consistent visual experience across app restarts

- 2025/12/17
- [x] Core App Architecture & Structure
  - Centralized configuration, theme, layout metrics, and routing logic to core

- [x] Enum-Based Home Tab Control
  - Introduced a `HomeTab` enum to represent all main tabs
  - Removed hard-coded index checks in favor of enum-driven UI logic (commented and replaced)

- [x] Search Bar
  - Added a reusable `HomeSearchBar` component
  - Search bar visibility is controlled via `HomeTab`
  - Search hint text dynamically changes based on the active page usiogn Enum

- [x] Screen & Header Standardization
  - Implemented Dashboard, Categories, Add, Chat, and Login pages using `CustomScrollView` and `SliverToBoxAdapter`
  - Added a reusable `PageHeader` for consistency

- [x] Implemented App Drawer
  - Added AI Generated light/dark background images
  - Implemented expandable sections (Help, Policies, Guidelines, Delivery) 
  - Limited child items per section for clean UX
  - Included close button
  - All items navigate to placeholder screens using a reusable DummyPage

- [x] Local Mock Backend Product and Image API
  - Added SQLite database for data
  - Stored product images locally and exposed them via static image URLs
  - Implemented product APIs with category-based filtering
  - Returned relative image paths to allow client-side base URL handling

- [x] Dashboard Categories, theme updates 
  - Introduced a category model and local mock categories 
  - Added horizontal dashboard category list with navigation added 
  - Refined AppBar styling with the theme
  - Added a safe local rebuild script for repeatable Flutter clean builds


---

## Getting Started (Mobile)
> **Will be expanded as features are implemented.**

### Run the app
```bash
cd mobile-frontend
flutter pub get
flutter run
```

