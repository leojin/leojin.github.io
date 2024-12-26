+++
title = "2024 12 26 Google Oauth"
date = "2024-12-26T00:05:36+08:00"
author = "leojin"
authorTwitter = "" #do not include @
cover = ""
tags = ["开发"]
keywords = ["谷歌登录", "Oauth"]
description = "接入Google Oauth登录，实现用户登录功能"
showFullContent = false
readingTime = false
hideComments = false
color = "" #color from the theme settings
+++
#

# 一、准备

## 1、Google Console Search
证明网站所有权，以使用Google Oauth Client发布到生产环境。
[申请入口](https://search.google.com/search-console)

## 2、Google Oauth Client
[官方文档](https://developers.google.com/identity/protocols/oauth2)

- 申请入口：[Google Cloud Platform](https://console.cloud.google.com/)，进入`APIs & Services`。
- 左侧导航栏选择`Credentials`，点击`Create credentials`，选择`OAuth client ID`。
  - User Type选择`External`（对外公开网站，允许任意用户登录）
  - Application Type，这里选择`Web application`
- 流程完成后，获取到`Client ID`和`Client Secret`

# 二、登录流程示意

![流程示意](images/login-google.png)

## 1、 前端SDK接入
![登录按钮](images/login-google-button.png)

接入上述按钮，参考：[@react-oauth/google](https://www.npmjs.com/package/@react-oauth/google)，过程中需要传入`Client ID`。

```jsx
import {GoogleOAuthProvider, GoogleLogin} from '@react-oauth/google';

const GoogleLoginComponent = () => {
    const onSuccess = async (response) => {
        console.log(response);
    }
    return (
        <GoogleOAuthProvider clientId="Your Oauth ClientID">
            <GoogleLogin
                onSuccess={onSuccess}
            />
        </GoogleOAuthProvider>
    );
};
```

## 2、 服务端登录接口主要逻辑

- 请求`https://oauth2.googleapis.com/tokeninfo`, 通过前端传入的`Credential`，获取用户基本信息，其中sub可作为谷歌用户ID，见[官方说明](https://cloud.google.com/docs/authentication/token-types?hl=zh-cn#id)。
- 根据sub，查询用户（触发新老用户逻辑）。
- 处理Session，返回业务登录凭据。

# 三、开发&发布

## 1、 开发测试
在[Google Auth Platform/Client ID for Web application](https://console.cloud.google.com/auth/clients)中修改`Authorized JavaScript origins`，填写本地开发环境和测试环境的地址（支持http://127.0.0.1:xxxx）

## 2、 发布正式
在[Google Auth Platform/Audience](https://console.cloud.google.com/auth/audience)中，切换到`Production`，提交审核，审核通过后即可上线使用。
审核期间如有问题，会有邮件通知（体验很快，1天内就给了反馈），根据邮件提示修改即可。

