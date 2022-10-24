-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = true
protectionLevel = 1
killsToRedSkull = 5
pzLocked = 60000
removeChargesFromRunes = true
removeWeaponAmmunition = true
timeToDecreaseFrags = 5 * 60 * 60 * 1000
whiteSkullTime = 15 * 60 * 1000
stairJumpExhaustion = 200
experienceByKillingPlayers = false
expFromPlayersLevelRange = 75
allowFightBack = "true"
stopAttackingAtExit = "false"
premiumForPromotion = false


-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "a55082a498fc6f094.awsglobalaccelerator.com"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 2000
motd = "Welcome to Tibiabra."
onePlayerOnlinePerAccount = true
allowClones = false
teleportSummons = false
serverName = "Tibiabra"
statusTimeout = 50000
replaceKickOnLogin = true
maxPacketsPerSecond = 100

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 200
houseRentPeriod = "never"
houseAntiTrash = false
onlyInvitedCanMoveHouseItems = true

-- Item Usage
timeBetweenActions = 150
timeBetweenExActions = 800

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "realera"
mapAuthor = "Tibiabra Team"

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = "Apc1719#la147"
mysqlDatabase = "julera"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
-- NOTE: classicAttackSpeed set to true makes players constantly attack at regular
-- intervals regardless of other actions such as item (potion) use. This setting
-- may cause high CPU usage with many players and potentially affect performance!

allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 20
emoteSpells = false
classicEquipmentSlots = true
classicAttackSpeed = true
autoStackItems = true
displayLootMessage = true
summonsDropCorpse = false

CorpseOwner = false

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = 1
rateSkill = 8
rateLoot = 2
rateMagic = 4
rateSpawn = 2

-- Monsters
deSpawnRange = 0
deSpawnRadius = 0

-- Stamina
staminaSystem = false

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = false

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = true

-- Status server information
ownerName = "Tibiabra Team"
ownerEmail = ""
url = "https://tibiabra.com/"
location = "Brazil"
