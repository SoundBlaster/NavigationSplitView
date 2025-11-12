# Tuist Setup for NavigationSplitViewDemo

## Configuration

The demo app is configured to support:
- ✅ **iPhone** - iOS 17.0+
- ✅ **iPad** - iOS 17.0+ (native iPad support)
- ✅ **Mac** - macOS 14.0+ (native Mac support, NOT Designed for iPad)

## Features Configured

### Platform Support
- `destinations: [.iPhone, .iPad, .mac]` - Native support for all platforms
- iPhone: portrait + landscape
- iPad: all orientations
- Mac: native application

### Deployment Targets
- iOS: 17.0
- macOS: 14.0

## Installation & Generation

### 1. Install Tuist (if not already installed)

```bash
curl -Ls https://install.tuist.io | bash
```

Or with Homebrew:
```bash
brew install tuist
```

### 2. Generate Xcode Project

From the Demo directory:
```bash
cd Demo
tuist generate
```

This will create:
- `NavigationSplitViewDemo.xcodeproj` - with native Mac support
- Proper framework linking to parent library
- All assets and resources configured

### 3. Build & Run

Open the generated project:
```bash
open NavigationSplitViewDemo.xcodeproj
```

Then:
- **For iPhone/iPad**: Select iPhone/iPad simulator or device
- **For Mac**: Select "My Mac" as destination → native macOS app

## What Changed vs. Original

| Before | After |
|--------|-------|
| `destinations: .iOS` | `destinations: [.iPhone, .iPad, .mac]` |
| iPhone only | **Native Mac support** |
| "Designed for iPad" | **Native Mac application** |
| No macOS option | macOS 14.0+ support |

## Notes

- The app will be a **native macOS application**, not "Designed for iPad"
- Full NavigationSplitView adaptive layout works on all platforms
- macOS features adaptive UI with proper column visibility
- All SwiftUI features work natively on Mac

## Troubleshooting

If you get "tuist: command not found":
1. Install Tuist: `curl -Ls https://install.tuist.io | bash`
2. Add to PATH if needed: `export PATH="/usr/local/bin:$PATH"`
3. Run `tuist generate` again

## Next Steps

After generating:
1. Open project in Xcode
2. Select "My Mac" as destination
3. Build & Run → Native macOS app! 🎉
