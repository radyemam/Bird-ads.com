// lib/screens/create_ad/location_selection_page.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart';

class LocationSelectionPage extends StatefulWidget {
  @override
  _LocationSelectionPageState createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  List<String> _selectedCountries = [];
  List<String> _selectedRegions = [];
  String? _selectedCountry;
  String? _selectedRegion;
  List<String> _excludedAreas = [];
  bool _showError = false;
  bool _showExcludedAreas = false; // Flag to control the visibility of excluded areas

  final Map<String, List<String>> _countryRegions = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localizations = S.of(context);
    setState(() {
      _countryRegions.addAll({
        localizations.egypt: [
          localizations.egypt_all,
          localizations.cairo,
          localizations.giza,
          localizations.alexandria,
          localizations.luxor,
          localizations.aswan,
          localizations.faiyum,
          localizations.gharbia,
          localizations.sharqia,
          localizations.dakahlia,
          localizations.qalyubia,
          localizations.monufia,
          localizations.kafr_el_sheikh,
          localizations.beheira,
          localizations.matruh,
          localizations.north_sinai,
          localizations.south_sinai,
          localizations.red_sea,
          localizations.suez,
          localizations.port_said,
          localizations.ismailia,
          localizations.minya,
          localizations.asyut,
          localizations.sohag,
          localizations.qena,
          localizations.bani_suef,
          localizations.new_valley,
          localizations.damietta
        ],
        localizations.saudi_arabia: [
          localizations.saudi_all,
          localizations.riyadh,
          localizations.jeddah,
          localizations.mecca,
          localizations.medina,
          localizations.dammam,
          localizations.khobar,
          localizations.taif,
          localizations.buraidah,
          localizations.abha,
          localizations.khamis_mushait,
          localizations.hail,
          localizations.arar,
          localizations.jazan,
          localizations.najran,
          localizations.tabuk,
          localizations.al_bahah,
          localizations.sakaka,
          localizations.dhahran
        ],
        localizations.kuwait: [
          localizations.kuwait_all,
          localizations.capital,
          localizations.farwaniya,
          localizations.jahra,
          localizations.hawalli,
          localizations.ahmadi,
          localizations.mubarak_al_kabeer
        ],
        localizations.uae: [
          localizations.uae_all,
          localizations.abu_dhabi,
          localizations.dubai,
          localizations.sharjah,
          localizations.ajman,
          localizations.ras_al_khaimah,
          localizations.fujairah,
          localizations.umm_al_quwain
        ],
        localizations.qatar: [
          localizations.qatar_all,
          localizations.doha,
          localizations.rayyan,
          localizations.wakra,
          localizations.khor,
          localizations.shamal,
          localizations.um_said,
          localizations.shayhaniya
        ],
        localizations.bahrain: [
          localizations.bahrain_all,
          localizations.manama,
          localizations.muharraq,
          localizations.riffa,
          localizations.isa_town,
          localizations.hamad_town,
          localizations.jidhafs,
          localizations.sitra,
          localizations.budiya
        ],
        localizations.oman: [
          localizations.oman_all,
          localizations.muscat,
          localizations.salalah,
          localizations.sohar,
          localizations.nizwa,
          localizations.rustaq,
          localizations.ibri,
          localizations.buraimi,
          localizations.sur,
          localizations.khasab
        ],
        localizations.usa: [
          localizations.usa_all,
          localizations.new_york,
          localizations.los_angeles,
          localizations.chicago,
          localizations.houston,
          localizations.phoenix,
          localizations.philadelphia,
          localizations.san_antonio,
          localizations.san_diego,
          localizations.dallas,
          localizations.san_jose
        ],
        localizations.canada: [
          localizations.canada_all,
          localizations.toronto,
          localizations.vancouver,
          localizations.montreal,
          localizations.calgary,
          localizations.ottawa,
          localizations.edmonton,
          localizations.winnipeg,
          localizations.quebec,
          localizations.halifax,
          localizations.victoria
        ],
        localizations.libya: [
          localizations.libya_all,
          localizations.tripoli,
          localizations.benghazi,
          localizations.misrata,
          localizations.zawiya,
          localizations.beida,
          localizations.sebha,
          localizations.sert,
          localizations.tobruk,
          localizations.ajdabiya,
          localizations.gharyan
        ],
        localizations.algeria: [
          localizations.algeria_all,
          localizations.algiers,
          localizations.oran,
          localizations.constantine,
          localizations.annaba,
          localizations.blida,
          localizations.batna,
          localizations.sidi_bel_abbes,
          localizations.bejaia,
          localizations.tiaret,
          localizations.tlemcen
        ],
        localizations.morocco: [
          localizations.morocco_all,
          localizations.rabat,
          localizations.casablanca,
          localizations.marrakesh,
          localizations.fes,
          localizations.tangier,
          localizations.agadir,
          localizations.oujda,
          localizations.kenitra,
          localizations.tetouan,
          localizations.safi
        ]
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSelectedLocation();
  }

  void _loadSelectedLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCountries = prefs.getStringList('selectedCountries') ?? [];
      _selectedRegions = prefs.getStringList('selectedRegions') ?? [];
      _selectedCountry = prefs.getString('selectedCountry');
      _selectedRegion = prefs.getString('selectedRegion');
      _excludedAreas = prefs.getStringList('excludedAreas') ?? [];
      _showExcludedAreas = _excludedAreas.isNotEmpty; // Show excluded areas if there are any
    });
  }

  void _selectCountry(String country) {
    setState(() {
      _selectedCountry = country;
      _selectedRegion = null; // Reset selected region when country changes
    });
  }

  void _addSelectedRegion(String region) async {
    if (region != null && !_selectedRegions.contains("$region, $_selectedCountry")) {
      setState(() {
        _selectedRegions.add("$region, $_selectedCountry");
        _selectedRegion = null;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('selectedRegions', _selectedRegions);
    }
  }

  void _addExcludedArea(String area) async {
    if (area != null && !_excludedAreas.contains(area)) {
      setState(() {
        _excludedAreas.add(area);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('excludedAreas', _excludedAreas);
    }
  }

  void _removeExcludedArea(String area) async {
    setState(() {
      _excludedAreas.remove(area);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('excludedAreas', _excludedAreas);
  }

  void _removeCountry(String country) async {
    setState(() {
      _selectedCountries.remove(country);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedCountries', _selectedCountries);
    if (_selectedCountries.isEmpty) {
      await prefs.remove('selectedCountries');
    }
  }

  void _removeRegion(String region) async {
    setState(() {
      _selectedRegions.remove(region);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedRegions', _selectedRegions);
    if (_selectedRegions.isEmpty) {
      await prefs.remove('selectedRegions');
    }
  }

  void _clearSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedCountries');
    await prefs.remove('selectedRegions');
    await prefs.remove('selectedCountry');
    await prefs.remove('selectedRegion');
    setState(() {
      _selectedCountries = [];
      _selectedRegions = [];
      _selectedCountry = null;
      _selectedRegion = null;
      _excludedAreas = [];
      _showExcludedAreas = false;
    });
  }

  void _saveSelection() async {
    if (_selectedRegions.isEmpty) {
      setState(() {
        _showError = true;
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('selectedRegions', _selectedRegions);
      await prefs.setString('selectedCountry', _selectedCountry ?? '');
      await prefs.setStringList('excludedAreas', _excludedAreas); // Save excluded areas
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).location_selection_page_title, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                S.of(context).select_countries,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: _selectedCountry,
                      isExpanded: true,
                      hint: Text(S.of(context).select_country_hint, style: TextStyle(color: purpleColor)),
                      items: _countryRegions.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: purpleColor)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _selectCountry(newValue!);
                      },
                      dropdownColor: Colors.white,
                      iconEnabledColor: purpleColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (_selectedCountry != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: _selectedRegion,
                        isExpanded: true,
                        hint: Text(S.of(context).select_region_hint, style: TextStyle(color: purpleColor)),
                        items: _countryRegions[_selectedCountry!]!.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: InkWell(
                              onTap: () {
                                _addSelectedRegion(value);
                                setState(() {}); // to close the dropdown
                              },
                              child: Text(value, style: TextStyle(color: purpleColor)),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          _addSelectedRegion(newValue!);
                        },
                        dropdownColor: Colors.white,
                        iconEnabledColor: purpleColor,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 16),
              ],
              if (_showError)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      S.of(context).please_select_target_locations,
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).selected_locations_title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: purpleColor),
                  ),
                  TextButton(
                    onPressed: _clearSelection,
                    child: Text(S.of(context).clear_all, style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0,
                children: _selectedRegions.map((region) {
                  return Chip(
                    label: Text(region),
                    onDeleted: () {
                      _removeRegion(region);
                    },
                    backgroundColor: purpleColor.withOpacity(0.1),
                    labelStyle: TextStyle(color: purpleColor),
                    deleteIconColor: Colors.red,
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await _showExcludeAreaDialog(context);
                    if (result != null) {
                      _addExcludedArea(result);
                      setState(() {
                        _showExcludedAreas = true;
                      });
                    }
                  },
                  child: Text(S.of(context).exclude_area, style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 16),
              if (_showExcludedAreas) ...[
                Text(
                  S.of(context).excluded_areas,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _excludedAreas.map((area) {
                    return Chip(
                      label: Text(area),
                      onDeleted: () {
                        _removeExcludedArea(area);
                      },
                      backgroundColor: Colors.red.withOpacity(0.1),
                      labelStyle: TextStyle(color: Colors.red),
                      deleteIconColor: Colors.red,
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
              ],
              Center(
                child: ElevatedButton(
                  onPressed: _saveSelection,
                  child: Text(S.of(context).save, style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _showExcludeAreaDialog(BuildContext context) async {
    String? excludeArea;
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).exclude_area),
          content: TextField(
            onChanged: (value) {
              excludeArea = value;
            },
            decoration: InputDecoration(hintText: S.of(context).enter_exclude_area),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(excludeArea);
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
    );
  }
}
