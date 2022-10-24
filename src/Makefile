TFS = tfs

INCLUDEDIRS = -I"." -I"/usr/include/luajit-2.1" -I"/usr/include/mysql"

FLAGS = -DBOOST_DISABLE_ASSERTS -DNDEBUG

CXXFLAGS = -march=native -mtune=native $(INCLUDEDIRS) $(FLAGS) -Werror -fomit-frame-pointer -Wall -Ofast -g -std=c++11 -pthread
CXX = g++
LIBS = -lluajit-5.1 -lgmp -lboost_system -lboost_regex -lmysqlclient -lboost_filesystem /usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4

LDFLAGS = $(LIBS)

CXXSOURCES = actions.cpp	ban.cpp 	baseevents.cpp 		bed.cpp 	chat.cpp      \
combat.cpp \
commands.cpp \
condition.cpp \
configmanager.cpp \
connection.cpp \
container.cpp \
creature.cpp \
creatureevent.cpp \
cylinder.cpp \
database.cpp \
databasemanager.cpp \
databasetasks.cpp \
depotchest.cpp \
depotlocker.cpp \
events.cpp \
fileloader.cpp \
game.cpp \
globalevent.cpp \
groups.cpp \
guild.cpp \
house.cpp \
housetile.cpp \
ioguild.cpp \
iologindata.cpp \
iomap.cpp \
iomapserialize.cpp \
item.cpp \
items.cpp \
luascript.cpp \
mailbox.cpp \
map.cpp \
monster.cpp \
monsters.cpp \
movement.cpp \
networkmessage.cpp \
npc.cpp \
otpch.cpp \
otserv.cpp \
outfit.cpp \
outputmessage.cpp \
party.cpp \
player.cpp \
position.cpp \
protocol.cpp \
protocolgame.cpp \
protocollogin.cpp \
protocolstatus.cpp \
quests.cpp \
raids.cpp \
rsa.cpp \
scheduler.cpp \
signals.cpp \
scriptmanager.cpp \
server.cpp \
spawn.cpp \
stats.cpp \
spells.cpp \
talkaction.cpp \
tasks.cpp \
teleport.cpp \
thing.cpp \
tile.cpp \
tools.cpp \
trashholder.cpp \
vocation.cpp \
waitlist.cpp \
weapons.cpp \
wildcardtree.cpp

OBJDIR = obj
CXXOBJECTS = $(CXXSOURCES:%.cpp=$(OBJDIR)/%.o)

all: $(TFS)

clean:
	$(RM) $(CXXOBJECTS) $(TFS)

$(TFS): $(CXXOBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $(CXXOBJECTS) $(LDFLAGS)

$(OBJDIR)/%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

