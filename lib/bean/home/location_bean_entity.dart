class LocationBeanEntity {
	dynamic altitude;
	String country;
	String city;
	String cityCode;
	dynamic latitude;
	dynamic accuracy;
	int errorCode;
	String errorInfo;
	dynamic locationType;
	dynamic trustedLevel;
	dynamic speed;
	String coordType;
	String province;
	String locationDetail;
	String provider;
	String street;
	String adCode;
	int floor;
	LocationBeanLocationqualityreport locationQualityReport;
	dynamic longitude;
	dynamic satellites;
	String address;
	String poiName;
	dynamic bearing;
	String streetNum;
	String buildingId;
	bool isMock;
	String aoiName;
	bool isFixLastLocation;
	String district;
	bool isOffset;
	dynamic gpsAccuracyStatus;

	LocationBeanEntity({this.altitude, this.country, this.city, this.cityCode, this.latitude, this.accuracy, this.errorCode, this.errorInfo, this.locationType, this.trustedLevel, this.speed, this.coordType, this.province, this.locationDetail, this.provider, this.street, this.adCode, this.floor, this.locationQualityReport, this.longitude, this.satellites, this.address, this.poiName, this.bearing, this.streetNum, this.buildingId, this.isMock, this.aoiName, this.isFixLastLocation, this.district, this.isOffset, this.gpsAccuracyStatus});

	LocationBeanEntity.fromJson(Map<String, dynamic> json) {
		altitude = json['altitude'];
		country = json['country'];
		city = json['city'];
		cityCode = json['cityCode'];
		latitude = json['latitude'];
		accuracy = json['accuracy'];
		errorCode = json['errorCode'];
		errorInfo = json['errorInfo'];
		locationType = json['locationType'];
		trustedLevel = json['trustedLevel'];
		speed = json['speed'];
		coordType = json['coordType'];
		province = json['province'];
		locationDetail = json['locationDetail'];
		provider = json['provider'];
		street = json['street'];
		adCode = json['adCode'];
		floor = json['floor'];
		locationQualityReport = json['locationQualityReport'] != null ? new LocationBeanLocationqualityreport.fromJson(json['locationQualityReport']) : null;
		longitude = json['longitude'];
		satellites = json['satellites'];
		address = json['address'];
		poiName = json['poiName'];
		bearing = json['bearing'];
		streetNum = json['streetNum'];
		buildingId = json['buildingId'];
		isMock = json['isMock'];
		aoiName = json['aoiName'];
		isFixLastLocation = json['isFixLastLocation'];
		district = json['district'];
		isOffset = json['isOffset'];
		gpsAccuracyStatus = json['gpsAccuracyStatus'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['altitude'] = this.altitude;
		data['country'] = this.country;
		data['city'] = this.city;
		data['cityCode'] = this.cityCode;
		data['latitude'] = this.latitude;
		data['accuracy'] = this.accuracy;
		data['errorCode'] = this.errorCode;
		data['errorInfo'] = this.errorInfo;
		data['locationType'] = this.locationType;
		data['trustedLevel'] = this.trustedLevel;
		data['speed'] = this.speed;
		data['coordType'] = this.coordType;
		data['province'] = this.province;
		data['locationDetail'] = this.locationDetail;
		data['provider'] = this.provider;
		data['street'] = this.street;
		data['adCode'] = this.adCode;
		data['floor'] = this.floor;
		if (this.locationQualityReport != null) {
      data['locationQualityReport'] = this.locationQualityReport.toJson();
    }
		data['longitude'] = this.longitude;
		data['satellites'] = this.satellites;
		data['address'] = this.address;
		data['poiName'] = this.poiName;
		data['bearing'] = this.bearing;
		data['streetNum'] = this.streetNum;
		data['buildingId'] = this.buildingId;
		data['isMock'] = this.isMock;
		data['aoiName'] = this.aoiName;
		data['isFixLastLocation'] = this.isFixLastLocation;
		data['district'] = this.district;
		data['isOffset'] = this.isOffset;
		data['gpsAccuracyStatus'] = this.gpsAccuracyStatus;
		return data;
	}
}

class LocationBeanLocationqualityreport {
	String adviseMessage;
	int gpsSatellites;
	int gpsStatus;
	int netUseTime;
	String networkType;
	bool isWifiAble;
	LocationBeanLocationqualityreport({this.adviseMessage, this.gpsSatellites, this.gpsStatus, this.netUseTime, this.networkType, this.isWifiAble});

	LocationBeanLocationqualityreport.fromJson(Map<String, dynamic> json) {
		adviseMessage = json['adviseMessage'];
		gpsSatellites = json['gpsSatellites'];
		gpsStatus = json['gpsStatus'];
		netUseTime = json['netUseTime'];
		networkType = json['networkType'];
		isWifiAble = json['isWifiAble'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['adviseMessage'] = this.adviseMessage;
		data['gpsSatellites'] = this.gpsSatellites;
		data['gpsStatus'] = this.gpsStatus;
		data['netUseTime'] = this.netUseTime;
		data['networkType'] = this.networkType;
		data['isWifiAble'] = this.isWifiAble;
		return data;
	}
}
