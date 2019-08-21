// Do not modify these lines.
const express = require("express");
const { getOrganization } = require("./realDB");

const app = express();
// End

app.get("/organizations/:id", async (req, res) => {
    // TODO
});

app.listen(3000, () => {
    console.log("Listening on port 3000!");
});