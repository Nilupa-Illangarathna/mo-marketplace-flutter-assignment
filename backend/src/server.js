const express = require('express');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Health check
app.get('/', (req, res) => {
  res.json({ status: 'MO Marketplace API running' });
});

app.listen(PORT, () => {
  console.log(`API running on http://localhost:${PORT}`);
});
