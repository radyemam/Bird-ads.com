const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const admin = require('firebase-admin');
admin.initializeApp();

// إعداد nodemailer مع بيانات الاعتماد الصحيحة
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'radyemam08@gmail.com',
    pass: 'wodxghpbicdyslzs'  // ضع هنا كلمة مرور التطبيق التي أنشأتها
  }
});

exports.sendVerificationCode = functions.https.onCall(async (data, context) => {
  const email = data.email;

  if (!email) {
    throw new functions.https.HttpsError('invalid-argument', 'The function must be called with ' +
      'one argument "email" containing the email address to send verification code to.');
  }

  // Generate a verification code
  const verificationCode = Math.floor(100000 + Math.random() * 900000).toString();

  // Save the verification code to Firestore (or any other database)
  await admin.firestore().collection('verificationCodes').doc(email).set({
    code: verificationCode,
    timestamp: admin.firestore.FieldValue.serverTimestamp()
  });

  // إعداد رسالة البريد الإلكتروني
  const mailOptions = {
    from: 'radyemam08@gmail.com',
    to: email,
    subject: 'Verification Code',
    text: `Your verification code is ${verificationCode}`
  };

  try {
    // إرسال البريد الإلكتروني
    await transporter.sendMail(mailOptions);
    return { success: true, code: verificationCode };
  } catch (error) {
    console.error('Error sending email:', error);
    return { success: false, error: error.toString() };
  }
});
