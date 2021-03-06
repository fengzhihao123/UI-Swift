
#  Swift 搭建UI系列

## intro
 学习Swift也有一段时间了，通过这一段时间的学习既体验了Swift语言的强大也感受到了今天写的代码明天就不能用的惊悚，总体来说Swift还是充满了无限的可能性（甚至于能写后台的程序），而且以后应该也会越来越好（以后替代OC，毕竟Apple的亲儿子😑）。
 
 学习的这一段时间从写个button都要google到现在能上手项目，学到了很多东西也踩了很多坑。开始学习Swift的时候上来就抱着Swift的Language Guide一顿猛啃，事实证明这是一种很愚蠢的做法，结果没坚持一周就放弃了，因为学习一门新的语言只看语法的话很乏味，没有成果的刺激很难坚持下来。所以我想写一个关于Swift搭建iOS的UI控件的系列，让初学者可以在享受成果的同时更好的学习Swift。
 
##Swift的快捷键

* Color Literal 

eg:
在你写`let color = `代码的时候在后面写color会只能提示`Color Literal `，这样可以直观的看到然后选择自己需要的颜色

* Image Literal，用法同上

* `command`+`option`+`/`:添加函数注释说明（此快捷键适用OC）

## Request

* Xcode:Xcode8 
* Swift:Swift3.0 
* simulator:iphone 7 plus

<h2><a href="#C1">01 - UILabel</a> </h2>
<h2><a href="#C2">02 - UITextField</a></h2>
<h2><a href="#C3">03 - UIPickView</a></h2>
<h2><a href="#C4">04 - UIScrollView</a></h2>
<h2><a href="#C5">05 - UITableView</a></h2>
<h2><a href="#C6">06 - UICollectionView</a></h2>
<h2><a href="#C7">07 - 扫描二维码</a></h2>

<h2><a name="C1">01 - UILabel</a></h2>

* 高度自适应label
* 斜体label

![gif](https://github.com/fengzhihao123/UI-Swift/blob/master/01-LabelAndButton/01-UILabel.gif)

<h2><a name="C2">02 - UITextField</a></h2>

* 自定义带有placeholder的UITextView
* 自定义跟随键盘移动的UITextField

![gif](https://github.com/fengzhihao123/UI-Swift/blob/master/02-UITextView/02-UITextField:UITextView.gif)


<h2><a name="C3">03 - UIPickView</a></h2>

* 三级联动地址选择器

![gif](https://github.com/fengzhihao123/UI-Swift/blob/master/03-UIPickView/03-UIPickView.gif)

<h2><a name="C4">04 - UIScrollView</a></h2>

* 自动轮播图

![gif](https://github.com/fengzhihao123/UI-Swift/blob/master/04-UIScrollView/05-UIScrollView.gif)

<h2><a name="C5">05 - UITableView</a></h2>

* 左划删除
* 全选、单选删除

![gif](https://github.com/fengzhihao123/UI-Swift/blob/master/05-UITableView/05-UITableView.gif)

<h2><a name="C6">06 - UICollectionView</a></h2>

* 瀑布流

![gif](https://github.com/fengzhihao123/UI-Swift/blob/master/06-UICollectionView/06-UICollectionView.gif)

<h2><a name="C7">07 - 扫描二维码</a></h2>

[参考链接](http://swift.gg/2017/01/18/barcode-reader-swift/)
## 广告

大家如果敲完这几个项目，可以看一下我的这个[项目](https://github.com/fengzhihao123/FZHKit)。里面都是一些项目常用的功能。

## License

UI-Swift is released under the MIT license. See LICENSE for details.
