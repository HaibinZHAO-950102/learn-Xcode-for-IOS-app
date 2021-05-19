# Learn Xcode for IOS App

## 0 风格

### 0.1 变量命名风格

基本原则：命名要有描述性，让第一次读代码的人看懂。无所谓变量名长短。

文件命名：全部小写，可以包含下划线，例如`cat_and_dog_images`

类型命名：每个单词首字母均大写, 不包含下划线: `MyViewModel`, `Cat`, `Dog

类型实例命名：小写，没有下划线，例如`myviewmodel`, `cat`, `dog`。有多个实例时直接在后面加备注内容，例如`myviewmodel1`, `catblack`, `dogorange`

变量命名：全部小写，可以包含下划线，例如`num_table`, `size_box`

常量命名：全部大写，可以包含下划线，例如: `ITERATION`, `LENGTH_MAX`

函数命名：每个单词首字母均大写, 不包含下划线: `ReadData()`, `GetLength()`

### 0.2 格式风格

运算符及冒号前后均加空格（与字符串相关的除外），例如

~~~swift
let a : Int = 1
let b : Int = 2
let c = a + b
~~~

函数/枚举等等括号写在下一行：

~~~swift
func example(a : Int, b : Int) -> Int
{
	return a + b
}
~~~



## 1 Swift基础语法

### 1.1 基础语法

#### 1.1.1 打印、定义变量

打印

~~~swift
print("Hello World")
~~~

定义变量

~~~swift
var age = 25
~~~

赋值

~~~swift
age = 28
print("age: ", age)
~~~

定义常量

~~~swift
let age = 25
// age = 28 报错
~~~

显示制定变量类型

~~~swift
var age : Double = 25.5
print(age)
~~~

字符串与数字组合

~~~swift
var player_name = "Tobias"
var player_age = 26
print(player_name + " is " + String(age) + ".")    //强制类型转换，字符串可以用"+"拼接
~~~

变量嵌入

~~~swift
print("\(player_name) is \(player_age).")       // 类似于python的格式化输出
~~~

定义可以为空的变量

~~~swift
var age:Int? = 25    // 这里有一个问号代表这个变量可以为空，否则下一句会报错
age = nil        // nil相当于python里的None
if age == nil
{
    print("Age is unknown.")
}
else
{
    print("His age is \(age).")
}
~~~



#### 1.1.2 列表

创建列表

~~~swift
var MyList = ["Tobias", "Haibin", "Mengfan"]
print(MyList)
~~~

创建空列表

~~~swift
let mylist = [String]()
~~~

打印列表

~~~swift
print(MyList[1])   // "Haibin"
~~~

追加元素

~~~swift
Mulist.append("Yunrou")
~~~

数组转换成二进制Data

~~~swift
let number = [1.0, 2.0, 3.0, 4.0]
let number_byte = number.withUnsafeBufferPointer {Data(buffer: $0)}
~~~



#### 1.1.3字典

定义字典

~~~swift
var MySkill =
[
    "Java": 3,
    "Python": 4
]
~~~

创建空字典

~~~swift
let myskill = [String : Float]()
~~~

打印字典

~~~swift
print(MySkill)
print(MySkill["Java"])      // 返回Optional(3)
// Optional( )的意思是这个地方的值可以为空
~~~

添加字典内容

~~~swift
MySkill["C++"] = 5
~~~

 

### 1.2 控制流程

#### 1.2.1 for-in循环

一般循环

~~~swift
// 两个点
for i in 0 ..< 3
{
  print("Step: ", i)
}
// 0, 1, 2

// 三个点 （在xcode里面好像不行）
for i in 0 ...< 3
{
  print("Step: ", i)
}
// 0, 1, 2, 3
~~~



列表循环

~~~swift
var MyList = [1, 2, 3, 4, 5]
for val in MyList
{
  print(val)
}
~~~



字典循环

~~~swift
var PlayerSocre = 
[
  "Tobias": 1,
  "Haibin": 2
]

for score in PlayerScore
{
  if score.value >=2
  {
		print("\(score.key) is good.")
  }
  else
  {
		print("\(score.key) is not good.")
  }
}
~~~

 

### 1.2.2 if判断

~~~swift
var answer = 1
var perfect_solution = 1
var good_solution = 2

if answer == perfect_solution
{
  print("Your answer is perfect!")
}
else if answer == good_solution
{
  print("Your answer is good!")
}
else
{
  print("Your answer is incorrect.")
}
~~~

 

### 1.2.3 *while循环

一般写法

~~~swift
var i = 1

while i <= 5
{
  print("Step: ", i)
  i += 1
}
~~~



`repeat`写法

~~~swift
var j = 10

repeat
{
  print("Step: ", j)
  j += 1
} while j <= 5
~~~

 

#### 1.2.4 *`??`判断

`??`运算符判断前者是否为空值，如果是空，就选择后者

~~~swift
var choice_1:String? = "KIT"
var choice_2 = "TUM"

print("I would like to go the \(choice_1 ?? choice_2) for study!")
// "I would like to go the KIT for study!"
 
choice_1 = nil
print("I would like to go the \(choice_1 ?? choice_2) for study!")
// "I would like to go the TUM for study!"
~~~



### 1.3 函数和封包

#### 1.3.1 定义普通函数

~~~swift
func FunctionName(Parameter : Tpye) -> Returntype	// Returntype 也可以写成(Returnparameter : Returntype)的形式，看下面的例子
{
  return ReturnValue
}
~~~

举例：

~~~swift
func power(variable : Int) -> Int	// -> Result : Int, 但是直接打印结果则会有不同，看1.3.2的例子
{
  return a * a
}
// 调用的时候要写上输入变量的名字，这里就是variable
print("The power of 3 is \(power(variable : 3)).")
~~~



#### 1.3.2 返回元组的函数

~~~swift
func edge_length(x1 : Int, x2 : Int, y1 : Int, y2 : Int) -> (Length : Int, Width : Int)
{
  return (x2 - x1, y2 - y1)
}
~~~

直接打印

~~~swift
print(edge_length(x1 : 0, x2 : 10, y1 : 1, y2 : 5))
// (Length: 10, Width: 4)
~~~

赋值后使用

~~~swift
let SizeOfBox = edge_length(x1:0, x2:10, y1:1, y2:5)
print(SizeOfBox.Length)            // 10
print(SizeOfBox.Width)            // 4
~~~

 

#### 1.3.3 *函数嵌套

~~~swift
func add_2_number(x : Int, y : Int) -> Int
{
  func add() -> Int
  {
		return x + y
  }
  return add()
}
~~~

`add()`里面可以直接调用`add_2_number()`的变量

 

#### 1.3.4 *定义返回函数的函数

~~~swift
func FindMethod() -> ((Int, Int)-> Int)      // 返回的是一个 输入2输出1 的函数，也就是下面的add()
{
  func add(x : Int, y : Int) -> Int
  {
		return x + y
  }
  return add
}
~~~

调用

~~~swift
var MyMethod = FindMethod()
print(MyMethod(10, 20))        // 30
~~~

 

#### 1.3.5 *定义CallBack函数

~~~swift
func showScreen(threshold:Int, cb: (String) -> Void)
{
  pring("showScreen: ", threshold)
  cb("Hello, World!")
}

func screen_cb(screen_data:String) -> Void
{
  pring("screen_data is ", screen_data)
}

showScreen(threshold: 100, cb: screen_cb)

// showScreen: 100
// screen_data is Hello, World!
~~~

 

#### 1.3.6 闭包函数

~~~swift
var numbers = [1, 2, 3, 4, 5]

var MyList = numbers.map({(number:Int) -> Int in
  return number * number
})

print(MyList)      // [1, 4, 9, 16, 25]
~~~

 

### 1.4 对象和类

#### 1.4.1 定义类

~~~swift
class Player
{
  init(score : Int)            // 和Python一样
  {
		self.score = score
  }
  
  func PlayerLevel() -> String
  {
		if self.score >= 30
		{
			return "MVP"
		}
		else
		{
			return "Good"
		}
  }
}
~~~



使用类

~~~swift
var player1 = Player(score : 25)
print(player1.PlayerLevel())
~~~

 

#### 1.4.2 继承和多态

~~~swift
class NBAPlayer: Player          // 继承
{
  override func PlayerLever() -> String   // 多态
  {
		if self.score >= 15
		{
			return "MVP"
		}
		else
		{
			return "Good"
		}
  }
}
~~~

 

### 1.4.3 *`getter`和`setter`

~~~swift
class Circle
{
  var radius = 0.0
  init(radius: Float)
  {
		self.radius = radius
  }
  var area:Float
  {
		get                // 每次获取，就执行这个
		{
			return 3.14 * power(self.radius, 2)
		}
		set                // 每次设置，就执行这个
		{
			self.radius = power(newValue / 3.14, 0.5)
		}
  }
}
~~~

使用

~~~swift
var circle = Circle(radius: 10)
print(circle.area)              // 314
circle.area = 100
print(circle.radius)            // 5.64333
~~~

 

### 1.5 枚举和结构

#### 1.5.1 *创建枚举

~~~swift
enum Language
{
  case java
  case python
  case c
  case matlab
  case cpp
}
~~~



#### 1.5.2 *定义结构体

~~~swift
struct LoginForm
{
  var uid:Int
  var pwd:String
  var authorized_code:String
}
let user1 = LoginForm(uid: 1001, pwd: "helloworld", authorized_code: "12345")
~~~



### 1.6 *扩展和协议

 

### 1.7 *错误处理



## 2 Xcode + SwiftUI入门

右边的框点一下Resume就可以现实UI界面

`command + A `全选， `control + i` 自动排版

### 2.1 布局

#### 2.1.1 基本布局

最基本的横向纵向排列：在`ContentView.swift`里面

~~~swift
struct ContentView: View {
  var body: some View {
		Text("Hello, world!")
  }
}
~~~

按住`command`键左键点击`Text( )`，选择`Embed in H/V Stack`然后就会有

~~~swift
struct ContentView: View {
  var body: some View {
		VStack {
			Text("Hello, world!")
		}
  }
}
~~~

然后可以在`Text("Hello, world!")`下面增加东西了，比如再增加一个`Text("Hello, world!")`

 

在Vstack后面可以加入选项

~~~swift
VStack(alignment: .trailing, spacing:0 ) {
  Text("My first APP")
  Text("Haibin")
}
~~~

`.trailing`, `.center`, `.leading`分别是右对齐，居中对齐和左对齐。

`spacing`是两个文本直接的间隔

**右上角的"+"可以拖拽到代码或者UI里面**

 

#### 2.1.2 图片

添加图片：点击`Assets.xcassets`，左下角加号，点击`Image Set`，改名字，然后把图片拖进来即可

 

放置图片：

~~~swift
Image("AirCase")               // 插入图片
  .resizable()               // 大小可变
  .aspectRatio(contentMode:.fit)      // 图片大小的适应方式，还有.fill
~~~



点击图片的动作`onTapGasture`

~~~swift
.onTapGesture {
  withAnimation{
		self.zoomed.toggle()         // zoom.toggle()就是true变false, false变true
  }
}
~~~

上面意味着点击图片则`zoomed`在`true`和`false`之间变换。把`.aspectRatio(contentMode:.fit)`改写成

~~~swift
.aspectRatio(contentMode: self.zoomed ? .fit : .fill)
~~~

则图片的填充形式也会随着点击图片而变化

 

#### 2.1.3 Button

~~~swift
Button(action: {                  // action是点击之后的动作
  self.title = self.textInput          // 先不用管这个
}, label: {
  Text("Confirm")                // 显示的内容
		.font(.title)
		.padding()
		.background(Color.blue)          // 背景颜色
		.foregroundColor(.white)         // 文字颜色
  .cornerRadius(10)               // 按钮圆角
})
~~~



#### 2.1.4 TextField

~~~swift
@State private var textInput:String = ""      // 一个状态变量，绑定数据，一般直接绑定环境变量，不用这个
...

TextField("Type Here", text: self.$textInput)   // Type Here是Hint。输入绑定在textInput上。带$表示可以改变变量，不带则只能读取
  .font(.title)
  .frame(width: UIScreen.main.bounds.width - 50, height: 100, alignment:.center)
  .padding(10)
  .textFieldStyle(RoundedBorderTextFieldStyle())
~~~

输入完成后的CallBack函数：`onCommit`

~~~swift
TextField("Label",
  text: $depthvideocontroller.label,			// depthvideocontroller是一个环境变量的类的实例，label是类里的一个变量			
  onCommit:
  {
		depthvideocontroller.ResetLabel()			// ResetLabel()是一个函数
  }
)
~~~

输入过程中的监控：`didSet`（其实是针对变量的，而不是TextField）

~~~
@Published var label : String = "Label"	
{
  didSet
  {
		print(self.label)
  }
}
右对齐：
.multilineTextAlignment(.trailing)
~~~



#### 2.1.5 List



#### 2.1.6 Sheet

 

### 2.2 *数据绑定 (一般都用环境变量)

~~~swift
struct ContentView: View {
  
  @State private var textInput:String = ""      // 建立2个状态变量绑定Text和TextField
  @State private var title:String = "Hello World!"
  
  var body: some View {
    VStack (alignment:.center, spacing: 10) {
       Text(self.title)             // 把Text文本框绑定self.title
         .font(.title)
       
				TextField("Type Here", text: self.$textInput)
         .font(.title)
         .frame(width: UIScreen.main.bounds.width - 50, height: 100, alignment:.center)
         .padding(10)
         .textFieldStyle(RoundedBorderTextFieldStyle())
       
				Button(action: {
         self.title = self.textInput      // 按钮按下则把文本框内容赋给Text
        }, label: {
         Text("Confirm")
           .font(.title)
           .padding()
           .background(Color.blue)
           .foregroundColor(.white)
         .cornerRadius(10)
       })
    }
  }
}
~~~



### 2.3 获得系统数据

~~~swift
struct ContentView: View {
  @Environment(\.colorScheme) var mode        // 获取系统数据并附给mode
  var body: some View {
  Text("System color scheme is: \(mode == .dark ? "Dark" : "Light").")  // 根据数据调整内容
  }
}}
~~~

 **获取系统时间：**

~~~swift
let a = Data()
~~~

获取一个唯一的时间（1970年到当下的ms时间）

~~~swift
extension Date {
    var milliseconds:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
~~~

使用方法：

~~~
let a = Data().milliseconds
~~~





### 2.4 *观察者数据绑定

在建立项目的时候选择APP生命周期为UIKit APP Delegate **（过时了已经，现在的版本见2.6）**

 

`command + N` 建立一个新的Swift文件（我给它起名ViewModel）

在ViewModel.swift里建立一个类，这个类可以在APP生命周期储存所有数据

~~~swift
import Foundation
import SwiftUI
 
class myviewmodel: ObservableObject {         // 继承于ObservableObject
  @Published var AppTitle:String = "Learn MVVM"   // 比方说我建立2个字符串
  @Published var Author:String = "Haibin Zhao"    // Published是公用的
}
~~~

在AppDelegate.swift里面：

在class里面创建实例

~~~swift
import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 
  var MyViewModel: myviewmodel!         // 创建实例，别忘了加 "!"
~~~

在`application`函数里创建self这个实例

~~~swift
	func application(...) -> Bool {
    self.MyViewModel = myviewmodel()     // 这里
    return true
  }
  ...                      // 其他代码省略
}
~~~

在SceneDelegate.swift的scene函数里加2行并改1行:

~~~swift
func scene(...) {
// 加下面这2行，从AppDelegate.swift里面拿到实例MyViewModel
  let app = UIApplication.shared
  let delegate = app.delegate as! AppDelegate
// 改这1行，将MyViewModel传入ContentView页面
  let contentView = ContentView(MyViewModel: delegate.MyViewModel)
 
  if let windowScene = scene as? UIWindowScene { ... }
}
~~~

最后在ContentView里面使用ViewModel里的变量：

~~~swift
import SwiftUI
 
struct ContentView: View {
  @ObservedObject var MyViewModel: myviewmodel    // 获得这个实例
 
  var body: some View {
    Text(MyViewModel.AppTitle)          // 就是之前定义的"Learn MVVM"了
  }
}
 
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(MyViewModel: myviewmodel())      // 这里也改一下，为了看Preview
  }
}
~~~



### 2.5 *访问环境对象

观察者绑定过于繁琐，因为要一层一层传递。可以将变量直接设置为环境变量，从各个地方都能读取。

 

在建立项目的时候选择APP生命周期为UIKit APP Delegate.**（过时了已经，现在的版本见2.6）**

 

`command + N` 建立一个新的Swift文件（我给它起名ViewModel）

在ViewModel.swift里建立一个类，这个类可以在APP生命周期储存所有数据

~~~swift
import Foundation
import SwiftUI
 
class myviewmodel: ObservableObject {         // 继承于ObservableObject
  @Published var AppTitle:String = "Learn MVVM"   // 比方说我建立2个字符串
  @Published var Author:String = "Haibin Zhao"    // Published是公用的
} 
~~~

在AppDelegate.swift里面：在class里面创建实例

~~~swift
import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var MyViewModel: myviewmodel!         // 创建实例，别忘了加 "!"
~~~

在`application`函数里创建self这个实例

~~~swift
	func application(...) -> Bool {
		self.MyViewModel = myviewmodel()     // 这里
		return true
	}
  ...                      // 其他代码省略
}
~~~

在SceneDelegate.swift的`scene`函数里加3行:

~~~swift
func scene(...) {
// 加下面这2行，从AppDelegate.swift里面拿到实例MyViewModel
  let app = UIApplication.shared
  let delegate = app.delegate as! AppDelegate
  let contentView = ContentView()
    .environmentObject(delegate.MyViewModel)    // 加这1行，将MyViewModel变成环境变量
 
  if let windowScene = scene as? UIWindowScene { ... }
}
~~~

最后在ContentView里面使用ViewModel里的变量：

~~~swift
import SwiftUI
 
struct ContentView: View {
  @EnvironmentObject var MyViewModel: myviewmodel    // 获得这个实例
 
  var body: some View {
    Text(MyViewModel.AppTitle)            // 就是之前定义的"Learn MVVM"了
  }
}
 
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
       .environmentObject(myviewmodel())       // 这里也改一下，为了看Preview
  }
}
~~~



### 2.6 MVVM模式 !

#### 2.6.1 建立一般MVVM模型

建立SwiftUI APP生命周期

 

**建立文件夹将View, Model, ViewModel分类储存**

View: UI界面

Model: 数学模型，函数

ViewModel: 控制器(Model转换成View的工具)，（Model和ViewModel也可以放一起）

右键单击项目文件夹，New Group，命名即可。

 

在Model文件夹里建立swift文件（比如Book.swift）存放数据结构：

~~~swift
import SwiftUI
 
struct Book {
  var Title:String
  var Author:String
}
~~~



在View文件夹里建立**SwiftUI View**文件（比如MyHomeView.swift）存放View

~~~swift
import SwiftUI
 
struct MyHomeView: View {
  @StateObject private var viewmodel = MyHomeViewModel()   // 和ObservedObject类似
 
  var body: some View {
    Text(self.viewmodel.AppTitle)
  }
}
 
struct MyHomeView_Previews: PreviewProvider {
  static var previews: some View {
    MyHomeView()
  }
}
~~~

 

在ViewModel里面建立`MyHomeViewModel.swift`来交互View和Model

~~~swift
import SwiftUI
 
class MyHomeViewModel : ObservableObject {
  @Published var bookinfo : Book
  init()
  {
    self.bookinfo = Book(Title : "My Book", Author : "Haibin")
  }
  var AppTitle:String
  {
    return self.bookinfo.Title + " (Author: \(self.bookinfo.Author))"
  }
}
~~~

**如果要直接绑定变量，必须加上<u>@Published</u>**，比如

~~~swift
import SwiftUI

class MyHomeViewModel: ObservableObject {
  @Published state : String = "good"
  
  func ChangeState(){
    state = "bad"
  }
}
~~~

如果在`View`页面绑定了`state`

~~~swift
Text(self.viewmodel.state)
~~~

然后（例如通过按钮）调用了

~~~swift
self.viewmodel.ChangeState()
~~~

那么如果没加`@Published`则Text的显示不会改变

 

最后在Project.swift里面改变App启动时的View

~~~swift
import SwiftUI
 
@main
struct learn_xcode_5App: App {
  var body: some Scene {
    WindowGroup {
       MyHomeView()         // 这里
    }
  }
}
~~~



#### 2.6.2 将实例放在环境变量里

上文例子中，在View里`@StateObject private var viewmodel = MyHomeViewModel()`直接建立了新的实例，但是每次（例如在不同页面中）创建新实例，数据并不共通。所以应当在整个APP生命周期，各个地方都使用同一个实例。 

在Project.swift里面改变App启动时的View (line 9)，同时增加环境变量(line 5, 10)

~~~swift
import SwiftUI
@main
struct learn_xcode_5App: App {
 
  @StateObject var viewmodel:MyHomeViewModel = MyHomeViewModel()   // 在整个APP中创建实例
 
  var body: some Scene {
    WindowGroup {
       MyHomeView()
         .envirnomentObject(self.viewmodel)           // 设为环境变量
    }
  }
}
~~~



环境变量的调用：在View里不再写`@StateObject private var viewmodel = MyHomeViewModel()`创建新的实例，而是

~~~swift
@EnvironmentObject var viewmodel: MyHomeViewModel
~~~

直接调用之前设置好的环境变量`viewmodel`。

 

### 2.7 页面导航

#### 2.7.1 导航页面的基本设置

在`var body: some View {}`用`NavigationView{}`把内容圈起来

~~~swift
var body: some View {
  NavigationView														// 这里
  {
    VStack
    {
       Text("Hello World!")
         .foregroundColor(self.setColor ? Color.red : Color.blue)
       Spacer()
    }

		// 然后设置navigation页面的东西，可以设置页面题目，左上和右上角的东西
    .navigationBarTitle("Home Screen", displayMode: .inline)  //  标题
 
    .navigationBarItems(
       leading: Button(action: {         // 左边的东西，这里是个按钮
         self.setBold.toggle()
       }, label: {
         Text("Change the font")
       }),
       trailing: Button(action: {        // 右边的东西，也是个按钮
         self.setColor.toggle()
       }, label: {
         Text("Change the color")
       }))
  }
}
~~~



#### 2.7.2 导航链接

建立View文件夹，把主页面拖进去，或者自己建立一个。

~~~swift
import SwiftUI
 
struct ContentView: View {
   @State private var activeLink: Bool = false       // 控制是否切换页面
   
   var body: some View {
      NavigationView
      {
        VStack(alignment: .center, spacing: 0)
        {
           Text("Hello World!")
           NavigationLink(
             // 进入DetailView要同时传递activeLink参数。是否进入取决于activeLink的真假
             destination: DetailView(active: self.$activeLink), isActive: self.$activeLink,
             label:
                {
                   Button(action: {
                     self.activeLink = true      // 点击按钮之后就进入了
                   }, label: {
                     Text("Detail Page")
                   })
                })
        }
        .padding()
        .navigationBarTitle("Main Page", displayMode: .inline)
      }
   }
}
 
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
~~~



再建立一个DetailView的SwiftUI文件

~~~swift
import SwiftUI
 
struct DetailView: View {
  @Binding var active: Bool       // 传进来的activeLink绑定active
  var body: some View
  {
    Text("I love you!")
    Button(action: {
       self.active = false      // 点击按钮，则activeLink变成false，退回主页面
    }, label: {
       Text("Back")
    })
  }
}
 
struct detailView_Previews: PreviewProvider {
// @Binding static var active = false
  static var previews: some View {
    // 为了看效果，这里也要传入一个true，要这样写才行
    DetailView(active: .constant(true))
  }
}
~~~



### 2.8 TabView

在https://developer.apple.com/sf-symbols/可以下载许多小图标，图标的名字可以直接用在app里，见2.5.1 line 8, 14

#### 2.8.1 TabView基础

~~~swift
struct ContentView: View {
  var body: some View {
    TabView
    {
       AnotherView1()                // 自己建立的View
         .tabItem
         {
           Image(systemName: "house")      // 图标
           Text("Home Page")           // 文字
         }
       AnotherView2()
         .tabItem
         {
           Image(systemName: "calendar")
           Text("Calendar")
         }
    }
// 下面两行使得页面可以滑动切换，用处不大
//   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//   .background(Color.gray.opacity(0.5))
  }
}
~~~



#### 2.8.2 TabView链接

TabView里面加一些参数，并给每个页面指定一个代号

~~~swift
@State private var selected_view_index:Int = 10        // 一个控制页面的变量
var body: some View {
  TabView (selection: self.$selected_view_index){      // 用它来控制页面选择
    AnotherView1(page_index: self.$selected_view_index)  // 传到页面里，为了在页面里切换
       .tabItem ({                    // 这里多了一对"()"
         Image(systemName: "house")
         Text("Home Page")
       }).tag(10)                    // 这里是页面的标签
    AnotherView2(page_index: self.$selected_view_index)
       .tabItem ({
         Image(systemName: "house")
         Text("Home Page")
       }).tag(20)
  }
}
~~~

 

在每个页面里需要绑定`selected_view_index`并通过更改它来切换页面：

~~~swift
struct AnotherView1: View
{
  @Binding var page_index:Int      // 绑定
  var body: some View {
    VStack{
       Text("Hello")
       Button(action: {
         self.page_index = 20   // 点击一下就变成20，就切到另一个页面了
       }, label: {
         Text("Click Here")
       })
    }
  }
}
~~~

 

### 2.9 弹出Sheet视图

`.sheet`就可以控制pop一个页面

~~~swift
struct ContentView: View {
  @State private var show_sheet:Bool = false
  var body: some View {
    Button(action: {
       self.show_sheet = true
    }, label: {
       Text("Show Pop View")
         .font(.title)
    })
    .sheet(isPresented: self.$show_sheet, content: {
       PopView(show: self.$show_sheet)
    })
  }
}
~~~

然PopView里面Binding一个变量，然后弄一个按钮设置`false`返回即可。

 

### 2.10 警告框

`.alert()`显示警告框

~~~swift
struct ContentView: View {
  @State private var show_alert:Bool = false
  var body: some View {
    Button(action: {
       self.show_alert = true
    }, label: {
       Text("Show Alert :)")
         .font(.largeTitle)
    })
    .alert(isPresented: self.$show_alert, content: {    // 固定的下面的模式
       Alert(title: Text("Alert"),
       message: Text("It is dangerous!!"),
       dismissButton: .cancel(Text("Close")))
    })
  }
}
~~~

 

### 2.11 ActionSheet

~~~swift
struct ContentView: View {
  @State private var title:String = "Learn ActionSheet"   // 建立2个内容
  @State private var message:String = "Message"
  @State private var open_sheet:Bool = false         // 判断打开ActionSheet与否
  
  var body: some View {
    VStack{
       Text(self.title)
         .font(.largeTitle)
       Spacer()
       Text(self.message)
         .font(.body)
         .foregroundColor(.red)
       Spacer()
       Button(action: {
         self.open_sheet = true
       }, label: {
         Text("Open ActionSheet")
       })
    }
    .actionSheet(isPresented: self.$open_sheet) { () -> ActionSheet in // 固定写法
       ActionSheet(title: Text("Title"),               // 类似于提示
             message: Text("Message"),             // 类似于描述
             buttons: [
               .default(Text("Option 1"), action: {      // 默认选项
                 self.message = "Option 1"
               }),
               .destructive(Text("Option 2"), action: {    // 红色的选项
                 self.message = "Option 2"
               }),
               .cancel(Text("Cancel"), action: {       // 关闭选项
                 self.message = "Canceled"
               })
       ])
    }
  }
}
~~~



## 3 项目相关

### 3.1 TrueDepth

~~~swift
import Foundation
import SwiftUI
import AVFoundation
import SocketIO
import Accelerate
import CoreVideo

class DepthVideoViewController : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate, AVCaptureDepthDataOutputDelegate, AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureDataOutputSynchronizerDelegate {
    
    @Published var label : String = "Label"
  	@Published var recording: Bool = false
    
    // About the Camera Setting
    @Published var session = AVCaptureSession()
    @Published var output = AVCapturePhotoOutput()
    @Published var depthOutput = AVCaptureDepthDataOutput()
    @Published var videoDataOutput = AVCaptureVideoDataOutput()
    var outputSynchronizer: AVCaptureDataOutputSynchronizer? = nil
    var dataOutputQueue = DispatchQueue(label: "depth data queue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
  	// Preview  
  	@Published var view: UIView = UIView(frame: UIScreen.main.bounds)
  
    // About SocketIo
    let socket_manager = SocketManager(socketURL: URL(string: url)!)
    let socket: SocketIOClient
    var forSocketToSend = ([], [], [])
    var frameCount = 0
  
    override init() {
        socket = socket_manager.defaultSocket
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected.")
        }
        socket.connect()
    }
    
    func Check()
    {
        // Check the Authorization
        switch AVCaptureDevice.authorizationStatus(for: .video)
        {
        case .authorized:
            SetUp()
            return
            
        case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.SetUp()
                        return
                    }
                }
        default:
            print("User denied access to camera")
            return
        }
    }
    
    func SetUp()
    {
        do {
            // Choose device
            guard let camera = AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .unspecified) else {return}
            // Setup session
            session.beginConfiguration()
           
            let input = try AVCaptureDeviceInput(device: camera)
            session.addInput(input)
            session.sessionPreset = AVCaptureSession.Preset.vga640x480
            
          	// Enable DepthData
          	self.output.isDepthDataDeliveryEnabled = true

          	session.addOutput(output)
            session.addOutput(depthOutput)
            session.addOutput(videoDataOutput)
            
            if let connection = depthOutput.connection(with: .depthData) {
                connection.isEnabled = true
                depthOutput.isFilteringEnabled = true
                depthOutput.setDelegate(self, callbackQueue: dataOutputQueue)
            }
            videoDataOutput.alwaysDiscardsLateVideoFrames = false
            videoDataOutput.connection(with: .video)?.isEnabled = true
            videoDataOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
 
            outputSynchronizer = AVCaptureDataOutputSynchronizer(dataOutputs: [videoDataOutput, depthOutput])
            outputSynchronizer!.setDelegate(self, queue: dataOutputQueue)
            
            session.commitConfiguration()
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        // Start Session
        session.startRunning()
        
        self.setUpPreviewLayer()
        
        // Socket IO
        socket.on("takephoto") {data, act in
            self.TakePhoto()
        }
    }
    
    func setUpPreviewLayer() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let camera_preview = AVCaptureVideoPreviewLayer(session: self.session)
            camera_preview.frame = self.view.frame

            camera_preview.videoGravity = .resizeAspectFill
            self.view.layer.addSublayer(camera_preview)
        }
    }
    
    func TakePhoto()
    {
        // Setup the photo type, depth information, etc.
        let photo_settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        photo_settings.isDepthDataDeliveryEnabled = self.output.isDepthDataDeliverySupported
        photo_settings.isDepthDataFiltered = false
        
        // Capture the photo (func photoOutput will be called, see following)
        self.output.capturePhoto(with: photo_settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?)
    {
        if error != nil
        {
            return
        }
        
        // get the photo information for saving photo
        guard let image_data = photo.fileDataRepresentation() else {return}     // for socket
        
        // deal with depth data
        let depth_temp = photo.depthData!
        let depth_data_type = kCVPixelFormatType_DepthFloat32
        let depth_converted = depth_temp.converting(toDepthDataType: depth_data_type)

        let pixel_buffer = depth_converted.depthDataMap
        // pixelweise handling, here convert the pixelbuffer into a Data
        let depth_data = pixel_buffer.GetData()                                    // for socket
        
        // intrinsic matrix
        let intrinsic_matrix = depth_converted.cameraCalibrationData!.intrinsicMatrix
        let intrinsic = [intrinsic_matrix[0][0], intrinsic_matrix[1][1], intrinsic_matrix[2][0], intrinsic_matrix[2][1]]
        let instrinsic_matrix = intrinsic.withUnsafeBufferPointer {Data(buffer: $0)}

        // Socket IO
        socket.emit("depthData", depth_data, image_data, instrinsic_matrix)
    }
    
    func startStopVideo() {
        if (!self.recording) {
			forSocketToSend.0.removeAll()
            forSocketToSend.1.removeAll()
            forSocketToSend.2.removeAll()

            frameCount = 0
            self.recording = true
        }
        else {
            self.recording = false
            print("Recorded \(frameCount) frames")
            socket.emit("video", forSocketToSend.0, forSocketToSend.1, forSocketToSend.2)
        }
    }

    func getDataFromCMSampleBuffer (sampleBuffer: CMSampleBuffer) -> Data? {
            if CMSampleBufferDataIsReady (sampleBuffer),
                let pixelBuffer = CMSampleBufferGetImageBuffer (sampleBuffer) {
                let ciImage = CIImage (cvImageBuffer: pixelBuffer)
                let image = UIImage (ciImage: ciImage)
                return (image.jpegData (compressionQuality: 0.0))
            }
            return nil
        }
    
    func toCMSampleBuffer(pixelBuffer : CVPixelBuffer) -> CMSampleBuffer {
            
            var newSampleBuffer: CMSampleBuffer? = nil
            var timimgInfo: CMSampleTimingInfo = CMSampleTimingInfo.invalid
            var videoInfo: CMVideoFormatDescription? = nil
     
            CMVideoFormatDescriptionCreateForImageBuffer(allocator: nil, imageBuffer: pixelBuffer, formatDescriptionOut: &videoInfo)
            CMSampleBufferCreateForImageBuffer(allocator: kCFAllocatorDefault, imageBuffer: pixelBuffer, dataReady: true, makeDataReadyCallback: nil, refcon: nil, formatDescription: videoInfo!, sampleTiming: &timimgInfo, sampleBufferOut: &newSampleBuffer)
     
            return newSampleBuffer!
            
        }

    //AVCaptureDataOutputSynchronizerDelegate
    func dataOutputSynchronizer(_ synchronizer: AVCaptureDataOutputSynchronizer, didOutput synchronizedDataCollection: AVCaptureSynchronizedDataCollection) {
        if (recording) {
            if let syncedDepthData: AVCaptureSynchronizedDepthData = synchronizedDataCollection.synchronizedData(for: self.depthOutput) as? AVCaptureSynchronizedDepthData {
                        if !syncedDepthData.depthDataWasDropped {
                            
                            if let syncedVideoData: AVCaptureSynchronizedSampleBufferData = synchronizedDataCollection.synchronizedData(for: self.videoDataOutput) as? AVCaptureSynchronizedSampleBufferData {
                                if !syncedVideoData.sampleBufferWasDropped {
                                    
                                    frameCount+=1
                                    
                                    // intrinsic matrix
                                    let depth_converted = syncedDepthData.depthData
                                    let intrinsic_matrix = depth_converted.cameraCalibrationData!.intrinsicMatrix
                                    let intrinsic = [intrinsic_matrix[0][0], intrinsic_matrix[1][1], intrinsic_matrix[2][0], intrinsic_matrix[2][1]]
                                    let instrinsic_matrix = intrinsic.withUnsafeBufferPointer {Data(buffer: $0)}
                                    
                                    let depthSampleBuffer = syncedDepthData.depthData.converting(toDepthDataType: kCVPixelFormatType_DepthFloat32).depthDataMap
                                    let videoSampleBuffer = syncedVideoData.sampleBuffer
                                    
                                    guard let imagePixelBuffer = CMSampleBufferGetImageBuffer(videoSampleBuffer) else { fatalError() }
                                    
                                    do {

                                        let frameData = try imagePixelBuffer.copy()
                                        let depthData = try depthSampleBuffer.copy()
                                        

                                        guard let image_data = getDataFromCMSampleBuffer(sampleBuffer: toCMSampleBuffer(pixelBuffer: frameData)) else {return}
                                        let depth_data = depthData.GetData()                                    // for socket
                                        depthData.normalize()

                                        forSocketToSend.0.append(depth_data)
                                        forSocketToSend.1.append(image_data)
                                        forSocketToSend.2.append(instrinsic_matrix)
                                        
                                    } catch {
                                        fatalError()
                                    }
                                } else {
                                    print("Video frame dropped")
                                }
                            }
                        } else {
                            print("Depth data dropped")
                        }
                
                    }
        }
    }
    
    func ResetLabel()
    {
        socket.emit("reset", self.label)
        print("The new label is: " + self.label)
    }
}
~~~



解读：

~~~swift
class DepthVideoViewController : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate, AVCaptureDepthDataOutputDelegate, AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureDataOutputSynchronizerDelegate
{
  ...
}
~~~

`NSObject`：一个关于 Objective-C 的类

`ObservableObject`：用于把类变成环境变量

`AVCapturePhotoCaptureDelegate`：用于拍照

`AVCaptureDepthDataOutputDelegate`：用于深度信息的连续输出（视频）

`AVCaptureVideoDataOutputSampleBufferDelegate`：用于图像信息的连续输出（视频）

`AVCaptureDataOutputSynchronizerDelegate`：用于同步深度和图像信息



~~~swift
var dataOutputQueue = DispatchQueue(label: "depth data queue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
~~~

`DispatchQueue`是多线程任务的队列，按照FIFO的原则处理信息。

`DispatchQueue`的定义方法：`DispatchQueue(label : String, qos : DispatchQoS = .unspecified, attributes : DispatchQueue.Attributes = [], autoreleaseFrequency : DispatchQueue.AutoreleaseFrequency = .inherit, target: DispatchQueue? = nil)`

- `label`：标签，名字
- `qos`：Quality of Service，设置该队列的优先级，以下优先级逐渐降低
  * `.userInteractive`
  * `.userInitiated`
  * `.default`
  * `.utility`
  * `.background`
  * `.unspecified`
- `attributes`：与队列关联的属性，如果省略该属性，则分派队列将顺序执行任务
- `autoreleaseFrequency`：自动释放队列调度的块创建的对象的频率
  * `.inherit`
  * `.workItem`
  * `.never`
- `target`：要在其上执行块的目标队列



~~~swift
let socket_manager = SocketManager(socketURL: URL(string: url)!)
let socket: SocketIOClient
var forSocketToSend = ([], [], [])
var frameCount = 0
  
override init() {
	socket = socket_manager.defaultSocket
	socket.on(clientEvent: .connect) {data, ack in
		print("socket connected.")
	}
	socket.connect()
}
~~~

用于连接服务器。let url = "http://192.168.2.107:3000"，我自己的服务器ip



~~~swift
func Check()
{
	// Check the Authorization
	switch AVCaptureDevice.authorizationStatus(for: .video)
	{
		case .authorized:
			SetUp()
			return
            
		case .notDetermined: // The user has not yet been asked for camera access.
			AVCaptureDevice.requestAccess(for: .video) { granted in
				if granted {
					self.SetUp()
					return
				}
			}
		
		default:
			print("User denied access to camera")
			return
	}
}
~~~

`AVCaptureDevice.authorizationStatus`：设备的权限状况

`AVCaptureDevice.requestAccess(for: .video)`：向用户获取权限



~~~swift
func SetUp()
{
	do {
		// Choose device
		guard let camera = AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .unspecified) else {return}
    
		// Setup session
		session.beginConfiguration()
           
		let input = try AVCaptureDeviceInput(device: camera)
		session.addInput(input)
		session.sessionPreset = AVCaptureSession.Preset.vga640x480
            
		// Enable DepthData
		self.output.isDepthDataDeliveryEnabled = true

		session.addOutput(output)
		session.addOutput(depthOutput)
		session.addOutput(videoDataOutput)
            
		if let connection = depthOutput.connection(with: .depthData) {
			connection.isEnabled = true
			depthOutput.isFilteringEnabled = true
			depthOutput.setDelegate(self, callbackQueue: dataOutputQueue)
		}
		videoDataOutput.alwaysDiscardsLateVideoFrames = false
		videoDataOutput.connection(with: .video)?.isEnabled = true
		videoDataOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
 
		outputSynchronizer = AVCaptureDataOutputSynchronizer(dataOutputs: [videoDataOutput, depthOutput])
		outputSynchronizer!.setDelegate(self, queue: dataOutputQueue)
            
		session.commitConfiguration()
	}
	catch
	{
		print(error.localizedDescription)
	}
        
	// Start Session
	session.startRunning()
        
	self.setUpPreviewLayer()
        
	// Socket IO
	socket.on("takephoto") {data, act in
		self.TakePhoto()
	}
}
~~~

AVFoundation：

`AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .unspecified)` 选择相机、目的和相机位置

`AVCaptureDeviceInput(device: camera)` 选择AVFoundation的输入设备

`session.addInput(input)` 添加到session里面

`session.sessionPreset = AVCaptureSession.Preset.vga640x480` 设置视频分辨率

`self.output.isDepthDataDeliveryEnabled = true` 加入深度信息

`session.addOutput(output)`, `session.addOutput(depthOutput)`, `session.addOutput(videoDataOutput)` 加到输出里

`session.commitConfiguration()` 完成session设置

`session.startRunning()` session开始运行



Depth输出设置：

if let connection = depthOutput.connection(with: .depthData)

connection.isEnabled = true

`depthOutput.isFilteringEnabled` 深度信息是否过滤

`depthOutput.setDelegate(self, callbackQueue: dataOutputQueue)` 设置深度信息的Delegate和DispatchQueue



Video输出设置（和Depth类似）：

videoDataOutput.connection(with: .video)?.isEnabled = true

`videoDataOutput.alwaysDiscardsLateVideoFrames` 是否忽略迟到的帧

`videoDataOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)` 设置图像信息的Delegate和DispatchQueue



同步器

`AVCaptureDataOutputSynchronizer(dataOutputs: [videoDataOutput, depthOutput])` 列表里设置要同步的内容

`outputSynchronizer!.setDelegate(self, queue: dataOutputQueue)` 设置同步器的Delegate和DispatchQueue



拍照

~~~swift
func TakePhoto()
{
	// Setup the photo type, depth information, etc.
	let photo_settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
	photo_settings.isDepthDataDeliveryEnabled = self.output.isDepthDataDeliverySupported
	photo_settings.isDepthDataFiltered = false
	
	// Capture the photo (func photoOutput will be called, see following)
	self.output.capturePhoto(with: photo_settings, delegate: self)
}
~~~

设置输出格式，Format那里决定了最后的图片类型
设置深度信息
设置深度信息的滤波
发出拍照指令



拍照的回调函数（`.capturePhoto()`后自动调用）

~~~swift
func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?)
{
	if error != nil { return }
        
	// get the photo information for saving photo
	guard let image_data = photo.fileDataRepresentation() else {return}     // for socket
        
	// deal with depth data
	let depth_temp = photo.depthData!
  let depth_data_type = kCVPixelFormatType_DepthFloat32
  let depth_converted = depth_temp.converting(toDepthDataType: depth_data_type)

  let pixel_buffer = depth_converted.depthDataMap
  
  // pixelweise handling, here convert the pixelbuffer into a Data
  let depth_data = pixel_buffer.GetData()                                    // for socket
        
  // intrinsic matrix
  let intrinsic_matrix = depth_converted.cameraCalibrationData!.intrinsicMatrix
  let intrinsic = [intrinsic_matrix[0][0], intrinsic_matrix[1][1], intrinsic_matrix[2][0], intrinsic_matrix[2][1]]
  let instrinsic_matrix = intrinsic.withUnsafeBufferPointer {Data(buffer: $0)}
	
  // time
	let time_step = Date().milliseconds
	let time_byte = withUnsafeBytes(of: time_step) { Data($0) }

  // Socket IO
  socket.emit("depthData", depth_data, image_data, instrinsic_matrix, time_byte)
}
~~~

`photo.fileDataRepresentation()` 返回Data类型，也就是一个二进制数

`photo` 里有`depthData`的信息，是`AVDepthData`类型

`depth_temp.converting()`转换深度信息的类型，也是`AVDepthData`类型

`depth_converted.depthDataMap` 转换成`CVPixelBuffer`类型

`pixel_buffer.GetData()` 将`CVPixelBuffer`转换成Data（后面详细说）

`AVDepthData`含有相机内参`depth_converted.cameraCalibrationData!.intrinsicMatrix`是一个$3\times3$的矩阵

时间后面再说，socket先不说



`getDataFromCMSampleBuffer`和`toCMSampleBuffer`是关于Buffer的后面和Data类型一起讲



~~~swift
func dataOutputSynchronizer(_ synchronizer: AVCaptureDataOutputSynchronizer, didOutput synchronizedDataCollection: AVCaptureSynchronizedDataCollection)
{
	if (recording)
  {
		if let syncedDepthData: AVCaptureSynchronizedDepthData = synchronizedDataCollection.synchronizedData(for: self.depthOutput) as? AVCaptureSynchronizedDepthData
    {
			if !syncedDepthData.depthDataWasDropped
      {
        if let syncedVideoData: AVCaptureSynchronizedSampleBufferData = synchronizedDataCollection.synchronizedData(for: self.videoDataOutput) as? AVCaptureSynchronizedSampleBufferData
        {
					if !syncedVideoData.sampleBufferWasDropped
          {
          	frameCount+=1
						// intrinsic matrix
						let depth_temp = syncedDepthData.depthData
            let depth_converted = syncedDepthData.depthData.converting(toDepthDataType: kCVPixelFormatType_DepthFloat32)
            let depthMap = depth_converted.depthDataMap
            let depth_data = depthMap.GetData()
            
						let intrinsic_matrix = depth_converted.cameraCalibrationData!.intrinsicMatrix
						let intrinsic = [intrinsic_matrix[0][0], intrinsic_matrix[1][1], intrinsic_matrix[2][0], intrinsic_matrix[2][1]]
						let instrinsic_matrix = intrinsic.withUnsafeBufferPointer {Data(buffer: $0)}
                                    
						
						let videoSampleBuffer = syncedVideoData.sampleBuffer
						guard let imagePixelBuffer = CMSampleBufferGetImageBuffer(videoSampleBuffer) else {fatalError()}
            let frameData = imagePixelBuffer.copy()
            guard let image_data = getDataFromCMSampleBuffer(sampleBuffer: toCMSampleBuffer(pixelBuffer: frameData)) else {return}
            
            forSocketToSend.0.append(depth_data)
            forSocketToSend.1.append(image_data)
            forSocketToSend.2.append(instrinsic_matrix)
          }
          else
          {
            print("Video frame dropped")
          }
        }
      }
      else
      {
        print("Depth data dropped")
      }            
    }
	}
}
~~~

一层一层的解读：

`func dataOutputSynchronizer(_ synchronizer: AVCaptureDataOutputSynchronizer, didOutput synchronizedDataCollection: AVCaptureSynchronizedDataCollection)` 是同步器，自带的回调函数。
其中`synchronizedDataCollection`就是之前加在里面的深度和图像信息，里面有`count`, `synchronizedData`, `iterator`等。

`synchronizedData(for captureOutput: AVCaptureOutput) -> AVCaptureSynchronizedData?` 这里的`AVCaptureOutput`就是之前添加进去的，一个是`self.depthOutput`，一个是`self.videoDataOutput`。 如果是for DepthOutput，则后面加 `as? AVCaptureSynchronizedDepthData `，如果是for VideoOutput，则后面加`as? AVCaptureSynchronizedSampleBufferData`。

`AVCaptureSynchronizedDepthData`里面有`.depthData`, `.depthDataWasDropped`, `.droppedReason`。其中的`.depthData` 就是之前照片中得到的深度信息了。



**Excursion：关于预览：几个一起看**

上面代码22行

```swift
@Published var view: UIView = UIView(frame: UIScreen.main.bounds)
```

上面代码101行

~~~swift
self.setUpPreviewLayer()
~~~

上面代码109行

 ~~~swift
 func setUpPreviewLayer() {
 	DispatchQueue.main.asyncAfter(deadline: .now()) {
 		let camera_preview = AVCaptureVideoPreviewLayer(session: self.session)
 		camera_preview.frame = self.view.frame
 
 		camera_preview.videoGravity = .resizeAspectFill
 		self.view.layer.addSublayer(camera_preview)
 	}
 }
 ~~~

`CameraPreview.swift` 的内容：

~~~swift
import Foundation
import SwiftUI
import AVFoundation

struct CameraPreview : UIViewRepresentable {
    @EnvironmentObject var depthviewcontroller: DepthVideoViewController
    func makeUIView(context: Context) -> UIView {
        return depthviewcontroller.view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
~~~

以及`CameraVideoPage.swift` 的内容

~~~swift
import SwiftUI

struct CameraVideoPage: View {
	@EnvironmentObject var depthvideocontroller: DepthVideoViewController
	var body: some View
	{
		ZStack
		{
			CameraPreview()
				.ignoresSafeArea()
			VStack
			{
				HStack {...}
				Spacer()
				HStack { Button(action:{...}, label:{...}) }
			}
		}
	}
}
~~~

解读：

`var view: UIView = UIView(frame: UIScreen.main.bounds)` UIView是展示在屏幕上的，这里让view的边框就是主屏幕的边界

`DispatchQueue.main` 中，`main` 表示主线程，是优先级最高的

asyncAfter(deadline: DispatchTime, qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], execute work: @escaping () -> Void)

`AVCaptureVideoPreviewLayer(session: self.session)` 用来展示获取的视频的

`camera_preview.frame = self.view.frame` 让展示视频的边框等于屏幕边框

`camera_preview.videoGravity` 与重力无关，是确定视频的缩放与否，选项有：

- `resizeAspect`
- `resizeAspectFill`
- `resize`

`view.layer.addSublayer(camera_preview)` 加上这一层输出

`func makeUIView(context: Context) -> UIView {return depthviewcontroller.view}` 必须用个方法来创建视图对象。对于所有后续的更新，系统会调用 `func updateUIView(_ uiView: UIViewType, context: Context) { }` 

`CameraPreview().ignoresSafeArea()` 就是把`CameraPreview`放在`CameraVideoPage.swift`里面，就可以展示出来



### 3.3 IMU信息获取

~~~swift
import Foundation
import SwiftUI
import AVFoundation
import CoreMotion
import SocketIO

class MotionController : ObservableObject{
    // UI
    @Published var acceleration_x_string : String = "0"
    @Published var acceleration_y_string : String = "0"
    @Published var acceleration_z_string : String = "0"
    @Published var attitude_w_string : String = "0"
    @Published var attitude_x_string : String = "0"
    @Published var attitude_y_string : String = "0"
    @Published var attitude_z_string : String = "0"
    
    // controller
    @Published var motion_recorder : Bool = false
    let motion = CMMotionManager()
    var timer : Timer!
    let socket_manager = SocketManager(socketURL: URL(string: "http://10.12.181.95:3000/")!)
    let socket: SocketIOClient
    
    // 9 Axis IMU + Attitude
    var acceleration_x : Double = 0.0
    var acceleration_y : Double = 0.0
    var acceleration_z : Double = 0.0
    var gyro_x : Double = 0.0
    var gyro_y : Double = 0.0
    var gyro_z : Double = 0.0
    var mag_x : Double = 0.0
    var mag_y : Double = 0.0
    var mag_z : Double = 0.0
    var attitude_w : Double = 0.0
    var attitude_x : Double = 0.0
    var attitude_y : Double = 0.0
    var attitude_z : Double = 0.0
    var acc_absolute_x : Double = 0.0
    var acc_absolute_y : Double = 0.0
    var acc_absolute_z : Double = 0.0
    var IMU = Data()
    
    init() {
        socket = socket_manager.defaultSocket
        socket.on(clientEvent: .connect) {data, ack in }
        socket.connect()
        
        socket.on("start_imu") {data, act in
            self.StartMotionRecord()
        }
        socket.on("stop_imu") {data, act in
            self.StopMotionRecorder()
        }
        
        if motion.isDeviceMotionAvailable && motion.isAccelerometerAvailable
        {
            self.motion.deviceMotionUpdateInterval = 1.0 / 100.0
            self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
            self.motion.accelerometerUpdateInterval = 1.0 / 100.0
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the motion data.
            self.timer = Timer(fire: Date(), interval: (1.0 / 100.0), repeats: true,
                               block: { [self] (timer) in
                                if let data = self.motion.deviceMotion {
                                    let rotate = data.attitude.quaternion
                                    self.attitude_x = rotate.x
                                    self.attitude_y = rotate.y
                                    self.attitude_z = rotate.z
                                    self.attitude_w = rotate.w
                                    self.attitude_x_string = String(format: "%.2f", attitude_x)
                                    self.attitude_y_string = String(format: "%.2f", attitude_y)
                                    self.attitude_z_string = String(format: "%.2f", attitude_z)
                                    self.attitude_w_string = String(format: "%.2f", attitude_w)
                                    
                                    self.acceleration_x = data.userAcceleration.x * 9.80665
                                    self.acceleration_y = data.userAcceleration.y * 9.80665
                                    self.acceleration_z = data.userAcceleration.z * 9.80665
                                    self.acceleration_x_string = String(format: "%.2f", acceleration_x)
                                    self.acceleration_y_string = String(format: "%.2f", acceleration_y)
                                    self.acceleration_z_string = String(format: "%.2f", acceleration_z)
                                    
                                    let gravity_x = data.gravity.x * 9.80665
                                    let gravity_y = data.gravity.y * 9.80665
                                    let gravity_z = data.gravity.z * 9.80665
                                    self.acc_absolute_x = gravity_x + self.acceleration_x
                                    self.acc_absolute_y = gravity_y + self.acceleration_y
                                    self.acc_absolute_z = gravity_z + self.acceleration_z
                                    
                                    self.gyro_x = data.rotationRate.x
                                    self.gyro_y = data.rotationRate.y
                                    self.gyro_z = data.rotationRate.z
                                    
                                    self.mag_x = data.magneticField.field.x
                                    self.mag_y = data.magneticField.field.y
                                    self.mag_z = data.magneticField.field.z
                                    
                                    let motion_data = [self.acceleration_x, self.acceleration_y, self.acceleration_z, self.gyro_x, self.gyro_y, self.gyro_z, self.mag_x, self.mag_y, self.mag_z, self.attitude_x, self.attitude_y, self.attitude_z, self.attitude_w, self.acc_absolute_x, self.acc_absolute_y, self.acc_absolute_z]
                                    let motion_byte = motion_data.withUnsafeBufferPointer {Data(buffer: $0)}

                                    let date_in_ms = Date().milliseconds
                                    let time_byte = withUnsafeBytes(of: date_in_ms) { Data($0) }

                                    if self.motion_recorder
                                    {
                                        self.IMU.append(time_byte)
                                        self.IMU.append(motion_byte)
                                    }
                                    
                                    socket.emit("imu_data", motion_data)
                                }
                               })
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
        }
    }
    func StartMotionRecord() {
        if !self.motion_recorder
        {
            print("start motion recorder")
            self.IMU = Data()
            self.motion_recorder = true
        }
    }
    
    func StopMotionRecorder() {
        if self.motion_recorder
        {
            print("stop motion recorder")
            self.motion_recorder = false
            socket.emit("motion", self.IMU)
        }
    }
    
    func GravityCaliberation() {
        socket.emit("caliberationstart")
        StartMotionRecord()
        socket.on("stopcaliberation") { data, ack in
            self.motion_recorder = false
            self.socket.emit("caliberationdata", self.IMU)
        }
    }
}

extension Date {
    var milliseconds:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
}

~~~

 

### 3.4 Data类型

 数字转换成Data

~~~swift
let date_in_ms : Int = Date().milliseconds
let time_byte = withUnsafeBytes(of: date_in_ms) { Data($0) }
~~~

数组转换成Data

~~~swift
let motion_data = [self.acceleration_x, self.acceleration_y, self.acceleration_z]
let motion_byte = motion_data.withUnsafeBufferPointer {Data(buffer: $0)}
~~~

Data的初始化和拼接

~~~swift
var IMU = Data()					// 定义
IMU.append(time_byte)			// 拼接
IMU = Data()							// 清零
IMU.removeAll()						// 也是清零
~~~

 

### 3.5 蓝牙BLE





### 3.6 分享界面

**一般都用SocketIO直接分享到服务器上。**

分享的函数以及要分享的数据

 ~~~swift
 func ShareData(data_to_share: Data)
 {
 	let data_to_share = data_to_share
 	let activity_view_controller = UIActivityViewController(activityItems: [data_to_share], applicationActivities: nil)
         
 	let view_controller = Coordinator.topViewController()
 	activity_view_controller.popoverPresentationController?.sourceView = view_controller?.view
 	view_controller?.present(activity_view_controller, animated: true, completion: nil)
 }
 ~~~

其中`Coordinator`来自于`ShareEnum.swift`

~~~swift
import Foundation
import SwiftUI

enum Coordinator {
  static func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
    let view_controller = viewController ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
    if let navigation_controller = view_controller as? UINavigationController {
      return topViewController(navigation_controller.topViewController)
    } else if let tab_bar_controller = view_controller as? UITabBarController {
      return tab_bar_controller.presentedViewController != nil ? topViewController(tab_bar_controller.presentedViewController) : topViewController(tab_bar_controller.selectedViewController)
      
    } else if let presented_view_controller = view_controller?.presentedViewController {
      return topViewController(presented_view_controller)
    }
    return view_controller
  }
}
~~~

使用方法：

~~~swift
Button(action:
	{
		motioncontroller.ShareData(data_to_share: motioncontroller.IMU)
	},
	label: {Text("Share")}
)
~~~

按下按钮就会弹出分享界面

 