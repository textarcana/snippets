# How to run tests

Just say any of

    vows test/*

    vows --spec test/*

    vows --json test/*

### Installing the Test Infrastructure

With Macports:

    sudo port install nodejs npm

    export NODE_PATH=/opt/local/lib/node_modules/

    sudo npm install -g vows jsdom
