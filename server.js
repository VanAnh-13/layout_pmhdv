// server.js
const express = require('express');
const cors = require('cors');
const fetch = require('node-fetch');

const app = express();
app.use(cors());

app.get('/api/car-sales/:month', async (req, res) => {
    try {
        const month = req.params.month;
        const response = await fetch(
            `https://car-management-1.onrender.com/carmanagement/sale/topmonth?month=${month}`
        );
        const data = await response.json();
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));