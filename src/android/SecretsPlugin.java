package cordova-plugin-secrets;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class SecretsPlugin extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("getSecrets")) {
            String key = args.getString(0);
            this.getSecrets(key, callbackContext);
            return true;
        }
        return false;
    }

    private void getSecrets(String key, CallbackContext callbackContext) {

        try {
            JSONParser parser = new JSONParser();
            //Use JSONObject for simple JSON and JSONArray for array of JSON.
            JSONObject data = (JSONObject) parser.parse(
                  new FileReader("../../secret.json"));//path to the JSON file.
            String json = data.toJSONString();
            callbackContext.success(json);
        } catch (IOException | ParseException e) {
            callbackContext.error("Error loading json file.");
        }
    }
}
