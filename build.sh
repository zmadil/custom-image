BASE_DIR=$PWD
BUILD_DIR=$BASE_DIR/build
PI_GEN_DIR=$BUILD_DIR/pi-gen

if $CLEAN; then
    echo removing build directory: $BUILD_DIR
    rm -rf $BUILD_DIR
    echo removed
fi

if [ ! -d "$PI_GEN_DIR" ]; then
    echo pi-gen not found, re-cloning
    git clone --branch arm64 https://github.com/RPI-Distro/pi-gen.git $PI_GEN_DIR
else
    echo pi-gen exists, not cloning. Re-run with CLEAN=true to force re-clone
fi

cp config $PI_GEN_DIR
cp -r docker_stage $PI_GEN_DIR/

cd $PI_GEN_DIR
touch stage4/SKIP stage5/SKIP
touch stage2/SKIP_IMAGES stage4/SKIP_IMAGES stage5/SKIP_IMAGES

if $CACHE_STAGES_PRE_DOCKER; then
    echo skipping stages 0-3
    touch stage0/SKIP stage1/SKIP stage2/SKIP stage3/SKIP
fi

export STAGE_LIST="stage0 stage1 stage2 stage3 docker_stage"
echo $STAGE_LIST
sudo -E ./build.sh
