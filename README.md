#  ASPARK-STARTER


Table of Contents

  * [1. WHAT IS IT ?!](#1-what-is-it-)
  * [2. INSTALLATION AND CONFIGURATION](#2-installation-and-configuration)
    * [2.1. Fetch the source](#21-fetch-the-source)
    * [2.2. Prerequisites](#22-prerequisites)
    * [2.3. run the boot-strap script](#23-run-the-boot-strap-script)
    * [2.4. Build the first aspark-starter instance](#24-build-the-first-aspark-starter-instance)
    * [2.5. Apply the db and issue create scirpts](#25-apply-the-db-and-issue-create-scirpts)
    * [2.6. Check the runnable actions](#26-check-the-runnable-actions)
    * [2.7. Install the required Perl modules](#27-install-the-required-perl-modules)
    * [2.8. Start hacking](#28-start-hacking)
  * [3. ADDITIONAL DOCS](#3-additional-docs)


    

## 1. What is it ?!
A demo application which will help you to grasp the Apache Spark concept. 

    

## 2. INSTALLATION AND CONFIGURATION
This section presents the steps needed to perform to deploy the aspark-starter tool. Note, that the commands are for Ubuntu, thus if you are on different OS choose , google the names of the packages applicable for your OS. 

    

### 2.1. Fetch the source
Fetch the source from git hub as follows:

    # create your product dir:
    mkdir -p /opt/csitea/
    cd /opt/csitea/
    
    # fetch the source
    git clone git@github.com:YordanGeorgiev/aspark-starter.git
    
    # DO NOT CD into the new dir !!!!

### 2.2. Prerequisites
The must have binaries are:
 bash, perl, zip

The nice to have are:
 tmux, vim ,ctags

The examples are for Ubuntu - use you OS package manager …

    apt-get autoclean
    apt-get install --only-upgrade bash
    sudo apt-get install -y perl
    
    
    apt-get upgrade

### 2.3. run the boot-strap script
The bootstrap script will interpolate change the git deployment dir to a "product_instance_dir" ( your instance of the issue-tracker, having the same version as this one, but running on a different host with different owner - your )

    # defiine the latest and greates product_version
    export product_version=$(cd issue-tracker;git tag|sort -nr| head -n 1;cd ..)
    
    # run the bootstrap script : 
    bash issue-tracker/src/bash/issue-tracker/bootstrap-issue-tracker.sh
    
    
    # now go to your product instance dir , note it is a DEV environment
    cd /opt/csitea/issue-tracker/issue-tracker.$product_version.dev.$USER
    

### 2.4. Build the first aspark-starter instance
Build the aspark-starter instance by running the bootstrap script

    # bootstrap the product instance dir
    bash aspark-starter/src/bash/aspark-starter/bootstrap-aspark-starter.sh
    
    # the script should prompt you to cd 

### 2.5. Apply the db and issue create scirpts
If you do not have the PostgreSQL ( v9.5 &gt; ) with currrent Linux user configured role installed check the instructions in the installations and configuratios section of the DevOps guide:
https://github.com/YordanGeorgiev/issue-tracker/blob/master/doc/md/issue-tracker-devops-guide.md#1-installations-and-configurations
If you do have it , apply the db and issue create scirpts as follows:

    # apply the postgre sql scripts
    bash src/bash/issue-tracker/issue-tracker.sh -a run-pgsql-scripts

### 2.6. Check the runnable actions
You could check the functions which could be run - aka "actions" by issuing the following command. 

    # check the runnable with the -a cmd arg actions 
    find . -name '*.func.sh' | sort

### 2.7. Install the required Perl modules
Just run the prerequisites checker script which will provide you with copy pastable instructions

    sudo perl src/perl/issue_tracker/script/issue_tracker_preq_checker.pl
    
    # after installing all the modules check the perl syntax of the whole project:
    bash src/bash/issue-tracker/issue-tracker.sh -a check-perl-syntax

### 2.8. Start hacking
Start hacking … or wait check at least the test call running all the functions of the tool … 

    # opionally if you are in the vim camp open the "project relative files list file"
    vim meta/.dev.aspark-starter
    
    # Ctrl + Z , 
    bash src/bash/aspark-starter/test-aspark-starter.sh 
    
    # now clone your own instance
    bash src/bash/aspark-starter/aspark-starter.sh -a to-app=my-tool

## 3. ADDITIONAL DOCS
Additonal docs could be found in the doc/md dir. 

    

