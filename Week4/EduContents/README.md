# 4주차 교육 컨텐츠 - 쌍쌍바

## Archiving

iOS 앱에서 데이터를 저장하고 불러오는 방법을 선택함에 있어서, 첫 번째로 데이터를 원격에 저장할 것인지, 아니면 로컬에 저장할 것인지 고민해 보아야 합니다. 만약, 로컬에 파일을 저장할 경우 Archiving 혹은 Core Data을 사용해야 합니다. 이번 주에는 이 중 Archiving에 대해서 알아보고, 스위프트 4에서는 어떠한 변화가 있을 예정인지 알아보도록 하겠습니다.

#### 아카이브 기본 개념

아카이빙은 iOS에서 모델 객체를 저장하는 방법 중 하나입니다. 아카이빙은 객체의 직렬화 과정 후객체를 바이너리 파일로 저장하는 과정을 말합니다. iOS에서 객체를 직렬화하여 바이너리 파일로 저장하기 위해서는 NSCoding 프로토콜을 따라야 합니다. 프로토콜을 준수하여 인코딩 과정을 거쳐 객체에 기록한 프로퍼티 들을 앱 내 파일 시스템에 저장되고, 불러올 때는 디코딩 과정을 거쳐 해당 프로퍼티들을 가져옵니다. 

#### 아카이빙의 특징

UIDocument나 File을 이용하는 방법에 비해서 저장할 수 있는 타입이 자유롭습니다. 예를 들어, 코코아 클래스 중 저장이 필요한 대부분의 클래스는 이미 NSCoding 프로토콜을 준수하고 있습니다. (NSString, NSData, NSArray, NSDate, UIView, UIViewController 등..) 하지만 NSTimer, NSFIleManager 등은 준수하지 않습니다.

#### 아카이빙을 지원하는 클래스

객체를 아카이빙 하기 위해서는 NSCoder 클래스를 사용합니다. NSCoder은 추상클래스로 프로그래머가 직접 NSCoder 클래스의 인스턴스를 직접 다루는 일은 거의 없습니다. 대신에 이 클래스를 구체화 한 NSArchiver, NSKeyedArchiver 클래스를 사용합니다.
NSArchiver/NSUnarchiver : 저장 방식은 데이터를 인코딩하는 순서대로 NSUnarchiver에서 디코딩되어야 하고, 단 한번의 디코딩만 할 수 있습니다.
NSKeyedArchiver/NSKeyedUnarchiver : Key 값이 함께 저장되기 때문에 Key 값만 있으면 순차적이지 않아도 되고 동일한 값을 여러번 읽어올 수 있다는 장점이 있습니다.

#### 저장 및 불러오기 과정

아카이빙은 NSCoding 프로토콜을 따르며 encodeWithCoder(_:) 와 init(coder:) 메서드에서 구현됩니다.

* encodeWithCoder:에 저장할 데이터를 넘긴다
* initWithCoder:에서 필요한 데이터를 가져온다.

해당 메서드를 통해 아래와 같이 객체의 프로퍼티들의 아카이빙, 언아카이빙 과정이 이루어 집니다.





## 사용법 (교재 예제 참고)

파일 시스템에 데이터를 저장할 공간과 파일 시스템에 저장할 수 있는 모델 객체 만들기
저장은 iOS 디바이스 내부에 있는 디렉토리에 URL을 이용하여 저장하는 방법과 Library/Preferences/에 UserDefault를 사용하여 저장하는 방법 두가지가 있다. 아래 예제는 Documents 디렉토리에 저장하는 예제이다.

#### 파일 URL 구성

```swift
class ItemStore {
...
let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
…
}
```

urls(for:in:) 메서드는 인자에 따라 기준에 부합하는 url을 파일 시스템에서 검색한다. 이것의 반환값은 URL 배열인데, OS X에서는 검색에 부합하는 여러 URL이 존재하겠지만 iOS는 단 하나의URL만 검색된다. 그러므로 아카이브 파일의 이름은 배열에서 하나뿐인 첫번째 URL에 덧붙여 진다.

#### 모델 객체 만들기

우리 클래스로 만든 오브젝트를 저장하려면 NSCoding이라는 프로토콜을 준수해야 한다.
해당 프로토콜 내부에는 required init?(coder aDecoder: NSCoder)와  encode(with aCoder: NSCoder)가 있어서 구현받은 클래스는 이를 준수해야 한다.

#### NSCoding

코코아 클래스 중 저장이 필요한 대부분의 클래스는 이미 NSCoding 프로토콜 준수한다.

* NSString, NSData, NSArray, NSDate 등


* UIView, UIViewController 등
* 하지만 NSTimer, NSFIleManager 등은 준수하지 않음

```swift
class Item: NSObject,NSCoding {

    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: NSDate

   ...생략…

  required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! NSDate
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber") as? String
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(serialNumber, forKey: "serialNumber")
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
    }
}
```



위 코드와 같이 두 메소드를 준수하면 파일에 저장할 수 있도록 encoding할 수 있고, 파일로부터 불러와서 decode하여 init() 해줄 수 있다.

저장할 공간과 저장할 수 있는 모델 객체가 마련되었으면 다음 순서로 저장과 로드하는 법만 알면 아카이빙에 대한 사용법을 어느정도 익힐 수 있다. 다음 과정을 보도록 하자.

#### 데이터를 저장하고 로딩하는 과정 구현하기 (NSKeyedArchiver, NSKeyedUnarchiver)

저장하는 방법은 NSKeyedArchiver의 archiveRootObject(_:toFile:)을 호출하여 구현할 수 있다.
이 메서드는 추상클래스 NSCoder를 실체화한 하위클래스이다. 

NSKeyedArchiver의 인스턴스를 인자로하여 해당 클래스에서(예제에서는 itemStore) encode(with:)를 호출하게 된다. 
NSKeyedArchiver는 수집한 데이터를 해당 path에 쓴다.

```swift
class ItemStore {

   ...

    func saveChanges() -> Bool {
        print("Saving item to : \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }

   ....

}
```

일단 저장은 되도록 많이하는 것이 좋다고 한다.
앱의 LifeCycle 적인 관점에서 사용자가 홈버튼을 누르면 appDelegate는 applicationDidEnterBackground() 메세지를 받는다. 앱이 비활성 상태나 백그라운드로 가는 상황에 위에서 작성한 저장 메서드를 호출하면 저장이 된다.

```swift
func applicationDidEnterBackground(_ application: UIApplication) {
	let suceess = itemStore.saveChanges()
	if suceess == true {
		print("saved")
	}
	else {
		print("fail to save")
	}
}
```

반대로 로드의 경우 NSKeyedUnarchiver를 사용하면 encode할 때와 정반대로 동작한다. 
예제에서는 itemStore를 init()하는 시점에 데이터를 불러온다.

  ```swift
init() {
	if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
	allItems += archivedItems
	}
}

  ```


## 샌드박스

iOS는 기본적으로 앱 마다 별도의 디렉토리를 가진다. 이를 애플리케이션 샌드박스라고 불리는데 이 샌드박스는 다른 앱의 샌드박스와 공유되지 않는다. 즉 서로 접근할 수 없으며, 앱은 반드시 자신의 샌드박스 안에 위치해야한다.

* #### 샌드박스 구조

  한 앱이 가지는 샌드박스에는 여러 디렉토리가 포함되어 있다. (윈도우에 내 컴퓨터와 같이)

  샌드박스의 구조는 다음과 같다.

  * ##### MyApp.app

    * 앱의 bundle 이 이 곳에 위치한다. 이 디렉토리에는 앱과 모든 리소스들(기본 아이콘 이미지, 스토리보드, 텍스트 파일 등)이 포함되며, 저장된 리소스에 대해 읽기 전용 엑세스 권한을 얻을 수 있다.
    * iTunes 또는 iCloud에 백업되지 않는다.

  * ##### Documents

    * 사용자의 데이터를 저장할 때 이 디렉토리를 이용한다. 사용자에게 공개 할 수 있는 데이터만 포함되어야 한다.
    * iTunes 또는 iCloud에 백업된다.

  * ##### Library/Preferences

    - 사용자의 데이터가 아닌 데이터를 저장할 때 사용되는 디렉토리이다. 설정 내용 또는 UserDefaults클래스가 이 곳으로 저장된다.
    - iTunes 또는 iCloud에 백업된다.

  * ##### Library/Caches

    * 앱이 실행 중에 생성한 데이터를 재시작시에도 유지할 수 있도록 데이터를 저장하는 디렉토리다. 하지만 생성된 데이터는 백업되지 않으며 기기의 디스크 공간이 부족할 경우 데이터가 삭제될 수 있다.
    * iTunes 또는 iCloud에 백업되지 않는다.

  * ##### tmp

    * 앱 실행 중에 임시로 사용하는 데이터를 저장하는 디렉토리다. 앱이 실행되지 않을 때 이 디렉토리의 데이터들은 제거될 수 있으나, 데이터들이 임시 보관 되길 원치 않는 경우 명시적으로 데이터를 지워야한다.
    * iTunes 또는 iCloud에 백업되지 않는다.

* #### Xcode에서의 접근

  Xcode에서 샌드박스의 각 디렉토리에 접근하고자 할 경우 FileManager클래스를 통해 접근 할 수 있다.

  ```swift
  FileManager.default.urls(for: FileManager.SearchPathDirectory, in: FileManager.SearchPathDomainMask)
  ```

  첫번째 인자인 `FileManager.SearchPathDirectory` 열거형 타입을 통해 각각의 디렉토리로 접근할 수 있다.

  * ##### Documents

    ```swift
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    //file:///Users/UserName/Library/Developer/CoreSimulator/Devices/.../data/Containers/Data/Application/.../Documents/
    ```

  * ##### Library/Preferences

    ```swift
    FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
    //file:///Users/UserName/Library/Developer/CoreSimulator/Devices/.../data/Containers/Data/Application/.../Library/Caches/
    ```

  * ##### Library/Caches

    ```swift
    FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    //file:///Users/UserName/Library/Developer/CoreSimulator/Devices/.../data/Containers/Data/Application/.../Library/
    ```

    ​

  ​

## 스위프트 4에서의 변화?

Swift 3에서는 NSObject를 상속하고 NSCoding 프로토콜을 따를 수 있는 클래스 타입만 NSKeyedArchiver을 이용할 수 있었다. struct나 enum타입같은 값 타입은 직접 NSKeyedArchiver를 사용할 수 없고, NSObject와 NSCoding을 따르는 클래스를 생성하여 클래스의 멤버로 인코딩할 값을 가지도록 하는 방법을 사용해야 했다.
스위프트 4에서는 이러한 이슈를 class, struct, enum 세 가지 Swift 타입 모두에 직렬화를 적용시킬 수 있게 하여 문제를 해결한다. [SE-0166]

```swift
public struct Location : Codable {

    public let latitude: Double
    public let longitude: Double

}
```



```swift
public enum Animal : Int, Codable {

    case chicken = 1
    case dog
    case turkey
    case cow

}
```



```swift
public struct Farm : Codable {

    public let name: String
    public let location: Location
    public let animals: [Animal]

}
```



이 예제에는 struct, enum 타입이 Codable 프로토콜을 따르도록 하여 인코딩과 디코딩 가능하도록 하는 예제이다. 

**만약 모든 프로퍼티가 Codable이면, 프로토콜 구현에 대한 코드는 컴파일러에서 자동으로 만들어준다고 한다.**
또한, 사용자 타입의 안전한 직렬화를 제공하기 위해 인코더 및 디코더를 제공할 예정이라고 한다.

```swift
let farm = Farm(name: "Old MacDonald s Farm",
                location: Location(latitude: 51.621648, longitude: 0.269273),
                animals: [.chicken, .dog, .cow, .turkey, .dog, .chicken, .cow, .turkey, .dog])
let payload: Data = try JSONEncoder().encode(farm)
let jsonString = String(data: payload, encoding: .utf8)

// "{"name":"Old MacDonalds farm",
//	"location": {
//	  "latitude": "51.621648,
//	  "longitude": "0.269273"
//	},
//	"animals": [.chicken, .dog, .cow, .turkey, .dog, .chicken, .cow, .turkey, .dog]
//    }"

do {
    let farm = try JSONDecoder().decode(Farm.self, from: payload)

    // Extracted as user types:
    let coordinates = "\(farm.location.latitude, farm.location.longitude)"
} catch {
    // Encountered error during deserialization
}
```


이 예제는, farm객체를 JSON객체로 인코딩하는 것을 보여준다. (JSON 인코더가 파싱한 결과물을 보면 알 수 있다.)
이러한 변화는 **NSObject를 상속받지 않는 Swift 클래스들이 NSKeyedArchiver를 직접 사용할 수 없었던 문제를 해결한다는 점에서 편리함을 가져다 줄 것으로 예상됩니다.**

## Core Data 비교

 앞서 교육 컨텐츠 소개에 앞서, ‘iOS 앱에서 데이터를 저장하고 불러오는 방법을 선택함에 있어서, 만약 로컬에 파일을 저장할 경우 Archiving 혹은 Core Data을 사용해야 합니다.’ 라고 언급하였습니다. 이 중 앞에서 다루었던 Archiving 방식은 NSCoding(Swift 4부터는 Codable) 프로토콜을 구현하기만 하면 되기 때문에 간편하다는 장점이 있습니다. 하지만 Archiving 방식은 데이터의 일부만 불러올 수 없고 전체 데이터를 한 번에 불러와야 하므로 저장된 데이터의 크기가 큰 경우 성능 면에서 손실을 가져올 수 있습니다. 마찬가지로 데이터를 쓰는 경우에도 일부분만 변경할 수 없어 전체 데이터를 새로 써야합니다.

 Core Data 방식은 개발자가 저장이 필요한 데이터와 그것을 저장하는 방식에 대해서만 알려주면, 내부적으로는 관계형 데이터베이스 방식으로 데이터를 저장해 Archiving과는 다르게 부분적인 변경에 대해서 전체 데이터를 불러올 필요가 없어 용량이 큰 데이터를 다루는데 적합하다고 볼 수 있습니다.
