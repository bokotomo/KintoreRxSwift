import UIKit
import RxSwift
import RxCocoa

class GraphHeader: UIView {
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    let disposeBag = DisposeBag()

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
        reactive()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
        reactive()
    }

    func loadNib() {
        let view = Bundle.main.loadNibNamed("GraphHeader", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func reactive() {
        titleTextField.rx.text.orEmpty
        .map { v in "\(v)desu" }
        .bind(to: testLabel.rx.text)
        .disposed(by: disposeBag)
    }
}
