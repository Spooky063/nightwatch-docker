module.exports = {
    src_folders: ["tests"],
    output_folder: `${process.env.NIGHTWATCH_OUTPUT}/reports`, // "var/nightwatch"
    webdriver: {
        start_process: true,
        server_path: "node_modules/.bin/chromedriver",
        host: process.env.WEBDRIVER_HOSTNAME, // "selenium",
        port: process.env.WEBDRIVER_PORT, // 4444,
        ssl: false,
        default_path_prefix: process.env.WEBDRIVER_PATH_PREFIX || '',
        proxy: undefined,
        cli_args: {}
    },
    test_settings: {
        default: {
            desiredCapabilities: {
                browserName: "chrome",
                acceptSslCerts: true,
                'goog:chromeOptions': {
                     args: process.env.WEBDRIVER_CHROME_ARGS
                         ? process.env.WEBDRIVER_CHROME_ARGS.split(' ')
                         : [],
                },
            },
            screenshots: {
                enabled: true,
                on_failure: true,
                on_error: true,
                path: `${process.env.NIGHTWATCH_OUTPUT}/screenshots`,
            },
            end_session_on_fail: false,
            skip_testcases_on_fail: false,
        }
    }
};