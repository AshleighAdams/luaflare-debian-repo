-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (native)
Source: luaflare
Binary: luaflare, luaflare-service, luaflare-reverseproxy-nginx, luaflare-reverseproxy-apache
Architecture: all
Version: 2.8
Maintainer: Kate Adams <self@kateadams.eu>
Homepage: https://github.com/KateAdams/LuaFlare
Standards-Version: 3.9.6
Vcs-Browser: https://github.com/KateAdams/LuaFlare-debian
Vcs-Git: https://github.com/KateAdams/LuaFlare-debian
Build-Depends: debhelper (>= 9), dh-systemd (>= 1.5), bash-completion, lua5.2
Package-List:
 luaflare deb httpd optional arch=all
 luaflare-reverseproxy-apache deb httpd optional arch=all
 luaflare-reverseproxy-nginx deb httpd optional arch=all
 luaflare-service deb httpd optional arch=all
Checksums-Sha1:
 7a93b7f1259c5712369d82c41eef1f28b6bcca66 1784708 luaflare_2.8.tar.xz
Checksums-Sha256:
 95cbf0d206d7acb73d10a32b72ce739c58d9965f32728affbaedf417de260171 1784708 luaflare_2.8.tar.xz
Files:
 263fa52437ccb68e64f60365a4d84863 1784708 luaflare_2.8.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU1YtrAAoJEL+N9HgLe9CtdNIP+QHiI7UqE1h2oaylfnTNfKC9
uvMHdR7SkAdUfzD1gHAQHjVYjzQDAiIUlB9Kerl2V3/r8J4mZwQg0+NpNg9xp+sP
BcU4QqI34OqZKIm0CTz4dm+GuTmmYNGfmicCVGOvY3tghQ2tiTuW8xUvk2u7pBmd
mOblEHBqnrLEQB1xANBHq5JDPz6LviYTc+FJWAC/68zY76crE8QnRyKkPS3hr60p
dkYNMwiBAPJT3nZYCUU6PHgJGhFJ8OQhhso+OhhX0oDwG1SQknxiPG+m4nAXp5OW
ynHxDekp/dBjnF4u5NAo4dpUTarQtOHYuX5UFBhlD2zrcxRWKrc7Z5F3yZa8MXtO
iJzUA60l/jp4bARz1/3EKFleydMTzm0AlsESqxXD7PBS9rDH0QZ3m8w0ExOcThOD
Hkx8+4eC17bY6LSHizAGjVPBE0KeVCjlrElAPmMXf5yh3q5UycVEILMUx3JU8MPy
fJLfbFsBgGZ8gbxDDbB1+E/qsMcA9vleWukEdIUzYrzkSUvh6TTx4Xu4ux0ETUme
y/PLNkOPD/BxO/1k7uUsqiR5c1ugqp+OuSZcTGl3R3xRomXuFjAn39ceTy57EOgg
V0/Q3uIkKUv5c8bX1uD8nxkFWt8HAmEKJBrl3sso4C1SJL0EkHqzSVfrMvQLQsPs
7OVI9bkOf+/v1lLDKxnf
=s90j
-----END PGP SIGNATURE-----
