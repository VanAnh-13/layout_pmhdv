const express = require('express');
const app = express();

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
});

app.get('/carmanagement/sale/topmonth', (req, res) => {
    // Your existing code to handle the request
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});