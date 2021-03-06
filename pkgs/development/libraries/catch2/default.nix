{ stdenv, fetchFromGitHub, cmake, python }:

stdenv.mkDerivation rec {
  name = "catch2-${version}";
  version = "2.6.0";

  src = fetchFromGitHub {
    owner = "catchorg";
    repo = "Catch2";
    rev = "v${version}";
    sha256="1p2y6fhxfmb48nl03xdg62nfrwssaaiw10vzr194z6srcj90n2r7";
  };

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    "-H.."
    "-DBUILD_TESTING=OFF"];

  meta = with stdenv.lib; {
    description = "A multi-paradigm automated test framework for C++ and Objective-C (and, maybe, C)";
    homepage = http://catch-lib.net;
    license = licenses.boost;
    maintainers = with maintainers; [ edwtjo knedlsepp ];
    platforms = with platforms; unix;
  };
}
