CyanogenMod 10.0 for ZTE Warp (WIP)

A lot of things still do not work, but we are trying

Credits

hroark13
joe.stone
PlayfulGod
shinru2004
downthemachine
Dm47021
superr
Junkie2100




How to build

your system must be setup as an Android Build system

mkdir cm10

cd cm10

repo init -u git://github.com/CyanogenMod/android.git -b jellybean

repo sync -j32

./vendor/cm/get-prebuilts

mkdir device/zte

cd device/zte

git clone https://github.com/hroark13/android_device_zte_arthur.git -b master arthur

cd ../..

mkdir kernel/zte

cd kernel/zte

git clone https://github.com/hroark13/WARP_KERNEL -b jellybean arthur

cd ../..

cp device/zte/arthur/ZTERIL.java frameworks/base/telephony/java/com/android/internal/telephony/

cp device/zte/arthur/ZTERIL2.java frameworks/base/telephony/java/com/android/internal/telephony/

source ./build/envsetup.sh

make clobber

source ./build/envsetup.sh && brunch arthur