document = require("jsdom").jsdom("<html><head></head><body></body></html>");
window = document.createWindow();
navigator = window.navigator;
location = window.location;
CSSStyleDeclaration = window.CSSStyleDeclaration;

process.env.TZ = "America/New_York";
