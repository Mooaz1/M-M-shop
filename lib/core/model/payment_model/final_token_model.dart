// To parse this JSON data, do
//
//     final finalToken = finalTokenFromJson(jsonString);


class FinalToken {
    FinalToken({
        required this.token,
    });

    String token;

    factory FinalToken.fromJson(Map<String, dynamic> json) => FinalToken(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
