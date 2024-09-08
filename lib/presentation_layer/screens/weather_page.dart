import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modern_weather_app/core/helpers/helpers.dart';
import 'package:modern_weather_app/presentation_layer/screens/gpt_page.dart';
import '../../data_layer/model.dart';

class WeatherHome extends StatelessWidget {

  final Weather weather;

  WeatherHome({super.key , required this.weather});

	Widget getWeatherIcon(int code) {
		switch (code) {
		  case >= 200 && < 300 :
		    return Image.asset(
					'assets/1.png'
				);
			case >= 300 && < 400 :
		    return Image.asset(
					'assets/2.png'
				);
			case >= 500 && < 600 :
		    return Image.asset(
					'assets/3.png'
				);
			case >= 600 && < 700 :
		    return Image.asset(
					'assets/4.png'
				);
			case >= 700 && < 800 :
		    return Image.asset(
					'assets/5.png'
				);
			case == 800 :
		    return Image.asset(
					'assets/6.png'
				);
			case > 800 && <= 804 :
		    return Image.asset(
					'assets/7.png'
				);
		  default:
			return Image.asset('assets/7.png');
		}
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: Colors.black,
			extendBodyBehindAppBar: true,
			appBar: AppBar(
				backgroundColor: Colors.transparent,
				elevation: 0,
				systemOverlayStyle: const SystemUiOverlayStyle(
					statusBarBrightness: Brightness.dark
				),
			),
			body: Padding(
        
				padding: const EdgeInsets.fromLTRB(40, 24, 40, 20),
				child: Container(
          decoration: BoxDecoration(color:const Color.fromARGB(255, 61, 110, 63)),
					height: MediaQuery.of(context).size.height,
					child: Stack(
						children: [
							Align(
								alignment: const AlignmentDirectional(3, -0.3),
								child: Container(
									height: 300,
									width: 300,
									decoration: const BoxDecoration(
										shape: BoxShape.circle,
										color: Colors.deepPurple
									),
								),
							),
							Align(
								alignment: const AlignmentDirectional(-3, -0.3),
								child: Container(
									height: 300 ,
									width: 300, 
									decoration: const BoxDecoration(
										shape: BoxShape.circle,
										color: Color(0xFF673AB7)
									),
								),
							),
							Align(
								alignment: const AlignmentDirectional(0, -1.2),
								child: Container(
									height: 300,
									width: 600,
									decoration: const BoxDecoration(
										color: Color(0xFFFFAB40)
									),
								),
							),
							BackdropFilter(
								filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
								child: Container(
									decoration: const BoxDecoration(color: Colors.transparent),
								),
							),
										 SizedBox(
											width: MediaQuery.of(context).size.width,
											height: 720,
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Row(children: [
                            Text(
														'🌍 ${weather.countryAreaName}',
														style: const TextStyle(
															color: Colors.white,
															fontWeight: FontWeight.w300
														),
													),
                          Spacer(),
                          IconButton(onPressed: () async {
                                print("go to gpt");
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GPTPage(),
                                  ),
                                );                             
                          }, icon: Image.asset('assets/chatgpt_icon.png',scale:10.0))
                          ]),
													const Text(
														'Good Morning',
														style: TextStyle(
															color: Colors.white,
															fontSize: 25,
															fontWeight: FontWeight.bold
														),
													),
													getWeatherIcon(weather.conditionCode),
													Center(
														child: Text(
															'${fromkelvinToCelsius(weather.currentTemperature).round()}°C',
															style: const TextStyle(
																color: Colors.white,
																fontSize: 35,
																fontWeight: FontWeight.w600
															),
														),
													),
													Center(
														child: Text(
															'${weather.main.toUpperCase()}',
															style: const TextStyle(
																color: Colors.white,
																fontSize: 25,
																fontWeight: FontWeight.w500
															),
														),
													),
													const SizedBox(height: 5),
													Center(
														child: Text(
															DateFormat('EEEE dd •').add_jm().format(DateTime.now()),
															style: const TextStyle(
																color: Colors.white,
																fontSize: 16,
																fontWeight: FontWeight.w300
															),
														),
													),
													const SizedBox(height: 30),
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															Row(
																children: [
																	Image.asset(
																		'assets/11.png',
																		scale: 8,
																	),
																	const SizedBox(width: 5),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			const Text(
																				'Sunrise',
																				style: TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w300
																				),
																			),
																			const SizedBox(height: 3),
																			Text(
                                        weather.sunriseTime,
																				style: const TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w700
																				),
																			),
																		],
																	)
																],
															),
															Row(
																children: [
																	Image.asset(
																		'assets/12.png',
																		scale: 8,
																	),
																	const SizedBox(width: 5),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			const Text(
																				'Sunset',
																				style: TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w300
																				),
																			),
																			const SizedBox(height: 3),
																			Text(
                                        weather.sunsetTime,
																				style: const TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w700
																				),
																			),
																		],
																	)
																],
															),
														],
													),
													const Padding(
														padding: EdgeInsets.symmetric(vertical: 5.0),
														child: Divider(
															color: Colors.grey,
														),
													),
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															Row(
																children: [
																	Image.asset(
																		'assets/13.png',
																		scale: 8,
																	),
																	const SizedBox(width: 5),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			const Text(
																				'Temp Max',
																				style: TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w300
																				),
																			),
																			const SizedBox(height: 3),
																			Text(
																				"${fromkelvinToCelsius(weather.temperatureMax).round()} °C",
																				style: const TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w700
																				),
																			),
																		],
																	)
																]
															),
															Row(
																children: [
																	Image.asset(
																		'assets/14.png',
																		scale: 8,
																	),
																	const SizedBox(width: 5),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			const Text(
																				'Temp Min',
																				style: TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w300
																				),
																			),
																			const SizedBox(height: 3),
																			Text(
																				"${fromkelvinToCelsius(weather.temperatureMin).round()} °C",
																				style: const TextStyle(
																					color: Colors.white,
																					fontWeight: FontWeight.w700
																				),
																			),
																		],
																	)
																]
															)
														],
													),
												],
											),
										)
						],
					),
				),
			),
		);
  }
}
