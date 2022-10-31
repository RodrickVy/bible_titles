import 'dart:collection';

import 'package:bibletiles/domain/models/game/team.profile.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tile.question.dart';
import 'package:bibletiles/domain/models/game/tiles.category.dart';

mixin GameMetaData {
  static const List<TeamProfile> suggestedProfiles = [
    TeamProfile(name: "Holy Opposition", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Overcoming Battles", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Wine Lovers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Consumed by his Glory", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Grand Central", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Keeping Our Eyes On Jesus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Occupy", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Christ’s Crowd", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Pivot Upper Stone", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Soul Fields", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Winning in Faith", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Faith Fighters", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Holiness is Calling", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Staunch Ladies", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Confrontation for Christ", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Join Christian Team", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Rendezvous of Believers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Dolls With Balls", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Jesus Eclipses All", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Proclaim His Name", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "No One Reads Philemon", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Walkie Talkies", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Clay Symbol", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "His Ways are Greater", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Looking Above", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Mad Monkey", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Block Heads", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Waste Brains", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Glory Bound", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We Will Thrive", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Big House", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We Found Hope", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Choir of Angels", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Zealous for Jesus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "It’s Reality", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Professing Our Faith", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Forgot to Warm-up.", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Sanctified", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Collective", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Journey", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Radical", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The King’s Acquaintances", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Risen Challengers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Sin Redemption", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Echoes of Mercy", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Cornerstone", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "For the King", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Dangerous Dynamos", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We Belong to God", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We Will Rise", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Egyptian Frog Casserole", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Souled Out", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Soul Testament", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Leaning on Jesus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Agape", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We are One", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Zeal for Victory", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Our Exodus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Invincible", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Follow the Christ", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Lifeline Legacy", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Storm Chasers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Set Us Free", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Refreshing Grace", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Unconditionally Free", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Refuge for Our Souls", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Breaking Point", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Mountaineers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Firm Stance", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Cross Roads", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Outburst", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Strength Renewed: Isaiah", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Lamentations", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Way, The Truth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Eagle Wings", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "My Strength", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Truth Tribe", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Lifted Up!", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "In Humility: Philippians", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Awakened", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Good News", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Bible Buddies", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Risen Life", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Fierce Nile Blood Squad", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Glory Unspeakable", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "On Fire", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Unknowns People", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "ReGeneration", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Flock of Believers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Once Blind[3]", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We are Changed", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Forever Changed", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Proclaiming Our Salvation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Shelter in the Storm", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "All in the Mind", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Samson Mullet", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Acute Awareness", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Be the Light", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Youth Group", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Unfired", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "God With Us: Deuteronomy", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Blessed Peace Battalion", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Genesis", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Arise & Compete!: 2 Samuel", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Baby Got Track", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "With Strength: Philippians", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Victory Is HIS", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Warriors of Faith", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Never Weary: Isaiah", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Victory in Jesus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Redeeming Blood Brigade", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Wise & Righteous: Proverbs", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Christian Team Names", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Warriors With Blessed Peace", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Never Weary: Galatians", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "God’s Generation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Revolutionary", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "It’s Ladies Group", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Always Steadfast", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Getting Personal With God", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Axis", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Opening Belief", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Arising Generation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Overcomers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Waiting on the Lord", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Amplified", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Breakthrough", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Communion in Competition", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Life, Faith, & Compete", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Justified: Luke", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We Will Worship", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Penitent Posse", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "We Press On Philippians", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Atonement Alliance", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Rugged Cross Rebels", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Imperishable: 1 Corinthians", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Bible Believers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "His Squad", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Thessalonian Lisp", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Be The Light", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Chain Reactions", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Real Thing", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Faith Found", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Redemption", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Big House", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Gracepointe", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Good for God", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "A Chosen Generation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Proclaim His Name", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "God Squad", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Jolt Jubilee", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Shears of Delilah", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "A Place for Truth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Good News", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Chosen Generation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "C.I.A. (Christians In Action)", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Catalyst", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Truth Seekers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Epic", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Arise and Shine", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Soul Fuel", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Arising Generation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Glory Bound", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Kid Zone", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Conquerers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Power Surge", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Faith Factor", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Kingdom Youth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Writing His-Story", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Movers & Seekers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Christ Inside", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Lifeline", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Journey", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Propitiation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Adventure Kids", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Army of God", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Faith in Following", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Imprint", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Kids Connection", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Grace Gang", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "J-Walkers (Walking With Jesus)", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Ground Zero", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "No Limits", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Destiny Youth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Anointed", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Fierce Nile Blood Squad", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Fireproof", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Apostles", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "New Life", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Jesus Freaks", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Legacy", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Disciples Union", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Grand Central", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Be Still", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Think Spiritually", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Egyptian Frog Casserole", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Purpose", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Deeper Roots", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Catch Fire", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "focus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Disciple This", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Changed", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Soul Squad", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Everywhere He Wants Us to Be", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Give Me Back My Rib", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "One Way", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Overcome", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Fuel", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Job Had It Coming", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Glow", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Lost & Found", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Where Hope is Found", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Light House", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "No One Reads Philemon", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Desire Truth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Pathfinders", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Occupy", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Collective", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Bible Buddies", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Abide", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Lifeforce", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Aftershock", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Nu Creations", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Deliver Hope", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "About Face", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "One Truth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Breakthrough", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "I'm Lovin' Him", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Unpardonable Win", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Alert", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Overcomers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Front Line", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "All for Jesus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "CrossWay", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Servants of Salvation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Praise Pack", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Exodus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Bathroom of the Ark", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Power Walk", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "I'm Livin' It", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Reflect + Revive", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Forge", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Contenders", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Access", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Mountain Movers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Once Blind", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "The Abomination of Desolation", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Teens for Truth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Amplified", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Gateway", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Breakthrough Brigade", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Manger Danger", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Forever His Followers", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Mighty Youth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Stench of Lazarus", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Above & Beyond", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Biblical Proportions", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Living Stones", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Impact", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Samson Mullet", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Worthy Warriors", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "God Gang", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Ablaze", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "For the King", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Battle Ready", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Fellow Citizens", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Breaking Point", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Cross Walk", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "ALTARed", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Christ's Crusaders", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Absolute Truth", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "On Fire", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Gomorrah Forecast", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Empowered", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Hopes Answer", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Parable of the Beatdown", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Refuge", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Agape", avatar: "assets/images/default_avatar.png"),
    TeamProfile(name: "Plugged In", avatar: "assets/images/default_avatar.png"),
  ];

  static List<TilesCategory> categories = [
    TilesCategory(
      name: "David",
      themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
      image: 'assets/logos/icon.png',
      description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
      categoryTiles: <int, List<Tile>>{
        100: [
          const Tile(
            question: "What was David's job as a young boy?",
            answer: ' Shepherd',
            explanation:
                "David was not just an ordinary boy, but one who trusted in God to help him slay the lions and bears who came to attack the sheep. 1 Sam 17:34 ",
            image: '',
          ),
          const Tile(
            question: "Who was the king of Israel before David?",
            answer: 'Soul',
            explanation:
                "I Samuel 9 and 10 tell us that Saul was the first king, and David came after him. Solomon, Josiah, and Hezekiah were kings after David.",
            image: '',
          )
        ],
        200: [
          const Tile(
              image: '',
              question:
                  "Before David married King Saul's daughter, Michal, Saul had offered David another of his daughters in marriage. What was her name?",
              answer: 'Merab',
              explanation:
                  "Following David's slaying of the Philistine giant, Goliath, David was compelled by King Saul to stay at the palace."
                  " David was successful in all he did, so Saul promoted him to a high rank in the army. "
                  "All the people loved David so much that Saul became quite jealous and wanted David dead. "
                  "As part of his strategy he decided to offer his older daughter Merab to David in marriage. "
                  "His only request was that David would continue to serve him in the army."
                  " He thought that by doing this it would be inevitable that David would be killed at some point.  (See 1 Samuel 18)."),
          const Tile(
            question: "What was the bride price that King Saul requested from David for his daughter Michal?",
            answer: '100 Philistine foreskins',
            explanation:
                "After David's refusal to marry Saul's older daughter, King Saul discovered that his daughter Michal was actually in love with David. He saw another opportunity to try to get David to become his son-in-law and thought that Michal could be used as a snare to trap David. David however refused the offer again on the grounds of being a poor man, presumably implying that he wouldn't be able to afford the bride price required by a king. Saul saw this as an opportunity to get David killed so didn't ask for money or anything of monetary value: he simply asked David to go and kill 100 Philistines and bring back their foreskins! (This sounds somewhat gruesome to modern ears!) David agreed to the challenge and went to it with a vengeance. He and his men went out and killed not 100 but 200 Philistines and brought their foreskins to the king. And so David and Michal were married. (See 1 Samuel 18:20-27).",
            image: '',
          ),
        ],
        300: [
          const Tile(
              image: '',
              question:
              "Where was David's third anointing?",
              answer: 'Hebron',
              explanation:
              "David was anointed the first time in Bethleham by Samuel before Saul knew about David. The second and third anointings were in Hebron. The second was for part of Israel and the third was for all of Israel."),
          const Tile(
            question: " How many sons did Jesse have, and what was David's placing among them, according to 1 Samuel?",
            answer: '8 sons, youngest',
            explanation:
            "1 Samuel 17:12b Jesse had eight sons, and in Saul's time he was old and well advanced in years. Samuel originally thought that the oldest son, Eliab, would be the one who was to be king, but God replied in 1 Samuel 16:7 The Lord does not look at the things man looks at. Man looks at the outward appearance, but the Lord looks at the heart. Meaning to say God did not choose the oldest, but the most faithful.",
            image: '',
          ),
        ],
        400: [
          const Tile(
              image: '',
              question:
              " How many years did David reign as king?",
              answer: '40',
              explanation:
              "I Kings 2:11 - David reigned for seven years in Hebron, and then thirty-three years in Jerusalem."),
          const Tile(
            question: "While still a young man, David was called into the service of Saul. He became an armor-bearer and did what other task for the king?",
            answer: 'Played the harp',
            explanation:
            "Whenever the spirit from God came upon Saul, David would take his harp and play. Then relief would come to Saul; he would feel better, and the evil spirit would leave him. (1 Samuel 16:23)",
            image: '',
          ),
        ],
        500: [
          const Tile(
              image: '',
              question:
              "How did Michal help David to escape from her father when he was trying to kill David?",
              answer: 'Let him down through the window',
              explanation:'''
              Saul's jealousy and hatred of David continued and Saul was constantly on the lookout for an opportunity to kill his son-in-law. One night Saul sent men to watch David's house with the plan to kill him the next morning. Michal must have heard of this, though, and persuaded her husband that he had to flee for his life. She let him down out of a window and he was able to escape.

Michal then dressed an idol and put it in David's place in the bed. When Saul's men came the next day she pretended that David was ill so they couldn't see him. On hearing this her father himself then came to the house and was angry with her deception. (See 1 Samuel 19:11-17).
              '''),
        ]
      },
    ),
    TilesCategory(
      name: "Kings Of Isreal",
      themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
      image: 'assets/logos/icon.png',
      description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
      categoryTiles: <int, List<Tile>>{
        100: [
          const Tile(
            question: "What was David's job as a young boy?",
            answer: ' Shepherd',
            explanation:
            "David was not just an ordinary boy, but one who trusted in God to help him slay the lions and bears who came to attack the sheep. 1 Sam 17:34 ",
            image: '',
          ),
          const Tile(
            question: "Who was the king of Israel before David?",
            answer: 'Soul',
            explanation:
            "I Samuel 9 and 10 tell us that Saul was the first king, and David came after him. Solomon, Josiah, and Hezekiah were kings after David.",
            image: '',
          )
        ],
        200: [
          const Tile(
              image: '',
              question:
              "Before David married King Saul's daughter, Michal, Saul had offered David another of his daughters in marriage. What was her name?",
              answer: 'Merab',
              explanation:
              "Following David's slaying of the Philistine giant, Goliath, David was compelled by King Saul to stay at the palace."
                  " David was successful in all he did, so Saul promoted him to a high rank in the army. "
                  "All the people loved David so much that Saul became quite jealous and wanted David dead. "
                  "As part of his strategy he decided to offer his older daughter Merab to David in marriage. "
                  "His only request was that David would continue to serve him in the army."
                  " He thought that by doing this it would be inevitable that David would be killed at some point.  (See 1 Samuel 18)."),
          const Tile(
            question: "What was the bride price that King Saul requested from David for his daughter Michal?",
            answer: '100 Philistine foreskins',
            explanation:
            "After David's refusal to marry Saul's older daughter, King Saul discovered that his daughter Michal was actually in love with David. He saw another opportunity to try to get David to become his son-in-law and thought that Michal could be used as a snare to trap David. David however refused the offer again on the grounds of being a poor man, presumably implying that he wouldn't be able to afford the bride price required by a king. Saul saw this as an opportunity to get David killed so didn't ask for money or anything of monetary value: he simply asked David to go and kill 100 Philistines and bring back their foreskins! (This sounds somewhat gruesome to modern ears!) David agreed to the challenge and went to it with a vengeance. He and his men went out and killed not 100 but 200 Philistines and brought their foreskins to the king. And so David and Michal were married. (See 1 Samuel 18:20-27).",
            image: '',
          ),
        ],
        300: [
          const Tile(
              image: '',
              question:
              "Where was David's third anointing?",
              answer: 'Hebron',
              explanation:
              "David was anointed the first time in Bethleham by Samuel before Saul knew about David. The second and third anointings were in Hebron. The second was for part of Israel and the third was for all of Israel."),
          const Tile(
            question: " How many sons did Jesse have, and what was David's placing among them, according to 1 Samuel?",
            answer: '8 sons, youngest',
            explanation:
            "1 Samuel 17:12b Jesse had eight sons, and in Saul's time he was old and well advanced in years. Samuel originally thought that the oldest son, Eliab, would be the one who was to be king, but God replied in 1 Samuel 16:7 The Lord does not look at the things man looks at. Man looks at the outward appearance, but the Lord looks at the heart. Meaning to say God did not choose the oldest, but the most faithful.",
            image: '',
          ),
        ],
        400: [
          const Tile(
              image: '',
              question:
              " How many years did David reign as king?",
              answer: '40',
              explanation:
              "I Kings 2:11 - David reigned for seven years in Hebron, and then thirty-three years in Jerusalem."),
          const Tile(
            question: "While still a young man, David was called into the service of Saul. He became an armor-bearer and did what other task for the king?",
            answer: 'Played the harp',
            explanation:
            "Whenever the spirit from God came upon Saul, David would take his harp and play. Then relief would come to Saul; he would feel better, and the evil spirit would leave him. (1 Samuel 16:23)",
            image: '',
          ),
        ],
        500: [
          const Tile(
              image: '',
              question:
              "How did Michal help David to escape from her father when he was trying to kill David?",
              answer: 'Let him down through the window',
              explanation:'''
              Saul's jealousy and hatred of David continued and Saul was constantly on the lookout for an opportunity to kill his son-in-law. One night Saul sent men to watch David's house with the plan to kill him the next morning. Michal must have heard of this, though, and persuaded her husband that he had to flee for his life. She let him down out of a window and he was able to escape.

Michal then dressed an idol and put it in David's place in the bed. When Saul's men came the next day she pretended that David was ill so they couldn't see him. On hearing this her father himself then came to the house and was angry with her deception. (See 1 Samuel 19:11-17).
              '''),
        ]
      },
    ),
    TilesCategory(
      name: "Kings Of Isreal",
      themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
      image: 'assets/logos/icon.png',
      description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
      categoryTiles: <int, List<Tile>>{
        100: [
          const Tile(
            question: "What was David's job as a young boy?",
            answer: ' Shepherd',
            explanation:
            "David was not just an ordinary boy, but one who trusted in God to help him slay the lions and bears who came to attack the sheep. 1 Sam 17:34 ",
            image: '',
          ),
          const Tile(
            question: "Who was the king of Israel before David?",
            answer: 'Soul',
            explanation:
            "I Samuel 9 and 10 tell us that Saul was the first king, and David came after him. Solomon, Josiah, and Hezekiah were kings after David.",
            image: '',
          )
        ],
        200: [
          const Tile(
              image: '',
              question:
              "Before David married King Saul's daughter, Michal, Saul had offered David another of his daughters in marriage. What was her name?",
              answer: 'Merab',
              explanation:
              "Following David's slaying of the Philistine giant, Goliath, David was compelled by King Saul to stay at the palace."
                  " David was successful in all he did, so Saul promoted him to a high rank in the army. "
                  "All the people loved David so much that Saul became quite jealous and wanted David dead. "
                  "As part of his strategy he decided to offer his older daughter Merab to David in marriage. "
                  "His only request was that David would continue to serve him in the army."
                  " He thought that by doing this it would be inevitable that David would be killed at some point.  (See 1 Samuel 18)."),
          const Tile(
            question: "What was the bride price that King Saul requested from David for his daughter Michal?",
            answer: '100 Philistine foreskins',
            explanation:
            "After David's refusal to marry Saul's older daughter, King Saul discovered that his daughter Michal was actually in love with David. He saw another opportunity to try to get David to become his son-in-law and thought that Michal could be used as a snare to trap David. David however refused the offer again on the grounds of being a poor man, presumably implying that he wouldn't be able to afford the bride price required by a king. Saul saw this as an opportunity to get David killed so didn't ask for money or anything of monetary value: he simply asked David to go and kill 100 Philistines and bring back their foreskins! (This sounds somewhat gruesome to modern ears!) David agreed to the challenge and went to it with a vengeance. He and his men went out and killed not 100 but 200 Philistines and brought their foreskins to the king. And so David and Michal were married. (See 1 Samuel 18:20-27).",
            image: '',
          ),
        ],
        300: [
          const Tile(
              image: '',
              question:
              "Where was David's third anointing?",
              answer: 'Hebron',
              explanation:
              "David was anointed the first time in Bethleham by Samuel before Saul knew about David. The second and third anointings were in Hebron. The second was for part of Israel and the third was for all of Israel."),
          const Tile(
            question: " How many sons did Jesse have, and what was David's placing among them, according to 1 Samuel?",
            answer: '8 sons, youngest',
            explanation:
            "1 Samuel 17:12b Jesse had eight sons, and in Saul's time he was old and well advanced in years. Samuel originally thought that the oldest son, Eliab, would be the one who was to be king, but God replied in 1 Samuel 16:7 The Lord does not look at the things man looks at. Man looks at the outward appearance, but the Lord looks at the heart. Meaning to say God did not choose the oldest, but the most faithful.",
            image: '',
          ),
        ],
        400: [
          const Tile(
              image: '',
              question:
              " How many years did David reign as king?",
              answer: '40',
              explanation:
              "I Kings 2:11 - David reigned for seven years in Hebron, and then thirty-three years in Jerusalem."),
          const Tile(
            question: "While still a young man, David was called into the service of Saul. He became an armor-bearer and did what other task for the king?",
            answer: 'Played the harp',
            explanation:
            "Whenever the spirit from God came upon Saul, David would take his harp and play. Then relief would come to Saul; he would feel better, and the evil spirit would leave him. (1 Samuel 16:23)",
            image: '',
          ),
        ],
        500: [
          const Tile(
              image: '',
              question:
              "How did Michal help David to escape from her father when he was trying to kill David?",
              answer: 'Let him down through the window',
              explanation:'''
              Saul's jealousy and hatred of David continued and Saul was constantly on the lookout for an opportunity to kill his son-in-law. One night Saul sent men to watch David's house with the plan to kill him the next morning. Michal must have heard of this, though, and persuaded her husband that he had to flee for his life. She let him down out of a window and he was able to escape.

Michal then dressed an idol and put it in David's place in the bed. When Saul's men came the next day she pretended that David was ill so they couldn't see him. On hearing this her father himself then came to the house and was angry with her deception. (See 1 Samuel 19:11-17).
              '''),
        ]
      },
    ),
    TilesCategory(
      name: "Chain Of Prophecy",
      themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
      image: 'assets/logos/icon.png',
      description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
      categoryTiles: <int, List<Tile>>{
        100: [
          const Tile(
            question: "What was David's job as a young boy?",
            answer: ' Shepherd',
            explanation:
            "David was not just an ordinary boy, but one who trusted in God to help him slay the lions and bears who came to attack the sheep. 1 Sam 17:34 ",
            image: '',
          ),
          const Tile(
            question: "Who was the king of Israel before David?",
            answer: 'Soul',
            explanation:
            "I Samuel 9 and 10 tell us that Saul was the first king, and David came after him. Solomon, Josiah, and Hezekiah were kings after David.",
            image: '',
          )
        ],
        200: [
          const Tile(
              image: '',
              question:
              "Before David married King Saul's daughter, Michal, Saul had offered David another of his daughters in marriage. What was her name?",
              answer: 'Merab',
              explanation:
              "Following David's slaying of the Philistine giant, Goliath, David was compelled by King Saul to stay at the palace."
                  " David was successful in all he did, so Saul promoted him to a high rank in the army. "
                  "All the people loved David so much that Saul became quite jealous and wanted David dead. "
                  "As part of his strategy he decided to offer his older daughter Merab to David in marriage. "
                  "His only request was that David would continue to serve him in the army."
                  " He thought that by doing this it would be inevitable that David would be killed at some point.  (See 1 Samuel 18)."),
          const Tile(
            question: "What was the bride price that King Saul requested from David for his daughter Michal?",
            answer: '100 Philistine foreskins',
            explanation:
            "After David's refusal to marry Saul's older daughter, King Saul discovered that his daughter Michal was actually in love with David. He saw another opportunity to try to get David to become his son-in-law and thought that Michal could be used as a snare to trap David. David however refused the offer again on the grounds of being a poor man, presumably implying that he wouldn't be able to afford the bride price required by a king. Saul saw this as an opportunity to get David killed so didn't ask for money or anything of monetary value: he simply asked David to go and kill 100 Philistines and bring back their foreskins! (This sounds somewhat gruesome to modern ears!) David agreed to the challenge and went to it with a vengeance. He and his men went out and killed not 100 but 200 Philistines and brought their foreskins to the king. And so David and Michal were married. (See 1 Samuel 18:20-27).",
            image: '',
          ),
        ],
        300: [
          const Tile(
              image: '',
              question:
              "Where was David's third anointing?",
              answer: 'Hebron',
              explanation:
              "David was anointed the first time in Bethleham by Samuel before Saul knew about David. The second and third anointings were in Hebron. The second was for part of Israel and the third was for all of Israel."),
          const Tile(
            question: " How many sons did Jesse have, and what was David's placing among them, according to 1 Samuel?",
            answer: '8 sons, youngest',
            explanation:
            "1 Samuel 17:12b Jesse had eight sons, and in Saul's time he was old and well advanced in years. Samuel originally thought that the oldest son, Eliab, would be the one who was to be king, but God replied in 1 Samuel 16:7 The Lord does not look at the things man looks at. Man looks at the outward appearance, but the Lord looks at the heart. Meaning to say God did not choose the oldest, but the most faithful.",
            image: '',
          ),
        ],
        400: [
          const Tile(
              image: '',
              question:
              " How many years did David reign as king?",
              answer: '40',
              explanation:
              "I Kings 2:11 - David reigned for seven years in Hebron, and then thirty-three years in Jerusalem."),
          const Tile(
            question: "While still a young man, David was called into the service of Saul. He became an armor-bearer and did what other task for the king?",
            answer: 'Played the harp',
            explanation:
            "Whenever the spirit from God came upon Saul, David would take his harp and play. Then relief would come to Saul; he would feel better, and the evil spirit would leave him. (1 Samuel 16:23)",
            image: '',
          ),
        ],
        500: [
          const Tile(
              image: '',
              question:
              "How did Michal help David to escape from her father when he was trying to kill David?",
              answer: 'Let him down through the window',
              explanation:'''
              Saul's jealousy and hatred of David continued and Saul was constantly on the lookout for an opportunity to kill his son-in-law. One night Saul sent men to watch David's house with the plan to kill him the next morning. Michal must have heard of this, though, and persuaded her husband that he had to flee for his life. She let him down out of a window and he was able to escape.

Michal then dressed an idol and put it in David's place in the bed. When Saul's men came the next day she pretended that David was ill so they couldn't see him. On hearing this her father himself then came to the house and was angry with her deception. (See 1 Samuel 19:11-17).
              '''),
        ]
      },
    ),
    TilesCategory(
      name: "The Early Church",
      themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
      image: 'assets/logos/icon.png',
      description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
      categoryTiles: <int, List<Tile>>{
        100: [
          const Tile(
            question: "What was David's job as a young boy?",
            answer: ' Shepherd',
            explanation:
            "David was not just an ordinary boy, but one who trusted in God to help him slay the lions and bears who came to attack the sheep. 1 Sam 17:34 ",
            image: '',
          ),
          const Tile(
            question: "Who was the king of Israel before David?",
            answer: 'Soul',
            explanation:
            "I Samuel 9 and 10 tell us that Saul was the first king, and David came after him. Solomon, Josiah, and Hezekiah were kings after David.",
            image: '',
          )
        ],
        200: [
          const Tile(
              image: '',
              question:
              "Before David married King Saul's daughter, Michal, Saul had offered David another of his daughters in marriage. What was her name?",
              answer: 'Merab',
              explanation:
              "Following David's slaying of the Philistine giant, Goliath, David was compelled by King Saul to stay at the palace."
                  " David was successful in all he did, so Saul promoted him to a high rank in the army. "
                  "All the people loved David so much that Saul became quite jealous and wanted David dead. "
                  "As part of his strategy he decided to offer his older daughter Merab to David in marriage. "
                  "His only request was that David would continue to serve him in the army."
                  " He thought that by doing this it would be inevitable that David would be killed at some point.  (See 1 Samuel 18)."),
          const Tile(
            question: "What was the bride price that King Saul requested from David for his daughter Michal?",
            answer: '100 Philistine foreskins',
            explanation:
            "After David's refusal to marry Saul's older daughter, King Saul discovered that his daughter Michal was actually in love with David. He saw another opportunity to try to get David to become his son-in-law and thought that Michal could be used as a snare to trap David. David however refused the offer again on the grounds of being a poor man, presumably implying that he wouldn't be able to afford the bride price required by a king. Saul saw this as an opportunity to get David killed so didn't ask for money or anything of monetary value: he simply asked David to go and kill 100 Philistines and bring back their foreskins! (This sounds somewhat gruesome to modern ears!) David agreed to the challenge and went to it with a vengeance. He and his men went out and killed not 100 but 200 Philistines and brought their foreskins to the king. And so David and Michal were married. (See 1 Samuel 18:20-27).",
            image: '',
          ),
        ],
        300: [
          const Tile(
              image: '',
              question:
              "Where was David's third anointing?",
              answer: 'Hebron',
              explanation:
              "David was anointed the first time in Bethleham by Samuel before Saul knew about David. The second and third anointings were in Hebron. The second was for part of Israel and the third was for all of Israel."),
          const Tile(
            question: " How many sons did Jesse have, and what was David's placing among them, according to 1 Samuel?",
            answer: '8 sons, youngest',
            explanation:
            "1 Samuel 17:12b Jesse had eight sons, and in Saul's time he was old and well advanced in years. Samuel originally thought that the oldest son, Eliab, would be the one who was to be king, but God replied in 1 Samuel 16:7 The Lord does not look at the things man looks at. Man looks at the outward appearance, but the Lord looks at the heart. Meaning to say God did not choose the oldest, but the most faithful.",
            image: '',
          ),
        ],
        400: [
          const Tile(
              image: '',
              question:
              " How many years did David reign as king?",
              answer: '40',
              explanation:
              "I Kings 2:11 - David reigned for seven years in Hebron, and then thirty-three years in Jerusalem."),
          const Tile(
            question: "While still a young man, David was called into the service of Saul. He became an armor-bearer and did what other task for the king?",
            answer: 'Played the harp',
            explanation:
            "Whenever the spirit from God came upon Saul, David would take his harp and play. Then relief would come to Saul; he would feel better, and the evil spirit would leave him. (1 Samuel 16:23)",
            image: '',
          ),
        ],
        500: [
          const Tile(
              image: '',
              question:
              "How did Michal help David to escape from her father when he was trying to kill David?",
              answer: 'Let him down through the window',
              explanation:'''
              Saul's jealousy and hatred of David continued and Saul was constantly on the lookout for an opportunity to kill his son-in-law. One night Saul sent men to watch David's house with the plan to kill him the next morning. Michal must have heard of this, though, and persuaded her husband that he had to flee for his life. She let him down out of a window and he was able to escape.

Michal then dressed an idol and put it in David's place in the bed. When Saul's men came the next day she pretended that David was ill so they couldn't see him. On hearing this her father himself then came to the house and was angry with her deception. (See 1 Samuel 19:11-17).
              '''),
        ]
      },
    ),
    // TilesCategory(
    //     name: "Journey",
    //     themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
    //     image: 'assets/logos/icon.png',
    //     description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
    //     tiles: []),
    // TilesCategory(
    //     name: "Joseph",
    //     themes: ['history'],
    //     image: 'assets/logos/icon.png',
    //     description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
    //     tiles: []),
    // TilesCategory(
    //     name: "Women In Scripture",
    //     themes: ['history'],
    //     image: 'assets/logos/icon.png',
    //     description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
    //     tiles: []),
    // TilesCategory(
    //     name: "Jesus",
    //     themes: [],
    //     image: 'assets/logos/icon.png',
    //     description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
    //     tiles: []),
    // TilesCategory(
    //     name: "Angels",
    //     themes: [],
    //     image: 'assets/logos/icon.png',
    //     description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
    //     tiles: [])
  ];

  List<String> get namesSuggestions => suggestedProfiles.map((e) => e.name).toList();

  List<String> get playerAvatars => suggestedProfiles.map((e) => e.avatar).toList();

  int get categoryLimit => 5;

  int get minimumCategories => 5;

  int get minimumPlayers => 2;

  int get playersLimit => 7;


  int get tilesNumber => 5;


  int get selectionCountDownTime => 50;

  int get answeringCountDownTime => 50;
}
