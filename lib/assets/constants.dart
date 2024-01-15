import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future getData() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos/1');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    //print(jsonResponse);
    return jsonResponse;
  }
}

//
// PRINCIPALI
//
const String TITLE = 'La Tua Agenzia Digitale';
const Color COLORE_PRINCIPALE = Color(0xff008080);
const Color COLORE_SECONDARIO = Color(0xff233b66);
const Color COLORE_TERZIARIO = Color(0xff233b66);
const Color BIANCO = Color(0xffffffff);
const Color TRASPARENTE = Color(0x00ffffff);
const String ID = '3';
const String TOKEN = 'LHgC8?QbYO';

//
// STILI
//
const TextStyle EVIDENZA = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const TextStyle BOLD = TextStyle(fontWeight: FontWeight.bold);
const TextStyle H1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
final ButtonStyle STILE_BOTTONE = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    backgroundColor: MaterialStateProperty.all<Color>(COLORE_TERZIARIO),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white));
const Widget SPACER = SizedBox(height: 25);
const Widget SPACER_MINIMAL = SizedBox(height: 5);
const Widget SPACER_MEDIUM = SizedBox(height: 10);

//
// HEADER
//
final Image HEADER = Image.network('https://picsum.photos/1200/600',
    height: 200, fit: BoxFit.fitWidth);
const NetworkImage PROFILE_PICTURE = NetworkImage('https://picsum.photos/200');
const String IMG_PATH = 'https://www.seemypage.it/hybridandgo/res/';

//
// NOME SOCIAL
//
const String NOME_AGENZIA = 'Soluzioni Assicurative CUDRIG';
final SvgPicture IMAGE_FACEBOOK =
    SvgPicture.asset('lib/assets/facebook.svg', width: 50);
final SvgPicture IMAGE_GOOGLE =
    SvgPicture.asset('lib/assets/google.svg', width: 40);
final SvgPicture IMAGE_INSTAGRAM =
    SvgPicture.asset('lib/assets/instagram.svg', width: 40);
final SvgPicture IMAGE_LINKEDIN =
    SvgPicture.asset('lib/assets/linkedin.svg', width: 50);
final SvgPicture IMAGE_PINTEREST =
    SvgPicture.asset('lib/assets/pinterest.svg', width: 50);
final SvgPicture IMAGE_TWITTER =
    SvgPicture.asset('lib/assets/twitter.svg', width: 50);
final Image IMAGE_WEBSITE = Image.asset('lib/assets/website.png', width: 40);

//
// INFO
//
const AssetImage IMAGE_INFO = AssetImage('lib/assets/info.png');
const String TITOLO_SEZIONE_INFO = 'Info e Sedi';
/*const Widget NOTIFICA = Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(NOTIFICA_TEXT,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)));*/
const String NOTIFICA_TEXT =
    'Il 24 aprile, la sede di Roma resterà chiusa la mattina';
const String EVIDENZA_ORARI = 'Orari di Apertura';
const String EVIDENZA_INDIRIZZI = 'Indirizzi';
const String TESTO_BOTTONE_GOOGLE_MAPS = 'Guidami alla sede!';
const String TESTO_CONTATTI_TELEFONICI = 'Contatti Telefonici';
//NUOVO
const NetworkImage IMMAGINE_SEDE = NetworkImage('https://picsum.photos/200');
const String NOME_SEDE_UNO = 'Via del Corso';
const String ORARI_SEDE_UNO =
    'Lunedì - Venerdì: 8:30/12:30 - 14:30/18:30\nSabato: 8:30/12:30\nDomenica: Chiuso';
const String INDIRIZZO_SEDE_UNO = 'Via del Corso, 142 - 00123 Roma (RM)';
final Uri LINK_SEDE_UNO = Uri.parse(
    'https://www.linkedin.com/company/soluzioni-assicurative-cudrig/');
final Uri RECENSIONE_SEDE_UNO = Uri.parse(
    'https://www.linkedin.com/company/soluzioni-assicurative-cudrig/');
//NUOVISSIMO
final List<Uri> SEDI_LOGO_ARRAY = [
  Uri.parse('https://picsum.photos/200'),
  Uri.parse('https://picsum.photos/180'),
  Uri.parse('https://picsum.photos/210'),
];
final List<String> SEDI_NOMI_ARRAY = [
  'Sede n. 1',
  'Sede n. 2',
  'Sede n. 3',
];
final List<String> SEDI_INDIRIZZI_ARRAY = [
  'Via del casale delle Cornacchiole, 22/b - 00123 Roma (RM), Italia',
  'Via degli Orti di Monterosi, 425 - 00113 Viterbo (VT)',
  'Via de la Resistenza, 148 - 13002 Milano (MI)',
];
final List<String> SEDI_ORARI_ARRAY = [
  'Lunedì - Venerdì: 08:30/12:30 - 14:30/18:30\nSabato: 08:30/12:30\nDomenica: Chiusi',
  'Lunedì - Venerdì: 08:30/12:30 - 15:30/19:00\nSabato: 08:30/12:30\nDomenica: Chiusi',
  'Lunedì - Venerdì: 09:30/14:30 - 16:00/20:80\nSabato e Domenica: Chiusi',
];
final List<Uri> SEDI_MAPS_ARRAY = [
  Uri.parse('https://maps.app.goo.gl/K8PppjCrnrbpwJqW9'),
  Uri.parse('https://maps.app.goo.gl/SsJBduxEK9pxmRaP9'),
  Uri.parse('https://maps.app.goo.gl/shAv4Jh5JfAoecxUA'),
];
final List<Uri> SEDI_TELEFONO_ARRAY = [
  Uri.parse('tel:+393333333333'),
  Uri.parse('tel:+393333333333'),
  Uri.parse('tel:+393333333333'),
];
final List<Uri> SEDI_EMAIL_ARRAY = [
  Uri.parse('mailto:asdfg@gfdsa.fd'),
  Uri.parse('mailto:asdfg@gfdsa.fd'),
  Uri.parse('mailto:asdfg@gfdsa.fd'),
];
final List<Uri> SEDI_SITO_ARRAY = [
  Uri.parse('https://www.smp-digital.it'),
  Uri.parse('https://www.smp-digital.it'),
  Uri.parse('https://www.smp-digital.it'),
];
final List<Uri> SEDI_RECENSIONI_ARRAY = [
  Uri.parse('https://www.smp-digital.it'),
  Uri.parse('https://www.smp-digital.it'),
  Uri.parse('https://www.smp-digital.it'),
];

//
// CONTATTI
//
const AssetImage IMAGE_CONTATTI = AssetImage('lib/assets/contatti.png');
const String TITOLO_SEZIONE_CONTATTI = 'Numeri Utili e Contatti';
const String CONTATTI_TESTO =
    'Sede Principale:\nVia del Corso, 127 - 00123 Roma (RM)\nTelefono: +39 06 789456\ne-mail: info@cudrig.it';

//
// SINISTRO
//
const AssetImage IMAGE_CRASH = AssetImage('lib/assets/crash.png');
const String TITOLO_SEZIONE_DENUNCIA = 'Denuncia un sinistro';
const String SINISTRO_EVIDENZA =
    'Denunciare un sinistro non è mai stato così facile:';
const String SINISTRO_TEXT =
    'Clicca sul tasto qui sotto per compilare il modulo online, allegando il tuo CAI (vecchio CID) compilato e le foto dei veicoli!';
const String SINISTRO_TESTO_BOTTONE = 'Denuncia un Sinistro!';

//
// CAI
//
const String TESTOCAI =
    'Hai smarrito il tuo modello CAI (Vecchio CID)? Non c\'è problema, ti basterà cliccare qui sotto per scaricarlo e stamparlo!';
const String LABEL_BOTTONE_CAI = 'CAI';

//
// WEBVIEW
//
const String TITOLO_FORM_DENUNCIA = 'Denuncia un sinistro';

//
// CHIAMATA RAPIDA
//
const String CHIAMATA_RAPIDA_TOOLTIP = 'Chiamaci Ora!';

//
// METODI
//
const String ERRORE =
    'Impossibile effettuare l\'operazione. Contatta l\'amministrazione';
void openUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception(ERRORE);
  }
}

//
// LINK
//
final Uri EMAIL_LINK = Uri.parse('mailto:info@roba.it');
final Uri TELEFONO_LINK = Uri.parse('tel:+393333333333');
final Uri MAPPA_LINK = Uri.parse(
    'https://www.google.com/maps/place/25062+Concesio+BS/@45.6029892,10.1964036,14z/data=!3m1!4b1!4m6!3m5!1s0x478179d4beb328ef:0x862df3996374faf1!8m2!3d45.5998218!4d10.22268!16zL20vMDQxd2hs?hl=it&entry=ttu');
final Uri FACEBOOK_LINK =
    Uri.parse('https://www.facebook.com/cudrigassicurazioni');
final Uri INSTAGRAM_LINK =
    Uri.parse('https://www.instagram.com/soluzioni_assicurative_cudrig');
final Uri LINKEDIN_LINK = Uri.parse(
    'https://www.linkedin.com/company/soluzioni-assicurative-cudrig/');
final Uri PINTEREST_LINK = Uri.parse('https://www.pinterest.com');
final Uri TWITTER_LINK = Uri.parse('https://www.twitter.com');
final Uri GOOGLE_LINK = Uri.parse('https://maps.app.goo.gl/nv921bgSKNR7GPys9');
final Uri SITO_LINK = Uri.parse('https://www.google.com/reviews');
final Uri CAI_LINK = Uri.parse('https://www.documenti.it/cidonline.pdf');
final Uri URL_FORM_DENUNCIA = Uri.parse('https://www.seemypage.it');
final Uri REVIEW_LINK = Uri.parse('https://g.page/r/CdRhtF4CB0MfEBM/review');

// RANDOM

const String MESSAGGIO = 'Contenuto';

// CHIAMATE RAPIDE
const String CHIAMATA_RAPIDA_UNO = 'Chiamata Rapida';
const String CHIAMATA_RAPIDA_DUE = 'Chiamata Whatsapp';
const String CHIAMATA_RAPIDA_TRE = 'e-mail Rapida';
final Uri LINK_CHIAMATA_RAPIDA_UNO = Uri.parse('tel:');
final Uri LINK_CHIAMATA_RAPIDA_DUE = Uri.parse('https://wa.me/');
final Uri LINK_CHIAMATA_RAPIDA_TRE = Uri.parse('mailto:');
