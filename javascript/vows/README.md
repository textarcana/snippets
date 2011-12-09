# How to run tests

Just say any of

    vows test/*

    vows --spec test/*

    vows --json test/*

### Installing the Test Infrastructure

Node is already installed so you just need the Vows test harness and
the JSDom browser DOM emulator.

    sudo port install nodejs npm
    sudo npm install vows jsdom
