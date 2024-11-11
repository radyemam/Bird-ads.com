import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart';

class InterestsPage extends StatefulWidget {
  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  final List<String> _allInterests = [
    S.current.clothes,
    S.current.belt_clothes,
    S.current.sports_swimwear,
    S.current.republic_clothing_remix,
    S.current.organic_clothing,
    S.current.work_clothes,
    S.current.fashion_picture,
    S.current.castro_clothes,
    S.current.pinup_channel_clothes,
    S.current.charlotte_rousse_retailer,
    S.current.underwear,
    S.current.hot_clothes,
    S.current.exclusive_clothes,
    S.current.garage_retailer,
    S.current.fila_sportswear,
    S.current.strategy_games,
    S.current.property,
    S.current.hotels,
    S.current.writing,
    S.current.advertising,
    S.current.loud_music,
    S.current.anime_movies,
    S.current.coffee,
    S.current.heavy_metal_music,
    S.current.hard_drives,
    S.current.card_games,
    S.current.vegetarian,
    S.current.bodybuilding,
    S.current.economics,
    S.current.politics,
    S.current.design,
    S.current.cooking,
    S.current.horror_movies,
    S.current.network_storage,
    S.current.law,
    S.current.puzzle_video_games,
    S.current.pizza,
    S.current.sculpture,
    S.current.consumer_electronics,
    S.current.juice,
    S.current.dancing,
    S.current.free_software,
    S.current.marathon,
    S.current.beaches,
    S.current.tourism,
    S.current.lakes,
    S.current.browser_games,
    S.current.barbecue,
    S.current.scouts,
    S.current.marriage,
    S.current.perfumes,
    S.current.hair_products,
    S.current.books,
    S.current.pet_food,
    S.current.online_banking,
    S.current.weight_training,
    S.current.diy,
    S.current.tea,
    S.current.family,
    S.current.indian_cuisine,
    S.current.national_music,
    S.current.ice_skating,
    S.current.golf,
    S.current.sports_games,
    S.current.internet_ads,
    S.current.seo,
    S.current.credit_cards,
    S.current.entrepreneurship,
    S.current.fast_food_restaurants,
    S.current.drama_movies,
    S.current.documentary_movies,
    S.current.american_football,
    S.current.role_playing_games,
    S.current.reptiles,
    S.current.portable_media_players,
    S.current.racing_games,
    S.current.fitness_wellness,
    S.current.recipes,
    S.current.website_hosting,
    S.current.social_media_marketing,
    S.current.investing,
    S.current.energy_drinks,
    S.current.shopping_centers,
    S.current.drums,
    S.current.home_appliances,
    S.current.vietnamese_cuisine,
    S.current.shoes,
    S.current.online_shopping,
    S.current.camping,
    S.current.fashion_accessories,
    S.current.computer_memory,
    S.current.entertainment,
    S.current.triathlon,
    S.current.musical_theater,
    S.current.nature,
    S.current.motorcycles,
    S.current.basketball,
    S.current.nightclubs,
    S.current.mobile_homes,
    S.current.construction,
    S.current.tennis,
    S.current.casual_restaurants,
    S.current.management,
    S.current.web_design,
    S.current.business,
    S.current.alcoholic_drink,
    S.current.computers,
    S.current.children_clothes,
    S.current.weddings,
    S.current.french_cuisine,
    S.current.plays,
    S.current.charity_causes,
    S.current.non_fiction_books,
    S.current.action_games,
    S.current.diners,
    S.current.seafood,
    S.current.literature,
    S.current.ballet,
    S.current.simulation_games,
    S.current.casino_games,
    S.current.dancehall,
    S.current.sunglasses,
    S.current.health_products,
    S.current.shopping,
    S.current.fashion_design,
    S.current.jewelry,
    S.current.blues_music,
    S.current.sports,
    S.current.reality_tv,
    S.current.higher_education,
    S.current.fiction_books,
    S.current.gps_devices,
    S.current.mmorpg,
    S.current.middle_eastern_cuisine,
    S.current.handbags,
    S.current.sci_fi_movies,
    S.current.magazines,
    S.current.romance_novels,
    S.current.people_carriers,
    S.current.insurance,
    S.current.discount_stores,
    S.current.air_travel,
    S.current.televisions,
    S.current.thriller_movies,
    S.current.cruises,
    S.current.hip_hop_music,
    S.current.parenting,
    S.current.mountain_biking,
    S.current.car_rentals,
    S.current.trucks,
    S.current.graphic_design,
    S.current.latin_american_cuisine,
    S.current.italian_cuisine,
    S.current.boutiques,
    S.current.fishing,
    S.current.crafts,
    S.current.football,
    S.current.soul_music,
    S.current.spanish_cuisine,
    S.current.music_festivals,
    S.current.computer_monitors,
    S.current.desktop_computers,
    S.current.electric_car,
    S.current.cafes,
    S.current.boats,
    S.current.candy,
    S.current.beauty,
    S.current.science,
    S.current.cosmetics,
    S.current.organic_food,
    S.current.adventure_trip,
    S.current.home_decor,
    S.current.small_business,
    S.current.holidays,
    S.current.volleyball,
    S.current.classical_music,
    S.current.theater,
    S.current.mexican_cuisine,
    S.current.aviation,
    S.current.parties,
    S.current.mobile_phones,
    S.current.surfing,
    S.current.mystery_fiction,
    S.current.outdoor_recreation,
    S.current.motherhood,
    S.current.singing,
    S.current.reading,
    S.current.video_cameras,
    S.current.music,
    S.current.gambling,
    S.current.japanese_cuisine,
    S.current.online_poker,
    S.current.arts_music,
    S.current.tattoos,
    S.current.coupons,
    S.current.gardens,
    S.current.community_issues,
    S.current.ecotourism,
    S.current.first_person_shooters,
    S.current.retail_banking,
    S.current.investment_banking,
    S.current.mountains,
    S.current.children_games,
    S.current.sales,
    S.current.ebooks,
    S.current.manga,
    S.current.email_marketing,
    S.current.beauty_salons,
    S.current.baseball,
    S.current.thai_cuisine,
    S.current.smartphones,
    S.current.projectors,
    S.current.web_development,
    S.current.current_events,
    S.current.drinks,
    S.current.greek_cuisine,
    S.current.yoga,
    S.current.cameras,
    S.current.skiing,
    S.current.dogs,
    S.current.pop_music,
    S.current.music_videos,
    S.current.korean_cuisine,
    S.current.digital_marketing,
    S.current.tv_game_shows,
    S.current.furniture,
    S.current.animated_movies,
    S.current.vehicles,
    S.current.volunteering,
    S.current.mortgage_loans,
    S.current.computer_processors,
    S.current.personal_finance,
    S.current.car_racing,
    S.current.jazz_music,
    S.current.wine,
    S.current.performing_arts,
    S.current.cats,
    S.current.bollywood_movies,
    S.current.comedy_movies,
    S.current.college_football,
    S.current.tv_talk_shows,
    S.current.tv_programs,
    S.current.cars,
    S.current.fine_arts,
    S.current.dresses,
    S.current.dance_music,
    S.current.dishes,
    S.current.rhythm_blues_music,
    S.current.bars,
    S.current.fish
  ];

  final List<String> _filteredInterests = [];
  List<String> _selectedInterests = [];
  final TextEditingController _searchController = TextEditingController();
  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadSelectedInterests();
    _filteredInterests.addAll(_allInterests);
  }

  Future<void> _loadSelectedInterests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedInterests = prefs.getStringList('selectedInterests') ?? [];
    });
  }

  void _filterInterests(String query) {
    final filtered = _allInterests.where((interest) => interest.contains(query)).toList();
    setState(() {
      _filteredInterests.clear();
      _filteredInterests.addAll(filtered);
    });
  }

  void _toggleInterest(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  Future<void> _saveInterests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedInterests', _selectedInterests);
    Navigator.pop(context, _selectedInterests);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).search_interests, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: S.of(context).enter_interests,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: _filterInterests,
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _selectedInterests.map((interest) {
                    return Chip(
                      label: Text(interest),
                      onDeleted: () {
                        _toggleInterest(interest);
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _filteredInterests.length,
                  itemBuilder: (context, index) {
                    final interest = _filteredInterests[index];
                    final isSelected = _selectedInterests.contains(interest);
                    return GestureDetector(
                      onTap: () {
                        _toggleInterest(interest);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green[100] : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.green : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            interest,
                            style: TextStyle(
                              color: isSelected ? Colors.green[700] : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 80), // Add some space at the bottom
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _saveInterests,
              child: Text(S.of(context).save, style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
