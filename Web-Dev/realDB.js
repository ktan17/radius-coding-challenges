// Do not modify the contents of this file.

class Organization {
    constructor(name, memberCount) {
        this.name = name;
        this.memberCount = memberCount;
    }
}

// lol
const organizations = {
    "12" : new Organization("ACM", 500),
    "115" : new Organization("Bruin Entrpreneurs", 200),
    "37" : new Organization("CSSA", 150),
    "26" : new Organization("ACA", 1000),
    "25" : new Organization("KASA", 900),
    "19" : new Organization("180 Degrees Consulting", 100),
    "8" : new Organization("DevX", 250),
    "17" : new Organization("Creative Labs", 125),
    "2" : new Organization("Bruin Consulting", 400),
    "99" : new Organization("Daily Bruin", 300)
}

function getOrganization(id) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const organization = organizations[id];
            if (organization != undefined) {
                resolve(organization)
            } else {
                reject();
            }
        }, Math.floor(Math.random() * 2000) + 1000);
    });
}

module.exports = { getOrganization };