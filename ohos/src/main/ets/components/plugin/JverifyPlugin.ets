import { JVerificationInterface, JVerificationLoginSettings, JVerifyUIConfig,
  JVerifyUIConfigBuilder } from '@jg/verify';
import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';
import { HashMap } from '@kit.ArkTS';

/** JverifyPlugin **/
export default class JverifyPlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "JverifyPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "jverify");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "checkVerifyEnable") {
      this.checkVerifyEnable(call,result);
    } else if (call.method == "isInitSuccess") {
      this.isInitSuccess(call,result);
    } else if (call.method == "loginAuth") {
      this.loginAuth(call,result);
    } else if (call.method == "preLogin") {
      this.preLogin(call,result);
    } else if (call.method == "setCustomAuthorizationView") {
      this.setCustomAuthorizationView(call,result);
    } else if (call.method == "setup") {
      this.setup(call,result);
    } else {
      result.notImplemented()
    }
  }

  async checkVerifyEnable(call: MethodCall, result: MethodResult){
    let verifyEnable: boolean = await JVerificationInterface.checkVerifyEnable();
    result.success({result:verifyEnable});
  }
  isInitSuccess(call: MethodCall, result: MethodResult){
    let isSuccess = JVerificationInterface.isInitSuccess();
    result.success({result:isSuccess});
  }
  layoutOriginOuthView(uiConfig: HashMap<string,ESObject>, builder: JVerifyUIConfigBuilder){
    let authBackgroundImage: string|undefined = uiConfig['authBackgroundImage'];
    let logoOffsetX: number|undefined = uiConfig['logoOffsetX'];
    let logoOffsetY: number|undefined = uiConfig['logoOffsetY'];
    let logoWidth: number|undefined = uiConfig['logoWidth'];
    let logoHeight: number|undefined = uiConfig['logoHeight'];
    let logoImgPath: string|undefined = uiConfig['logoImgPath'];
    let logoHidden: boolean|undefined = uiConfig['logoHidden'];
    let numFieldOffsetX: number|undefined = uiConfig['numFieldOffsetX'];
    let numFieldOffsetY: number|undefined = uiConfig['numFieldOffsetY'];
    let numberFieldWidth: number|undefined = uiConfig['numberFieldWidth'];
    let numberFieldHeight: number|undefined = uiConfig['numberFieldHeight'];
    let numberSize: number|undefined = uiConfig['numberSize'];
    let numberColor: number|undefined = uiConfig['numberColor'];
    let numberTextBold: boolean|undefined = uiConfig['numberTextBold'];
    let sloganOffsetX: number|undefined = uiConfig['sloganOffsetX'];
    let sloganOffsetY: number|undefined = uiConfig['sloganOffsetY'];
    let sloganTextSize: number|undefined = uiConfig['sloganTextSize'];
    let sloganTextColor: number|undefined = uiConfig['sloganTextColor'];
    let sloganTextBold: boolean|undefined = uiConfig['sloganTextBold'];
    let logBtnOffsetX: number|undefined = uiConfig['logBtnOffsetX'];
    let logBtnOffsetY: number|undefined = uiConfig['logBtnOffsetY'];
    let logBtnWidth: number|undefined = uiConfig['logBtnWidth'];
    let logBtnHeight: number|undefined = uiConfig['logBtnHeight'];
    let logBtnText: string|undefined = uiConfig['logBtnText'];
    let logBtnTextSize: number|undefined = uiConfig['logBtnTextSize'];
    let logBtnTextColor: number|undefined = uiConfig['logBtnTextColor'];
    let logBtnTextBold: boolean|undefined = uiConfig['logBtnTextBold'];
    let logBtnBackgroundPath: string|undefined = uiConfig['logBtnBackgroundPath'];
    let privacyCheckboxSize: number|undefined = uiConfig['privacyCheckboxSize'];
    let checkedImgPath: string|undefined = uiConfig['checkedImgPath'];
    let uncheckedImgPath: string|undefined = uiConfig['uncheckedImgPath'];
    let privacyText: string[]|undefined = uiConfig['privacyText'];
    let privacyTextSize: number|undefined = uiConfig['privacyTextSize'];
    let privacyTextBold: boolean|undefined = uiConfig['privacyTextBold'];
    let privacyUnderlineText: boolean|undefined = uiConfig['privacyUnderlineText'];
    let privacyTextCenterGravity: boolean|undefined = uiConfig['privacyTextCenterGravity'];
    let privacyCheckboxInCenter: boolean|undefined = uiConfig['privacyCheckboxInCenter'];
    let privacyState: boolean|undefined = uiConfig['privacyState'];
    let privacyNavColor: number|undefined = uiConfig['privacyNavColor'];
    let privacyNavTitleTextSize: number|undefined = uiConfig['privacyNavTitleTextSize'];
    let privacyNavTitleTextColor: number|undefined = uiConfig['privacyNavTitleTextColor'];
    let privacyNavTitleTextBold: boolean|undefined = uiConfig['privacyNavTitleTextBold'];
    let privacyNavReturnBtnPath: string|undefined = uiConfig['privacyNavReturnBtnPath'];

    if(authBackgroundImage) builder.setAuthBGImgPath(authBackgroundImage);
    if(logoOffsetX!=null) builder.setLogoOffsetX(logoOffsetX);
    if(logoOffsetY!=null) builder.setLogoOffsetY(logoOffsetY);
    if(logoWidth!=null) builder.setLogoWidth(logoWidth);
    if(logoHeight!=null) builder.setLogoHeight(logoHeight);
    if(logoImgPath!=null) builder.setLogoImgPath(logoImgPath);
    if(logoHidden!=null) builder.setLogoHidden(logoHidden);
    if(numFieldOffsetX!=null) builder.setNumberFieldOffsetX(numFieldOffsetX);
    if(numFieldOffsetY!=null) builder.setNumberFieldOffsetY(numFieldOffsetY);
    if(numberFieldWidth!=null) builder.setNumberFieldWidth(numberFieldWidth);
    if(numberFieldHeight!=null) builder.setNumberFieldHeight(numberFieldHeight);
    if(numberSize!=null) builder.setNumberSize(numberSize);
    if(numberColor!=null) builder.setNumberColor(numberColor);
    if(numberTextBold!=null) builder.setNumberTextBold(numberTextBold);
    if(sloganOffsetX!=null) builder.setSloganOffsetX(sloganOffsetX);
    if(sloganOffsetY!=null) builder.setSloganOffsetY(sloganOffsetY);
    if(sloganTextSize!=null) builder.setSloganTextSize(sloganTextSize);
    if(sloganTextColor!=null) builder.setSloganTextColor(sloganTextColor);
    if(sloganTextBold!=null) builder.setSloganTextBold(sloganTextBold);
    if(logBtnOffsetX!=null) builder.setLogBtnOffsetX(logBtnOffsetX);
    if(logBtnOffsetY!=null) builder.setLogBtnOffsetY(logBtnOffsetY);
    if(logBtnWidth!=null) builder.setLogBtnWidth(logBtnWidth);
    if(logBtnHeight!=null) builder.setLogBtnHeight(logBtnHeight);
    if(logBtnText!=null) builder.setLogBtnText(logBtnText);
    if(logBtnTextSize!=null) builder.setLogBtnTextSize(logBtnTextSize);
    if(logBtnTextColor!=null) builder.setLogBtnTextColor(logBtnTextColor);
    if(logBtnTextBold!=null) builder.setLogBtnTextBold(logBtnTextBold);
    if(logBtnBackgroundPath!=null) builder.setLogBtnImgPath(logBtnBackgroundPath);
    if(privacyCheckboxSize!=null) builder.setPrivacyCheckboxSize(privacyCheckboxSize);
    if(checkedImgPath!=null) builder.setCheckedImgPath(checkedImgPath);
    if(uncheckedImgPath!=null) builder.setUncheckedImgPath(uncheckedImgPath);
    if(privacyText!=null) builder.setPrivacyText(privacyText[0],privacyText[1]);
    if(privacyTextSize!=null) builder.setPrivacyTextSize(privacyTextSize);
    if(privacyTextBold!=null) builder.setPrivacyTextBold(privacyTextBold);
    if(privacyUnderlineText!=null) builder.setPrivacyUnderlineText(privacyUnderlineText);
    if(privacyTextCenterGravity!=null) builder.setPrivacyTextCenterGravity(privacyTextCenterGravity);
    if(privacyCheckboxInCenter!=null) builder.setPrivacyCheckboxInCenter(privacyCheckboxInCenter);
    if(privacyState!=null) builder.setPrivacyState(privacyState);
    if(privacyNavColor!=null) builder.setPrivacyNavColor(privacyNavColor);
    if(privacyNavTitleTextSize!=null) builder.setPrivacyNavTitleTextSize(privacyNavTitleTextSize);
    if(privacyNavTitleTextColor!=null) builder.setPrivacyNavTitleTextColor(privacyNavTitleTextColor);
    if(privacyNavTitleTextBold!=null) builder.setPrivacyNavTitleTextBold(privacyNavTitleTextBold);
    if(privacyNavReturnBtnPath!=null) builder.setPrivacyNavReturnBtnPath(privacyNavReturnBtnPath);
  }
  loginAuth(call: MethodCall, result: MethodResult){
    let autoDismiss: boolean = call.argument('autoDismiss');
    let timeout: number = call.argument('timeout');

    let settings = new JVerificationLoginSettings();
    settings.autoFinish = autoDismiss;
    settings.timeout = timeout;
    JVerificationInterface.loginAuth(settings,(code,msg,operateRet)=>{
      result.success({code,message:msg,operator:operateRet});
    });
  }
  preLogin(call: MethodCall, result: MethodResult){
    let timeOut: number|undefined = call.argument('timeOut');
    JVerificationInterface.prelogin((code,msg,operateRet)=>{
      result.success({code,message:msg});
    },timeOut);
  }
  setCustomAuthorizationView(call: MethodCall, result: MethodResult){
    let portraitConfig: HashMap<string,ESObject> = call.argument('portraitConfig');

    let portraitBuilder = new JVerifyUIConfigBuilder();
    this.layoutOriginOuthView(portraitConfig,portraitBuilder);
    let portrait: JVerifyUIConfig = portraitBuilder.build();

    JVerificationInterface.setCustomUIWithConfig(portrait);
  }
  setup(call: MethodCall, result: MethodResult){
    let appKey: string = call.argument('appKey');
    JVerificationInterface.init(appKey,(code, msg)=>{
      result.success({code,message:msg});
    });
  }
}