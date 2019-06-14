

cd ./nowellpack

./gradlew installDist && cp ./build/install/nowellpack/bin/* $PREFIX/bin/ && cp ./build/install/nowellpack/lib/* $PREFIX/lib/

cp $RECIPE_DIR/scripts/* $PREFIX/bin
