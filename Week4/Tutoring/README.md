# 4주차 튜터링 - 최완복 튜터님

#### `쌍쌍바`

* ##### 데이터는 원형 타입으로 보관해야 조작이 쉽다.

  잘못된 예)

  ```swift
  let date : String
  init(date: Date) {
    self.date = "\(date)"
  }
  ```

  ​

* ##### 기본 값이 없어도 되는 경우 Initializer도 옵셔널하게 만들 수 있다.

  실제로 많이 활용되는 편이다.

  (실제로 ViewController 의 init 도 옵셔널 타입이 존재함)

  ​

* ##### Convenience Init

  Designated(지정 초기화) 서브클래스에서 상속 가능 하지만

  Convenience Init은 상속 할 수 없다.

  ​

* ##### if case 문

  패턴 매칭

  ```swift
  enum SomeType {
  	case a, b, c
  }

  let somthing = SomeType.c
  if case .a = somthing {

  }
  ```

  enum에 대한 매칭을 위 코드처럼 사용할 수 있다.

  (`if let` 문은 `if case let` 이 생략된 것)

  ​

* ##### 예시`item!.name` 에서 옵셔널 체이닝 시 가급적 `!` 대신 `?` 를 쓸 것.

  `?`를 써서 손해볼게 없다.

  ​


* ##### Storyboard상에서 설정한 뷰는 Storyboard에서 설정한 초기값으로 초기화된다.

  만약 Storyboard상 설정한 기기가 iPhone7이고 시뮬레이터는 7Plus일 경우 시뮬레이터는 Storyboard상 값인 iPhone7을 기준으로 반영된다. (viewDidAppear 이전까지) 이를 ViewDidLoad 시점에서 시뮬레이터 기기에 반영하고자 할 경우 ViewController가 로드 될때 업데이트를 해줘야 한다.

  ​

* ##### Sandbox 에서 Document, Library/Preference, Library/cache 가 있는데 Document에 저장할 때와 Library/Preference에 저장될 때 개발자가 임의로 디렉토리를 지정을 하면서 사용하는건지..?

  보통은 유저 데이터는 Document에 저장하고 그 외 폴더는 건드릴 일이 없을 것.

  ​



* ##### UI를 Storyboard 대신 코드로 짜는 방법을 억지로라도 연습해야하는가?

  코드로 개발할 경우 추후에 많은 도움이 되지만, 초기 생산성에 문제가 있을 수 있어서 선택을 해야한다.

  코드로 오토레이아웃을 설정할 경우 스냅킷 라이브러리를 많이 사용한다.

  ​



* ##### Protocol과 Extension의 조합으로 Protocol을 효율적으로 활용할 수 있다.

  Traits, Mixin

  ```swift
  protocol Common {
    func present()
    func dismiss()
  }

  //extenstion으로 Protocol을 구현해 놓으면 여러 곳에서 호출 할 수 있다.
  extension Common {
    func present() {
      print("present")
    }
    
    func dismiss() {
      print("dismiss")
    }
  }

  class BaseViewController: UIViewController, Common {
    func present() {
    }
  }
  ```

  서로 다른 클래스에서 동일한 기능을 구현할 때 중복코드를 최소화 하고자하는 방법

  ​

* ##### UIViewController를 상속받는 특정한 ViewController를 또 다른 ViewController가  상속받아 사용할 수 있다.

  ```swift
  class BaseViewController: UIViewController {
  }

  class ListViewController: BaseViewController {
  }

  class DetailViewController: BaseViewController {
  }
  ```

  ​


* ##### 프로젝트 관련

  프로젝트로 만들 앱은 목표를 출시로 잡고 임할 것.

  출시를 목표로 한 사람과 아닌 사람의 앱은 완성도나 프로젝트에 임하는 마음가짐에 있어서 많은 차이가 있다.

  프로젝트를 시작함과 동시에 개발자 등록을 추천함.​
