//
//  textAlert.swift
//  Composite-homework
//
//  Created by Grisha Pospelov on 15.11.2021.
//

import SwiftUI

func textAlert(_ handler: @escaping (String) -> Void) {
    let alert = UIAlertController(title: "добавить задачу", message: "добавить имя задаче", preferredStyle: .alert)
    alert.addTextField() { textField in
        textField.placeholder = "создать новое имя для задачи"
    }
    alert.addAction(UIAlertAction(title: "добавить", style: .default) { [unowned alert] _ in handler(alert.textFields![0].text ?? "") })
    alert.addAction(UIAlertAction(title: "отменить", style: .cancel) { _ in })
    showAlert(alert: alert)
}

func showAlert(alert: UIAlertController) {
    if let controller = topMostViewController() {
        controller.present(alert, animated: true)
    }
}

private func keyWindow() -> UIWindow? {
    return UIApplication.shared.connectedScenes
    .filter {$0.activationState == .foregroundActive}
    .compactMap {$0 as? UIWindowScene}
    .first?.windows.filter {$0.isKeyWindow}.first
}

private func topMostViewController() -> UIViewController? {
    guard let rootController = keyWindow()?.rootViewController else {
        return nil
    }
    return topMostViewController(for: rootController)
}

private func topMostViewController(for controller: UIViewController) -> UIViewController {
    if let presentedController = controller.presentedViewController {
        return topMostViewController(for: presentedController)
    } else if let navigationController = controller as? UINavigationController {
        guard let topController = navigationController.topViewController else {
            return navigationController
        }
        return topMostViewController(for: topController)
    } else if let tabController = controller as? UITabBarController {
        guard let topController = tabController.selectedViewController else {
            return tabController
        }
        return topMostViewController(for: topController)
    }
    return controller
}

