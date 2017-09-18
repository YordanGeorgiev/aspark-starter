#  ASPARK-STARTER FEATURES AND FUNCTIONALITIES


Table of Contents

  * [1. PROJ MANAGER FEATURES AND FUNCTIONALITIES](#1-proj-manager-features-and-functionalities)
    * [1.1. Project advancement documentation](#11-project-advancement-documentation)
    * [1.2. Documentation](#12-documentation)
  * [2. DEVOPS FEATURES AND FUNCTIONALITIES](#2-devops-features-and-functionalities)
    * [2.1. Clean consistent logging to file and STROUD](#21-clean-consistent-logging-to-file-and-stroud)
    * [2.2. Semi automated installation](#22-semi-automated-installation)
    * [2.3. Shell based actions](#23-shell-based-actions)
    * [2.4. RDBMS read to DataFrames objects demo](#24-rdbms-read-to-dataframes-objects-demo)
    * [2.5. DataFrames to file system saving demo](#25-dataframes-to-file-system-saving-demo)


    

## 1. PROJ MANAGER FEATURES AND FUNCTIONALITIES


     

### 1.1. Project advancement documentation
The ongoing issues and the advancement of the tool development can be tracked via the issues tables online:
https://docs.google.com/spreadsheets/d/e/2PACX-1vR0wo5N32EpubwxBfeFxi6X-eOmXwOPg4WSyA4qBSz1Yu0EyU34jl0xICgWzrFUSeEA_aC4RF7LRqx9/pubhtml

    # start the spark program
    bash src/bash/aspark-starter/aspark-starter.sh -a run-local-app

### 1.2. Documentation
The tool has extensive documentation as follows:
The UserStories:
https://github.com/YordanGeorgiev/aspark-starter/blob/master/doc/md/aspark-starter-user-stories.md
The Requirements:
https://github.com/YordanGeorgiev/aspark-starter/blob/master/doc/md/aspark-starter-requirements.md
The DevOps Guide:
https://github.com/YordanGeorgiev/aspark-starter/blob/master/doc/md/aspark-starter-devops-guide.md
The Features and Functionalities Description:
https://github.com/YordanGeorgiev/aspark-starter/blob/master/doc/md/aspark-starter-features-and-functionalities.md

     

## 2. DEVOPS FEATURES AND FUNCTIONALITIES


     

### 2.1. Clean consistent logging to file and STROUD
The tool has clean and consistent logging to STDOUT and log file. 

    # start the spark program
    bash src/bash/aspark-starter/aspark-starter.sh -a run-local-app

### 2.2. Semi automated installation
The installation of the tool is fully automated. The installation of the required binaries and libraries is semi-automated with requirements check scripts. The installation is fully documented in the DevOps guide. 
The DDL and DML sql scripts can be executed via a single action. 

     

### 2.3. Shell based actions
All the actions on the toool can be envoked with the -a &lt;&lt;action-name&gt;&gt; argument. For example:

    # start the spark program
    bash src/bash/aspark-starter/aspark-starter.sh -a run-local-app

### 2.4. RDBMS read to DataFrames objects demo
The tool demonstrates how to read data from RDBMS into DataFrames objects 

    

### 2.5. DataFrames to file system saving demo
The tool demonstrates how to read data from DataFrames and save it to file system as files

    

