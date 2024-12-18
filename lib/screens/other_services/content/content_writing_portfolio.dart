//lib/screens/other_services/content_writing_portfolio.dart
import 'package:flutter/material.dart';

class ContentWritingPortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سابقة أعمال كتابة المحتوى',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF800080),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اختر المجال الذي تود استكشافه:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 16.0, // المسافة الأفقية بين الأزرار
                runSpacing: 16.0, // المسافة العمودية بين الأزرار
                children: [
                  for (int i = 0; i < fields.length; i += 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (i < fields.length)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => getContentDetailPage(i)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF800080), // لون الخلفية موف
                                foregroundColor: Colors.white, // لون النص أبيض
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              ),
                              child: Text(
                                fields[i],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        SizedBox(width: 16),
                        if (i + 1 < fields.length)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => getContentDetailPage(i + 1)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF800080), // لون الخلفية موف
                                foregroundColor: Colors.white, // لون النص أبيض
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              ),
                              child: Text(
                                fields[i + 1],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getContentDetailPage(int index) {
  switch (index) {
    case 0:
      return ContentDetailPage(title: 'اثاث منزلي', content: '''
عروسة وفرحك قرب وشايلة هم فرش شقتك 🤔
جايبة جهاز غالي وشيك وعايزة تفرشية وتظهرية بمنظر شيك يشرفك قدام حبايبك 😍

إختاري الفرش على ذوقك واحنا نفرشلك على ذوقنا 🥰
✔ همس لفرش شقق العرايس خبرة في فرش وتزيين شقة العروسة هنفرشلك شقتك في يوم واحد فرش الشقة كاملة على المفتاح 🤗
✅ رص مطبخ
✅ رص نيش وبوفية
✅ دولاب نوم كبير
✅ فرش دولاب أطفال

✔ منشن لصحبتك العروسة اللي فرحها قرب وقوليلها جمال شقتك بيظهر لو مفروشة صح ♥ 

📣 للتواصل والإستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدري تتواصلي فون و واتس 😍👇
01128896334


--------------
لما يكون العميل مبسوط من الشغل و يعملنا سيشن للغرفة 🫶♥

في مليون جملة دعائية ممكن تقولها عن الغرفة بتاعتك بس دايما المنتج سيد السوق 👌

✔ إحنا في WooD LanD بنفهم أهمية الإبتكار و التميز في عالم الأثاث و علشان كده بنحرص علي تقديم تصميمات مبتكرة و تناسب إحتياجك هتلاقي في المعرض كل اللي نفسك في من أكبر تشكيلة أثاث بأعلي جودة و أفضل سعر 😍
✅ غرف نوم
✅ غرف أطفال
✅ سفرة
✅ نيش
✅ ركنة
✅ أنتريهات

✔ وعلشان راحتك معانا في كل حاجة تقدر تختار أي موديل والألوان اللي تعجبك وإحنا علينا التنفيذ والجودة 👑

📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01120804092

📌 العنوان: النزهة 2 شارع ال 27 جسر السويس أمام هيبر بيم و أقرب محطه مترو ( هشام بركات )


------------------
الأهم من إختيار فرش البيت لازم تختار المكان المضمون إللي هتفرش بيتك منه وإنت مطمن 🏘

لو إنت عريس جديد و بتدور علي أحدث التصميمات والموديلات بأعلي جوده وأفضل سعر في السوق هتلاقي بمصنع ومعرض مندور للأثاث كل الي نفسك فيه 🤗

✔ جهز بيتك دلوقتي وإختار اللي يناسبك من أكبر تشكيلة للأثاث المنزلي في مصر
✅ غرف نوم
✅ غرف أطفال
✅ سفرة
✅ نيش
✅ ركنة
✅ أنتريهات
✅ جزامات
✅ بنصنع بأجود أنواع الأخشاب (زان , ارو , كونتر ) و ضمان 10 سنوات 
✅ يوجد تقسيط

وكمان تقدر تبعتلنا أي تصميم عاجبك و هنقدر ننفذهولك في أسرع وقت وبأفضل سعر و أعلي جودة 👑 

✔ طريقك لإختيار أثاثك هيتغير بعد زيارتك لينا 🥰

📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01003400580

📌 العنوان: 22 ش محمد إمام من منشيه التحرير عين شمس معرض موبليات مندور


-------------
لو إنت عريس جديد و بتفرش شقتك و شايل هم ميزانيتك🫰
لو تعبت من الأثاث المنزلي المتكرر و التقليدي و محتاج أثاث يكون مختلف و يميز بيتك عن أي بيت تاني 😍

✔ يبقي إنت محتاج تزور معرضنا لأن مش أي مكان يقدر يجمع بين الرُقي و الجودة إحنا في مصنع ومعرض مندور للأثاث هدفنا أثاث يليق بشياكة بيتك ويكمل معاك عشرة السنين 🤗
✅ غرف نوم
✅ غرف أطفال
✅ سفرة
✅ نيش
✅ ركنة
✅ أنتريهات
✅ جزامات
✅ بنوفرلك أرقى التصميمات بأجود الخامات تعيش لسنين
✅ كل التصميمات بيتم تنفيذها بمصنعنا بأجود أنواع الأخشاب (زان , ارو , كونتر )
✅ ضمان 10 سنوات من تاريخ الشراء لثقتنا الكاملة في منتجاتنا
✅ إمكانية التقسيط 

✔ إختيارك أثاث بيتك لازم يكون إختيار صحيح وعشان كدا لازم تختار المكان الصح 👌♥

📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01003400580

📌 العنوان: 22 ش محمد إمام من منشيه التحرير عين شمس معرض موبليات مندور
''');
    case 1:
      return ContentDetailPage(title: 'ملابس', content: '''عارف إحنا لية ظهرنالك دلوقتي 🤔
عشان إحنا فى Memo store عرفنا إنك محتاج ترنج شتوي بجودة عالية وبسعر مميز ويكون تريندى 😍

✔ في الجو دا إنت محتاج ترنج يسد معاك 🥶
✅ أعلي خامة وأفضل سعر
✅ تلبيس اوفر سايز
✅ الخامة ميلتون مبطن بوبرة داخلية
✅ معالج ضد الوبر و الإنكماش

✔ الترنج متوفر لجميع المقاسات و المقاسات الخاصة
✅  L    50 kg : 70 kg
✅ xL   70 kg : 80  kg
✅ Xxxl   من 95ك - 110ك
✅ Xxxxl  من 110ك - 125ك

✔  السعر 300ج فقط والمقاسات الخاصة 315ج 🔥🔥

📣 للتواصل والإستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩



-----------
عمرك شوفت حد بيبيع بنص السعر في بداية الموسم ؟😳
طيب شوفت حد بيبيع بنص السعر وكمان عروض علي أكتر من قطعة 😎

متشيلش هم أسعار لبس الشتاء السنة دي 😍
✔ سنتر المودة و الرحمة بيقدملك أجود الخامات و بأسعار زمان 😉

✅ إستمتع معانا بأقوى عروض كل يوم جمعة بعد الصلاة أي قطعة داخل السنتر ب125 جنية بس🔥

✔ وكمان عروض عند الحصول على أكتر من قطعة
✅ 4 قطع صيفي ب 300 جنيه فقط
✅ 4 قطع شتوي ب 500 جنيه فقط 

💥 مستنينك تنورنا في السنتر علشان تستفاد بالعروض 🔥

📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01120082366
01063126031

📌 العنوان: شارع العريش فيصل أمام سوبر ماركت مترو أول عمارة يمين في الشارع
--------------

''');
    case 2:
      return ContentDetailPage(title: 'عقارات', content: '''ما هو أفضل عائد استثماري عقارى في دبي؟
فلنفرض انك تمتلك مليون درهم كيف تجعل المبلغ يصل 3 أضعاف ؟؟
ازاي ممكن نعمل كده؟؟

عند تملكك شقة فى جزيرة فى قلب البحر بين احضان الطبيعة سوف تحصل علي عائد استثماري ثابت موثق بعقد 8.33% لمده12
او 10% لمدة 10 سنوات تستطيع اعاده بيع العقار للشركة المالكة بضعف ثمن الشراء فسوف تحصل علي اجمالي 300% من المبلغ الاصلي لك
جميع الوحدات مفروشة بالكامل من قبل المطور والمشغل الفندقي المريح تسليمه في أسرع وقت
وحدات تحتوي على مكونات فندقية بدون رسوم خدمة
عوائد مضمونة بنسبة 00 3% من INVESTMNET
إنها أفضل فرصة استثمارية في دبي بأقساط ميسرة واسعار تبداء من 1,600.000 مليون ولا تنسي الشارع الممطر حيث يأتي الناس للحصول على السعادة والرقص تحت الماء

أيضا تحصل على عائد مضمون على الاستثمار موثق بالعقد و اعاده بيع العقار للمطور موثق بالعقد بنسبه100%
تملك عقارك مع ملكية 100٪ لدائرة الأراضي والأملاك وتكلفة الصيانة مجانا
استوديوهات - شقق - فلل- تاون هاوس - قصر
للتواصل 
+971 55 719 7654 
--------------------



💥 سمارت هوم 💥

💥 المشروع الأكبر والأضخم في دبي والوطن العربي🔥
 أكبر مجمع سكني مائى محاط بالمياه من جميع الجهات 🌊
وجهة جديدة للعيش في المدينة 🏙
 ويقع بالقرب من مطار آل مكتوم الدولي و نخلة جبل علي ✨


✔ يوفر المشروع العديد من المرافق والخدمات المميزة

 ✅ بوليفارد مغطى ومكيف مع ممشى خشبي أمام البحيرة 🚤
✅ شواطئ خاصة 🏊
✅ مراكز تجارية 🛒🛍 
✅ أوبرا هاوس 💫✨
✅ قاعات سينما 🎥🎞
✅ مستشفيات 🏥
✅ نوادي صحية 🏟
✅ مراكب للتنقل داخل المجمع 🚣🏼
✅ حدائق عامة 🏕⛺
✅ مناطق مخصصة للعب الأطفال 🛹⛸
✅ مناطق للشواء 🥩🍖
✅ قاعات لاقامة الحفلات 🪩
✅ نوافير راقصة ⛲
✅ مسرح مكشوف للعروض الليلية 💃🏼
✅ تلفريك 🚠
✅ مجموعة متنوعة من المطاعم والكافيهات ☕🍔🍟🍕🍹


✔ تتوفر وحدات سكنية متنوعة في المشروع

✅ استوديوهات 
✅ فلل مستقلة
✅ قصور

✔ تتميز جميع الوحدات 

✅ بإطلالات مباشرة على أكبر بحيرة كريستالية في العالم 🌊

💥 تبدأ أسعار الوحدات في المشروع من 550 ألف درهم
 مع دفعة أولى تبدأ من 77 ألف درهم 🔥
 
💥 بادر بالحجز المبكر في وقت الطرح قبل زياده الاسعار لضمان الحصول  على وحدتك المناسبه
-----------------------

''');
    case 3:
      return ContentDetailPage(title: 'عطور', content: '''الجوازة مش هتبوظ علي مطبخ أو شباك الوميتال 😎

لو إنت شاب و لسة بتشطب شقتك ونفسك تعمل الوميتال مميز فى بيتك وبشكل عصرى ف إحنا قررنا نقف جنبك و هنساعدك 🤗

✔ معانا متشلش هم المصاريف خلي شقتك عليك و الشبابيك الألوميتال و المطبخ علينا ال شوري متخصصون في جميع أنواع الألموتال👇
✅ شبابيك ألوميتال بجميع أنواعها
✅ أبواب و شبابيك PVC
✅ شيش حصيرة
✅ مطابخ
✅ وحدات حمام
✅ كبائن شاور
✅ تنفيذ جميع أنواع الوجهات
✅ تندا إيطالي

✔ إتفرج على شغلنا واحكم بنفسك 👇😘

📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01119816809

📌 العنوان: 13 شارع السيد عويس طالبية هرم
-------------



عالم العطور مليئ بالجمال والسحر حيث تأخذنا الروائح في رحلة من الإثارة والأناقة 

إصنع لنفسك عالماً خاص مع مجموعة متميزة من العطور الرائعة 🥰

✔ تمتع بـ لطافة و تميز والذوق الفريد بـ كولكشن مميز من العطور للرجال والسيدات 👩‍❤‍👨
✅ جميع العطور أورجينال
✅ عطور تناسب جميع الأذواق و الأعمار
✅ ثبات قوي جدا يدوم لأكثر من 48 ساعة
✅ الأنواع الأكثر مبيعاً في العالم بأفضل سعر
✅ عطور تناسب جميع فصول السنة

✔ نفاحات من الجاذبية و الغموض ترافقك أينما ذهبت 🤗

📣 لطلب الاوردر تقدر تتواصل معانا من خلال رسايل الصفحة 📩
----------------------------

''');
    case 4:
      return ContentDetailPage(title: 'خدمات طبية', content: '''❌دايما حاسس بشبوره علي عينك؟؟😵‍💫
❌صعوبة في الرؤية بليل 😞
❌صعوبة في القراءة وتميز الوجوه🧐

كل ده من ضمن اعراض المياه البيضاء 😱

متقلقش 😉هنبتدي معاك خطوه خطوه من اول الكشوفات و الفحوصات الي غرفه العمليات👁

✅اجراء كافه الفحوصات👁👁
✅اختيار القرار المناسب لحالتك👌🏻🔬
✅تشخيص طبي متكامل على اعلي مستوي👌🏻

كل ده هيتم تحت إشراف فريق طبي متكامل مدرب علي اعلي مستوي 👨‍⚕

مع د/ محمد إبراهيم سالم #عينيك_مسئوليتنا 👀

فريق كامل للرد على استفساراتكم☎
📣 للحجز و الاستفسار 
اتصل بنا : 01090091847 - 01114141324 
او ابعتلنا على رسائل الصفحة 📩

🚩 الشيخ زايد: روضة زايد-مول المعز
🚩 المهندسين: ٢٤ ش سوريا-مستشفى رواد تصحيح الإبصار
🚩 الفيوم: أول طريق القاهرة-مستشفى الحياة ٢
-----------------------------------------



⚠زهقت من النظارة وصعوبة التعامل بيها 👓

احنا هنحللك المشكلة  في 5 دقائق 😉👌🏻

👈 لأن عملية الليزك مدتها لا تتعدي ال 5 دقائق
👈 و لكن فيه إجراءات مهمة قبل العملية و بعد العملية هتضمنلك ليزك صحيح بدون عيوب 
👈 تشخيص طبي متكامل على أعلي مستوي

✅إجراء كافة الفحوصات👁👁
✅أدق الفحوصات لاختيار أفضل أنواع الليزك🔬
✅اختيار القرار المناسب لحالتك👌🏻
✅بنختارلك افضل اجهزه تصحيح الابصار🔬

كل ده هيتم تحت فريق طبي متكامل مدرب علي اعلي مستوي 👨‍⚕

مع د/ محمد إبراهيم سالم #عينيك_مسئوليتنا 👀

فريق كامل للرد على استفساراتكم☎
📣 للحجز و الاستفسار 
اتصل بنا : 01090091847 - 01114141324 

او ابعتلنا على رسائل الصفحة 📩

🚩 الشيخ زايد: روضة زايد-مول المعز
🚩 المهندسين: ٢٤ ش سوريا-مستشفى رواد تصحيح الإبصار
🚩 الفيوم: أول طريق القاهرة-مستشفى الحياة ٢
--------------------------------------------


''');
    case 5:
      return ContentDetailPage(title: 'سيارات', content: '''الشتا داخل و مش هتعرف تسوق بسبب الشابوره 💨🥶

بتسافر كتير و كل تحركاتك بالليل و نور العربيه مش مساعدك 👀🌑

✔ حلك مع طقم ليد بتقنية LASER LED HEADLIGHT أحدث التقنيات العالمية إصدار 2023 🔦💡

 عشان تشوف كويس بليل و تسوق و انت مستريح من غير ما تعرض حياتك للخطر ✋✖

✅ متوفر لجميع أنواع السيارات 🚘🚍
✅ تركيب فيشة بفيشة فبريكة بدون أي تعديل 💪
✅ متاح ( D1s - D2s - D3s - D4s - D5s ) ⚡
✅ ٣٠٠% إضاءة زيادة عن الإضاءة العادية ☄

✔ متنساش تسأل على عروضنا المتاحة 🔥
  
للتواصل: 01113999399 📱
مواعيدنا: من 11 ظهراً إلى 1 صباحاً

📌 العنوان: 24 شارع الخليفة الظافر - مدينة نصر - الحي السابع

----------
بتمشي كتير علي طرق بدون عواميد إنارة وعندك مشاكل في الرؤية وإنت سايق 🧐

لو عايز تبقي ماشي مطمن من كل مشاكل الطريق يبقي البوست دة ليك ♥👇

✔ سافر و إنت مطمن و تعالي نغير إضاءة عربيتك 
✅ إضاءة تصل الي 300% زيادة
✅ رؤية واضحة حتى في أسوأ ظروف الطقس
✅ إضاءة قوية لرؤية أكثر أمانا
✅ متوفر لجميع أنواع السيارات

✔ إسأل علي موديل عربيتك وهقولك المتاح ليها اية من اللمبات الليد وسعرة كام بالتركيب 😘
✔ مواعيدنا: من 11 ظهراً إلى 1 صباحاً

📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01113999399

📌 العنوان: 24 شارع الخليفة الظافر - مدينة نصر - الحي السابع

--------------


''');
    case 6:
      return ContentDetailPage(title: 'سياحة', content: '''مش هتلاقى الأسعار دى غير مع Lifetourz 😍
أسعار رحلاتنا الصيف ده غير أى حد و لما تسأل هتعرف بنفسك 💣
موجودين معاك فى كل حته فمصر 🌍
🌊 شرم الشيخ ،الغردقة ،دهب ، مرسى علم  ،العين السخنة، مرسي مطروح، الساحل 🛳

💣 عروض خاصة لشهر ٥ و٦ وعيد الأضحى المبارك بـــأقـــل ســــعـــــر 💸 

🎗 مع Lifetourz هتقضي اجازتك الجاية في احلي فنادق مصر و بأرخص الأسعار 🤑

✅ بنضمنلك كمان إقامة مميزة وده لأننا بنختار لك افخم الفنادق اللي بتقدم افضل الخدمات 
✅ رحلات لأجمل المعالم السياحية في  مصر (شرم الشيخ ،الغردقة ،دهب ، مرسى علم  ،العين السخنة، مرسي مطروح، الساحل )🌊❤
✅ شاملة الانتقالات والوجبات 

⭐ مستني ايه ؟ جهز نفسك لسفرية متتنسيش مع Lifetourz ❤
 
 عشان تعرف باقي الأسعار ابعتلنا رساله وهنبعت لك تفاصيل أكثر من 40 فندق ومنتجع 🌍💣

📱 للاستعلام:
📞 01000019388
📞 01112253911
📞 01270644073
📞 01101524954
📞 01026628767
📞 0233473248
❌ في حالة انشغال الخطوط برجاء ترك رساله واتس علي أي رقم وسوف يتم الرد خلال دقائق 

✔  ازاي تقدر تحجز 👇
⬅ ممكن تحجز عن طريق حسابنا في فودافون كاش
⬅ او عن طريق حسابتنا في بنك CIB
⬅ ممكن نبعتلك مندوب بايصال من الشركة
⬅أو مقر الشركة 

📍 267 شارع السودان - المهندسين - بعد الهواري ماركت - شركة لايف تورز للسياحة


''');
    case 7:
      return ContentDetailPage(title: 'خدمات النقل', content: '''
العفش من الحجات المهمة جداً وإنت بتنقل لشقتك الجديدة 😍
معانا هتنقل عفشك بأمان وسرعة وإحترافية👌

✔ دلوقتي هتنقل عفش بيتك من خلال عمالة مدربة على فك وتركيب ونقل العفش 
✅ لدينا أفضل عمالة مدربة ونجارين محترفين وفنيين لفك وتركيب جميع انواع الاثاث
✅ فني مطابخ
✅ فني غرف نوم

مع مؤسسة خير المدينة عمليه النقل بتم بكل ثقة وأمان 🥰

للتواصل و الأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تواصل فون و واتس 😍👇
0562689342
0568438132
------------------




كتير من الناس لما بتيجي تنقل بتكون خايفه حاجتها تتكسر أو تنقص 😧
مؤسسه الخير بتقولك متقلقش لأننا بنحسبها صح ومن أول مره 😍
بمعني مش بنسيب حاجه للظروف اولا بنحدد  عدد العمال  وعدد السيارات وأنواع التغليف
والفنيين المطلوبة من ( نجار - كهربائي  - و فني التكيفات )
✔ هنوفرلك كل خدمات نقل العفش بالكامل
✅ عربيات مغلقة مخصصة لنقل العفش
✅ نجاريين لفك وتركيب الاثاث
✅ تغليف الاثاث بأحدث الطرق 
✅ تغليف وتعبئة الصينى في كراتين
✅ عمالة مخصصة لنقل العفش
✅ فنيين تكييف وكهرباء للفك والتركيب
✅فريق متخصص للرد علي استفساراتكم على مدار 24 ساعة

مهمتها الأساسيه هي نقل الاثاث بأفضل الطرق والأساليب وده للحفاظ عليه من أي خدش أو كسر ممكن يحصل أثناء عمليه النقل 🚚


للتواصل و الأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تواصل فون و واتس 😍👇
0562689342
0568438132



''');
    case 8:
      return ContentDetailPage(title: 'لاند سكيب', content: '''الصيف داخل خلاص علينا والقعدة الحلوة بتبدأ من منظر جميل🌿🌳
يغير مودك ويحسن المزاج ويديك طاقة إيجابية ليومك 💚

✔️ شركة نيو لاند سكيب هتخلي بيتك جنة كل إحتياجات بيتك من اللاند سكيب في مكان واحد 🤗
✅ نجيلة طبيعي
✅ نجيلة صناعي
✅ تنسيق الحدائق والديكورات الخارجية
✅ جميع أعمال اللاند سكيب 
✅ وكمان بنوفرلك المعاينة مجاااانااا

✔️ الجمال الحقيقي للمنزل يبدأ من الحديقة المثالية 🌿

📣 للتواصل و الأستفسار إبعتلنا رسالة علي الصفحة 📩

أو التواصل فون و واتس علي 😍👇
01556636639
01050885507
================




عندك مساحة أرض فاضية ومش مستغلها ومحتاج تعمل  حمام سباحة 🤔

إستمتع برفاهية الحياة المائية وإكتشف معنى الإسترخاء الحقيقي مع حمامات السباحة المدهشة 🏊‍♂️💦

✔️لو بتفكر تعمل حمام سباحة بأحدث التصاميم  وبأسعار معقولة وجودة عالية يبقي إنت في المكان الصح شركة Natural views لأعمال الاندسكيب بتقدملك أجمل الموديلات والتصاميم العصرية لحمامات السباحة لأننا متخصصين في 👇
✅ حمامات السباحة 
✅ تنسيق الحدائق والديكورات الخارجية
✅ جميع أعمال اللاند سكيب 
✅ الهارد سكيب
✅ السوفت سكيب
✅حمامات السباحة 
✅ شبكات الري الذكية
✅ برجولات
✅ نوافير
✅ ديكورات الإضاءة الخارجية والأسوار
✅ المشايات الرخام والخشب الطبيعي
✅ أعمال الرخام والحجر والتجاليد
✅ نجيلة طبيعي
✅ نجيلة صناعي
✅ وكمان بنوفرلك المعاينة مجاااانااا

✔️ إجعل من كل يوم فرصة للهروب إلى عالم منعش من المياة 🏊🏻‍♂️

📣 للتواصل و الأستفسار إبعتلنا رسالة علي الصفحة 📩

أو التواصل فون و واتس علي 😍👇
01556636639
01050885507


''');
    case 9:

      return ContentDetailPage(title: 'طفايات الحريق', content: '''الإحساس بالأمان أكتر إحساس معظمنا بيفتقدوا خصوصاً لحظة حدوث حرائق 

حوادث الحرائق مفيش أكتر منها و بتتسبب في خسائر مادية و بشرية كبيرة جدا 😥
وعلشان تتفادها وتتجنب حدوثها تقدر تأمن مصنعك أو شركتك على أيدي المتخصصين بمنتهى الحرفية لضمان أعلى مستوى للأمان من خطر الحرائق 🔥🧯

وعلشان أمانك يبدأ معانا شركة الرحمة بتوفرلك الحماية الكاملة لبيتك و شركتك و مصنعك مع جميع أنواع الصناديق وأنظمة الحرائق بجميع ماركتها وجميع المقاسات 🥰
 ✔ ميلد استيل واستاايس استيل
✅ متوفر جميع أنواع طفايات الحريق 
✅ متوفر دولاب حريق بافاريا و SRI سنجل ودبل بسعر خاص للكميات
✅ تفاصيل الدولاب السنجل 80X80 X 30 بالبكره والحامل والخرطوم خرطوم حريق 1بوصه بطول 30 متر وقاذف متعدد 3مراحل 1 بوصه وحنفيه حريق 1 بوصه
✅ تفاصيل الدولاب السنجل 80X80 X 30 بالبكره والحامل والخرطوم 2.5 بوصه بطول 30 متر وقاذف متعدد 3 مراحل 2.5 بوصه وحنفية حريق 2.5 بوصة
✅ تفاصيل الدولاب الدبل عبارة عن بكارة حريق 1 بوصة بالخرطوم 30 متر وبكارة حريق 2.5بخرطوم 2.5بوصة 30متر ومحبس حريق 2.5بوصة وقاذف متعدد 3مراحل 2.5 بوصة 

✔ متاح جميع المشتملات الأصلية و المستوردة و المحلية و تقليد محلي بأفضل الأسعار 
✔ متاح جميع طفايات الحريق بافاريا والمصانع الحربيه بكل أنواعهم 
✔ متاح إسطوانات fm200 بأوزانها بأسعار مميزة

✅ أمانك رقم 1 بالنسبالنا 🤗

📣 لطلب الاوردر تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو من خلال أرقامنا 😍👇
فون: 01119011087
واتساب: ⁨01151929876
----------



إنت عليك الإستعلام و إحنا علينا الأمان
دلوقت تقدر تأمن بيتك وشركتك ومصنعك ضد جميع أنواع الحرائق🔥🧯
شركة الرحمه بتقدملك جميع أنواع الصناديق وأنظمة الحرائق بجميع ماركتها وجميع المقاسات 
✔ ميلد استيل واستاايس استيل
✅ متوفر جميع أنواع طفايات الحريق 
✅ متوفر دولاب حريق بافاريا و SRI سنجل ودبل بسعر خاص للكميات
✅ تفاصيل الدولاب السنجل 80X80 X 30 بالبكره والحامل والخرطوم خرطوم حريق 1بوصه بطول 30 متر وقاذف متعدد 3مراحل 1 بوصه وحنفيه حريق 1 بوصه
✅ تفاصيل الدولاب السنجل 80X80 X 30 بالبكره والحامل والخرطوم 2.5 بوصه بطول 30 متر وقاذف متعدد 3 مراحل 2.5 بوصه وحنفية حريق 2.5 بوصة
✅ تفاصيل الدولاب الدبل عبارة عن بكارة حريق 1 بوصة بالخرطوم 30 متر وبكارة حريق 2.5بخرطوم 2.5بوصة 30متر ومحبس حريق 2.5بوصة وقاذف متعدد 3مراحل 2.5 بوصة 

✔ كمان بنقدملك جميع المشتملات الأصلية و المستوردة و المحلية و تقليد محلي بأفضل الأسعار 🔥

✔ مع شركة الرحمة حمايتك أولويتنا 🤗

📣 لطلب الاوردر تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو من خلال أرقامنا 😍👇
فون: 01119011087
واتساب: ⁨01151929876
------------



''');
    case 10:
      return ContentDetailPage(title: 'مطاعم وكافيهات', content: '''
      جربت مطاعم كتير و موصلتش للطعم اللي أنت بتحبه؟ 
مع درش هتوصل للطعم الأصلي والسعر بتاع زمان😋😍

تعالى هنا أقولك ايه السبب 🤌
⿡ فراخنا كلها من مزارعنا 🐓
⿢ بنأكلها أجود أنواع الأعلاف بدون أي هرمونات 💪
⿣ فراخنا فريش يوميا من مزارعنا 🍗 
⿤ بنتبلها بأجود أنواع البهارات عشان نأكلك أحلى طعم ممكن تجربه 🥰

💣 وكمان عاملين لك عرض لمدة 15 يوم مينفعش تفوته 🫣

فرخة مشوية (فحم-شواية) + العيش و السلطات 🔥
ب 160 جنية بس بمناسبة افتتاح فرعنا الجديد 💥 🥳

👨🏻‍🍳 جربنا مش هتقدر تغيرنا 👨🏻‍🍳

أطلبنا الأن 👇
📱01150769892

📍العنوان:  شارع الأورمان - خلف أولاد رجب - اللبيني - الهرم

📍اللوكيشن: https://goo.gl/maps/BvfLP44GLcBB7NfU8 



''');
    case 11:
      return ContentDetailPage(title: 'مجالات اخري', content: '''
      المطبخ اهم شيء لكل ست بيت😍
لو بتدوري على مطبخ تطلعي فيه الشيف اللي جواكي ويكون شيك وعملي في نفس الوقت👩🏻‍🍳

عندنا هنحققلك حلمك و مش هنخلي نفسك في حاجه 🫶🏻😌

بنصمم و ننفذ الشكل اللي تختاريه  بأفضل الاسعار واجود الخامات في السوق
✔ الالوميتال
✔الخشمونيوم
✔الاكريليك
✔الكلادينج
✔البولي لاك
✔اليوفي لاك

وعشان اهم مرحلة هي مرحلة التصميم نفسه 👇
عندنا مهندسين متخصصين لتصميم مطبخك👨🏻‍🚒

هتقدر تستغل مساحة مطبخك صح🥰🥰🥰
 وبأحدث التصميمات وكمان بخصم 15% 🎉

للتواصل و الاستفسار👇
 📱01015317253
او ابعتلنا على رسائل الصفحة 💬

------


ديكور البيت من الحاجات المهمة لأنها بتديله لمسات جميلة ✨ 
وديكور الواجهات من أول الحاجات اللي بتشوفها العين وبتشد الإنتباه 👀

إحنا عارفين إن الإختيار مش سهل وقدامك مصانع وورش كثير وبتشوف كل يوم إعلانات و عروض و كلام أكتر بس الأهم هو التنفيذ علشان كدة إحنا بنضمنلك أفضل جودة بأقل سعر 👌
لو عندك شقة أو فيلا أو شالية لو إنت شركة تشطيبات أو صاحب محل تجاري معانا هتقدر تركب الوميتال بسعر مناسب وأعلي جودة 💯 

✔ متخصصون في جميع أنواع 👇
✅ الألوميتال 
✅ المطابخ
✅ شيش الحصير يدوي و إلكتروني
‏✅ كبائن شاور
✅ تنفيذ جميع أعمال الوجهات السوناتا و السيكوريت
✅ دريسينج روم
✅ أبواب وشبابيك upvc

✔ الأبواب والشبابيك والمطابخ بكافة القطاعات وكافة الخامات والإكسسوارات 
✅ بى اس صغير 
✅ بي اس كبير 
✅ تانجو 
✅ جامبو 
✅ فالفية و ميني فالفية

✔ ركب و إنت متطمن  لأن جميع القطاعات من شركة شريف علي حسن 😍

للتواصل و الأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01015317253



-------------------


مع إرتفاع درجات الحرارة بتزيد البكيتريا والجراثيم فى خزانك🧐
علشان كده إحنا فى مؤسسه الخير بنقوم بعملية تنظيف وتطهير خزانك علشان نضمنلك مياه نظيفة💧
✔ تنظيف وتطهير خزانات المياه ضروري لحمايتك لأنك كل يوم بتستخدم مياة الخزان في👇🏻 
✅ غسيل الأواني للأكل والشرب
✅ تحضير الطعام وغسل الفاكهة والخضروات
✅ غسل الأيدي والاستحمام والوضوء وغسل الأسنان 
✅ نظافة المياه لها تأثير حتى على نضارة بشرتك

✔ الغرض من التعقيم
✅ الحصول على ماء نظيف عن طريق غسيل وشطف تنكات وخزنات المياه بمسحوق الغسيل والكلور من الشوائب وما بها من رواسب لمنع تلوثها أو نمو ميكروبي بها👌

خليك حريص على صحتك وصحة أسرتك وإهتم بتنظيف خزانك بشكل دوري منتظم 🥰

للتواصل و الأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تواصل فون و واتس 😍👇
0562689342
0568438132


--------------


متخليش خوفك من الحشرات يقلق منامك🧐
قل وداعا للخوف واللإزعاج وأحصل الأن علي خدمات مكافحة الحشرات 🪳🪰
مع مؤسسة خير المدينة هتتخلص نهائيا من الحشرات المرعبة اللي بتزعجك إنت و أسرتك😍
✔ إبادة جميع انواع الحشرات والقوارض 
✅ فريق عمل مدرب علي أعلي مستوي
✅ مواد مكافحة أمنة جداً للصحة العامة
✅ مبيدات أمنه تماما وبدون مغادرة المنزل

✔ إقضي علي جميع أنواع الحشرات نهائيا بأفضل الأسعار في جميع أنحاء المملكة 🥰

للتواصل و الأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تواصل فون و واتس 😍👇
0562689342
0568438132


----------------


قرار السفر عليك وتجهيزات السفر علينا إحنا 😍

عايز تشتغل برا مصر في مهنة بتحبها والتكاليف عالية ؟🤔
لو معاك مؤهل أو إنت صنايعي شغلك عندنا ومتشيلش هم المصاريف إحنا معاك وهنساعدك لحد ما توصل لحلمك 

✔ مجموعة دروب الخير هي شركة توظيف المصريين بالخارج في كل التخصصات والمجالات
✅  أطباء
✅ مهندسين
✅ صنايعية
✅ و كمان جميع المهن الأخري

✔ مع شركة دروب الخير إنت عليك التقديم وإحنا علينا التنفيذ وخليك في المضمون 🥰


📣 للتواصل والأستفسار تقدر تتواصل معانا من خلال رسايل الصفحة 📩

أو تقدر تتواصل فون و واتس 😍👇
01226624993
0223647175

📌 العنوان: 4 شارع أحمد الحاسب الدور التاني شقة 5 منيل الروضة القاهرة


-------------


''');
    default:
      return ContentDetailPage(title: 'غير معروف', content: 'المحتوى غير متاح.');
  }
}

class ContentDetailPage extends StatelessWidget {
  final String title;
  final String content;

  ContentDetailPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            content,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

const List<String> fields = [
  'اثاث منزلي',
  'ملابس',
  'عقارات',
  'عطور',
  'خدمات طبية',
  'سيارات',
  'سياحة',
  'خدمات النقل',
  'لاند سكيب',
  'طفايات الحريق',
  'مطاعم وكافيهات',
  'مجالات اخري'
];