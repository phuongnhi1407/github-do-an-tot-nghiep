//QUAN LY ROUTER
final PREFIX  = 'authen/api/account';
//LOGIN
final LOGIN_URL = '$PREFIX/sign-in';

//SIGN UP
final SIGNUP_URL = '$PREFIX/sign-up';

//SIGN OUT
final LOGOUT_URL = '$PREFIX/revoke-token';

//CHANGE PASSWORD
final CHANGEPASSWORD_URL = '$PREFIX/change-password';

//PROFILE
final PROFILE_URL = 'master-data/api/user';

//DELETE
final DELETE_ACCOUNT_URL = '$PROFILE_URL/del';


//NEWS
final NEWS_URL = 'master-data/api/notification/detail';

//NOTIFICATIONLIST
final NOTIFICATIONLIST_URL = 'master-data/api/notification/list-received';

//BAKINGTRASACTION
final BAKINGTRASACTION_URL = 'master-data/api/transaction/recharge';

//TRANSACTIONHISTORY
final TRANSACTIONHISTORY_URL ='master-data/api/transaction/user-list';