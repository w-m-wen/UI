//
//  AppDelegate.h
//  LessonNetwork
//
//  Created by lanouhn on 15/4/9.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//
//网络参考模型
//每一层都有相关的协议, 协议指定了规范

//OSI(open system interconnection, 开放式网络互联模型), 分为7层, 有IOS(国际标准化组织)指定
//1.应用层
//2.表示层
//3.会话层
//4.传输层
//5.网络层
//6.数据链路层
//7.物理层

//TCP/IP, 又美国国防部制定, 分为四层
//1.应用层 (123合并) FTP HTTP
//2.传输层 (4)  TCP UDP
//3.网络层 (5)  IP
//4.物理层 (67) wifi, 以太网

//HTTP: 一种协议, 超文本传输协议

//客户端/服务器
//建立链接(过程类似于三次握手)
//1.客户端发送请求
//2.服务器端收到请求并告知客户端
//3.客户端收到服务器端的确定信息, 建立链接成功

//断开链接(四次挥手)
//1.客户端发送断开请求给服务器
//2.服务器端收到客户端的请求, 并告知客户端, 此时客户端断开链接
//3.服务器端发送断开请求给用户端
//4.客户端收到服务器的请求, 并告知服务器端, 此时服务器端断开链接

//HTTP请求
//1.根据数据存放的位置, 分为GET请求和POST请求
//2.根据请求是否需要等待, 分为同步请求和异步请求

//GET请求的参数, 放在url的后面, 以后?开头, 参数时key- value出现, 多个参数用&链接
//POST请求的参数, 放到HTTPBody中, 以NSData的形式存在

//同步请求获取的数据, 方法的返回值NSData的类型
//异步请求获取的数据在delegate的方法中, 或者 block 块中

//网络请求的流程
//1.urlString, 注:如果字符串中有中文, 需要转码
//2.创建url
//3.创建urlResquest, GET请求时候使用NSURLRequest, POST请求使用NSMatableURLRequest, 因为POST需要修改HTTPMethord和HTTPBody
//4.urlConnection, 同步请求方法只有一种, 异步请求可以选择delegate或者block, delegate模式中要实现的方法,
  //a. 请求失败 有 error
  //b. 收到服务器的响应NSURLResponse
  //c. 收到数据, 数据是分包返回的
  //d.请求完成, 此时数据完整的, 可以对其进行转码, 进而对其解析
//5.解析, XML和JSON, XML解析分为了两种方式SAX解析和DOM解析, JSON解析相对较为简单

//使用GET和POST请求由 后台服务器人员 规定, 在接口文档中有说明
//同步和异步请求有自己决定, 一般建议使用异步, 防止出现假死状态

//在真实的开发中, 会对网络进行一些封装, 99%的开发人员都会使用第三方类库AFNetworking


#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;


@end

