var exec = require('cordova/exec');

exports.getSecrets = function (arg0, success, error) {
    exec(success, error, 'SecretsPlugin', 'getSecrets', [arg0]);
};
