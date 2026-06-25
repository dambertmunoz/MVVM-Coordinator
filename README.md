# MVVM Coordinator Books

UIKit sample app that demonstrates a production-shaped iOS architecture with MVVM, coordinator-based navigation, repository boundaries, Realm persistence, RxSwift bindings, and a small internal Swift Package module.

The project started as a technical challenge, but the useful part is the architecture exercise: isolate navigation, data access, caching, and presentation state so each concern can evolve independently.

## What This Project Shows

- `MVVMCoordinator` iOS app built with UIKit and storyboards.
- MVVM view models that expose loading/error events through RxSwift.
- Coordinator-style navigation extracted into `Sources/MVVMUtils`.
- Repository pattern with remote and local data sources.
- Realm-backed offline cache for the books feed.
- Swift Package Manager integration for both third-party dependencies and the internal utilities module.
- Basic unit-test surface for the local data source.

## Architecture

```text
ViewController
  -> ViewModel
      -> BooksService
          -> BooksRepository
              -> BooksRemoteDataSource
              -> BooksLocalDataSource
                  -> Realm

Coordinator
  -> owns navigation flow and screen transitions
```

The repository checks Realm first. If cached books exist, it serves filtered local data. Otherwise it fetches the remote JSON payload, persists the result, and returns the requested category.

## Main Modules

| Path | Responsibility |
| --- | --- |
| `MVVMCoordinator/MVVMCoordinator/View` | UIKit screens and table view rendering |
| `MVVMCoordinator/MVVMCoordinator/ViewModel` | Presentation state and RxSwift events |
| `MVVMCoordinator/MVVMCoordinator/Core/Services` | Service/repository contracts |
| `MVVMCoordinator/MVVMCoordinator/Core/Services/Repository/Remote` | Remote JSON fetch |
| `MVVMCoordinator/MVVMCoordinator/Core/Services/Repository/Local` | Realm persistence and filtering |
| `Sources/MVVMUtils` | Reusable coordinator and UIKit helpers packaged with SPM |

## Dependencies

- RxSwift for view-model event streams.
- RealmSwift for local persistence.
- Kingfisher for image loading and caching.
- Swift Package Manager for dependency resolution.

## Technical Notes

- Network failures and empty responses are returned through the repository result instead of being silently ignored.
- Book category filtering no longer relies on force-unwrapping optional request types.
- View-model success/error events are delivered on the main queue before UI subscribers react.
- The remote endpoint is intentionally simple because this repo focuses on architecture boundaries, not API complexity.

## Running The Project

1. Open `MVVMCoordinator/MVVMCoordinator.xcodeproj`.
2. Let Xcode resolve Swift Package dependencies.
3. Select the `MVVMCoordinator` scheme.
4. Run on an iOS simulator.

## Test Surface

The repo includes tests under:

```text
MVVMCoordinator/MVVMCoordinatorTests
Sources/MVVMUtils/Tests
```

For a modern production codebase, the next improvements would be:

- inject the Realm configuration for deterministic tests;
- replace the remote data source with a protocol-backed mock in view-model tests;
- add snapshot or UI tests for the category screens.

## Screens

### Login

![Login screen](https://user-images.githubusercontent.com/66708463/132237907-b25dc2d2-7f27-449c-bec1-1c7d0d9526af.png)

### Home

![Home screen](https://user-images.githubusercontent.com/66708463/132137002-76202b03-5ed9-4487-80bd-bf3b07223139.png)

## Author

Dambert Muñoz

Email: [dmsantillana2705@gmail.com](mailto:dmsantillana2705@gmail.com)
