class CarData {
  String? id;
  String? name;
  String? price;
  String? version;
  String? image;
  List<Sales>? sales;
  Company? company;
  Company? cartype;
  Segment? segment;
  String? engineType;
  String? enginePower;
  String? engineTorque;
  String? gearBox;
  String? driveSystem;
  String? fuelType;
  String? fuelConsumption;
  String? operatingRange;
  String? fastChargingTime;
  String? batteryType;
  String? batteryCapacity;
  String? horsepower;
  String? capacity;
  String? torque;
  String? seatNumber;
  String? dimensions;
  String? wheelbase;
  String? groundClearance;
  String? turningRadius;
  String? fuelTankCapacity;
  String? tireAndWheel;
  String? luggageCompartmentVolume;
  String? selfWeight;
  String? fullLoadWeight;
  String? highBeam;
  String? proximityLights;
  String? daytimeLights;
  String? taillights;
  bool? automaticHeadlights;
  bool? automaticAngleHeadlights;
  bool? overheadBrakeLights;
  bool? rearviewMirrorDrying;
  bool? fishFinAntenna;
  bool? powerTrunk;
  bool? openTrunkHandsFree;
  bool? inhalationDoors;
  bool? automaticWipers;
  String? rearviewMirror;
  bool? autoHeadlights;
  String? steeringWheelCoverMaterial;
  String? steeringWheelAdjustment;
  bool? steeringWheelHeating;
  bool? steeringWheelPositionMemory;
  String? seatCoverMaterial;
  String? driversSeatAdjustment;
  bool? driversSeatPositionMemory;
  String? passengerSeatAdjustment;
  String? airConditioning;
  String? entertainmentScreen;
  String? speakerSystem;
  bool? driversSeatCooling;
  bool? passengersSeatCooling;
  bool? driversSeatHeating;
  bool? passengersSeatHeating;
  bool? smartKey;
  bool? rearSeatAirVents;
  bool? appleCarPlayConnection;
  bool? androidAutoConnection;
  bool? voiceCommand;
  bool? handsFreeTalk;
  bool? airFilter;
  bool? airQualityControl;
  bool? virtualAssistant;
  bool? wiFiStreaming;
  bool? wirelessCharging;
  bool? panoramicSunroof;
  String? driversDashboard;
  String? oneTouchWindows;
  bool? sunroof;
  String? powerDriversSeat;
  String? electricPassengerSeat;
  bool? autoDimmingInteriorRearviewMirror;
  String? secondRowSeats;
  bool? bluetoothConnection;
  bool? wiFiConnection;
  bool? pushButtonStart;
  String? centralScreen;
  bool? driverSeatMassage;
  bool? passengerSeatMassage;
  bool? steeringWheelIntegratedButtons;
  bool? rearSeatArmrest;
  bool? frontSeatArmrest;
  String? thirdRow;
  String? powerSteering;
  bool? multipleDrivingModes;
  bool? electronicHandbrake;
  bool? automaticBrakeHold;
  bool? activeParkingAssist;
  bool? supportReadingTrafficSignsAndSignals;
  bool? vehicleManagementViaPhoneApp;
  bool? displayInformationOnTheWindshield;
  bool? steeringAssistWhenCornering;
  bool? accelerationControl;
  bool? cruiseControl;
  bool? adaptiveCruiseControl;
  bool? steeringWheelPaddleShifters;
  bool? idlingStop;
  bool? electronicBrake;
  bool? idlingStopStartStop;
  int? airbags;
  bool? adaptiveCruiseControl2;
  bool? antiLockBrakingSystem;
  bool? emergencyBrakeAssist;
  bool? electronicBrakeForceDistribution;
  bool? electronicStabilityControl;
  bool? blindSpotWarning;
  bool? reverseSensor;
  bool? reverseCamera;
  bool? laneDepartureWarning;
  bool? laneKeepingAssist;
  bool? automaticLaneChange;
  bool? automaticCollisionMitigationBrakeAssist;
  bool? crossTrafficWarningWhenReversing;
  bool? drowsyDriverWarning;
  bool? isoFixChildSafetySeatHooks;
  bool? tirePressureSensor;
  bool? frontDistanceSensor;
  bool? preCollisionWarning;
  bool? laneChangeAssist;
  bool? trafficWarningWhenOpeningTheDoor;
  bool? trafficSignRecognition;
  bool? three60degreeCamera;
  bool? tractionControl;
  bool? hillStartAssist;
  bool? hillDescentAssist;
  bool? blindSpotCamera;
  String? rearBrakes;
  String? frontBrakes;
  String? rearSuspension;
  String? frontSuspension;
  bool? acoutlet;
  bool? usbconnection;
  bool? amfmradio;
  bool? auxconnection;

  CarData(
      {this.id,
        this.name,
        this.price,
        this.version,
        this.image,
        this.sales,
        this.company,
        this.cartype,
        this.segment,
        this.engineType,
        this.enginePower,
        this.engineTorque,
        this.gearBox,
        this.driveSystem,
        this.fuelType,
        this.fuelConsumption,
        this.operatingRange,
        this.fastChargingTime,
        this.batteryType,
        this.batteryCapacity,
        this.horsepower,
        this.capacity,
        this.torque,
        this.seatNumber,
        this.dimensions,
        this.wheelbase,
        this.groundClearance,
        this.turningRadius,
        this.fuelTankCapacity,
        this.tireAndWheel,
        this.luggageCompartmentVolume,
        this.selfWeight,
        this.fullLoadWeight,
        this.highBeam,
        this.proximityLights,
        this.daytimeLights,
        this.taillights,
        this.automaticHeadlights,
        this.automaticAngleHeadlights,
        this.overheadBrakeLights,
        this.rearviewMirrorDrying,
        this.fishFinAntenna,
        this.powerTrunk,
        this.openTrunkHandsFree,
        this.inhalationDoors,
        this.automaticWipers,
        this.rearviewMirror,
        this.autoHeadlights,
        this.steeringWheelCoverMaterial,
        this.steeringWheelAdjustment,
        this.steeringWheelHeating,
        this.steeringWheelPositionMemory,
        this.seatCoverMaterial,
        this.driversSeatAdjustment,
        this.driversSeatPositionMemory,
        this.passengerSeatAdjustment,
        this.airConditioning,
        this.entertainmentScreen,
        this.speakerSystem,
        this.driversSeatCooling,
        this.passengersSeatCooling,
        this.driversSeatHeating,
        this.passengersSeatHeating,
        this.smartKey,
        this.rearSeatAirVents,
        this.appleCarPlayConnection,
        this.androidAutoConnection,
        this.voiceCommand,
        this.handsFreeTalk,
        this.airFilter,
        this.airQualityControl,
        this.virtualAssistant,
        this.wiFiStreaming,
        this.wirelessCharging,
        this.panoramicSunroof,
        this.driversDashboard,
        this.oneTouchWindows,
        this.sunroof,
        this.powerDriversSeat,
        this.electricPassengerSeat,
        this.autoDimmingInteriorRearviewMirror,
        this.secondRowSeats,
        this.bluetoothConnection,
        this.wiFiConnection,
        this.pushButtonStart,
        this.centralScreen,
        this.driverSeatMassage,
        this.passengerSeatMassage,
        this.steeringWheelIntegratedButtons,
        this.rearSeatArmrest,
        this.frontSeatArmrest,
        this.thirdRow,
        this.powerSteering,
        this.multipleDrivingModes,
        this.electronicHandbrake,
        this.automaticBrakeHold,
        this.activeParkingAssist,
        this.supportReadingTrafficSignsAndSignals,
        this.vehicleManagementViaPhoneApp,
        this.displayInformationOnTheWindshield,
        this.steeringAssistWhenCornering,
        this.accelerationControl,
        this.cruiseControl,
        this.adaptiveCruiseControl,
        this.steeringWheelPaddleShifters,
        this.idlingStop,
        this.electronicBrake,
        this.idlingStopStartStop,
        this.airbags,
        this.adaptiveCruiseControl2,
        this.antiLockBrakingSystem,
        this.emergencyBrakeAssist,
        this.electronicBrakeForceDistribution,
        this.electronicStabilityControl,
        this.blindSpotWarning,
        this.reverseSensor,
        this.reverseCamera,
        this.laneDepartureWarning,
        this.laneKeepingAssist,
        this.automaticLaneChange,
        this.automaticCollisionMitigationBrakeAssist,
        this.crossTrafficWarningWhenReversing,
        this.drowsyDriverWarning,
        this.isoFixChildSafetySeatHooks,
        this.tirePressureSensor,
        this.frontDistanceSensor,
        this.preCollisionWarning,
        this.laneChangeAssist,
        this.trafficWarningWhenOpeningTheDoor,
        this.trafficSignRecognition,
        this.three60degreeCamera,
        this.tractionControl,
        this.hillStartAssist,
        this.hillDescentAssist,
        this.blindSpotCamera,
        this.rearBrakes,
        this.frontBrakes,
        this.rearSuspension,
        this.frontSuspension,
        this.acoutlet,
        this.usbconnection,
        this.amfmradio,
        this.auxconnection});

  CarData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    version = json['version'];
    image = json['image'];
    if (json['sales'] != null) {
      sales = <Sales>[];
      json['sales'].forEach((v) {
        sales!.add(new Sales.fromJson(v));
      });
    }
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    cartype =
    json['cartype'] != null ? new Company.fromJson(json['cartype']) : null;
    segment =
    json['segment'] != null ? new Segment.fromJson(json['segment']) : null;
    engineType = json['engineType'];
    enginePower = json['enginePower'];
    engineTorque = json['engineTorque'];
    gearBox = json['gearBox'];
    driveSystem = json['driveSystem'];
    fuelType = json['fuelType'];
    fuelConsumption = json['fuelConsumption'];
    operatingRange = json['operatingRange'];
    fastChargingTime = json['fastChargingTime'];
    batteryType = json['batteryType'];
    batteryCapacity = json['batteryCapacity'];
    horsepower = json['horsepower'];
    capacity = json['capacity'];
    torque = json['torque'];
    seatNumber = json['seatNumber'];
    dimensions = json['dimensions'];
    wheelbase = json['wheelbase'];
    groundClearance = json['groundClearance'];
    turningRadius = json['turningRadius'];
    fuelTankCapacity = json['fuelTankCapacity'];
    tireAndWheel = json['tireAndWheel'];
    luggageCompartmentVolume = json['luggageCompartmentVolume'];
    selfWeight = json['selfWeight'];
    fullLoadWeight = json['fullLoadWeight'];
    highBeam = json['highBeam'];
    proximityLights = json['proximityLights'];
    daytimeLights = json['daytimeLights'];
    taillights = json['taillights'];
    automaticHeadlights = json['automaticHeadlights'];
    automaticAngleHeadlights = json['automaticAngleHeadlights'];
    overheadBrakeLights = json['overheadBrakeLights'];
    rearviewMirrorDrying = json['rearviewMirrorDrying'];
    fishFinAntenna = json['fishFinAntenna'];
    powerTrunk = json['powerTrunk'];
    openTrunkHandsFree = json['openTrunkHandsFree'];
    inhalationDoors = json['inhalationDoors'];
    automaticWipers = json['automaticWipers'];
    rearviewMirror = json['rearviewMirror'];
    autoHeadlights = json['autoHeadlights'];
    steeringWheelCoverMaterial = json['steeringWheelCoverMaterial'];
    steeringWheelAdjustment = json['steeringWheelAdjustment'];
    steeringWheelHeating = json['steeringWheelHeating'];
    steeringWheelPositionMemory = json['steeringWheelPositionMemory'];
    seatCoverMaterial = json['seatCoverMaterial'];
    driversSeatAdjustment = json['driversSeatAdjustment'];
    driversSeatPositionMemory = json['driversSeatPositionMemory'];
    passengerSeatAdjustment = json['passengerSeatAdjustment'];
    airConditioning = json['airConditioning'];
    entertainmentScreen = json['entertainmentScreen'];
    speakerSystem = json['speakerSystem'];
    driversSeatCooling = json['driversSeatCooling'];
    passengersSeatCooling = json['passengersSeatCooling'];
    driversSeatHeating = json['driversSeatHeating'];
    passengersSeatHeating = json['passengersSeatHeating'];
    smartKey = json['smartKey'];
    rearSeatAirVents = json['rearSeatAirVents'];
    appleCarPlayConnection = json['appleCarPlayConnection'];
    androidAutoConnection = json['androidAutoConnection'];
    voiceCommand = json['voiceCommand'];
    handsFreeTalk = json['handsFreeTalk'];
    airFilter = json['airFilter'];
    airQualityControl = json['airQualityControl'];
    virtualAssistant = json['virtualAssistant'];
    wiFiStreaming = json['wiFiStreaming'];
    wirelessCharging = json['wirelessCharging'];
    panoramicSunroof = json['panoramicSunroof'];
    driversDashboard = json['driversDashboard'];
    oneTouchWindows = json['oneTouchWindows'];
    sunroof = json['sunroof'];
    powerDriversSeat = json['powerDriversSeat'];
    electricPassengerSeat = json['electricPassengerSeat'];
    autoDimmingInteriorRearviewMirror =
    json['autoDimmingInteriorRearviewMirror'];
    secondRowSeats = json['secondRowSeats'];
    bluetoothConnection = json['bluetoothConnection'];
    wiFiConnection = json['wiFiConnection'];
    pushButtonStart = json['pushButtonStart'];
    centralScreen = json['centralScreen'];
    driverSeatMassage = json['driverSeatMassage'];
    passengerSeatMassage = json['passengerSeatMassage'];
    steeringWheelIntegratedButtons = json['steeringWheelIntegratedButtons'];
    rearSeatArmrest = json['rearSeatArmrest'];
    frontSeatArmrest = json['frontSeatArmrest'];
    thirdRow = json['thirdRow'];
    powerSteering = json['powerSteering'];
    multipleDrivingModes = json['multipleDrivingModes'];
    electronicHandbrake = json['electronicHandbrake'];
    automaticBrakeHold = json['automaticBrakeHold'];
    activeParkingAssist = json['activeParkingAssist'];
    supportReadingTrafficSignsAndSignals =
    json['supportReadingTrafficSignsAndSignals'];
    vehicleManagementViaPhoneApp = json['vehicleManagementViaPhoneApp'];
    displayInformationOnTheWindshield =
    json['displayInformationOnTheWindshield'];
    steeringAssistWhenCornering = json['steeringAssistWhenCornering'];
    accelerationControl = json['accelerationControl'];
    cruiseControl = json['cruiseControl'];
    adaptiveCruiseControl = json['adaptiveCruiseControl'];
    steeringWheelPaddleShifters = json['steeringWheelPaddleShifters'];
    idlingStop = json['idlingStop'];
    electronicBrake = json['electronicBrake'];
    idlingStopStartStop = json['idlingStopStartStop'];
    airbags = json['airbags'];
    adaptiveCruiseControl2 = json['adaptiveCruiseControl2'];
    antiLockBrakingSystem = json['antiLockBrakingSystem'];
    emergencyBrakeAssist = json['emergencyBrakeAssist'];
    electronicBrakeForceDistribution = json['electronicBrakeForceDistribution'];
    electronicStabilityControl = json['electronicStabilityControl'];
    blindSpotWarning = json['blindSpotWarning'];
    reverseSensor = json['reverseSensor'];
    reverseCamera = json['reverseCamera'];
    laneDepartureWarning = json['laneDepartureWarning'];
    laneKeepingAssist = json['laneKeepingAssist'];
    automaticLaneChange = json['automaticLaneChange'];
    automaticCollisionMitigationBrakeAssist =
    json['automaticCollisionMitigationBrakeAssist'];
    crossTrafficWarningWhenReversing = json['crossTrafficWarningWhenReversing'];
    drowsyDriverWarning = json['drowsyDriverWarning'];
    isoFixChildSafetySeatHooks = json['isoFixChildSafetySeatHooks'];
    tirePressureSensor = json['tirePressureSensor'];
    frontDistanceSensor = json['frontDistanceSensor'];
    preCollisionWarning = json['preCollisionWarning'];
    laneChangeAssist = json['laneChangeAssist'];
    trafficWarningWhenOpeningTheDoor = json['trafficWarningWhenOpeningTheDoor'];
    trafficSignRecognition = json['trafficSignRecognition'];
    three60degreeCamera = json['three60degreeCamera'];
    tractionControl = json['tractionControl'];
    hillStartAssist = json['hillStartAssist'];
    hillDescentAssist = json['hillDescentAssist'];
    blindSpotCamera = json['blindSpotCamera'];
    rearBrakes = json['rearBrakes'];
    frontBrakes = json['frontBrakes'];
    rearSuspension = json['rearSuspension'];
    frontSuspension = json['frontSuspension'];
    acoutlet = json['acoutlet'];
    usbconnection = json['usbconnection'];
    amfmradio = json['amfmradio'];
    auxconnection = json['auxconnection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['version'] = this.version;
    data['image'] = this.image;
    if (this.sales != null) {
      data['sales'] = this.sales!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.cartype != null) {
      data['cartype'] = this.cartype!.toJson();
    }
    if (this.segment != null) {
      data['segment'] = this.segment!.toJson();
    }
    data['engineType'] = this.engineType;
    data['enginePower'] = this.enginePower;
    data['engineTorque'] = this.engineTorque;
    data['gearBox'] = this.gearBox;
    data['driveSystem'] = this.driveSystem;
    data['fuelType'] = this.fuelType;
    data['fuelConsumption'] = this.fuelConsumption;
    data['operatingRange'] = this.operatingRange;
    data['fastChargingTime'] = this.fastChargingTime;
    data['batteryType'] = this.batteryType;
    data['batteryCapacity'] = this.batteryCapacity;
    data['horsepower'] = this.horsepower;
    data['capacity'] = this.capacity;
    data['torque'] = this.torque;
    data['seatNumber'] = this.seatNumber;
    data['dimensions'] = this.dimensions;
    data['wheelbase'] = this.wheelbase;
    data['groundClearance'] = this.groundClearance;
    data['turningRadius'] = this.turningRadius;
    data['fuelTankCapacity'] = this.fuelTankCapacity;
    data['tireAndWheel'] = this.tireAndWheel;
    data['luggageCompartmentVolume'] = this.luggageCompartmentVolume;
    data['selfWeight'] = this.selfWeight;
    data['fullLoadWeight'] = this.fullLoadWeight;
    data['highBeam'] = this.highBeam;
    data['proximityLights'] = this.proximityLights;
    data['daytimeLights'] = this.daytimeLights;
    data['taillights'] = this.taillights;
    data['automaticHeadlights'] = this.automaticHeadlights;
    data['automaticAngleHeadlights'] = this.automaticAngleHeadlights;
    data['overheadBrakeLights'] = this.overheadBrakeLights;
    data['rearviewMirrorDrying'] = this.rearviewMirrorDrying;
    data['fishFinAntenna'] = this.fishFinAntenna;
    data['powerTrunk'] = this.powerTrunk;
    data['openTrunkHandsFree'] = this.openTrunkHandsFree;
    data['inhalationDoors'] = this.inhalationDoors;
    data['automaticWipers'] = this.automaticWipers;
    data['rearviewMirror'] = this.rearviewMirror;
    data['autoHeadlights'] = this.autoHeadlights;
    data['steeringWheelCoverMaterial'] = this.steeringWheelCoverMaterial;
    data['steeringWheelAdjustment'] = this.steeringWheelAdjustment;
    data['steeringWheelHeating'] = this.steeringWheelHeating;
    data['steeringWheelPositionMemory'] = this.steeringWheelPositionMemory;
    data['seatCoverMaterial'] = this.seatCoverMaterial;
    data['driversSeatAdjustment'] = this.driversSeatAdjustment;
    data['driversSeatPositionMemory'] = this.driversSeatPositionMemory;
    data['passengerSeatAdjustment'] = this.passengerSeatAdjustment;
    data['airConditioning'] = this.airConditioning;
    data['entertainmentScreen'] = this.entertainmentScreen;
    data['speakerSystem'] = this.speakerSystem;
    data['driversSeatCooling'] = this.driversSeatCooling;
    data['passengersSeatCooling'] = this.passengersSeatCooling;
    data['driversSeatHeating'] = this.driversSeatHeating;
    data['passengersSeatHeating'] = this.passengersSeatHeating;
    data['smartKey'] = this.smartKey;
    data['rearSeatAirVents'] = this.rearSeatAirVents;
    data['appleCarPlayConnection'] = this.appleCarPlayConnection;
    data['androidAutoConnection'] = this.androidAutoConnection;
    data['voiceCommand'] = this.voiceCommand;
    data['handsFreeTalk'] = this.handsFreeTalk;
    data['airFilter'] = this.airFilter;
    data['airQualityControl'] = this.airQualityControl;
    data['virtualAssistant'] = this.virtualAssistant;
    data['wiFiStreaming'] = this.wiFiStreaming;
    data['wirelessCharging'] = this.wirelessCharging;
    data['panoramicSunroof'] = this.panoramicSunroof;
    data['driversDashboard'] = this.driversDashboard;
    data['oneTouchWindows'] = this.oneTouchWindows;
    data['sunroof'] = this.sunroof;
    data['powerDriversSeat'] = this.powerDriversSeat;
    data['electricPassengerSeat'] = this.electricPassengerSeat;
    data['autoDimmingInteriorRearviewMirror'] =
        this.autoDimmingInteriorRearviewMirror;
    data['secondRowSeats'] = this.secondRowSeats;
    data['bluetoothConnection'] = this.bluetoothConnection;
    data['wiFiConnection'] = this.wiFiConnection;
    data['pushButtonStart'] = this.pushButtonStart;
    data['centralScreen'] = this.centralScreen;
    data['driverSeatMassage'] = this.driverSeatMassage;
    data['passengerSeatMassage'] = this.passengerSeatMassage;
    data['steeringWheelIntegratedButtons'] =
        this.steeringWheelIntegratedButtons;
    data['rearSeatArmrest'] = this.rearSeatArmrest;
    data['frontSeatArmrest'] = this.frontSeatArmrest;
    data['thirdRow'] = this.thirdRow;
    data['powerSteering'] = this.powerSteering;
    data['multipleDrivingModes'] = this.multipleDrivingModes;
    data['electronicHandbrake'] = this.electronicHandbrake;
    data['automaticBrakeHold'] = this.automaticBrakeHold;
    data['activeParkingAssist'] = this.activeParkingAssist;
    data['supportReadingTrafficSignsAndSignals'] =
        this.supportReadingTrafficSignsAndSignals;
    data['vehicleManagementViaPhoneApp'] = this.vehicleManagementViaPhoneApp;
    data['displayInformationOnTheWindshield'] =
        this.displayInformationOnTheWindshield;
    data['steeringAssistWhenCornering'] = this.steeringAssistWhenCornering;
    data['accelerationControl'] = this.accelerationControl;
    data['cruiseControl'] = this.cruiseControl;
    data['adaptiveCruiseControl'] = this.adaptiveCruiseControl;
    data['steeringWheelPaddleShifters'] = this.steeringWheelPaddleShifters;
    data['idlingStop'] = this.idlingStop;
    data['electronicBrake'] = this.electronicBrake;
    data['idlingStopStartStop'] = this.idlingStopStartStop;
    data['airbags'] = this.airbags;
    data['adaptiveCruiseControl2'] = this.adaptiveCruiseControl2;
    data['antiLockBrakingSystem'] = this.antiLockBrakingSystem;
    data['emergencyBrakeAssist'] = this.emergencyBrakeAssist;
    data['electronicBrakeForceDistribution'] =
        this.electronicBrakeForceDistribution;
    data['electronicStabilityControl'] = this.electronicStabilityControl;
    data['blindSpotWarning'] = this.blindSpotWarning;
    data['reverseSensor'] = this.reverseSensor;
    data['reverseCamera'] = this.reverseCamera;
    data['laneDepartureWarning'] = this.laneDepartureWarning;
    data['laneKeepingAssist'] = this.laneKeepingAssist;
    data['automaticLaneChange'] = this.automaticLaneChange;
    data['automaticCollisionMitigationBrakeAssist'] =
        this.automaticCollisionMitigationBrakeAssist;
    data['crossTrafficWarningWhenReversing'] =
        this.crossTrafficWarningWhenReversing;
    data['drowsyDriverWarning'] = this.drowsyDriverWarning;
    data['isoFixChildSafetySeatHooks'] = this.isoFixChildSafetySeatHooks;
    data['tirePressureSensor'] = this.tirePressureSensor;
    data['frontDistanceSensor'] = this.frontDistanceSensor;
    data['preCollisionWarning'] = this.preCollisionWarning;
    data['laneChangeAssist'] = this.laneChangeAssist;
    data['trafficWarningWhenOpeningTheDoor'] =
        this.trafficWarningWhenOpeningTheDoor;
    data['trafficSignRecognition'] = this.trafficSignRecognition;
    data['three60degreeCamera'] = this.three60degreeCamera;
    data['tractionControl'] = this.tractionControl;
    data['hillStartAssist'] = this.hillStartAssist;
    data['hillDescentAssist'] = this.hillDescentAssist;
    data['blindSpotCamera'] = this.blindSpotCamera;
    data['rearBrakes'] = this.rearBrakes;
    data['frontBrakes'] = this.frontBrakes;
    data['rearSuspension'] = this.rearSuspension;
    data['frontSuspension'] = this.frontSuspension;
    data['acoutlet'] = this.acoutlet;
    data['usbconnection'] = this.usbconnection;
    data['amfmradio'] = this.amfmradio;
    data['auxconnection'] = this.auxconnection;
    return data;
  }
}

class Sales {
  String? id;
  int? month;
  int? north;
  int? central;
  int? south;
  String? car;

  Sales({this.id, this.month, this.north, this.central, this.south, this.car});

  Sales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    month = json['month'];
    north = json['north'];
    central = json['central'];
    south = json['south'];
    car = json['car'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['month'] = this.month;
    data['north'] = this.north;
    data['central'] = this.central;
    data['south'] = this.south;
    data['car'] = this.car;
    return data;
  }
}

class Company {
  String? id;
  String? img;
  String? name;
  String? description;
  List<String>? cars;

  Company({this.id, this.img, this.name, this.description, this.cars});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    description = json['description'];
    cars = json['cars'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cars'] = this.cars;
    return data;
  }
}

class Segment {
  String? id;
  String? name;
  String? description;
  List<String>? cars;

  Segment({this.id, this.name, this.description, this.cars});

  Segment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    cars = json['cars'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cars'] = this.cars;
    return data;
  }
}