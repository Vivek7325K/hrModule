
class AttachmentCredentialsModel {
  String? privateUrl;
  String? downloadUrl;
  UploadCredentials? uploadCredentials;

  AttachmentCredentialsModel(
      {this.privateUrl, this.downloadUrl, this.uploadCredentials});

  AttachmentCredentialsModel.fromJson(Map<String, dynamic> json) {
    privateUrl = json['privateUrl'];
    downloadUrl = json['downloadUrl'];
    uploadCredentials = json['uploadCredentials'] != null
        ? UploadCredentials.fromJson(json['uploadCredentials'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privateUrl'] = privateUrl;
    data['downloadUrl'] = downloadUrl;
    if (uploadCredentials != null) {
      data['uploadCredentials'] = uploadCredentials!.toJson();
    }
    return data;
  }
}

class UploadCredentials {
  String? url;
  Fields? fields;
  String? publicUrl;

  UploadCredentials({this.url, this.fields, this.publicUrl});

  UploadCredentials.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
    publicUrl = json['publicUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    data['publicUrl'] = publicUrl;
    return data;
  }
}

class Fields {
  String? acl;
  String? key;
  String? xGoogDate;
  String? xGoogCredential;
  String? xGoogAlgorithm;
  String? policy;
  String? xGoogSignature;

  Fields(
      {this.acl,
      this.key,
      this.xGoogDate,
      this.xGoogCredential,
      this.xGoogAlgorithm,
      this.policy,
      this.xGoogSignature});

  Fields.fromJson(Map<String, dynamic> json) {
    acl = json['acl'];
    key = json['key'];
    xGoogDate = json['x-goog-date'];
    xGoogCredential = json['x-goog-credential'];
    xGoogAlgorithm = json['x-goog-algorithm'];
    policy = json['policy'];
    xGoogSignature = json['x-goog-signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acl'] = acl;
    data['key'] = key;
    data['x-goog-date'] = xGoogDate;
    data['x-goog-credential'] = xGoogCredential;
    data['x-goog-algorithm'] = xGoogAlgorithm;
    data['policy'] = policy;
    data['x-goog-signature'] = xGoogSignature;
    return data;
  }
}