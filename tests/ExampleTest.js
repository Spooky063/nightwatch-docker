module.exports = {
    '@tags': ['custom'],
    'Demo test Google': function (browser) {
        const screenshotPath = browser.options.screenshots.path;
        browser
            .url('http://google.com')
            .waitForElementVisible('body', 1000)
            .assert.titleContains('Google')
            .saveScreenshot(`${screenshotPath}/homepage-google.png`);
    },
    after(browser) {
        browser.end();
    }
};