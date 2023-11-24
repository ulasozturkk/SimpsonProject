import UIKit

class TabBar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarController = UITabBarController()

        let firstVC = CharacterVC()
        firstVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(named: "character")?.withRenderingMode(.alwaysOriginal).resize(targetSize: CGSize(width: 24, height: 24)), tag: 0)
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        let secondVC = EpisodeVC()
        secondVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(named: "episodes")?.withRenderingMode(.alwaysOriginal).resize(targetSize: CGSize(width: 24, height: 24)), tag: 1)
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        let thirdVC = ProductVC()
        thirdVC.tabBarItem = UITabBarItem(title: "Products", image: UIImage(named: "products")?.withRenderingMode(.alwaysOriginal).resize(targetSize: CGSize(width: 24, height: 24)), tag: 2)
        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        tabBarController.viewControllers = [firstVC, secondVC, thirdVC]

        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
}

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        let size = self.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // AspectRatio'yu koruyarak resmi boyutlandır
        let newSize = widthRatio > heightRatio ?
            CGSize(width: size.width * heightRatio, height: size.height * heightRatio) :
            CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Yeni boyutlu resmi çiz
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
