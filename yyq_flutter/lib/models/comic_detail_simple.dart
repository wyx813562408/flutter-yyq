class ComicDetailSimpleModel {
	int code;
	Data data;

	ComicDetailSimpleModel({this.code, this.data});

	ComicDetailSimpleModel.fromJson(Map<String, dynamic> json) {
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
		returnData = json['returnData'] != null ? new ReturnData.fromJson(json['returnData']) : null;
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
	List<ChapterList> chapterList;
	List<OtherWorks> otherWorks;
	Comment comment;
	Comic comic;

	ReturnData({this.chapterList, 
   this.otherWorks, this.comment, this.comic
  });

	ReturnData.fromJson(Map<String, dynamic> json) {
		if (json['chapter_list'] != null) {
			chapterList = new List<ChapterList>();
			json['chapter_list'].forEach((v) { chapterList.add(new ChapterList.fromJson(v)); });
		}
		if (json['otherWorks'] != null) {
			otherWorks = new List<OtherWorks>();
			json['otherWorks'].forEach((v) { otherWorks.add(new OtherWorks.fromJson(v)); });
		}
		comment = json['comment'] != null ? new Comment.fromJson(json['comment']) : null;
		comic = json['comic'] != null ? new Comic.fromJson(json['comic']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.chapterList != null) {
      data['chapter_list'] = this.chapterList.map((v) => v.toJson()).toList();
    }
		if (this.otherWorks != null) {
      data['otherWorks'] = this.otherWorks.map((v) => v.toJson()).toList();
    }
		if (this.comment != null) {
      data['comment'] = this.comment.toJson();
    }
		if (this.comic != null) {
      data['comic'] = this.comic.toJson();
    }
		return data;
	}
}

class ChapterList {
	String name;
	String imageTotal;
	String chapterId;
	String size;
	String zipHighWebp;
	String cropZipSize;
	String vipImages;
	int isView;
	String buyed;
	int publishTime;
	int chapterIndex;
	List<List> imHightArr;
	int countImHightArr;
	String buyPrice;
	int isDownload;
	int readState;
	int isFree;

	ChapterList({this.name, this.imageTotal, this.chapterId, this.size, this.zipHighWebp, this.cropZipSize, this.vipImages, this.isView, this.buyed, this.publishTime, this.chapterIndex, this.imHightArr, this.countImHightArr, this.buyPrice, this.isDownload, this.readState, this.isFree});

	ChapterList.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		imageTotal = json['image_total'];
		chapterId = json['chapter_id'];
		size = json['size'];
		zipHighWebp = json['zip_high_webp'];
		cropZipSize = json['crop_zip_size'];
		vipImages = json['vip_images'];
		isView = json['is_view'];
		buyed = json['buyed'];
		publishTime = json['publish_time'];
		chapterIndex = json['chapterIndex'];
		// if (json['imHightArr'] != null) {
		// 	imHightArr = new List<List>();
		// 	json['imHightArr'].forEach((v) { imHightArr.add(new List.fromJson(v)); });
		// }
		countImHightArr = json['countImHightArr'];
		buyPrice = json['buy_price'];
		isDownload = json['is_download'];
		readState = json['read_state'];
		isFree = json['is_free'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['image_total'] = this.imageTotal;
		data['chapter_id'] = this.chapterId;
		data['size'] = this.size;
		data['zip_high_webp'] = this.zipHighWebp;
		data['crop_zip_size'] = this.cropZipSize;
		data['vip_images'] = this.vipImages;
		data['is_view'] = this.isView;
		data['buyed'] = this.buyed;
		data['publish_time'] = this.publishTime;
		data['chapterIndex'] = this.chapterIndex;
		if (this.imHightArr != null) {
     // data['imHightArr'] = this.imHightArr.map((v) => v.toJson()).toList();
    }
		data['countImHightArr'] = this.countImHightArr;
		data['buy_price'] = this.buyPrice;
		data['is_download'] = this.isDownload;
		data['read_state'] = this.readState;
		data['is_free'] = this.isFree;
		return data;
	}
}

class ImHightArr {


//	ImHightArr({});

	// ImHightArr.fromJson(Map<String, dynamic> json) {
	// }

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	return data;
	// }
}

class OtherWorks {
	String comicId;
	String coverUrl;
	String name;
	String passChapterNum;

	OtherWorks({this.comicId, this.coverUrl, this.name, this.passChapterNum});

	OtherWorks.fromJson(Map<String, dynamic> json) {
		comicId = json['comicId'];
		coverUrl = json['coverUrl'];
		name = json['name'];
		passChapterNum = json['passChapterNum'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['comicId'] = this.comicId;
		data['coverUrl'] = this.coverUrl;
		data['name'] = this.name;
		data['passChapterNum'] = this.passChapterNum;
		return data;
	}
}

class Comment {
	List<CommentList> commentList;
	int commentCount;

	Comment({this.commentList, this.commentCount});

	Comment.fromJson(Map<String, dynamic> json) {
		if (json['commentList'] != null) {
			commentList = new List<CommentList>();
			json['commentList'].forEach((v) { commentList.add(new CommentList.fromJson(v)); });
		}
		commentCount = json['commentCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.commentList != null) {
      data['commentList'] = this.commentList.map((v) => v.toJson()).toList();
    }
		data['commentCount'] = this.commentCount;
		return data;
	}
}

class CommentList {
	String commentId;
	int userId;
	String content;
	String createTime;
	String floor;
	String isDelete;
	String isUp;
	String threadId;
	String totalReply;
	String isChoice;
	int praiseTotal;
	String ticketId;
	String cate;
	String objectType;
	String contentFilter;
	int ticketNum;
	int giftNum;
	String giftImg;
	User user;
	List<Null> imageList;
	int comicId;
	String createTimeStr;

	CommentList({this.commentId, this.userId, this.content, this.createTime, this.floor, this.isDelete, this.isUp, this.threadId, this.totalReply, this.isChoice, this.praiseTotal, this.ticketId, this.cate, this.objectType, this.contentFilter, this.ticketNum, this.giftNum, this.giftImg, this.user, this.imageList, this.comicId, this.createTimeStr});

	CommentList.fromJson(Map<String, dynamic> json) {
		commentId = json['comment_id'];
		userId = json['user_id'];
		content = json['content'];
		createTime = json['create_time'];
		floor = json['floor'];
		isDelete = json['is_delete'];
		isUp = json['is_up'];
		threadId = json['thread_id'];
		totalReply = json['total_reply'];
		isChoice = json['is_choice'];
		praiseTotal = json['praise_total'];
		ticketId = json['ticket_id'];
		cate = json['cate'];
		objectType = json['object_type'];
		contentFilter = json['content_filter'];
		ticketNum = json['ticketNum'];
		giftNum = json['gift_num'];
		giftImg = json['gift_img'];
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
		if (json['imageList'] != null) {
			imageList = new List<Null>();
			//json['imageList'].forEach((v) { imageList.add(new Null.fromJson(v)); });
		}
		comicId = json['comic_id'];
		createTimeStr = json['create_time_str'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['comment_id'] = this.commentId;
		data['user_id'] = this.userId;
		data['content'] = this.content;
		data['create_time'] = this.createTime;
		data['floor'] = this.floor;
		data['is_delete'] = this.isDelete;
		data['is_up'] = this.isUp;
		data['thread_id'] = this.threadId;
		data['total_reply'] = this.totalReply;
		data['is_choice'] = this.isChoice;
		data['praise_total'] = this.praiseTotal;
		data['ticket_id'] = this.ticketId;
		data['cate'] = this.cate;
		data['object_type'] = this.objectType;
		data['content_filter'] = this.contentFilter;
		data['ticketNum'] = this.ticketNum;
		data['gift_num'] = this.giftNum;
		data['gift_img'] = this.giftImg;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		if (this.imageList != null) {
     // data['imageList'] = this.imageList.map((v) => v.toJson()).toList();
    }
		data['comic_id'] = this.comicId;
		data['create_time_str'] = this.createTimeStr;
		return data;
	}
}

class User {
	String face;
	String nickname;
	String groupUser;
	int isAuthor;
	int otherComicAuthor;
	int vipLevel;
	String userTitle;
	int grade;

	User({this.face, this.nickname, this.groupUser, this.isAuthor, this.otherComicAuthor, this.vipLevel, this.userTitle, this.grade});

	User.fromJson(Map<String, dynamic> json) {
		face = json['face'];
		nickname = json['nickname'];
		groupUser = json['group_user'];
		isAuthor = json['is_author'];
		otherComicAuthor = json['other_comic_author'];
		vipLevel = json['vip_level'];
		userTitle = json['user_title'];
		grade = json['grade'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['face'] = this.face;
		data['nickname'] = this.nickname;
		data['group_user'] = this.groupUser;
		data['is_author'] = this.isAuthor;
		data['other_comic_author'] = this.otherComicAuthor;
		data['vip_level'] = this.vipLevel;
		data['user_title'] = this.userTitle;
		data['grade'] = this.grade;
		return data;
	}
}

class Comic {
	String name;
	String shortDescription;
	int accredit;
	String type;
	String description;
	String cateId;
	String threadId;
	int seriesStatus;
	int lastUpdateTime;
	String weekMore;
	String affiche;
	int monthGift;
	String lastUpdateWeek;
	String cover;
	String ori;
	String wideCover;
	List<String> themeIds;
	List<ClassifyTags> classifyTags;
	Author author;
	Share share;
	String wideColor;
	List<String> tagList;
	String comicId;
	String isVip;
	String status;
	String userId;
	String clickTotal;
	int favoriteTotal;
	int totalTicket;
	int monthlyTicket;
	String monthTicket;
	int totalTucao;
	int giftTotal;
	int passChapterNum;
	double vipDiscount;
	double yearVipDiscount;
	String commentTotal;
	int isFree;
	bool isVipFree;
	bool isVipBuy;
	int isBuyAction;
	int isAutoBuy;
	String ticketDesc;

	Comic({this.name, this.shortDescription, this.accredit, this.type, this.description, this.cateId, this.threadId, this.seriesStatus, this.lastUpdateTime, this.weekMore, this.affiche, this.monthGift, this.lastUpdateWeek, this.cover, this.ori, this.wideCover, this.themeIds, this.classifyTags, this.author, this.share, this.wideColor, this.tagList, this.comicId, this.isVip, this.status, this.userId, this.clickTotal, this.favoriteTotal, this.totalTicket, this.monthlyTicket, this.monthTicket, this.totalTucao, this.giftTotal, this.passChapterNum, this.vipDiscount, this.yearVipDiscount, this.commentTotal, this.isFree, this.isVipFree, this.isVipBuy, this.isBuyAction, this.isAutoBuy, this.ticketDesc});

	Comic.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		shortDescription = json['short_description'];
		accredit = json['accredit'];
		type = json['type'];
		description = json['description'];
		cateId = json['cate_id'];
		threadId = json['thread_id'];
		seriesStatus = json['series_status'];
		lastUpdateTime = json['last_update_time'];
		weekMore = json['week_more'];
		affiche = json['affiche'];
		monthGift = json['month_gift'];
		lastUpdateWeek = json['last_update_week'];
		cover = json['cover'];
		ori = json['ori'];
		wideCover = json['wideCover'];
		themeIds = json['theme_ids'].cast<String>();
		if (json['classifyTags'] != null) {
			classifyTags = new List<ClassifyTags>();
			json['classifyTags'].forEach((v) { classifyTags.add(new ClassifyTags.fromJson(v)); });
		}
		author = json['author'] != null ? new Author.fromJson(json['author']) : null;
		share = json['share'] != null ? new Share.fromJson(json['share']) : null;
		wideColor = json['wideColor'];
		tagList = json['tagList'].cast<String>();
		comicId = json['comic_id'];
		isVip = json['is_vip'];
		status = json['status'];
		userId = json['user_id'];
		clickTotal = json['click_total'];
		favoriteTotal = json['favorite_total'];
		totalTicket = json['total_ticket'];
		monthlyTicket = json['monthly_ticket'];
		monthTicket = json['month_ticket'];
		totalTucao = json['total_tucao'];
		giftTotal = json['gift_total'];
		passChapterNum = json['pass_chapter_num'];
		vipDiscount = json['vip_discount'];
		yearVipDiscount = json['year_vip_discount'];
		commentTotal = json['comment_total'];
		isFree = json['is_free'];
		isVipFree = json['is_vip_free'];
		isVipBuy = json['is_vip_buy'];
		isBuyAction = json['is_buy_action'];
		isAutoBuy = json['is_auto_buy'];
		ticketDesc = json['ticket_desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['short_description'] = this.shortDescription;
		data['accredit'] = this.accredit;
		data['type'] = this.type;
		data['description'] = this.description;
		data['cate_id'] = this.cateId;
		data['thread_id'] = this.threadId;
		data['series_status'] = this.seriesStatus;
		data['last_update_time'] = this.lastUpdateTime;
		data['week_more'] = this.weekMore;
		data['affiche'] = this.affiche;
		data['month_gift'] = this.monthGift;
		data['last_update_week'] = this.lastUpdateWeek;
		data['cover'] = this.cover;
		data['ori'] = this.ori;
		data['wideCover'] = this.wideCover;
		data['theme_ids'] = this.themeIds;
		if (this.classifyTags != null) {
      data['classifyTags'] = this.classifyTags.map((v) => v.toJson()).toList();
    }
		if (this.author != null) {
      data['author'] = this.author.toJson();
    }
		if (this.share != null) {
      data['share'] = this.share.toJson();
    }
		data['wideColor'] = this.wideColor;
		data['tagList'] = this.tagList;
		data['comic_id'] = this.comicId;
		data['is_vip'] = this.isVip;
		data['status'] = this.status;
		data['user_id'] = this.userId;
		data['click_total'] = this.clickTotal;
		data['favorite_total'] = this.favoriteTotal;
		data['total_ticket'] = this.totalTicket;
		data['monthly_ticket'] = this.monthlyTicket;
		data['month_ticket'] = this.monthTicket;
		data['total_tucao'] = this.totalTucao;
		data['gift_total'] = this.giftTotal;
		data['pass_chapter_num'] = this.passChapterNum;
		data['vip_discount'] = this.vipDiscount;
		data['year_vip_discount'] = this.yearVipDiscount;
		data['comment_total'] = this.commentTotal;
		data['is_free'] = this.isFree;
		data['is_vip_free'] = this.isVipFree;
		data['is_vip_buy'] = this.isVipBuy;
		data['is_buy_action'] = this.isBuyAction;
		data['is_auto_buy'] = this.isAutoBuy;
		data['ticket_desc'] = this.ticketDesc;
		return data;
	}
}

class ClassifyTags {
	String name;
	String argName;
	int argVal;

	ClassifyTags({this.name, this.argName, this.argVal});

	ClassifyTags.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		argName = json['argName'];
		argVal = json['argVal'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['argName'] = this.argName;
		data['argVal'] = this.argVal;
		return data;
	}
}

class Author {
	String avatar;
	String name;
	String id;

	Author({this.avatar, this.name, this.id});

	Author.fromJson(Map<String, dynamic> json) {
		avatar = json['avatar'];
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['avatar'] = this.avatar;
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}

class Share {
	String title;
	String content;
	String cover;
	String url;

	Share({this.title, this.content, this.cover, this.url});

	Share.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		content = json['content'];
		cover = json['cover'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['content'] = this.content;
		data['cover'] = this.cover;
		data['url'] = this.url;
		return data;
	}
}

