#import <UIKit/UIKit.h>

%hook CountDownAnimationView
- (id)initWithFrame:(CGRect)arg1 downCount:(long long)arg2 backColor:(id)arg3 progressColor:(id)arg4 lineWidth:(double)arg5 totalTime:(float)arg6 {
	return NULL;
}
%end

%hook DrawerMyInfoView
- (void)initSignView {
	%orig;
}
%end

%hook DrawerTalentView
- (id)init {
	return NULL;
}
%end

%hook DrawerViewController
- (void)registerCellCallBack:(id)arg1 {
	%orig;
}
%end

%hook FLPatch
- (id)apiVersion {
	return @"2";
}
%end

%hook FlappyEgg
- (id)initWithImage:(id)arg1 {
	return NULL;
}
%end

%hook HeadButton
- (void)showHint {
	%orig;
}
%end

%hook ImagesSplashView
- (void)doShowInView:(id)arg1 {
	%orig;
}
%end

%hook MLSearchBar
- (id)initWithFrame:(struct CGRect)arg1 {
	return NULL;
}
%end

%hook MQZoneActiveFeedViewController
- (long long)numberOfSectionsInTableView:(id)arg1 {
	return 0;
}
%end

%hook MQZoneTableFootLoadingView
- (void)setFootState:(long long)arg1 {
	%orig;
}
%end

%hook NSFAnimationManager
- (id)init {
	return NULL;
}
%end

%hook NearByBannerView
- (id)initWithFrame:(CGRect)arg1 {
	return NULL;
}
%end

%hook NearbyAdView
- (void)setAdModel:(id)arg1 {
	arg1 = NULL;
	%orig;
}
%end

%hook PreviewSecretPictureModel
- (bool)isCanPreview {
	return YES;
}
%end

%hook PreviewSecretPictureViewController
- (void)hideSecretPictureImage {
	%orig;
}

- (void)previewSecretPictureView:(id)arg1 hideNavigationBar:(bool)arg2 {
	%orig;
}
%end

%hook QMADropDownAppListManager
- (bool)miniappShowFullScreenViewForMessage {
	return NO;
}
%end

%hook QQAIOMsgModel
- (int)getMagicFontTypeFromMsgModel {
	return 0;
}

- (bool)getMagicFontOpenFlagFromMsgModel {
	return NO;
}
%end

%hook QQAIORichModel
- (long long)getFontIdFromMsgModel {
	return 0;
}
%end

%hook QQAIOTextModel
- (long long)getFontIdFromMsgModel {
	return 0;
}
%end

%hook QQAppSetting
- (bool)isAgreeToShowMayKnowUser:(id)arg1 {
	return %orig;
}

- (bool)isAgreeToShareLocation:(id)arg1 {
	return %orig;
}

- (bool)getReadInJoyTabSwitch {
	return NO;
}
%end

%hook QQAvatarView
- (void)setShouldShowAvatarPendant:(bool)arg1 {
	%orig;
}
%end

%hook QQChatViewController
- (bool)isSupportRightSlideAnimation {
	return NO;
}

- (void)onAIOTipsNotify:(id)arg1 {
	arg1 = NULL;
	%orig;
}
%end

%hook QQDynamicSearchDiscoveryView
- (long long)numberOfSectionsInTableView:(id)arg1 {
	return 0;
}
%end

%hook QQFaceAssociateKeyBoard
- (id)initWithEmojis:(id)arg1 {
	return NULL;
}
%end

%hook QQFaceHistoryFrameView
- (bool)isQidianMaster {
	return YES;
}
%end

%hook QQFacePanelController
- (void)setMarketFaceSupported:(bool)arg1arg1 {
	return 0;
}

- (void)loadMagicTabWithItem:(id)arg1 {
	%orig;
}

- (void)loadRecommendTabWithItem:(id)arg1 {
	%orig;
}

- (void)loadRecommendTabWithItem:(id)arg1 {
	%orig;
}

- (void)loadMagicTabWithItem:(id)arg1 {
	%orig;
}

- (void)loadSelfieTabWithItem:(id)arg1 {
	%orig;
}

- (void)loadSearchTabWithItem:(id)arg1 {
	%orig;
}
%end

%hook QQFlappyEggConfigModel
- (bool)disabled {
	return YES;
}
%end

%hook QQGroupChatViewController
- (id)rightSlideViewController {
	return NULL;
}
%end

%hook QQGroupDeliverGiftAnimationManager
- (id)init {
	return NULL;
}

- (void)playGiftAnimationWithModel:(id)arg1 {
	%orig;
}
%end

%hook QQGroupLeftSlideAppPanelPinnedAppsContainer
- (long long)numberOfSectionsInCollectionView:(id)arg1 {
	return 0;
}
%end

%hook QQGroupLeftSlideAppPanelViewController
- (long long)numberOfSectionsInTableView:(id)arg1 {
	return 1;
}
%end

%hook QQGroupSearchBottomView
- (void)updateClassificModel:(id)arg1 {
	%orig;
}
%end

%hook QQMessageModel
- (void)setBubbleID:(unsigned int)arg1 {
	%orig;
}
%end

%hook QQMessageRecallNetEngine
- (bool)parseGroupRecallNotify:(char*)arg1 bufferLen:(unsigned int)arg2 model:(RecallModel*)arg3 {
	return NO;
}

- (bool)parseDiscussRecallNotify:(char*)arg1 bufferLen:(unsigned int)arg2 model:(RecallModel*)arg3 {
	arg2 = 0;
	return NO;
	return %orig;
}

- (bool)parseC2CRecallNotify:(const void*)arg1 bufferLen:(int)arg2 subcmd:(int)arg3 model:(RecallModel*)arg4 {
	return NO;
}
%end

%hook QQNavigationDoubleButtonView
- (void)setLeftButton:(id)arg1 {
	%orig;
}

+ (id)initWithLeftButton:(id)arg1arg1 rightButton:(id)arg2arg2 middleGap:(int)arg3arg3 {
	arg1 = NULL;
	return %orig;
}
%end

%hook QQPushBannerView_Advertisement
- (id)initWithFrame:(CGRect)arg1 delegate:(id)arg2 {
	return NULL;
}
%end

%hook QQTabBarButtonConfig
- (bool)showsTitle {
	return NO;
}
%end

%hook QQTableViewIndexBar
- (void)setIndexes:(id)arg1 {
	%orig;
}
%end

%hook QQUnReadCountAnimationView
- (void)setOriginSuperView:(id)arg1 {
	%orig;
}
%end

%hook QQWalletViewController
- (bool)isShowFeedsPage {
	return NO;
}

- (void)showTopBannerAd {
	%orig;
}
%end

%hook QQWeatherView
- (void)setInfo:(id)arg1 {
	arg1 = NULL;
	%orig;
}
%end

%hook QZBuddleView
- (id)init {
	return NULL;
}
%end

%hook ReadInJoyBBCircleView
- (void)setupNormalBBCircleView:(struct CGRect)arg1 {
	%orig;
}
%end

%hook ReadInJoyChannelSliderViewController
- (void)viewDidLoad {
	%orig;
}
%end

%hook RedPointShowInfo
- (id)init {
	return %orig;
}
%end

%hook SDKUpgradeSetting
- (id)init {
	return NULL;
}
%end

%hook UserSummaryViewController
- (long long)numberOfSectionsInTableView:(id)arg1 {
	return 0;
}
%end