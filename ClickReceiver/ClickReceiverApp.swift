import SwiftUI

extension UIApplication {
  func getWindow() -> UIWindow? {
    let allScenes = UIApplication.shared.connectedScenes
    for scene in allScenes {
      guard let windowScene = scene as? UIWindowScene else { continue }
      for window in windowScene.windows where window.isKeyWindow {
        return window
      }
    }
    return nil
  }
  func addGestureRecognizer() {
    guard let window = getWindow() else { return }
    let gesture = UITapGestureRecognizer(target: window, action: nil)
    gesture.requiresExclusiveTouchType = false
    gesture.cancelsTouchesInView = false
    gesture.delegate = self
    window.addGestureRecognizer(gesture)
  }
}

extension UIApplication: UIGestureRecognizerDelegate {
  public func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch
  ) -> Bool {
    let location = touch.location(in: touch.window)

    let coordinates = "(\(Int(location.x)), \(Int(location.y)))"
    if let encoded = try? JSONEncoder().encode(coordinates) {
      UserDefaults.standard.set(encoded, forKey: "clickLocation")
    }
    print("Click at \(coordinates)")

    return true
  }

  public func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    return true
  }
}

@main
struct ClickReceiverApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(Click())
        .onAppear(perform: UIApplication.shared.addGestureRecognizer)
    }
  }
}
