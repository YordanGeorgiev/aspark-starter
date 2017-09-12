#  ASPARC STARTER DEVOPS GUIDE


Table of Contents

  * [1. WAY OF WORKING](#1-way-of-working)
    * [1.1. Issues handling](#11-issues-handling)
    * [1.2. Documentation](#12-documentation)
  * [2. NAMING CONVENTIONS](#2-naming-conventions)
    * [2.1. Dirs naming conventions](#21-dirs-naming-conventions)
    * [2.2. Root Dirs naming conventions](#22-root-dirs-naming-conventions)
    * [2.3. Bash scripts naming conventions](#23-bash-scripts-naming-conventions)
    * [2.4. Scala code naming conventions](#24-scala-code-naming-conventions)
  * [3. INSTALLATIONS AND CONFIGURATIONS](#3-installations-and-configurations)
    * [3.1. Install Java Development Kit 1.9](#31-install-java-development-kit-19)
      * [3.1.1. verify the JDK installation and configuration](#311-verify-the-jdk-installation-and-configuration)
      * [3.1.2. configure java_home](#312-configure-java_home)
    * [3.2. Install Scala](#32-install-scala)
      * [3.2.1. Install sbt](#321-install-sbt)
    * [3.3. Install apache spark](#33-install-apache-spark)


    

## 1. WAY OF WORKING


     

### 1.1. Issues handling
Each proper time spent on time saves 10 times more in execution, thus the tasks and aktivities related to this tool are tracked via the issue-tracker tool:
https://github.com/YordanGeorgiev/issue-tracker
and could be found @:
https://docs.google.com/spreadsheets/d/1-oYPtBM8PG_FUogk40RDmcM_Xzq91Tb81Zlyi0cMwYQ/edit#gid=135774576

    

### 1.2. Documentation
The purpose of the tool is to "grasp the concept of apache spark", thus a proper documentation set is created as well.

    

## 2. NAMING CONVENTIONS


     

### 2.1. Dirs naming conventions
The dir structure should be logical and a person navigating to a dir should almost understand what is to be find in thre by its name .. 

    

### 2.2. Root Dirs naming conventions
The root dirs and named as follows:
bin - contains the produced binaries for th project
cnf - for the configuration
dat - for the data of the app
lib - for any external libraries used
src - for the source code of the actual projects and subprojects

    

### 2.3. Bash scripts naming conventions
Do not use capital letters - they are too noisy.

    

### 2.4. Scala code naming conventions


    

## 3. INSTALLATIONS AND CONFIGURATIONS


     

### 3.1. Install Java Development Kit 1.9
Install Java Development Kit 1.9 as follows:

    # update your Ubuntu repositories
    sudo apt-get update
    # install the open jdk
    sudo apt-get install -y openjdk-8-jdk

#### 3.1.1. verify the JDK installation and configuration


    
    # and verify 
      java --version
    openjdk 9-Ubuntu
    OpenJDK Runtime Environment (build 9-Ubuntu+0-9b161-1)
    OpenJDK 64-Bit Server VM (build 9-Ubuntu+0-9b161-1, mixed mode)
    
    

#### 3.1.2. configure java_home


    echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.java_opts.host-name

### 3.2. Install Scala
The scala libs will be installed with the sbt build tool. 

    

#### 3.2.1. Install sbt
Install sbt scala build tool by following the instructions in the following url:
http://www.scala-sbt.org/0.13/docs/Installing-sbt-on-Linux.html

    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
    sudo apt-get update
    sudo apt-get install sbt
    which sbt
    

### 3.3. Install apache spark


    

