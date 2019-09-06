class HomeBeanEntity {
	List<HomeBeanResobj> resobj;
	String rescode;

	HomeBeanEntity({this.resobj, this.rescode});

	HomeBeanEntity.fromJson(Map<String, dynamic> json) {
		if (json['resobj'] != null) {
			resobj = new List<HomeBeanResobj>();(json['resobj'] as List).forEach((v) { resobj.add(new HomeBeanResobj.fromJson(v)); });
		}
		rescode = json['rescode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.resobj != null) {
      data['resobj'] =  this.resobj.map((v) => v.toJson()).toList();
    }
		data['rescode'] = this.rescode;
		return data;
	}
}

class HomeBeanResobj {
	String livePersonCount;
	String livePersonName;
	String liveImg;
	String liveSubName;
	String liveTitleName;

	HomeBeanResobj({this.livePersonCount, this.livePersonName, this.liveImg, this.liveSubName, this.liveTitleName});

	HomeBeanResobj.fromJson(Map<String, dynamic> json) {
		livePersonCount = json['live_person_count'];
		livePersonName = json['live_person_name'];
		liveImg = json['live_img'];
		liveSubName = json['live_sub_name'];
		liveTitleName = json['live_title_name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['live_person_count'] = this.livePersonCount;
		data['live_person_name'] = this.livePersonName;
		data['live_img'] = this.liveImg;
		data['live_sub_name'] = this.liveSubName;
		data['live_title_name'] = this.liveTitleName;
		return data;
	}
}
