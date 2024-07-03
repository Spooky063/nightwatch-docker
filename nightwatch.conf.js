module.exports = {
    src_folders: ["tests"],
    output_folder: process.env.NIGHTWATCH_OUTPUT, //var/nightwatch/ouput
    webdriver: {
        start_process: true,
        server_path: "node_modules/.bin/chromedriver",
        host: process.env.NIGHTWATCH_HOST, //"selenium",
        port: process.env.NIGHTWATCH_PORT, //4444,
        ssl: false,
        default_path_prefix: '',
        proxy: undefined,
        cli_args: {}
    },
    test_settings: {
        default: {
            desiredCapabilities: {
                browserName: "chrome"
            }
        }
    }
};