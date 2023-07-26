import UIKit

protocol MyViewDelegate: AnyObject {
    func view(_ view: UIView, didSendEvent event: MyViewWithDelegate.Event)
}

class MyViewWithDelegate: UIView {

    // MARK: - Public

    enum State {
        case updateButton1Text(text: String)
        case updateButton2Color(color: UIColor)
    }

    enum Event {
        case button1Tap(someText: String)
        case button2Tap(someInt: Int)
        case button3Tap
    }

    weak var delegate: MyViewDelegate?

    // MARK: - UI Elements

    private var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Button 1", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    private var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Button 2", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    private var button3: UIButton = {
        let button = UIButton()
        button.setTitle("Button 3", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    // MARK: - View Codable

    private func setupActions() {
        button1.addTarget(self, action: #selector(didTap1Button(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(didTap2Button(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(didTap3Button(_:)), for: .touchUpInside)
    }

    @objc private func didTap1Button(_ sender: Any) {
        delegate?.view(self, didSendEvent: .button1Tap(someText: "Some text"))
    }

    @objc private func didTap2Button(_ sender: Any) {
        delegate?.view(self, didSendEvent: .button2Tap(someInt: 25))
    }

    @objc private func didTap3Button(_ sender: Any) {
        delegate?.view(self, didSendEvent: .button3Tap)
    }

    // MARK: - Public functions

    func updateState(_ state: MyViewWithDelegate.State) {
        switch state {
        case .updateButton1Text(let text):
            button1.setTitle(text, for: .normal)
        case .updateButton2Color(let color):
            button2.setTitleColor(color, for: .normal)
        }
    }
}
