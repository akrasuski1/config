import subprocess

avr_inc=["-I/usr/lib/avr/include", "-Wnoint-to-void-pointer-cast", 
        "-D__AVR_ATmega8__",
        "-D__AVR__",
#        "-D__AVR_ATtiny13A__",
        "-Wno-attributes",
        "-Wno-unused",
        ]

kern_inc=["-I/usr/src/linux-headers-4.8.0-46/include/"]

#esp_inc=["-I/home/adam/code/esp/esp-open-sdk/ESP8266_NONOS_SDK_V2.0.0_16_08_10/include"]
esp32_inc=["-I/home/adam/esp/xtensa-esp32-elf/xtensa-esp32-elf/include",
        "-I/home/adam/esp/esp-idf/components/driver/include",
        "-I/home/adam/esp/esp-idf/components/freertos/include"]

cflags=  ["-Wall", "-Wextra", "-std=c11"]
Sflags=  []
cppflags=["-Wall", "-Wextra", "-std=c++14"]

c_ext=  ["c"]
S_ext=  ["S"]
cpp_ext=["h","cpp","cc"]

def FlagsForFile( filename, **kwargs ):
    inc=["-DYCM_LOCAL", "-Iinclude", "-I.",
        "-I/usr/lib/gcc/x86_64-linux-gnu/6/include"]
    yep_c=False
    try:
        data=open(filename).read()
        if data.find("avr/io.h")!=-1:
            inc+=avr_inc
        if data.find("<linux/")!=-1:
            inc+=kern_inc
        if data.find("#include \"ets")!=-1:
            inc+=esp_inc
        if data.find("freertos/task.h")!=-1:
            inc+=esp32_inc
        if data.find("esp_log.h")!=-1:
            inc+=esp32_inc
        if data.find("\"mpi.h\"")!=-1:
            inc+=["-I/usr/lib/x86_64-linux-gnu/openmpi/include/"]
        if data.find("YEP, C")!=-1:
            yep_c=True
    except IOError:
        pass
    

    ext=filename.split(".")[-1]
    if ext in cpp_ext and not yep_c:
        try:
            flags=subprocess.check_output(["make", "flags_cpp"]).split()
        except:
            flags=cppflags
        flags+=["-x", "c++"]
        flags+=["-Wno-deprecated-register"]
    elif ext in c_ext or yep_c:
        try:
            flags=subprocess.check_output(["make", "flags_c"]).split()
        except:
            flags=cflags
    elif ext in S_ext:
        try:
            flags=subprocess.check_output(["make", "flags_S"]).split()
        except:
            flags=Sflags
    else:
        flags=[]

    flags+=inc

    return {
        'flags': flags,
        'do_cache': True
    }
