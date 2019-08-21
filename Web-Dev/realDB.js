// Do not modify the contents of this file.
const util = require("util");

class Organization {
    constructor(name, memberCount) {
        this.name = name;
        this.memberCount = memberCount;
    }
}

// lol
const organizations = {
    "12" : new Organization("ACM", 500),
    "115" : new Organization("Bruin Entrepreneurs", 200),
    "37" : new Organization("CSSA", 150),
    "26" : new Organization("ACA", 1000),
    "25" : new Organization("KASA", 900),
    "19" : new Organization("180 Degrees Consulting", 100),
    "8" : new Organization("DevX", 250),
    "17" : new Organization("Creative Labs", 125),
    "2" : new Organization("Bruin Consulting", 400),
    "99" : new Organization("Daily Bruin", 300)
}

const timeout = util.promisify(setTimeout);

async function getOrganization(id) {
    await timeout(Math.floor(Math.random() * 2000) + 1000);

    const organization = organizations[id];
    if (organization != undefined) {
        return organization;
    } else {
        return new Error("Organization not found");
    }
}

module.exports = { getOrganization };