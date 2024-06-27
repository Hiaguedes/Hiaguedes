#!/usr/bin/env ts-node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs_1 = require("fs");
var path_1 = require("path");
(0, fs_1.readFile)((0, path_1.join)(__dirname, '/info.json'), 'utf-8', function (error, data) {
    if (error) {
        throw error;
    }
    console.log(data);
});
