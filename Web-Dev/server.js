// Do not modify these lines.
const express = require("express");
const { json } = require("body-parser");
const { getOrganization } = require("./realDB");

const app = express();
app.use(json());
// End

app.get("/organizations", async (req, res) => {
    // TODO
});

app.listen(3000, () => {
    console.log("Listening on port 3000!");
});