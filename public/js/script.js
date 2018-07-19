// Function to select random element from a given array
function randomize(array) {
    return array[Math.floor(Math.random() * array.length)]
  }

//Function to generate random encounter
function generate() {


  var raceAfterA = ['n elf', ' human', ' dwarf', ' tiefling', ' dragonborn', ' gnome', ' halfling'];
  var race = ['elf', 'human', 'dwarf', 'tiefling', 'dragonborn', 'gnome', 'halfling'];
  var racial = ['elven', 'human', 'dwarven', 'gnomish', 'halfling'];
  var racialAfterA = ['n elven', ' human', ' dwarven', ' gnomish', ' halfling'];
  var racePlural = ['elves', 'humans', 'dwarves', 'gnomes', 'halflings', 'tieflings', 'dragonborn'];
  var person = ['adventurer', 'wizard', 'mage', 'ranger', 'cleric', 'thief', 'guard', 'cultist', 'blacksmith'];
  var metal = ['gold', 'silver', 'bronze', 'copper', 'mithral', 'platinum', 'electrum', 'orichalcum', 'black gold'];
  var hooks1 = [
    `A${randomize(raceAfterA)} in a dark hood bumps into a party member in the street and slips a ${randomize(metal)} ring into his/her pocket, when the character turns to look for the stranger, he has disappeared into the crowd, but the character does catch a glimpse of the strange tattoo on the inside of his arm.`,
    `A young ${randomize(racial)} woman comes bursting through a crowd of people, nervoursly glancing from whence she came. As she runs past the party, she stops and shoves a small parcel in your direction. "Keep it safe," she whispers breathlessly, before disappearing back into the crowded streets. Inside the parcel, you find a simple ${randomize(metal)} ring.`,
    `The party member with the highest passive perception notices a glimmering object in a sewer grate, upon further inspection, it appears to be a ${randomize(metal)}ring encrusted with sparkling rubies.`,
    `A${randomize(racialAfterA)} merchant espies the party and waves them to her stand, she offers to sell them a recently-acquired ${randomize(metal)} ring at a very reasonable price, without even knowing exactly what magic the ring holds.`
    ];
  var encounters1 = [
    `Later, a distressed ${randomize(racial)} wizard accompanied by three city guards points out the member of the party holding the ring. He declares that character to be the one who stole his ring and invaluable spellbook, and has the party member searched. When the guards discover the ring, they attempt to arrest him/her. `,
    `Later, a group of ${randomize(racePlural)} in white, expressionless masks and red cloaks corner the party in an alley. The leader of the group steps forward and demands the return of his cult’s guardian ring on pain of death. Whether or not the party returns the ring, the cultists imbue them with a dangerous curse. `,
    'Later, when the party member(s) inspect the ring, they notice strange runes hand-engraved on the inside of the band. The character may sit with the ring as they would a magical item, in order to decipher the runic script. When they do, speaking the words creates a dark storm cloud, and unleashes demons into the streets. '
    ];
  var hooks2 = [
    `The player with the highest passive perception overhears a female ${randomize(race)} exchanging hushed, but heated words in a strange dialect with a man whose face is cast in shadow. After the conversation, she begins to walk through the streets towards the party as the man slips away. `,
    'You notice a group of commoners parting their path, giving a wide berth to a royal guard walking through the streets. While his posture remains that of a professional, his green eyes dart desperately over the crowd. ',
    `The player with the lowest passive perception feels a tug at his/her coin purse. When the character turns around, they spy a ruddy-faced ${randomize(race)}, no older than ten, whose blue eyes begin to swell with tears.  `
    ];
  var encounters2 = [
    'With some persistence, the stranger informs you that they have had a foul run with their boss, and owe them a sizable amount of coin — more than they own. If they do not return with the coin before sundown, they may not live to see the sun rise again.',
    `With some persistence, the stranger informs you that a fortnight ago, they discovered a [magical item] tucked under their covers, and needing the money, sold the item to a pawn shop. Now, a strange, shadowy figure has been following them through the streets at night, and they fear that without returning the item, their doom may await them in the darkness. `,
    `With some persistence, the stranger informs you that a [magical item] has been stolen from them — the only object that remains of their once proud lineage. Since the night that the item was taken, they have been receiving cryptic letters demanding a ransom that they could never fulfill. `
    ];
  var hooks3 = [
    `The player with the highest passive perception spies a nondescript ${randomize(race)} facing a brick wall at the end of an alley. It strikes the characters as odd, but little more, until the sounds of stone scraping on stone leads him/her to believe that something more is afoot. When the character investigates, the figure is gone, and the dead-end the alley is unoccupied.  `,
    'While admiring the layout and landscape of the city, the characters spot a dark cave on a cliffside below one of the city’s largest temples. Though it is in the distance, it seems that a figure is entering the cave with a torch in hand. ',
    'In what was once the city’s small market stands an unused well with a warning that reads: danger lies within. Only, it appears that someone has recently opened the well’s boarded cover. ',
    `In the heart of the city, the characters come across a condemned and long-dilapidated old house. The windows and doors are all boarded shut, but yet you hear noises coming from within. Upon closer inspection you find the cellar door has been pried open, and recently by the looks of it.`
    ];
  var encounters3 = [
    'Once inside, a magical veil parts to reveal a wizard’s black market. Brightly colored tents and stalls illuminate the area and the air is thick with the scents of burning incense, brewing potions, and roasting food. Spellcasters of all varieties are offering magical goods at discounted prices, free from the taxation and litigation of the city proper.   ',
   `Once inside, you’re met with a winding array of dark corridors. The deeper you travel through the maze, the more disoriented you become, when eventually the air becomes foul with the scent of blood from the body of a recently deceased ${randomize(person)}. You believe you’ve stumbled upon a monster’s lair. `,
   'Once inside, you feel a rush of salty sea air blow over you, strong enough that you feel the need to brace yourself. You push forward through a foggy veil, until your toes begin to slip and rocks tumble down over the edge of a mountainous cliff leading to the sea. Ahead are white waves and a rocky promenade leading to an illuminated lighthouse. You’ve traveled through a wizard’s portal, but when you turn back, the portal has closed. '
    ];
  var fullHooks = [
    `A traveling merchant sells goods from far-off lands — exotic silks, fruits, and jewelry. He haggles fiercely for the prices of goods, and spits and swears in a language the characters don't understand. If asked where he’s from, he will not say, but he also will not let the characters leave without making at least one purchase.`,
    `While walking through a wealthy district of town, the player with the lowest Charisma score is stopped by a noble’s servant and a finely dressed ${randomize(racial)} child. The spoiled child finds that the character has something on his/her person that the child must have. The noble's staff does what it can to acquire it, by nearly any means necessary.`,
    `Unbeknownst to the party, the local Thieves Guild is currently having an initiation contest, for Guild applicants to prove their worth. Perhaps this explains why the party is being repeatly targeted by unskilled, would-be thieves.`,
    `A gypsy intercepts the party member with the highest charisma score and tells him/her of a vision she had. She predicts the party member will find a beautiful person in this city and it will be the love of his/her life. She provides no further details. Later on, a beautiful person flirts with the character. Is it a member of this gypsy’s con or is this woman truly a diviner?`,
    `While walking through a residential neighborhood at dusk/night, a${randomize(racialAfterA)} woman falls dead to the street from the second story window. Soon after, the party notices a hooded figure skillfully dropping, uninjured, from another second story window facing into the alley. The figure quickly disappears into a maze of side streets.`,
    `The town guard eye the characters suspiciously for most of the day, but make no moves on the party. That evening, the guard approach the party in a public place (tavern, inn, etc.), certain that the party's mage is responsible for a magical duel fought atop the cathedral roof last night, and attempt to arrest him/her swiftly and painlessly. Can the party talk the guard out of their wrongful conviction or escape and find the real culprit before they are hunted down themselves? Do they dare, knowing that the criminal dispatched his last opponent with a frighteningly high-level spell?`
    ];


  var randomHook = Math.floor(Math.random() * 3);
  /* This line selects one hook at random.
  The rest of the functions matches the hook with a well matched encounter*/
  if (randomHook == 1) {
  document.getElementById('display').innerHTML = `${randomize(hooks1)} ${randomize(encounters1)}`
  } else if (randomHook == 2) {
   document.getElementById('display').innerHTML = `${randomize(hooks2)} ${randomize(encounters2)}`
  } else if (randomHook == 3){
    document.getElementById('display').innerHTML = `${randomize(hooks1)} ${randomize(encounters1)}`
  } else {
    document.getElementById('display').innerHTML = `${randomize(fullHooks)}`
  }
  //document.getElementById('display').innerHTML
}
