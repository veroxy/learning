---
layout: page
title:  clone depuis une branche
parent: git
date:   2024-06-02 20:06
---

# clone depuis une branche [stack](https://stackoverflow.com/questions/1911109/how-do-i-clone-a-specific-git-branch)


```sh
git clone -b <branch> <remote_repo>
```
Example:
```sh
git clone -b creez-routeur https://github.com/OpenClassrooms-Student-Center/4670706-architecture-mvc-php.git
```
With Git 1.7.10 and later, add --single-branch to prevent fetching of all branches. Example, with OpenCV 2.4 branch:
```sh
git clone -b opencv-2.4 --single-branch https://github.com/Itseez/opencv.git
```


