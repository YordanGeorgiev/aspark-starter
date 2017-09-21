#  ASPARC STARTER USER STORIES


Table of Contents

    * [1. Check project status](#1-check-project-status)
    * [2. Check project source code](#2-check-project-source-code)
  * [1. DEVELOPER PERSPECTIVE](#1-developer-perspective)
    * [1.1. Easy and quick initial deployment](#11-easy-and-quick-initial-deployment)
    * [1.2. Single shell entry point for full tests execution](#12-single-shell-entry-point-for-full-tests-execution)
    * [1.3. Easy environment setup](#13-easy-environment-setup)


    

### 1. Check project status
As a ProjectManager 
In order to be able decisions based on the current state of the project work
I wanto to be able to check the project status via a single report link:
For example:
https://docs.google.com/spreadsheets/d/e/2PACX-1vR0wo5N32EpubwxBfeFxi6X-eOmXwOPg4WSyA4qBSz1Yu0EyU34jl0xICgWzrFUSeEA_aC4RF7LRqx9/pubhtml#

    

### 2. Check project source code
As a ProjectManager 
In order to be able verify and communicate the availability of the project's source code I wanto to be able to access it via an GitHub link ,for example:
https://github.com/YordanGeorgiev/aspark-starter

    

## 1. DEVELOPER PERSPECTIVE


    

### 1.1. Easy and quick initial deployment
As a Developer
In order to be able to quickly view and check what is it all about
I wanto to be able to deploy the tool by simply following the instructions from thhe ReadMe.md on the GitHub. 

    bash wrapp/src/bash/aspark-starter/bootstrap-aspark-starter.sh
    
    git clone git@github.com:YordanGeorgiev/aspark-starter.git
    

### 1.2. Single shell entry point for full tests execution
As a Developer
In order to be able to check the full feature-set of the application
I wanto to be able to have a single entry shell entry point coverring all the tests and features of the application. 

    bash src/bash/aspark-starter/test-aspark-starter.sh

### 1.3. Easy environment setup
As a Developer
In order to be able to build the whole environment quickly
I wanto to be able to execute a single shell command which will load 

    bash src/bash/aspark-starter/aspark-starter.sh -a sbt-compile

