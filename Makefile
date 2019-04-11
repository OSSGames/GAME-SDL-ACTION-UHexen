#Uncomment and edit lines below


#For FreeBSD
#CC=gcc
#BINARY=uhexen
#SDL_INCLUDES=-I/usr/local/include/SDL
#SDL_LIBS=-L/usr/local/lib
#EXTRA_INCLUDES=
#EXTRA_LIBS=-L/usr/local/kde/lib -L/usr/local/qt/lib
#EXTRA_INCLUDES=
#EXTRA_CFLAGS=-DUSE_SDL -DFBSD_CONSOLE -pthread

#For Linux
#CC=gcc
#BINARY=uhexen
#SDL_INCLUDES=-I/usr/local/include/SDL
#SDL_LIBS=-L/usr/local/lib
#EXTRA_INCLUDES=
#EXTRA_LIBS=-L/usr/local/kde/lib -L/usr/local/qt/lib
#EXTRA_INCLUDES=
#EXTRA_CFLAGS=-DUSE_SDL

#For OpenBSD
CC=gcc
BINARY=uhexen
SDL_INCLUDES=-I/usr/local/include/SDL
SDL_LIBS=-L/usr/local/lib
EXTRA_INCLUDES=
EXTRA_LIBS=-L/usr/local/kde/lib -L/usr/local/qt/lib -L/usr/X11R6/lib
EXTRA_INCLUDES=
EXTRA_CFLAGS=-DUSE_SDL -pthread

# For Windows (cross-compiler)
#CC=/usr/local/cross-tools/i386-mingw32msvc/bin/gcc
#BINARY=uhexen.exe
#SDL_INCLUDES= -I/usr/local/cross-tools/i386-mingw32msvc/include/SDL
#SDL_LIBS=-L/usr/local/cross-tools/i386-mingw32msvc/lib
#EXTRA_INCLUDES=-I/usr/local/cross-tools/i386-mingw32msvc/include
#EXTRA_LIBS=-lmingw32 -lSDLmain -mwindows
#EXTRA_CFLAGS=-mwindows -DUSE_SDL -DMUSTDIE -Dmain=SDL_main -DHAVE_OPENGL


CFLAGS=-Iinclude -O3  -fomit-frame-pointer -Wall -DNORMALUNIX $(SDL_INCLUDES) $(EXTRA_INCLUDES) $(EXTRA_CFLAGS)
LIBS=-lm -lSDL -lSDL_mixer
LDFLAGS=$(SDL_LIBS) $(LIBS) $(EXTRA_LIBS)

# subdirectory for objects
O=obj
S=src

# not too sophisticated dependency
OBJS=				\
$(O)/a_action.o  \
$(O)/am_map.o  \
$(O)/ct_chat.o  \
$(O)/d_net.o  \
$(O)/f_finale.o  \
$(O)/g_game.o  \
$(O)/h2_main.o  \
$(O)/in_lude.o  \
$(O)/info.o  \
$(O)/m_misc.o  \
$(O)/mn_menu.o  \
$(O)/mn_keynames.o  \
$(O)/p_acs.o  \
$(O)/p_anim.o  \
$(O)/p_ceilng.o  \
$(O)/p_doors.o  \
$(O)/p_enemy.o  \
$(O)/p_floor.o  \
$(O)/p_inter.o  \
$(O)/p_lights.o  \
$(O)/p_map.o  \
$(O)/p_maputl.o  \
$(O)/p_mobj.o  \
$(O)/p_plats.o  \
$(O)/p_pspr.o  \
$(O)/p_setup.o  \
$(O)/p_sight.o  \
$(O)/p_spec.o  \
$(O)/p_switch.o  \
$(O)/p_telept.o  \
$(O)/p_things.o  \
$(O)/p_tick.o  \
$(O)/p_user.o  \
$(O)/po_man.o  \
$(O)/i_video.o \
$(O)/i_sdlvideo.o \
$(O)/i_fbsdvideo.o \
$(O)/i_main.o \
$(O)/i_system.o \
$(O)/i_sound.o \
$(O)/qmus2mid.o \
$(O)/i_sdlsound.o \
$(O)/i_netstub.o \
$(O)/m_fixed.o \
$(O)/r_bsp.o  \
$(O)/r_data.o  \
$(O)/r_draw.o  \
$(O)/r_main.o  \
$(O)/r_plane.o  \
$(O)/r_segs.o  \
$(O)/r_things.o  \
$(O)/sb_bar.o  \
$(O)/sc_man.o  \
$(O)/sn_sonix.o  \
$(O)/sounds.o  \
$(O)/st_start_stub.o  \
$(O)/sv_save.o  \
$(O)/tables.o  \
$(O)/template.o  \
$(O)/v_video.o  \
$(O)/w_wad.o  \
$(O)/z_zone.o

all:	uhexen

clean:
	rm -f *.o *~ *.flc $(BINARY) *.core
	rm -f obj/*

uhexen:	$(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS)  \
	-o $(BINARY) $(LIBS)

$(O)/%.o:	$(S)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

#############################################################
#
#############################################################
