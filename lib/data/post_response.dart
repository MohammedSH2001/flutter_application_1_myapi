
class PostResponse {
  int? id;
  String? title;
  String? content;
  String? slug;
  String? picture;
  String? user;
  Links? links;

  PostResponse({this.id, this.title, this.content, this.slug, this.picture, this.user, this.links});

  PostResponse.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["picture"] is String) {
      picture = json["picture"];
    }
    if(json["user"] is String) {
      user = json["user"];
    }
    if(json["_links"] is Map) {
      links = json["_links"] == null ? null : Links.fromJson(json["_links"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["content"] = content;
    _data["slug"] = slug;
    _data["picture"] = picture;
    _data["user"] = user;
    if(links != null) {
      _data["_links"] = links?.toJson();
    }
    return _data;
  }
}

class Links {
  Self? self;
  Modify? modify;
  Delete? delete;

  Links({this.self, this.modify, this.delete});

  Links.fromJson(Map<String, dynamic> json) {
    if(json["self"] is Map) {
      self = json["self"] == null ? null : Self.fromJson(json["self"]);
    }
    if(json["modify"] is Map) {
      modify = json["modify"] == null ? null : Modify.fromJson(json["modify"]);
    }
    if(json["delete"] is Map) {
      delete = json["delete"] == null ? null : Delete.fromJson(json["delete"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(self != null) {
      _data["self"] = self?.toJson();
    }
    if(modify != null) {
      _data["modify"] = modify?.toJson();
    }
    if(delete != null) {
      _data["delete"] = delete?.toJson();
    }
    return _data;
  }
}

class Delete {
  String? href;

  Delete({this.href});

  Delete.fromJson(Map<String, dynamic> json) {
    if(json["href"] is String) {
      href = json["href"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["href"] = href;
    return _data;
  }
}

class Modify {
  String? href;

  Modify({this.href});

  Modify.fromJson(Map<String, dynamic> json) {
    if(json["href"] is String) {
      href = json["href"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["href"] = href;
    return _data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    if(json["href"] is String) {
      href = json["href"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["href"] = href;
    return _data;
  }
}