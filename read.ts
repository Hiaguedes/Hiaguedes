#!/usr/bin/env ts-node

import { readFile } from 'fs'
import { join } from 'path'

readFile(join(__dirname, '/info.json'),'utf-8' , (error, data) => {
    if(error) {
        throw error
    }
    
    console.log(data)
})