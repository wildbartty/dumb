import std.stdio;

void main() {
  writefln("Hello world");
  for (long i = 0; i < 1L>>32; i++) {
    if ((i % 1000000) == 0) {
      writefln("%d", i);
    }
  }
}
