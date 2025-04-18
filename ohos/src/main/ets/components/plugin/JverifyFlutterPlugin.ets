import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';

/** JverifyFlutterPlugin **/
export default class JverifyFlutterPlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "JverifyFlutterPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "jverify_flutter");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "checkVerifyEnable") {
      checkVerifyEnable(call,result);
    } else if (call.method == "isInitSuccess") {
      isInitSuccess(call,result);
    } else if (call.method == "preLogin") {
      preLogin(call,result);
    } else if (call.method == "setCustomAuthorizationView") {
      setCustomAuthorizationView(call,result);
    } else if (call.method == "setup") {
      setup(call,result);
    } else {
      result.notImplemented()
    }
  }

  checkVerifyEnable(call: MethodCall, result: MethodResult){
    let verifyEnable = await JVerificationInterface.checkVerifyEnable();
    result.success({result:verifyEnable});
  }
  isInitSuccess(call: MethodCall, result: MethodResult){
    let isSuccess = JVerificationInterface.isInitSuccess();
    result.success({result:isSuccess});
  }
  preLogin(call: MethodCall, result: MethodResult){
    JVerificationInterface.prelogin((code,msg,operateRet)=>{
      result.success({code,message:msg});
    });
  }
  setCustomAuthorizationView(call: MethodCall, result: MethodResult){
    let isAutorotate: boolean = call.argument('isAutorotate');
    let portraitConfig: HashMap<string,ESObject> = call.argument('portraitConfig');
    let landscapeConfig: HashMap<string,ESObject> = call.argument('landscapeConfig');
    let widgetList: HashMap<string,ESObject> = call.argument('widgets');

    let builder = new JVerifyUIConfigBuilder();
    let uiconfig:JVerifyUIConfig = builder.build();
    JVerificationInterface.setCustomUIWithConfig(uiconfig);
  }
  setup(call: MethodCall, result: MethodResult){
    let appKey: string = call.argument('appKey');
    JVerificationInterface.init(appKey,(code, msg)=>{
      result.success({code,message:msg});
    });
  }
}