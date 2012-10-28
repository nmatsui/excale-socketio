excale-socketio
===============

node-socket.ioサーバへ接続し、データを送受信するiOSアプリ。  
iOS 5.0以降で動作する（iOS 5.1.1のiPhone4Sで動作確認）。

Public PaaSでも動作できるように、AZSocketIOを利用しxhr-pollingで接続する。([eXcale](www.excale.net) で動作確認)

Library
-------

このソフトウェアは以下のライブラリに依存する。

[AZSocketIO](http://github.com/pashields/AZSocketIO)  
[SocketRocket](http://github.com/square/SocketRocket)  
[AFNetworking](http://github.com/AFNetworking/AFNetworking)

これらは[CocoaPods](https://github.com/CocoaPods/CocoaPods)対応ライブラリのため、

    $gem install cocoapods
    $pod setup
    $pod install

でインストールできる。

License
-------
Copyright &copy; 2012 Nobuyuki Matsui (nobuyuki.matsui@gmail.com)

Distributed under the [MIT License][mit].
[MIT]:http://rem.mit-license.org
