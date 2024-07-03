module.exports = {
    '@tags': ['custom'],
    'Demo test Google': function (browser) {
        browser
            .url('http://google.com')
            .waitForElementVisible('body', 1000)
            .assert.titleContains('Google');
    },
    after(browser) {
        browser.end();
    }
};