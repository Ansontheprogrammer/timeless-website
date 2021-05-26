#  #100DaysOfCode

I have decided to use this project to complete my #100daysofcodechallenge.

# Goal

I wanted to use a technology that I have not used before and I thought Flutter Web would be perfect. I have experience with Flutter but Flutter Web seemed very interesting to me and I would love to be competent with using it prior to it being released for production. I'm personally a big fan of many google technologies however this one takes the cake. I could only dream of creating a mobile app that is responsive in the browser. Maybe it's to ambitious but we can try right :-). Depending on the success of this project I may expand this website to also being optimized on a desktop application and mobile application.

# Bonus

Use some conditional logic to have the website also build as a mobile application. This should include many standard things for mobile applications such as App bars, snack bars, etc.

## Startup

### CORS
To display the images from Firebase storage you will need to install gsutil. This will resolve the cors issue that will be received using web.
https://cloud.google.com/storage/docs/gsutil_install

Next you must create a JSON file containing your local server info.
```[
    {
      "origin": ["http://localhost:58553/"],
      "responseHeader": ["Content-Type"],
      "method": ["GET", "HEAD", "DELETE"],
      "maxAgeSeconds": 3600
    }
]```

Then you can set your CORS using this command (With file 'cors.json' created)
`gsutil cors set cors.json gs://timeless-app-607e3.appspot.com`

### Firebase

This script will be needed in your web/index.html file to use the Firebase services

``` <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js"></script>
  <script src="http://www.gstatic.com/firebasejs/8.3.1/firebase-analytics.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-storage.js"></script>
  <script src="http://www.gstatic.com/firebasejs/7.20.0/firebase-firestore.js"></script>
  <!-- The core Firebase JS SDK is always required and must be listed first -->
  
  <!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#available-libraries -->
  
  <script>
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    var firebaseConfig = {
      apiKey: "API-KEY",
      authDomain: "AUTH-DOMAIN",
      projectId: "PROJECT-ID",
      storageBucket: "STORAGE-BUCKET",
      messagingSenderId: "MESSAGING-SENDER-ID",
      appId: "APP-ID",
      measurementId: "MEASUREMENT-ID"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
      // firebase.analytics();
  </script>```

### Null Safety
Depending on if you've added configurations to run null safety from your IDE you may need to run it from the terminal.
`flutter run --no-sound-null-safety`
