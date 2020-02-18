class ComicDetailListModel {
  int code;
  Data data;

  ComicDetailListModel({this.code, this.data});

  ComicDetailListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int stateCode;
  String message;
  ReturnData returnData;

  Data({this.stateCode, this.message, this.returnData});

  Data.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    message = json['message'];
    returnData = json['returnData'] != null
        ? new ReturnData.fromJson(json['returnData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateCode'] = this.stateCode;
    data['message'] = this.message;
    if (this.returnData != null) {
      data['returnData'] = this.returnData.toJson();
    }
    return data;
  }
}

class ReturnData {
  List<GalleryItem> galleryItems;
  // List<Null> textItems;
  List<Module> modules;
  FloatItems floatItems;
  String editTime;
  String defaultSearch;
  int curTime;

  ReturnData(
      {this.galleryItems,
      // this.textItems,
      this.modules,
      this.floatItems,
      this.editTime,
      this.defaultSearch,
      this.curTime});

  ReturnData.fromJson(Map<String, dynamic> json) {
    if (json['galleryItems'] != null) {
      galleryItems = new List<GalleryItem>();
      json['galleryItems'].forEach((v) {
        galleryItems.add(new GalleryItem.fromJson(v));
      });
    }
    // if (json['textItems'] != null) {
    //   textItems = new List<Map>();
    //   json['textItems'].forEach((v) {
    //     textItems.add(new Map.fromJson(v));
    //   });
    // }
    if (json['modules'] != null) {
      modules = new List<Module>();
      json['modules'].forEach((v) {
        modules.add(new Module.fromJson(v));
      });
    }
    floatItems = json['floatItems'] != null
        ? new FloatItems.fromJson(json['floatItems'])
        : null;
    editTime = json['editTime'];
    defaultSearch = json['defaultSearch'];
    curTime = json['curTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.galleryItems != null) {
      data['galleryItems'] = this.galleryItems.map((v) => v.toJson()).toList();
    }
    // if (this.textItems != null) {
    //   data['textItems'] = this.textItems.map((v) => v.toJson()).toList();
    // }
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    if (this.floatItems != null) {
      data['floatItems'] = this.floatItems.toJson();
    }
    data['editTime'] = this.editTime;
    data['defaultSearch'] = this.defaultSearch;
    data['curTime'] = this.curTime;
    return data;
  }
}

class GalleryItem {
  int linkType;
  String cover;
  int id;
  String title;
  String content;
  String topCover;
  List<Ext> ext;
  int overTime;

  GalleryItem(
      {this.linkType,
      this.cover,
      this.id,
      this.title,
      this.content,
      this.topCover,
      this.ext,
      this.overTime});

  GalleryItem.fromJson(Map<String, dynamic> json) {
    linkType = json['linkType'];
    cover = json['cover'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    topCover = json['topCover'];
    if (json['ext'] != null) {
      ext = new List<Ext>();
      json['ext'].forEach((v) {
        ext.add(new Ext.fromJson(v));
      });
    }
    overTime = json['over_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkType'] = this.linkType;
    data['cover'] = this.cover;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['topCover'] = this.topCover;
    if (this.ext != null) {
      data['ext'] = this.ext.map((v) => v.toJson()).toList();
    }
    data['over_time'] = this.overTime;
    return data;
  }
}

class Ext {
  String key;
  String val;

  Ext({this.key, this.val});

  Ext.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    val = json['val'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['val'] = this.val;
    return data;
  }
}

class Module {
  int moduleType;
  int uiType;
  ModuleInfo moduleInfo;

  List<DiscoveryItem> discoveryItems = [];
  List<AdvItem> advItems = [];
  List<CommentItem> commentItems = [];
  List<AnimationItem> animationItems = [];
  List<RewardItem> rewardItems ;

  Module({this.moduleType, this.uiType, this.moduleInfo,this.discoveryItems,this.advItems,this.commentItems,this.animationItems,this.rewardItems });

  Module.fromJson(Map<String, dynamic> json) {
    moduleType = json['moduleType'];
    uiType = json['uiType'];

    switch (moduleType) {
      case 1:
        //发现discovery
        if (json['items'] != null) {
          discoveryItems = new List<DiscoveryItem>();
          json['items'].forEach((v) {
            discoveryItems.add(new DiscoveryItem.fromJson(v));
          });
        }
        break;
      case 2:
      
       if (json['items'] != null) {
          advItems = new List<AdvItem>();
          json['items'].forEach((v) {
            advItems.add(new AdvItem.fromJson(v));
          });
        }
        //广告
        break;
      case 3:
        //comment
        if (json['items'] != null) {
          commentItems = new List<CommentItem>();
          json['items'].forEach((v) {
            commentItems.add(new CommentItem.fromJson(v));
          });
        }
        break;
      case 4:
        //动画影视
        if (json['items'] != null) {
          animationItems = new List<AnimationItem>();
          json['items'].forEach((v) {
            animationItems.add(new AnimationItem.fromJson(v));
          });
        }
        break;
      case 5:
        //表白墙
        if (json['items'] != null) {
          rewardItems = new List<RewardItem>();
          json['items'].forEach((v) {
            rewardItems.add(new RewardItem.fromJson(v));
          });
        }
        break;
      default:
    }

    moduleInfo = json['moduleInfo'] != null
        ? new ModuleInfo.fromJson(json['moduleInfo'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleType'] = this.moduleType;
    data['uiType'] = this.uiType;
    data['discoveryItems'] = this.discoveryItems;
    data['advItems'] = this.advItems;
    data['commentItems'] = this.commentItems;
    data['rewardItems'] = this.rewardItems;
    data['animationItems'] = this.animationItems;
 

    if (this.moduleInfo != null) {
      data['moduleInfo'] = this.moduleInfo.toJson();
    }
    
    // if (this.items != null) {
    //   data['items'] = this.items.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ModuleInfo {
  String argName;
  int argValue;
  String title;
  String icon;
  String bgCover;
  String subTitle;

  ModuleInfo(
      {this.argName,
      this.argValue,
      this.title,
      this.icon,
      this.bgCover,
      this.subTitle});

  ModuleInfo.fromJson(Map<String, dynamic> json) {
    argName = json['argName'];
    argValue = json['argValue'];
    title = json['title'];
    icon = json['icon'];
    bgCover = json['bgCover'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['argName'] = this.argName;
    data['argValue'] = this.argValue;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['bgCover'] = this.bgCover;
    data['subTitle'] = this.subTitle;
    return data;
  }
}

class User {
  int userId;
  String cover;
  String nickname;
  bool isVipUser;

  User({this.userId, this.cover, this.nickname, this.isVipUser});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    cover = json['cover'];
    nickname = json['nickname'];
    isVipUser = json['isVipUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['cover'] = this.cover;
    data['nickname'] = this.nickname;
    data['isVipUser'] = this.isVipUser;
    return data;
  }
}

class FloatItems {
  bool localInfoButton;

  FloatItems({this.localInfoButton});

  FloatItems.fromJson(Map<String, dynamic> json) {
    localInfoButton = json['localInfoButton'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localInfoButton'] = this.localInfoButton;
    return data;
  }
}

//发现类别
class DiscoveryItem {
  List<ComicItem> list = [];
  DiscoveryItem({this.list});
  DiscoveryItem.fromJson(List<dynamic> json) {
    if (json.length > 0) {
      
      list = json.map((v) {
        return ComicItem.fromJson(v);
      }).toList();
    }
  }
}

class ComicItem {
  int comicId;
  String title;
  String cover;
  String subTitle;

  ComicItem({this.comicId, this.title, this.cover, this.subTitle});

  ComicItem.fromJson(Map<String, dynamic> json) {
    comicId = json['comicId'];
    title = json['title'];
    cover = json['cover'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comicId'] = this.comicId;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['subTitle'] = this.subTitle;
    return data;
  }
}

class AdvItem {
  int linkType;
  String cover;
  int id;
  String title;
  String content;
  List<Ext> ext;
  int overTime;

  AdvItem(
      {this.linkType,
      this.cover,
      this.id,
      this.title,
      this.content,
      this.ext,
      this.overTime});

  AdvItem.fromJson(Map<String, dynamic> json) {
    linkType = json['linkType'];
    cover = json['cover'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    if (json['ext'] != null) {
      ext = new List<Ext>();
      json['ext'].forEach((v) {
        ext.add(new Ext.fromJson(v));
      });
    }
    overTime = json['over_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkType'] = this.linkType;
    data['cover'] = this.cover;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    if (this.ext != null) {
      data['ext'] = this.ext.map((v) => v.toJson()).toList();
    }
    data['over_time'] = this.overTime;
    return data;
  }
}


class CommentItem {
  int commentId;
  String threadId;
  String objectType;
  String comment;
  int comicId;
  String comicName;
  User user;
  String cover;
  String upperColor;
  String lowerColor;

  CommentItem(
      {this.commentId,
      this.threadId,
      this.objectType,
      this.comment,
      this.comicId,
      this.comicName,
      this.user,
      this.cover,
      this.upperColor,
      this.lowerColor});

  CommentItem.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    threadId = json['threadId'];
    objectType = json['objectType'];
    comment = json['comment'];
    comicId = json['comicId'];
    comicName = json['comicName'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cover = json['cover'];
    upperColor = json['upperColor'];
    lowerColor = json['lowerColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['threadId'] = this.threadId;
    data['objectType'] = this.objectType;
    data['comment'] = this.comment;
    data['comicId'] = this.comicId;
    data['comicName'] = this.comicName;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['cover'] = this.cover;
    data['upperColor'] = this.upperColor;
    data['lowerColor'] = this.lowerColor;
    return data;
  }
}

class AnimationItem {
  String title;
  String cover;
  String url;
  String subTitle;
  String color;

  AnimationItem({this.title, this.cover, this.url, this.subTitle, this.color});

  AnimationItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cover = json['cover'];
    url = json['url'];
    subTitle = json['subTitle'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['url'] = this.url;
    data['subTitle'] = this.subTitle;
    data['color'] = this.color;
    return data;
  }
}

class RewardItem {
  int giftCount;
  int comicId;
  String giftName;
  String nickname;
  String comicName;
  String cover;
  bool isVipUser;
  int bgType;
  String giftIcon;

  RewardItem(
      {this.giftCount,
      this.comicId,
      this.giftName,
      this.nickname,
      this.comicName,
      this.cover,
      this.isVipUser,
      this.bgType,
      this.giftIcon});

  RewardItem.fromJson(Map<String, dynamic> json) {
    giftCount = json['giftCount'];
    comicId = json['comicId'];
    giftName = json['giftName'];
    nickname = json['nickname'];
    comicName = json['comicName'];
    cover = json['cover'];
    isVipUser = json['isVipUser'];
    bgType = json['bgType'];
    giftIcon = json['giftIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['giftCount'] = this.giftCount;
    data['comicId'] = this.comicId;
    data['giftName'] = this.giftName;
    data['nickname'] = this.nickname;
    data['comicName'] = this.comicName;
    data['cover'] = this.cover;
    data['isVipUser'] = this.isVipUser;
    data['bgType'] = this.bgType;
    data['giftIcon'] = this.giftIcon;
    return data;
  }
}

