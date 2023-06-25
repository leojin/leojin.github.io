+++
title = "Hello World"
date = "2023-06-25T01:14:27+08:00"
author = "LeoJin"
authorTwitter = ""
cover = "posts/hello-world/cover.jpg"
tags = []
keywords = []
description = ""
showFullContent = false
readingTime = false
hideComments = false
color = "green" #color from the theme settings
+++

Now it's time to say goodbye to WordPress. I have bought a virtual machine for several years on Tencent Cloud(1Core/1G/1Mbps). It's totally enough for my site with no comments. So, Since there's no comment, why do I need a vm to host a dynamic site? 

`😔What I need is just a static page.😔`

Here are several tools I used to make this change:

| Tools | Description                                                                                                                                                                                                   |
| ----- |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Bitnami Wordpress](https://bitnami.com/stack/wordpress) | It contains everything you need to launch a WordPress, such as httpd,mysql,php.                                                                                                                               |
| [All-in-One Wp Migration](https://servmask.com) | Export the previous data and import them into the new WordPress instance.                                                                                                                                     |
| [github.io](https://pages.github.com) and [github custom domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site) | You can use github.io to host the content of the site and it's custom domain feature keep my domain `leojin.com` continually working. This site's repo is [here](https://github.com/leojin/leojin.github.io). |
| [Hugo](https://gohugo.io) | Offical site: The world’s fastest framework for building websites.                                                                                                                                            |
| [Terminal](https://github.com/panr/hugo-theme-terminal) | A hugo theme which is what you see now.                                                                                                                                                                       |

Below is my local replica preview. I won't miss u, so it has been shut down forever.
![](Screenshot%202023-06-25%20at%2016.40.04.png)

Bye WordPress.

Hello Hugo & Github.io.