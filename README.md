
```markdown
# SwiftUI MVI Architecture Pattern

A clean, production-ready blueprint demonstrating the **MVI (Model-View-Intent)** architecture pattern in **SwiftUI**. This project showcases how a Unidirectional Data Flow (UDF) can create predictable state management, isolate asynchronous side effects, and offer a highly testable alternative to traditional MVVM in modern iOS applications.

Inspired by the structural concepts detailed in the **iCode** architectural guide.

---

## 🧭 The Problem with MVVM in SwiftUI
In complex, real-world SwiftUI views, MVVM often introduces challenges:
* **Scattered State:** Multiple `@Published` properties can be updated from various async tasks concurrently.
* **Bi-directional Data Flow:** State updates can cause unpredictable side effects, making it hard to trace *"who mutated what and why"*.
* **Massive View Models:** Business logic, UI state bindings, and API calling lifecycle methods get tightly coupled.

## 🚀 The MVI Solution
MVI introduces a strict **Unidirectional Data Flow (UDF)** where data moves in a single, predictable loop:


```

[ View ] ───( Intent )───► [ Store ] ───( State + Intent )───► [ Reducer ]
▲                                                                │
│                                                                ▼
( Renders ) ◄─────────────── [ New State ] ◄────( Side Effect )────┘

```

### Core Architecture Components
* **State:** A single immutable structure representing the exact snapshot of the UI at any given second.
* **Intent:** Clear, explicit enums encapsulating user actions or system events (e.g., `buttonTapped`, `loadData`).
* **Reducer:** A completely pure function that takes the *current state* and an *intent*, then computes the *new state* alongside any optional side effects.
* **Effect:** Isolated wrappers for asynchronous tasks (API networks, disk I/O, timers) preventing them from mutating the pure business logic directly.
* **Store:** The main conductor (`ObservableObject`) that holds the state, receives intents, executes asynchronous effects, and updates the View safely on the main thread.

---

## 🛠️ Project Structure

```text
├── Sources/
│   ├── Component/           # UI Elements & Subviews
│   ├── MVI/
│   │   ├── Intent.swift     # Enum representing user/system actions
│   │   ├── State.swift      # Immutable snapshot struct for UI State
│   │   ├── Reducer.swift    # Pure state mutation function & Effect models
│   │   └── Store.swift      # Observable conductor driving the UDF loop
│   └── View.swift           # SwiftUI View observing the state

```

---

## 💻 Key Features Covered

* **Unidirectional State Binding:** The View only renders based on data inside the singular `State` object.
* **Side-Effect Management:** Clean separation of asynchronous tasks via background pipeline handlers inside the `Reducer`.
* **Memory Safety & Cancellation:** Built-in tracking of active Combine/Async subscriptions inside the `Store` to clean up resources effortlessly when views deinitialize.

---

## 🏗️ Getting Started

### Prerequisites

* iOS 15.0+ / macOS 12.0+
* Xcode 14 or higher
* Swift 5.5+ (SwiftUI & Combine framework integration)

### How to adapt this to your own screens:

1. Define your screen's UI variables in `State.swift`.
2. Add potential user or background actions into the `Intent` enum.
3. Handle state mutations inside the `Reducer.swift` switch cases. Return an `Effect` if you need to run network tasks or async flows.
4. Inject your `Store` into your SwiftUI view as an `@StateObject` or `@ObservedObject`.

---

## 🎓 Acknowledgements

* Concepts implemented from the [iCode YouTube Video Architecture Guide](https://www.youtube.com/watch?v=VIATIjMiEC0).

```
http://googleusercontent.com/youtube_content/1

```
