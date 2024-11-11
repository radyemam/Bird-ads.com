// lib/screens/settings/faq_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

class FAQPage extends StatelessWidget {
  final int initialQuestionIndex;
  final Color purpleColor = Color(0xFF800080);

  FAQPage({required this.initialQuestionIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).faq,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: purpleColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildQuestionItem(context, 1, S.of(context).faq_question_1),
          _buildQuestionItem(context, 2, S.of(context).faq_question_2),
          _buildQuestionItem(context, 3, S.of(context).faq_question_3),
          _buildQuestionItem(context, 4, S.of(context).faq_question_4),
          _buildQuestionItem(context, 5, S.of(context).faq_question_5),
          _buildQuestionItem(context, 6, S.of(context).faq_question_6),
          _buildQuestionItem(context, 7, S.of(context).faq_question_7),
          _buildQuestionItem(context, 8, S.of(context).faq_question_8),
          _buildQuestionItem(context, 9, S.of(context).faq_question_9),
          _buildQuestionItem(context, 10, S.of(context).faq_question_10),
          _buildQuestionItem(context, 11, S.of(context).faq_question_11),
          _buildQuestionItem(context, 12, S.of(context).faq_question_12),
        ],
      ),
    );
  }

  Widget _buildQuestionItem(BuildContext context, int number, String question) {
    return Card(
      child: ListTile(
        title: Text(question),
        leading: CircleAvatar(
          backgroundColor: purpleColor,
          child: Text(
            number.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_forward, color: purpleColor),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnswerPage(number: number, question: question),
            ),
          );
        },
      ),
    );
  }
}

class AnswerPage extends StatelessWidget {
  final int number;
  final String question;

  AnswerPage({required this.number, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإجابة على السؤال', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            _buildAnswerContent(context, number),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerContent(BuildContext context, int number) {
    switch (number) {
      case 1:
        return Text(
          'عن طريق تطبيق بيرد تقدر تعمل اعلانات على منصات مختلفة زي فيسبوك وانستجرام و تطبيق بيرد بيساعدك في وصول اعلانك لانساب جمهور باستخدام ذكاء صناعي بطريقة سهلة وسريعة وبدون ما تحتاج لخبرة في الإعلانات.\n\nعشان تقدر تستخدم تطبيق بيرد لازم يكون عندك صفحة فيسبوك فعالة وتكون Admin عليها كل اللي هتعمله انك تعمل حساب على تطبيق بيرد بعد كده تختار المنشور و تطبيق بيرد هيختار احسن استهداف يناسب عملائك على حسب المنتج او الخدمة اللي بتقدمهم في البوست وتقدر تعدلها بنفسك. وكمان هتقدر تحدد ميزانيتك وتدفع عن طريق منصات دفع مختلفة. بعد كده يتم مراجعة الاعلان ونشره وتكون عملت اول اعلان ليك في دقائق و بدون اي مجهود.\n\nلو احتجت توقف الاعلان في اي وقت، باقي ميزانية الإعلان هترجع في محفظتك تقدر تعمل بيها اعلان تاني او تستردها علي حسابك بنفس طريقة الدفع.\n\nالتطبيق متاح حاليا في جميع دول العالم ولو في اي دولة مش موجودة تقدر تكلم الدعم وتضيفهالك علي الاعلان الخاص بيك.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 2:
        return Text(
          'افتح تطبيق بيرد واضغط على انشاء اللي في منتصف الشاشة، اختر المنصة اللي بيفضل انك تعمل اعلانك عليها (فيسبوك او انستجرام او جوجل او يوتيوب او تيك توك)، تقدر كمان تختار انك تعمل الاعلان علي فيس بوك وانستجرام في نفس الوقت بشرط انك تكون رابط حساب انستجرام بصفحة الفيس بوك.\n\nحدد الهدف من الاعلان من الاختيارات المتاحة سواء (زيادة عدد المتابعين، زيادة التفاعل علي المنشور، رسائل ماسنجر .. الخ ) حدد البوست اللي حابب انك تستخدمه في الاعلان من خلال انك تضيف الرابط بتاعه في المنشور .\n\nحدد الفئة العمرية ونوع الجمهور الخاص بيك والدولة والمحافظة والمنطقة اللي تحب يوصلها الاعلان وحدد ميزانيتك وادفع عن طريق منصات الدفع المناسبة ليك واتاكد من انك رافع اكونت الشركة مسئول او محرر في الصفحة لو اعلانك فيس بوك او انستجرام شغل الاعلان وانتظر مراجعته من خلال فريقنا ومن خلال فيسبوك ولو الاعلان مطابق للشروط والاحكام يتم نشره.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 3:
        return Text(
          'تقدر تشحن رصيدك في أي وقت من خلال التطبيق عن طريق:\n\n- اضغط على المحفظة\n- اختار إضافة رصيد\n- أضف المبلغ اللي عايز تشحنه مع العلم ان أقل مبلغ لعمل اعلان هو 200 جنيه، تطبيق بيرد هيوضحلك اجمالي قيمة الشحن\n- اضغط استمرار\n- اختر وسيلة الدفع المناسبة وبمجرد الشحن سيتم إضافة المبلغ إلى المحفظة بشكل فوري.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 4:
        return Text(
          'أهم العوامل المؤثرة في أداء الإعلان هي:\n\n- التصميم والمحتوى: العامل الأساسي لنجاح الاعلان هو المحتوى المكتوب والتصميم المعروض في شكل صورة أو فيديو. تأكد أن وصف ومميزات المنتج أو الخدمة مكتوبة بشكل واضح ويغطي احتياجات الجمهور المستهدف واهتماماتهم. وكمان تصميم الصورة او الفيديو لازم يكون بشكل مناسب وجذاب للجمهور.\n\n- الاهتمامات: اختيار الاهتمامات المناسبة للإعلان عامل مهم جدا ومقلقش من الخطوة دي لأن تطبيق بيرد بيساعدك فيها عن طريق الذكاء الصناعي اللي بيحدد احسن استهداف يناسب عملائك على حسب المنتج او الخدمة اللي بتقدمهم في المنشور بتاعك. تقدر كمان تراجع الاهتمامات بنفسك وتعمل تعديل عليها.\n\n- الجمهور المستهدف: مهم جدا تحدد الجمهور المناسب من حيث الفئة العمرية ونوع الجمهور والمحافظة والمنطقة اللي تحب يوصلها الاعلان وحاول تكون محدد جدا في اختيار المناطق المناسبة ليك لضمان تركيز ميزانية الإعلان على نطاق شغلك.\n\n- مدة الإعلان: في كل مرة يتم فيها عرض إعلان، نظام إعلانات فيسبوك يقدر يتعلم أكتر على أنسب جمهور وأماكن لعرض الإعلان. وده معناه ان في خلال الايام الاولى من نشر الاعلان بيكون فيسبوك في مرحلة التعلم واداء الاعلان بيكون أقل استقرارًا ومع الوقت بيكون أداء الاعلان أفضل وأكثر دقة. وبالتالي يفضل يكون الاعلان فعال لمدة لا تقل عن 5 أيام.\n\nوأخيرا ننصح انك تعمل اكثر من اعلان بمحتوى وبمنشور مختلف وتابع نتائج كل اعلان وده هيساعدك جدا في تحديد افضل اعلان حقق نتائج مناسبة ليك.\n\nالإعلان يتم نشره عن طريق مدير إعلانات تطبيق بيرد وتقدر تتابع النتائج من خلال التطبيق عن طريق:\n\n- تسجيل دخول\n- الدخول على الصفحة الرئيسية و اختيار الإعلان اللي حابب تشوف الأداء الخاص بيه.\n- الضغط علي "عرض التفاصيل"\n- و بيظهر ليك الاحصائيات الخاصة بالإعلان مثل عدد مرات الظهور، عدد الأشخاص اللي تم وصول الإعلان ليهم، التفاعل، الرسائل، التكلفة.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 5:
        return Text(
          'لو اعلانك اترفض ده بيكون بسبب احتواء الإعلان على محتوى او منتج او خدمة تتعارض مع شروط وأحكام فيسبوك، مراجعة الإعلان تتم على مرحلتين: الأولى مراجعة تطبيق بيرد والثانية مراجعة فيسبوك.\n\nتقدر تعرف سبب الرفض من خلال التطبيق عن طريق تحديد الإعلان المرفوض والضغط على تفاصيل هتقدر تشوف السبب. أغلب أسباب رفض الاعلانات هي:\n\n- اذا كان اعلانك يحتوي على اسم او صورة تابعة لماركة أو شركة او علامة تجارية ويخالف حقوق الملكية والطباعة والنشر.\n\n- اذا كان اعلانك يحتوي على بيع حسابات على منصات او برامج او تطبيقات.\n\n- اذا كانت صفحتك محظورة من انشاء الإعلانات على فيسبوك برجاء تغيير الصفحة او الرجوع الى فريق دعم فيس بوك.\n\n- اذا كان اعلانك يحتوي على منتجات محظورة أو غير شرعية أو غير مصرح بها.\n\n- اذا كان اعلانك يحتوي على كورسات محظورة مثل الاختراق او بيع الشهادات غير الموثقة.\n\n- اذا كانت أبعاد الفيديو المستخدمة غير مناسبة للعرض، برجاء تعديل أو تغيير الفيديو واعادة عمل الإعلان.\n\n- اذا كان اعلانك يحتوي على موسيقى في الفيديو، برجاء تعديل الفيديو واعادة عمل الإعلان.\n\n- اذا كان اعلانك يحتوي على خدمات محظورة أو غير شرعية أو غير مصرح بها.\n\n- اذا كان اعلانك يحتوي على شكل من أشكال الأسلحة والذخيرة والمتفجرات.\n\n- اذا كان اعلانك يحتوي على صورة مقارنة قبل وبعد استخدام المنتج أو الخدمة المعلن عنها، برجاء تغيير الصورة واستخدام صورة أخرى وإعادة عمل الإعلان.\n\n- اذا كان اعلانك يحتوي على كلمات مسيئة أو غير أخلاقية أو مخالفة لسياسات فيسبوك، برجاء تعديل المحتوى أولا ثم إعادة عمل الإعلان.\n\n- اذا كان المنشور غير متوفر على الصفحة الخاصة بك في وقت عمل الاعلان، او تم حذف المنشور قبل قبول الاعلان من تطبيق بيرد، برجاء التأكد من ان المنشور متوفر قبل عمل الاعلان.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 6:
        return Text(
          'في حالة انتهاء الاعلان، الرصيد المتبقي من ميزانية الإعلان بيرجع في حسابك تلقائيًا في خلال 4 ساعات من انتهاء الاعلان تقدر تستخدمه في عمل اعلان تاني او تسترده مرة أخرى وغير متاح تحويل المبلغ لحساب شخص اخر.\n\nتقدر تسحب رصيدك القابل للإرجاع في أي وقت من خلال التطبيق عن طريق:\n\n- المحفظة\n- طلب مرتجع\n\nالرصيد القابل للإرجاع هيوصلك بنفس طريقة الدفع اللي استخدمتها. سحب الرصيد على المحفظة الإلكترونية يتم في خلال يومين عمل، ايضا القيمة المضافة لا يتم استردادها عند استرجاع الاموال وانه يتم خصم تكلفة جميع الكوبونات التي تم شحنها للحساب  ',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 7:
        return Text(
          'أكواد الخصم بتوصلك من خلال إشعارات التطبيق وبتستخدمها من خلال الخطوات التالية:\n\n- تسجيل حساب من خلال التطبيق\n- الدخول على المحفظة\n- اختار اضافة كوبون\n- أضف كود الخصم\n- اضغط استخدام\n\nعشان تكسب فلوس من خلال استخدام ومشاركة كود الدعوة الخاص بيك، دوس على الإعدادات\n- اختار اكسب فلوس\n- اقرا مميزات مشاركة كود الدعوة واعرف المبلغ اللي هتكتسبه\n\n- عشان يتم اضافة مبلغ مشاركة كود الدعوة ليك، لازم الشخص اللي هيستخدم الكود الخاص بيك يعمل اعلان علي تطبيق بيرد بشكل ناجح.\n\n- أكواد الخصم غير متوفرة من خلال فريق الدعم.\n\n- رصيد كود الخصم يستخدم فقط في عمل اعلانات ولا يمكن سحبه ويكون صالح لمدة ثلاثة شهور بعدها يكون منتهي الصلاحية وغير قابل للاستخدام.\n\n- بعد اول اعلان بنسألك عن تقييمك في الخدمة، بمجرد ما بتعمل التقييم بينزل في محفظتك رصيد هدية بشكل تلقائي تقدر تستخدمهم في عمل اعلانات.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 8:
        return Text(
          'في حالة انتهاء اعلانك حابب نطمنك ان المتبقي من صرف الاعلان بيرجعلك من السيستم بشكل تلقائي على محفظة تطبيق بيرد بعد 4 ساعات بحد اقصى تقدر انك تعمل بيهم اعلان مره تانية.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
      case 9:
        return RichText(
          text: TextSpan(
            text: 'مواعيد العمل الرسمية\nمن الساعة 10:00 ص حتى الساعة 2:00 ص بعد منتصف الليل\n\nعنوان الشركة\n7 عمارة (بيم) ركن الصفا من خالد أمين من شارع العريش الهرم الجيزة الدور التاسع - أمام الأسانسير\n\nاللوكشن\n',
            style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
            children: [
              TextSpan(
                text: 'https://goo.gl/maps/hPNEgJBsGTVYFf7g8',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL('https://goo.gl/maps/hPNEgJBsGTVYFf7g8');
                  },
              ),
            ],
          ),
        );
      case 10:
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('fb').doc('LDYHr2kvHLOl7slzEfIl').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('حدث خطأ أثناء جلب البيانات');
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text('لم يتم العثور على البيانات');
            } else {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              String name = data['name fb'];
              String link = data['link fb'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'دا فيديو شرح طريقة رفع الادمن اتبع الخطوات :\n',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                      children: [
                        TextSpan(
                          text: 'https://www.youtube.com/watch?v=TI0GjXVv3lo\n',
                          style: TextStyle(fontSize: 16.0, color: Colors.blue, decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchURL('https://www.youtube.com/watch?v=TI0GjXVv3lo');
                            },
                        ),
                        TextSpan(
                          text: 'وبعدين هتاخد اسم الاكونت دا تضيفه في مربع البحث لو ملقتش الاسم ابلعتله طلب صداقة من الاكونت الاكونت الشخصي بتاعك\nاسم الاكونت اللي محتاجين ترفعه مسئول او محرر هوا :\n',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL('https://www.facebook.com/$name'),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy, color: Colors.grey.shade700),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: name));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم نسخ الاسم')),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    'لينك الاكونت علشان تتاكد من الصورة هيا هيا لوجو الشركة وعلشان لو حبيت تبعت طلب صداقة:\n',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                  ),
                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL(link),
                        child: Text(
                          link,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy, color: Colors.grey.shade700),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: link));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم نسخ الرابط')),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),  // تأكد من وجود الفاصلة هنا
                  ElevatedButton(
                    onPressed: () {
                      _sendFriendRequest(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('لقد ارسلت طلب صداقة'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'لو واجهت اي مشكلة تواصل مع الدعم',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings/support');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('الدعم'),
                  ),
                ],
              );
            }
          },
        );
      case 11:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'تقدر تشوف الفيديو بيشرح ازاي تجيب كود الاعلان علي التيك توك\n',
                style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                children: [
                  TextSpan(
                    text: 'https://vt.tiktok.com/ZSYa39AnH\n\n',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL('https://vt.tiktok.com/ZSYa39AnH');
                      },
                  ),
                  TextSpan(
                    text: 'الخطوات هيا:\nدوس علي السهم بتاع الشير\nاختار اعدادات الاعلان\nافتح ترخيص الاعلان واختار اطول مدة واضغط تفويض\nهتلاقي اختيار ظهر اسمه رمز الفيديو اختار انشاء\nدوس علي حفظ\nهتلاقي رمز الفيديو مكتوب جنبه جاهز وفيه كلمة اسمها ادارة\nدوس علي ادارة ودوس نسخ الرمز\nهيقولك تم نسخ الرمز ضيفه في الاعلان بتاعك لما تنشئ اعلان معانا في مكان محتوي المنشور',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'لو قبلت اي مشكلة تواصل مع الدعم',
              style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings/support');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('الدعم'),
            ),
          ],
        );
      case 12:
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('youtube').doc('E8AWjjNAsGmQCfLXRKDN').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('حدث خطأ أثناء جلب البيانات');
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text('لم يتم العثور على البيانات');
            } else {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              String youtubeLink = data['youtube_explan'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ايوة متوافر شرح بالفيديوهات لكل جزء من الابلكشن وطريقة انشاء الاعلانات لكل المنصات وكل ما تحتاجه في الرابط التالي:',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(youtubeLink),
                    child: Text(
                      youtubeLink,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        );
      default:
        return Text(
          'لم يتم العثور على إجابة للسؤال.',
          style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
        );
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendFriendRequest(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
            .collection('clients')
            .doc(user.uid)
            .get();

        if (clientSnapshot.exists) {
          print("Client data fetched successfully");
          await FirebaseFirestore.instance.collection('customer requests').add({
            'action': 'طلب جديد',
            'ad name': 'طلب صداقة',
            'adID': '',
            'createdTime': FieldValue.serverTimestamp(),
            'customerID': clientSnapshot['uid'],
            'email': user.email,
            'note': 'طلب صداقة',
            'status': 'طلب جديد',
          });
          print("Friend request sent successfully");

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('تم ارسال طلب الصداقة'),
                content: Text('تم ارسال اشعار بطلب الصداقة سيتم القبول خلال ساعة عمل كا حد اقصي'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF800080),
                    ),
                    child: Text('تم'),
                  ),
                ],
              );
            },
          );
        } else {
          print("Client data not found");
        }
      } catch (e) {
        print("Error sending friend request: $e");
      }
    } else {
      print("User not logged in");
    }
  }
}
