# MVC, MVVM, MVP 디자인 패턴과 디자인 패턴의 필요성

### 개요

MVC, MVP, MVVM 패턴은 Application의 행동을 세 가지의 역할로 레이어를 나누는 디자인 패턴이다. 각각은 이름에서도 알 수 있듯이 MV(…)로 시작된다. 여기서 M, V, C/P/VM는 각각 Model(M), View(V), Controller / Presenter / ViewModel(C/P/VM) 을 뜻한다. 각각은 다음과 같은 의미를 가진다.

* Model : Data 접근을 위한 Layer 혹은 데이터 자체를 책임지는 영역
* View : 레이어에 표현되는 것을 책임지는 영역. 말 그대로 View와 관련된 영역.
* Controller / Presenter / ViewModel : View를 업데이트하는 책임과 Model을 변경하는 책임을 가지며 경우에 따라 Activity의 역할을 수행하기도 한다. 

### MVC

* 전통적인 MVC

![traditional-mvc](./Resources/Traditional_MVC.png)

* Apple's MVC

![apple-mvc](./Resources/Apple_MVC.png)

### MVP

![traditional-mvp](./Resources/MVP.png)

### MVVM

![mvvm](./Resources/MVVM.png)

#### 출처

[Apple Developer MVC 문서](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)
