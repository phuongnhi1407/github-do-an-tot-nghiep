//QUAN LY ROUTER
//1
final PREFIX  = 'master-data/api/account';
//LOGIN
final LOGIN_URL = '$PREFIX/sign-in';

//SIGN UP
final SIGNUP_URL = '$PREFIX/sign-up';

//SIGN OUT
final LOGOUT_URL = '$PREFIX/revoke-token';

//CHANGE PASS
final CHANGEPASS_URL = '$PREFIX/change-password';
//FORGOT PASS
final FOGOTPASS_URL = '$PREFIX/forgot-password';

//2

//PROFILE
final PROFILE_URL = 'master-data/api/user';

//DELETE
final DELETE_ACCOUNT_URL = '$PROFILE_URL/del';

//NOTIFICATION
final NEWS_URL = 'master-data/api/notification/detail';
//LISTNEWS
final LISTNEWS_URL = 'master-data/api/post/list';

//NOTIFICATIONLIST
final NOTIFICATIONLIST_URL = 'master-data/api/notification/list-received';

//BAKINGTRASACTION
final BAKINGTRASACTION_URL = 'master-data/api/transaction/recharge';

//TRANSACTIONHISTORY
final TRANSACTIONHISTORY_URL ='master-data/api/transaction/user-list';

//MYWALLET
final MYWALLET_URL = 'master-data/api/transaction/user-wallet';

//LOCATION
final LOCATION_URL = 'master-data/api/map-location/list';

//STATION
final STATION_URL = 'master-data/api/station/list';

//DETAILSTATION
final DETAILSTATION_URL ='master-data/api/station/detail';

//LISTBIKEINSTATION
final LISTBIKEINSTATION_URL = 'master-data/api/bike/list';

//RECHARFE
final RECHARGE_URL ='master-data/api/transaction/get-payment-url';

