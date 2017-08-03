## Collection View MultiSelection - 쌍쌍바

예제 파일을 받아 CollectionView Multi Selection 을 구현하세요.



### 성공 조건

* Edit모드를 통해 여러 장의 사진을 선택하여 삭제하세요.
* 선택한 사진은 선택되지 않은 사진과 시각적으로 구분합니다. (예: 윤곽선, 투명도 등)



### 구현 내용

* NavigationItem에 Edit 버튼을 만들고 Edit버튼 터치시 Editing모드가 토글됩니다.

  (Editing모드는 수동으로 구현.)


* Edit모드가 true 일 때만 Delete버튼이 생성됩니다.
* Edit모드가 true 일 때만 Multi Selection이 활성화 됩니다.
* Edit모드에서 선택한 Items 들은 Edit모드가 false가 될 때 모두 deselected 되어야 합니다.
* Edit모드가 false일 경우 Cell은 선택할 수 없습니다.


**(Segue는 연결하지 않습니다.)**

