#!/usr/bin/env node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = require("fs");
const path_1 = require("path");
(0, fs_1.readFile)((0, path_1.join)(__dirname, 'info.json'), 'utf-8', (error, data) => {
    if (error)
        throw error;
    console.log(data);
});
//# sourceMappingURL=read.js.map