import { readFile } from 'fs'
import { join } from 'path'

// In CommonJS, __dirname is already globally available out of the box
readFile(join(__dirname, 'info.json'), 'utf-8', (error, data) => {
    if (error) throw error
    console.log(data)
})