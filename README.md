# MyCGM

Introducing MyCGM, the mobile app for diabetics who track their blood glucose levels, insulin treatments, and carb intake. With a clean, simple, and easy-to-use interface, MyCGM takes the hassle out of recording these crucial pieces of information. Simply link your Nightscout account to the app, and MyCGM does the rest, presenting everything in a beautiful interface.

* Track your blood glucose levels, insulin treatments, and carb intake in a simple, clean, and efficient manner;
* Featuring a visually appealing interface that shows your levels at a quick glance, with green indicating target range, orange indicating above range, and red indicating below range;
* See a beautiful chart of your previous glucose readings and an easy-to-read glance of your treatments;
* COMING SOON: Google Assistant integration will allow you to ask your smart speaker for your latest glucose levels and even add insulin treatments via voice.
* COMING SOON: Add MyCGM into your smart home automations! Have Google Assistant automatically tell you your blood glucose levels as part of your 'Good Morning' or 'Goodnight' routines/automations.
* COMING SOON: Get a visual alert when levels are outside range by linking MyCGM to your smart lights. For example, turn specific lights red when you need to take action!

MyCGM cuts through the clutter and gives users a quick, simple, and visually appealing way to track this important health data. 

Join the private beta today and take your CGM to the next level.



## Getting Started

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.
