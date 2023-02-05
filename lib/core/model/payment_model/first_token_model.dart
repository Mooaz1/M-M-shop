// To parse this JSON data, do
//
//     final firstTokenModel = firstTokenModelFromJson(jsonString);



class FirstTokenModel {
    FirstTokenModel({
        required this.profile,
        required this.token,
    });

    Profile profile;
    String token;

    factory FirstTokenModel.fromJson(Map<String, dynamic> json) => FirstTokenModel(
        profile: Profile.fromJson(json["profile"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "token": token,
    };
}

class Profile {
    Profile({
        required this.id,
        required this.user,
        required this.createdAt,
        required this.active,
        required this.profileType,
        required this.phones,
        required this.companyEmails,
        required this.companyName,
        required this.state,
        required this.country,
        required this.city,
        required this.postalCode,
        required this.street,
        required this.emailNotification,
        this.orderRetrievalEndpoint,
        this.deliveryUpdateEndpoint,
        this.logoUrl,
        required this.isMobadra,
        this.sector,
        required this.activationMethod,
        required this.signedUpThrough,
        required this.failedAttempts,
        required this.customExportColumns,
        required this.serverIp,
        this.username,
        required this.primaryPhoneNumber,
        required this.primaryPhoneVerified,
        required this.isTempPassword,
        required this.otpSentAt,
        required this.otpSentTo,
        required this.otpValidatedAt,
        this.awbBanner,
        this.emailBanner,
        this.identificationNumber,
        required this.deliveryStatusCallback,
        this.merchantExternalLink,
        required this.merchantStatus,
        required this.deactivatedByBank,
        this.bankDeactivationReason,
        required this.bankMerchantStatus,
        this.nationalId,
        this.superAgent,
        this.walletLimitProfile,
        this.address,
        this.commercialRegistration,
        this.commercialRegistrationArea,
        this.distributorCode,
        this.distributorBranchCode,
        required this.allowTerminalOrderId,
        required this.allowEncryptionBypass,
        this.walletPhoneNumber,
        required this.suspicious,
        this.latitude,
        this.longitude,
        required this.bankStaffs,
        this.bankRejectionReason,
        required this.bankReceivedDocuments,
        required this.bankMerchantDigitalStatus,
        this.bankDigitalRejectionReason,
        required this.filledBusinessData,
        required this.dayStartTime,
        this.dayEndTime,
        required this.withholdTransfers,
        required this.smsSenderName,
        this.withholdTransfersReason,
        this.withholdTransfersNotes,
        required this.canBillDepositWithCard,
        required this.canTopupMerchants,
        this.topupTransferId,
        required this.referralEligible,
        required this.paymobAppMerchant,
        this.settlementFrequency,
        this.dayOfTheWeek,
        this.dayOfTheMonth,
        required this.allowTransactionNotifications,
        required this.allowTransferNotifications,
        required this.sallefnyAmountWhole,
        required this.sallefnyFeesWhole,
        this.paymobAppFirstLogin,
        this.paymobAppLastActivity,
        this.acqPartner,
        required this.salesOwner,
        this.dom,
        this.bankRelated,
        required this.permissions,
    });

    int id;
    User user;
    DateTime createdAt;
    bool active;
    String profileType;
    List<String> phones;
    List<String> companyEmails;
    String companyName;
    String state;
    String country;
    String city;
    String postalCode;
    String street;
    bool emailNotification;
    dynamic orderRetrievalEndpoint;
    dynamic deliveryUpdateEndpoint;
    dynamic logoUrl;
    bool isMobadra;
    dynamic sector;
    int activationMethod;
    int signedUpThrough;
    int failedAttempts;
    List<dynamic> customExportColumns;
    List<dynamic> serverIp;
    dynamic username;
    String primaryPhoneNumber;
    bool primaryPhoneVerified;
    bool isTempPassword;
    DateTime otpSentAt;
    String otpSentTo;
    DateTime otpValidatedAt;
    dynamic awbBanner;
    dynamic emailBanner;
    dynamic identificationNumber;
    String deliveryStatusCallback;
    dynamic merchantExternalLink;
    int merchantStatus;
    bool deactivatedByBank;
    dynamic bankDeactivationReason;
    int bankMerchantStatus;
    dynamic nationalId;
    dynamic superAgent;
    dynamic walletLimitProfile;
    dynamic address;
    dynamic commercialRegistration;
    dynamic commercialRegistrationArea;
    dynamic distributorCode;
    dynamic distributorBranchCode;
    bool allowTerminalOrderId;
    bool allowEncryptionBypass;
    dynamic walletPhoneNumber;
    int suspicious;
    dynamic latitude;
    dynamic longitude;
    BankStaffs bankStaffs;
    dynamic bankRejectionReason;
    bool bankReceivedDocuments;
    int bankMerchantDigitalStatus;
    dynamic bankDigitalRejectionReason;
    bool filledBusinessData;
    String dayStartTime;
    dynamic dayEndTime;
    bool withholdTransfers;
    String smsSenderName;
    dynamic withholdTransfersReason;
    dynamic withholdTransfersNotes;
    bool canBillDepositWithCard;
    bool canTopupMerchants;
    dynamic topupTransferId;
    bool referralEligible;
    bool paymobAppMerchant;
    dynamic settlementFrequency;
    dynamic dayOfTheWeek;
    dynamic dayOfTheMonth;
    bool allowTransactionNotifications;
    bool allowTransferNotifications;
    int sallefnyAmountWhole;
    int sallefnyFeesWhole;
    dynamic paymobAppFirstLogin;
    dynamic paymobAppLastActivity;
    dynamic acqPartner;
    String salesOwner;
    dynamic dom;
    dynamic bankRelated;
    List<dynamic> permissions;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        active: json["active"],
        profileType: json["profile_type"],
        phones: List<String>.from(json["phones"].map((x) => x)),
        companyEmails: List<String>.from(json["company_emails"].map((x) => x)),
        companyName: json["company_name"],
        state: json["state"],
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
        street: json["street"],
        emailNotification: json["email_notification"],
        orderRetrievalEndpoint: json["order_retrieval_endpoint"],
        deliveryUpdateEndpoint: json["delivery_update_endpoint"],
        logoUrl: json["logo_url"],
        isMobadra: json["is_mobadra"],
        sector: json["sector"],
        activationMethod: json["activation_method"],
        signedUpThrough: json["signed_up_through"],
        failedAttempts: json["failed_attempts"],
        customExportColumns: List<dynamic>.from(json["custom_export_columns"].map((x) => x)),
        serverIp: List<dynamic>.from(json["server_IP"].map((x) => x)),
        username: json["username"],
        primaryPhoneNumber: json["primary_phone_number"],
        primaryPhoneVerified: json["primary_phone_verified"],
        isTempPassword: json["is_temp_password"],
        otpSentAt: DateTime.parse(json["otp_sent_at"]),
        otpSentTo: json["otp_sent_to"],
        otpValidatedAt: DateTime.parse(json["otp_validated_at"]),
        awbBanner: json["awb_banner"],
        emailBanner: json["email_banner"],
        identificationNumber: json["identification_number"],
        deliveryStatusCallback: json["delivery_status_callback"],
        merchantExternalLink: json["merchant_external_link"],
        merchantStatus: json["merchant_status"],
        deactivatedByBank: json["deactivated_by_bank"],
        bankDeactivationReason: json["bank_deactivation_reason"],
        bankMerchantStatus: json["bank_merchant_status"],
        nationalId: json["national_id"],
        superAgent: json["super_agent"],
        walletLimitProfile: json["wallet_limit_profile"],
        address: json["address"],
        commercialRegistration: json["commercial_registration"],
        commercialRegistrationArea: json["commercial_registration_area"],
        distributorCode: json["distributor_code"],
        distributorBranchCode: json["distributor_branch_code"],
        allowTerminalOrderId: json["allow_terminal_order_id"],
        allowEncryptionBypass: json["allow_encryption_bypass"],
        walletPhoneNumber: json["wallet_phone_number"],
        suspicious: json["suspicious"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        bankStaffs: BankStaffs.fromJson(json["bank_staffs"]),
        bankRejectionReason: json["bank_rejection_reason"],
        bankReceivedDocuments: json["bank_received_documents"],
        bankMerchantDigitalStatus: json["bank_merchant_digital_status"],
        bankDigitalRejectionReason: json["bank_digital_rejection_reason"],
        filledBusinessData: json["filled_business_data"],
        dayStartTime: json["day_start_time"],
        dayEndTime: json["day_end_time"],
        withholdTransfers: json["withhold_transfers"],
        smsSenderName: json["sms_sender_name"],
        withholdTransfersReason: json["withhold_transfers_reason"],
        withholdTransfersNotes: json["withhold_transfers_notes"],
        canBillDepositWithCard: json["can_bill_deposit_with_card"],
        canTopupMerchants: json["can_topup_merchants"],
        topupTransferId: json["topup_transfer_id"],
        referralEligible: json["referral_eligible"],
        paymobAppMerchant: json["paymob_app_merchant"],
        settlementFrequency: json["settlement_frequency"],
        dayOfTheWeek: json["day_of_the_week"],
        dayOfTheMonth: json["day_of_the_month"],
        allowTransactionNotifications: json["allow_transaction_notifications"],
        allowTransferNotifications: json["allow_transfer_notifications"],
        sallefnyAmountWhole: json["sallefny_amount_whole"],
        sallefnyFeesWhole: json["sallefny_fees_whole"],
        paymobAppFirstLogin: json["paymob_app_first_login"],
        paymobAppLastActivity: json["paymob_app_last_activity"],
        acqPartner: json["acq_partner"],
        salesOwner: json["sales_owner"],
        dom: json["dom"],
        bankRelated: json["bank_related"],
        permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
        "active": active,
        "profile_type": profileType,
        "phones": List<dynamic>.from(phones.map((x) => x)),
        "company_emails": List<dynamic>.from(companyEmails.map((x) => x)),
        "company_name": companyName,
        "state": state,
        "country": country,
        "city": city,
        "postal_code": postalCode,
        "street": street,
        "email_notification": emailNotification,
        "order_retrieval_endpoint": orderRetrievalEndpoint,
        "delivery_update_endpoint": deliveryUpdateEndpoint,
        "logo_url": logoUrl,
        "is_mobadra": isMobadra,
        "sector": sector,
        "activation_method": activationMethod,
        "signed_up_through": signedUpThrough,
        "failed_attempts": failedAttempts,
        "custom_export_columns": List<dynamic>.from(customExportColumns.map((x) => x)),
        "server_IP": List<dynamic>.from(serverIp.map((x) => x)),
        "username": username,
        "primary_phone_number": primaryPhoneNumber,
        "primary_phone_verified": primaryPhoneVerified,
        "is_temp_password": isTempPassword,
        "otp_sent_at": otpSentAt.toIso8601String(),
        "otp_sent_to": otpSentTo,
        "otp_validated_at": otpValidatedAt.toIso8601String(),
        "awb_banner": awbBanner,
        "email_banner": emailBanner,
        "identification_number": identificationNumber,
        "delivery_status_callback": deliveryStatusCallback,
        "merchant_external_link": merchantExternalLink,
        "merchant_status": merchantStatus,
        "deactivated_by_bank": deactivatedByBank,
        "bank_deactivation_reason": bankDeactivationReason,
        "bank_merchant_status": bankMerchantStatus,
        "national_id": nationalId,
        "super_agent": superAgent,
        "wallet_limit_profile": walletLimitProfile,
        "address": address,
        "commercial_registration": commercialRegistration,
        "commercial_registration_area": commercialRegistrationArea,
        "distributor_code": distributorCode,
        "distributor_branch_code": distributorBranchCode,
        "allow_terminal_order_id": allowTerminalOrderId,
        "allow_encryption_bypass": allowEncryptionBypass,
        "wallet_phone_number": walletPhoneNumber,
        "suspicious": suspicious,
        "latitude": latitude,
        "longitude": longitude,
        "bank_staffs": bankStaffs.toJson(),
        "bank_rejection_reason": bankRejectionReason,
        "bank_received_documents": bankReceivedDocuments,
        "bank_merchant_digital_status": bankMerchantDigitalStatus,
        "bank_digital_rejection_reason": bankDigitalRejectionReason,
        "filled_business_data": filledBusinessData,
        "day_start_time": dayStartTime,
        "day_end_time": dayEndTime,
        "withhold_transfers": withholdTransfers,
        "sms_sender_name": smsSenderName,
        "withhold_transfers_reason": withholdTransfersReason,
        "withhold_transfers_notes": withholdTransfersNotes,
        "can_bill_deposit_with_card": canBillDepositWithCard,
        "can_topup_merchants": canTopupMerchants,
        "topup_transfer_id": topupTransferId,
        "referral_eligible": referralEligible,
        "paymob_app_merchant": paymobAppMerchant,
        "settlement_frequency": settlementFrequency,
        "day_of_the_week": dayOfTheWeek,
        "day_of_the_month": dayOfTheMonth,
        "allow_transaction_notifications": allowTransactionNotifications,
        "allow_transfer_notifications": allowTransferNotifications,
        "sallefny_amount_whole": sallefnyAmountWhole,
        "sallefny_fees_whole": sallefnyFeesWhole,
        "paymob_app_first_login": paymobAppFirstLogin,
        "paymob_app_last_activity": paymobAppLastActivity,
        "acq_partner": acqPartner,
        "sales_owner": salesOwner,
        "dom": dom,
        "bank_related": bankRelated,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
    };
}

class BankStaffs {
    BankStaffs();

    factory BankStaffs.fromJson(Map<String, dynamic> json) => BankStaffs(
    );

    Map<String, dynamic> toJson() => {
    };
}

class User {
    User({
        required this.id,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.dateJoined,
        required this.email,
        required this.isActive,
        required this.isStaff,
        required this.isSuperuser,
        this.lastLogin,
        required this.groups,
        required this.userPermissions,
    });

    int id;
    String username;
    String firstName;
    String lastName;
    DateTime dateJoined;
    String email;
    bool isActive;
    bool isStaff;
    bool isSuperuser;
    dynamic lastLogin;
    List<dynamic> groups;
    List<int> userPermissions;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateJoined: DateTime.parse(json["date_joined"]),
        email: json["email"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
        lastLogin: json["last_login"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions: List<int>.from(json["user_permissions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "date_joined": dateJoined.toIso8601String(),
        "email": email,
        "is_active": isActive,
        "is_staff": isStaff,
        "is_superuser": isSuperuser,
        "last_login": lastLogin,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
    };
}
