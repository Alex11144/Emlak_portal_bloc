import 'package:cached_network_image/cached_network_image.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/ui/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreenWidget extends StatefulWidget {
  final int id;

  const DetailsScreenWidget({super.key, required this.id});

  @override
  State<DetailsScreenWidget> createState() => _DetailsScreenWidgetState();
}

class _DetailsScreenWidgetState extends State<DetailsScreenWidget> {
  final apiClient = ApiClient();
  var imagesList = [];
  dynamic _details;
  // var detailsList;

  Future<void> downloadImages(id) async {
    try {
      final images = await apiClient.getDetailsImages(id);
      // announcesEntity.id = id;
      // announcesEntity.isFromSearch = 'false';
      imagesList += images;
      setState(() {});
    } catch (e) {}
  }

  Future<void> details(id) async {
    _details = await apiClient.getDetails(id);
    // announcesEntity.id = id;
    // announcesEntity.isFromSearch = 'false';

    // print(_details.propertyType);
    // detailsList += _details;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    downloadImages(widget.id);
    details(widget.id);
  }

  var formate1;
  // ignore: prefer_typing_uninitialized_variables
  var dateTime;
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();
    if (_details == null) {
      Future.delayed(const Duration(milliseconds: 3000));
    } else {
      dateTime = DateTime.parse(_details.announceDate);
      formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    }

    final int args = ModalRoute.of(context)!.settings.arguments as int;
    return _details == null
        ? const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppbarWidget(context),
                      ImagesDetailed(
                          imagesList: imagesList, watch: watch, args: args),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
                        child: Text(
                          '${_details.price} AZN',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 26),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 28,
                              width: 78,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(34, 186, 104, 1)),
                              child: Center(
                                child: Text(
                                  _details.roomCount.toString() + ' otaqli',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              height: 28,
                              width: 87,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(34, 186, 104, 1)),
                              child: Center(
                                child: Text(
                                  _details.space.toString() + ' m²',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              height: 28,
                              width: 116,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(34, 186, 104, 1)),
                              child: Center(
                                child: Text(
                                  '${_details.currentFloor.toString() + '/' + _details.floorCount.toString() + ' mərtəbə'}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                      ),
                      MapSiteLocationWidget(
                          details: _details, formate1: formate1),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(113, 158, 158, 158),
                                  width: 0.4)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WifiWidget(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: PhoneNumberWidget(details: _details),
                      ),
                      EtrafliMelumatWidget()
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Padding EtrafliMelumatWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color.fromARGB(108, 158, 158, 158))),
            // width: 313,
            // height: 330,
            child: Column(
              // alignment: AlignmentDirectional.bottomCenter,
              // mainAxisAlignment: MainAxisAlignment.ce,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(_details.text,
                      style: const TextStyle(fontSize: 15),
                      maxLines: descTextShowFlag ? 10 : 5,
                      textAlign: TextAlign.start),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      descTextShowFlag
                          ? const Text(
                              "azalt",
                              style: TextStyle(color: Colors.blue),
                            )
                          : const Text("Etrafli",
                              style: TextStyle(color: Colors.blue))
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      descTextShowFlag = !descTextShowFlag;
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }

  Column WifiWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/WifiHigh.png',
                  ),
                  const Text('Su'),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/WifiHigh.png',
                  ),
                  const Text('Qaz')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/WifiHigh.png',
                  ),
                  const Text('İşıq')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/WifiHigh.png',
                  ),
                  const Text('Su')
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/WifiHigh.png',
                ),
                const Text('Kamera')
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/WifiHigh.png',
                ),
                const Text('Su')
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/WifiHigh.png',
                ),
                const Text('Su')
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/WifiHigh.png',
                ),
                const Text('İnternet')
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row AppbarWidget(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            iconSize: 40,
            onPressed: () => MainNavigation.navigationPop(context),
            icon: Image.asset(
              'assets/images/arrow_back.png',
            )),
        Text(
          _details.propertyType +
              ',' +
              ' ' +
              _details.price.toString() +
              ' AZN',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        IconButton(
            iconSize: 40,
            onPressed: () {
              watch.shareButton();
            },
            icon: Image.asset('assets/images/share_details.png'))
      ],
    );
  }
}

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    Key? key,
    required details,
  })  : _details = details,
        super(key: key);

  final _details;
  _callNumber() async {
    var number = _details.mobile.toString();
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color.fromARGB(113, 158, 158, 158), width: 0.4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/E.png'),
                    const Positioned.fill(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Ə',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 18),
                            ))),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _details.owner,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(_details.ownerType)
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Color.fromRGBO(234, 241, 255, 1),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Container(
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' ${'+ (994) ' + _details.mobile.toString()}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: _callNumber,
                                        icon: Image.asset(
                                            'assets/images/Phone.png'))
                                  ],
                                ),
                              ],
                            ),
                          ));
                },
                icon: Image.asset('assets/images/Phone.png'))
          ],
        ));
  }
}

class MapSiteLocationWidget extends StatelessWidget {
  const MapSiteLocationWidget({
    Key? key,
    required details,
    required this.formate1,
  })  : _details = details,
        super(key: key);

  final _details;
  final formate1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/MapPin.png'),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  _details.address.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset('assets/images/Globe.png'),
              const SizedBox(
                width: 5,
              ),
              Text(
                _details.parserSite,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset('assets/images/Clock.png'),
              const SizedBox(
                width: 5,
              ),
              Text(
                _details.city + ' ,' + formate1,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ImagesDetailed extends StatefulWidget {
  const ImagesDetailed({
    Key? key,
    required this.imagesList,
    required this.watch,
    required this.args,
  }) : super(key: key);

  final List imagesList;
  final SatilanEvlerData watch;
  final int args;

  @override
  State<ImagesDetailed> createState() => _ImagesDetailedState();
}

class _ImagesDetailedState extends State<ImagesDetailed> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final favourites = context.watch<SatilanEvlerData>().favorite;
    final watch = context.watch<SatilanEvlerData>();

    final model = context.watch<QovluqlarData>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.imagesList.isNotEmpty
            ? Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () => MainNavigation.navigateToDetailedImages(
                            context, widget.imagesList),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width / 1.75,
                            height: 190,
                            imageUrl: 'https://d2jcoi69vojtfw.cloudfront.net/' +
                                widget.imagesList[currentIndex],
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.transparent,
                          child: IconButton(
                              onPressed: () {
                                widget.watch.favouritesPostToDb(
                                  widget.args,
                                );
                                // model.modalBottomSheet(context);
                              },
                              icon: favourites
                                      .map((e) => e.id)
                                      .contains(widget.args)
                                  ? SvgPicture.asset(
                                      'assets/images/HeartStraightRed.svg')
                                  : SvgPicture.asset(
                                      'assets/images/heartIcon.svg')))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: 192,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: widget.imagesList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 3.2),
                            child: InkWell(
                              onTap: () {
                                currentIndex = index;
                                setState(() {});
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  // width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  imageUrl:
                                      'https://d2jcoi69vojtfw.cloudfront.net/' +
                                          widget.imagesList[index],
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            : const CircularProgressIndicator());
  }
}
