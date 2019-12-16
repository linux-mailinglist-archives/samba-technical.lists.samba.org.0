Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E11208DD
	for <lists+samba-technical@lfdr.de>; Mon, 16 Dec 2019 15:47:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=eWE80Ub6+QBlTYwHgj0+KvEb6flkYe/qgIKP595P/Rc=; b=jiPf0stLOECuhPX/y373DTEb0T
	6Qu8zjbjs6Hap+h9GVng4fn6EI24AP1ADhbTf+6XDa/pMTpAk45Eaqx7IhFDmy8bcQOcREiVnG3oN
	B9C6cIAeDhnzrHK81eMkv5hzQ7r5ZCgrKVjuhkyBCiu7dwbo0//swS77z+lt2wmQMQucr6v/mX5Mp
	tu6pFjxjjOYWIf2u8LJJhQNxIqmdOw4vNZ5erfv3Z+akfB/v1Z+u0KzWaKjIl0E2Cwp35wZ5x0ARs
	YjzfjK1QgKdf2e+BH0krfTnh/nINwRyDJTgRuz5EJIZ6eflQXiVg8P/DLowgJ/T7FqNiau9WvSXLJ
	BBBaIHmw==;
Received: from localhost ([::1]:63352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igrdc-007PBP-3s; Mon, 16 Dec 2019 14:46:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30806) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igrdX-007PBI-PC
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 14:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=eWE80Ub6+QBlTYwHgj0+KvEb6flkYe/qgIKP595P/Rc=; b=cl3irokxOsFtvcJfejhMbH9Iko
 NLgut7cxOLaDQSzgJsfGfUIKD0CQp2az1GP+xoqrJ7QSmpoH6UYk+JDZGv89C5eMYmR6pc/1b3+s9
 UTiNnVyXLoT7EJ7kvfar07ir8gyogiXcNk5+s4UTotSpQe2U+auaEAa1cBPLUO6Erdr0L1DAaehCX
 b899B6El5w2pMcnvSuqLl40YipogGOcZ7zlQ7MUX3aJYsrHe9P4W7Uks61250ZbCcprIBohA5lh1f
 ci2P5xrr2MncSCANlEe8ChOS61ZROrUi+KPtjQZdAWlZKrKdPeym8ZE7rvTZFpDASHcE6dH/OhWP1
 G7qLGMh/JYa25Wz8xcFiOUPCPfe0Lsih7t83Rj4wn3LjuxKKCr4N69t20x4TPhv6Wjudo54u+9/Gm
 Z/3olADiSdlfNxQrzPDnD+CglHOBdS8fvx5cwd7vRP7rn/nnc8yRLfHs+DBbww/Q93Psj8pmWQNsu
 iA75Qf8KJL6ypRs2OhXcOwKw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1igrdW-0006rc-I1
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 14:46:15 +0000
To: <samba-technical@lists.samba.org>
References: <vmime.5df7707d.74d7.61e0656b532253cd@ms249-lin-003.rotterdam.bazuin.nl>
In-Reply-To: <vmime.5df7707d.74d7.61e0656b532253cd@ms249-lin-003.rotterdam.bazuin.nl>
Subject: RE: Spelling/typos. /Fix multiple typos found by lintian on debian
 patch included.
Date: Mon, 16 Dec 2019 15:46:14 +0100
Message-ID: <7ED1B3EB46AE40D3845A260EA8E4FBD2@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_003D_01D5B427.F2DE5940"
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdW0B5bM5tszEa2JTtiVyuDtPd1n8QAFsdkQ
X-MimeOLE: Produced By Microsoft MimeOLE
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_003D_01D5B427.F2DE5940
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hai,=20

I hoped someone would reply, but everybody seems very buzy lately.=20

And since i dont want to mess up git, I attached the patch with typo =
fixes.=20
I've also attached the lintian output where i worked from.=20

Not fixed:=20
ressource =3D> resource=20
dont =3D> don't =20
upto =3D> up to=20

These three where also in variables or other code parts so i've not =
fixed
these.=20


Greetz,=20

Louis




> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> L.P.H. van Belle via samba-technical
> Verzonden: maandag 16 december 2019 12:55
> Aan: samba-technical@lists.samba.org
> Onderwerp: Spelling/typos.=20
>=20
> Hai Guys,=20
> =A0
> Im currently working on fixing spelling errors found by=20
> debian Lintian.=20
> One im fixing now is :=20
> =A0
> usr/lib/x86_64-linux-gnu/samba/vfs/fruit.so:ressource:resource
> =A0
> Now im grepping on the type "ressource" but that also showed=20
> me this :=A0=20
> =A0
> librpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0 uint32 ressource_id;
> librpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0 uint32 ressource_id;
> =
source3/modules/vfs_fruit.c:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "ressource", fruit_rsrc, FRUIT_RSRC_ADFILE);
> =
source3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
> info2.ressource_id=A0=A0=A0=A0=A0 =3D 0;
> source3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=A0=A0=20
> printf("\tressource_id: 0x%08x\n", r->ressource_id);
> source3/locale/pam_winbind/da.po:msgstr "Dom=E6ne-controller=20
> kan ikke n=E5s, bruger cachede akkreditiver i stedet.=20
> Netv=E6rksressourcer kan v=E6re utilg=E6ngelige"
> source3/locale/pam_winbind/fr.po:msgstr "Le contr=F4leur de=20
> domaine est injoignable. Les donn=E9s d'identification en cache=20
> seront utilis=E9es. Certaines ressources r=E9seaux seront =
indisponibles."
>=20
> =A0
> my question,=A0 things like :=A0 uint32 ressource_id;=20
> =A0
> rgrep ressource_id *
>=20
> librpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0 uint32 ressource_id;
> librpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0 uint32 ressource_id;
> =
source3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
> info2.ressource_id=A0=A0=A0=A0=A0 =3D 0;
> source3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=A0=A0=20
> printf("\tressource_id: 0x%08x\n", r->ressource_id);
>=20
> Should i fix these also? to resource_id ?=20
> =A0
> And, can put these type fixes in one patch?=20
> I'm=A0tekstbook following the git steps, because i need to=A0
> learn to work=A0more git.
> =A0
> =A0
> =A0
> Greetz,
> =A0
> Louis
> =A0
>=20
>=20
>=20
>=20

------=_NextPart_000_003D_01D5B427.F2DE5940
Content-Type: application/octet-stream;
	name="master-fix-typos.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="master-fix-typos.patch"

From 7643232dec1f50d6717df1f405ac9cdf472ea998 Mon Sep 17 00:00:00 2001
From: Louis van Belle <belle@samba.org>
Date: Mon, 16 Dec 2019 15:32:57 +0100
Subject: [PATCH 1/1] Fix multiple typos found by lintian on debian

---
 docs-xml/smbdotconf/browse/preferredmaster.xml  |  2 +-
 source3/locale/net/de.po                        |  4 ++--
 source3/rpc_server/mdssd.c                      |  2 +-
 source3/rpc_server/mdssvc/mdssvc.c              |  2 +-
 source3/utils/status.c                          |  6 +++---
 source4/heimdal/kdc/kerberos5.c                 |  2 +-
 source4/heimdal/lib/asn1/asn1_err.et            |  2 +-
 source4/heimdal/lib/hcrypto/des.c               | 10 +++++-----
 source4/heimdal/lib/hdb/ext.c                   |  8 ++++----
 source4/heimdal/lib/hdb/hdb.c                   |  2 +-
 source4/heimdal/lib/hdb/hdb.h                   |  2 +-
 source4/heimdal/lib/hdb/mkey.c                  |  2 +-
 source4/heimdal/lib/hx509/ca.c                  |  2 +-
 source4/heimdal/lib/hx509/cert.c                |  4 ++--
 source4/heimdal/lib/hx509/print.c               |  4 ++--
 source4/heimdal/lib/krb5/cache.c                |  4 ++--
 source4/heimdal/lib/krb5/crypto.c               |  2 +-
 source4/heimdal/lib/krb5/krbhst.c               |  8 ++++----
 source4/heimdal/lib/krb5/log.c                  |  2 +-
 source4/heimdal/lib/krb5/pkinit.c               |  4 ++--
 source4/heimdal/lib/wind/utf8.c                 |  2 +-
 source4/torture/libsmbclient/libsmbclient.c     |  8 ++++----
 source4/torture/raw/samba3misc.c                |  2 +-
 source4/torture/smb2/samba3misc.c               |  2 +-
 source4/torture/winbind/struct_based.c          |  2 +-
 third_party/cmocka/cmocka.c                     |  2 +-
 third_party/cmocka/cmocka.h                     |  2 +-
 third_party/nss_wrapper/wscript                 |  2 +-
 third_party/pam_wrapper/wscript                 |  2 +-
 third_party/resolv_wrapper/wscript              |  2 +-
 third_party/socket_wrapper/wscript              |  2 +-
 third_party/uid_wrapper/wscript                 |  2 +-
 third_party/waf/waflib/extras/boost.py          |  2 +-
 third_party/waf/waflib/extras/cfg_altoptions.py |  2 +-
 third_party/waf/waflib/extras/cross_gnu.py      |  2 +-
 third_party/waf/waflib/extras/file_to_object.py |  2 +-
 36 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/docs-xml/smbdotconf/browse/preferredmaster.xml =
b/docs-xml/smbdotconf/browse/preferredmaster.xml
index 15ebd2484c0..bf717d5aae2 100644
--- a/docs-xml/smbdotconf/browse/preferredmaster.xml
+++ b/docs-xml/smbdotconf/browse/preferredmaster.xml
@@ -4,7 +4,7 @@
                  enumlist=3D"enum_bool_auto"
                  function=3D"_preferred_master"
                  =
xmlns:samba=3D"http://www.samba.org/samba/DTD/samba-doc">
-<synonym>prefered master</synonym>
+<synonym>preferred master</synonym>
  <description>
        <para>
        This boolean parameter controls if =
<citerefentry><refentrytitle>nmbd</refentrytitle>
diff --git a/source3/locale/net/de.po b/source3/locale/net/de.po
index c71ffbb9ed8..95d62990dbb 100644
--- a/source3/locale/net/de.po
+++ b/source3/locale/net/de.po
@@ -6335,7 +6335,7 @@ msgstr ""

 #: ../../utils/net_rpc_printer.c:1305
 #, c-format
-msgid "unkown action: %d\n"
+msgid "unknown action: %d\n"
 msgstr ""

 #: ../../utils/net_rpc_printer.c:1331
@@ -6365,7 +6365,7 @@ msgstr ""

 #: ../../utils/net_rpc_printer.c:1458
 #, c-format
-msgid "unkown state: %d\n"
+msgid "unknown state: %d\n"
 msgstr "unbekannter Status: %d\n"

 #: ../../utils/net_rpc_printer.c:1528 =
../../utils/net_rpc_printer.c:1675 ../../utils/net_rpc_printer.c:1858 =
../../utils/net_rpc_printer.c:2047 ../../utils/net_rpc_printer.c:2214
diff --git a/source3/rpc_server/mdssd.c b/source3/rpc_server/mdssd.c
index 6f2635c6519..75e2a17c850 100644
--- a/source3/rpc_server/mdssd.c
+++ b/source3/rpc_server/mdssd.c
@@ -378,7 +378,7 @@ static void mdssd_handle_client(struct tevent_req =
*req)
                  (int)(data->pf->pid)));

        if (tsocket_address_is_inet(srv_addr, "ip")) {
-               DEBUG(3, ("Got a tcpip client connection from %s on =
inteface %s\n",
+               DEBUG(3, ("Got a tcpip client connection from %s on =
interface %s\n",
                           tsocket_address_string(cli_addr, tmp_ctx),
                           tsocket_address_string(srv_addr, tmp_ctx)));

diff --git a/source3/rpc_server/mdssvc/mdssvc.c =
b/source3/rpc_server/mdssvc/mdssvc.c
index fce3335d602..6fea52f06ea 100644
--- a/source3/rpc_server/mdssvc/mdssvc.c
+++ b/source3/rpc_server/mdssvc/mdssvc.c
@@ -461,7 +461,7 @@ static bool inode_map_add(struct sl_query *slq, =
uint64_t ino, const char *path)
                 */

                if (value.dsize !=3D sizeof(void *)) {
-                       DEBUG(1, ("invalide dsize\n"));
+                       DEBUG(1, ("invalid dsize\n"));
                        return false;
                }
                memcpy(&p, value.dptr, sizeof(p));
diff --git a/source3/utils/status.c b/source3/utils/status.c
index 36f7030e4f4..4d8d8ecc26c 100644
--- a/source3/utils/status.c
+++ b/source3/utils/status.c
@@ -293,7 +293,7 @@ static void print_brl(struct file_id id,

 static const char *session_dialect_str(uint16_t dialect)
 {
-       static fstring unkown_dialect;
+       static fstring unknown_dialect;

        switch(dialect){
        case SMB2_DIALECT_REVISION_000:
@@ -316,8 +316,8 @@ static const char *session_dialect_str(uint16_t =
dialect)
                return "SMB3_11";
        }

-       fstr_sprintf(unkown_dialect, "Unknown (0x%04x)", dialect);
-       return unkown_dialect;
+       fstr_sprintf(unknown_dialect, "Unknown (0x%04x)", dialect);
+       return unknown_dialect;
 }

 static int traverse_connections(const struct connections_key *key,
diff --git a/source4/heimdal/kdc/kerberos5.c =
b/source4/heimdal/kdc/kerberos5.c
index 27d38ad84b7..17d7880a7ba 100644
--- a/source4/heimdal/kdc/kerberos5.c
+++ b/source4/heimdal/kdc/kerberos5.c
@@ -1295,7 +1295,7 @@ _kdc_as_rep(krb5_context context,
            krb5_crypto_destroy(context, crypto);
            /*
             * Since the user might have several keys with the same
-            * enctype but with diffrent salting, we need to try all
+            * enctype but with different salting, we need to try all
             * the keys with the same enctype.
             */
            if(ret){
diff --git a/source4/heimdal/lib/asn1/asn1_err.et =
b/source4/heimdal/lib/asn1/asn1_err.et
index ac7a9ebaa52..dc08a86cf30 100644
--- a/source4/heimdal/lib/asn1/asn1_err.et
+++ b/source4/heimdal/lib/asn1/asn1_err.et
@@ -23,7 +23,7 @@ error_code MIN_CONSTRAINT,    "ASN.1 too few elements"
 error_code MAX_CONSTRAINT,     "ASN.1 too many elements"
 error_code EXACT_CONSTRAINT,   "ASN.1 wrong number of elements"
 error_code INDEF_OVERRUN,      "ASN.1 BER indefinte encoding overrun"
-error_code INDEF_UNDERRUN,     "ASN.1 BER indefinte encoding underun"
+error_code INDEF_UNDERRUN,     "ASN.1 BER indefinte encoding underrun"
 error_code GOT_BER,            "ASN.1 got BER encoded when expected =
DER"
 error_code INDEF_EXTRA_DATA,   "ASN.1 EoC tag contained data"
 end
diff --git a/source4/heimdal/lib/hcrypto/des.c =
b/source4/heimdal/lib/hcrypto/des.c
index 2e3192bff8a..014f5ea7d90 100644
--- a/source4/heimdal/lib/hcrypto/des.c
+++ b/source4/heimdal/lib/hcrypto/des.c
@@ -395,7 +395,7 @@ DES_ecb_encrypt(DES_cblock *input, DES_cblock =
*output,
 /**
  * Encrypt/decrypt a block using DES in Chain Block Cipher mode (cbc).
  *
- * The IV must always be diffrent for diffrent input data blocks.
+ * The IV must always be different for different input data blocks.
  *
  * @param in data to encrypt
  * @param out data to encrypt
@@ -471,7 +471,7 @@ DES_cbc_encrypt(const void *in, void *out, long =
length,
  * Chaining mode. This mode is only used for Kerberos 4, and it should
  * stay that way.
  *
- * The IV must always be diffrent for diffrent input data blocks.
+ * The IV must always be different for different input data blocks.
  *
  * @param in data to encrypt
  * @param out data to encrypt
@@ -596,7 +596,7 @@ DES_ecb3_encrypt(DES_cblock *input,
 /**
  * Encrypt/decrypt using Triple DES in Chain Block Cipher mode (cbc).
  *
- * The IV must always be diffrent for diffrent input data blocks.
+ * The IV must always be different for different input data blocks.
  *
  * @param in data to encrypt
  * @param out data to encrypt
@@ -676,7 +676,7 @@ DES_ede3_cbc_encrypt(const void *in, void *out,
  * Encrypt/decrypt using DES in cipher feedback mode with 64 bit
  * feedback.
  *
- * The IV must always be diffrent for diffrent input data blocks.
+ * The IV must always be different for different input data blocks.
  *
  * @param in data to encrypt
  * @param out data to encrypt
@@ -754,7 +754,7 @@ DES_cfb64_encrypt(const void *in, void *out,
  * Crete a checksum using DES in CBC encryption mode. This mode is
  * only used for Kerberos 4, and it should stay that way.
  *
- * The IV must always be diffrent for diffrent input data blocks.
+ * The IV must always be different for different input data blocks.
  *
  * @param in data to checksum
  * @param output the checksum
diff --git a/source4/heimdal/lib/hdb/ext.c =
b/source4/heimdal/lib/hdb/ext.c
index f4f17152400..f68b159fafc 100644
--- a/source4/heimdal/lib/hdb/ext.c
+++ b/source4/heimdal/lib/hdb/ext.c
@@ -101,7 +101,7 @@ hdb_replace_extension(krb5_context context,
        ext2 =3D hdb_find_extension(entry, ext->data.element);
     } else {
        /*
-        * This is an unknown extention, and we are asked to replace a
+        * This is an unknown extension, and we are asked to replace a
         * possible entry in `entry' that is of the same type. This
         * might seem impossible, but ASN.1 CHOICE comes to our
         * rescue. The first tag in each branch in the CHOICE is
@@ -120,7 +120,7 @@ hdb_replace_extension(krb5_context context,
                          &size);
        if (ret) {
            krb5_set_error_message(context, ret, "hdb: failed to decode =
"
-                                  "replacement hdb extention");
+                                  "replacement hdb extension");
            return ret;
        }

@@ -136,7 +136,7 @@ hdb_replace_extension(krb5_context context,
                              &size);
            if (ret) {
                krb5_set_error_message(context, ret, "hdb: failed to =
decode "
-                                      "present hdb extention");
+                                      "present hdb extension");
                return ret;
            }

@@ -153,7 +153,7 @@ hdb_replace_extension(krb5_context context,
        ret =3D copy_HDB_extension(ext, ext2);
        if (ret)
            krb5_set_error_message(context, ret, "hdb: failed to copy =
replacement "
-                                  "hdb extention");
+                                  "hdb extension");
        return ret;
     }

diff --git a/source4/heimdal/lib/hdb/hdb.c =
b/source4/heimdal/lib/hdb/hdb.c
index 5dc5a0957e0..e3555c2b3a8 100644
--- a/source4/heimdal/lib/hdb/hdb.c
+++ b/source4/heimdal/lib/hdb/hdb.c
@@ -45,7 +45,7 @@
  * @section intro Introduction
  *
  * Heimdal libhdb library provides the backend support for Heimdal kdc
- * and kadmind. Its here where plugins for diffrent database engines
+ * and kadmind. Its here where plugins for different database engines
  * can be pluged in and extend support for here Heimdal get the
  * principal and policy data from.
  *
diff --git a/source4/heimdal/lib/hdb/hdb.h =
b/source4/heimdal/lib/hdb/hdb.h
index 6a09ecb6fe1..d55e9404b09 100644
--- a/source4/heimdal/lib/hdb/hdb.h
+++ b/source4/heimdal/lib/hdb/hdb.h
@@ -128,7 +128,7 @@ typedef struct HDB{
     /**
      * Close the database for transaction
      *
-     * Closes the database for further transactions, wont release any
+     * Closes the database for further transactions, won't release any
      * permanant resources. the database can be ->hdb_open-ed again.
      */
     krb5_error_code (*hdb_close)(krb5_context, struct HDB*);
diff --git a/source4/heimdal/lib/hdb/mkey.c =
b/source4/heimdal/lib/hdb/mkey.c
index 6dcfc029420..b038da12bb0 100644
--- a/source4/heimdal/lib/hdb/mkey.c
+++ b/source4/heimdal/lib/hdb/mkey.c
@@ -328,7 +328,7 @@ hdb_read_master_key(krb5_context context, const char =
*filename,
     } else {
       /*
        * Check both LittleEndian and BigEndian since they key file
-       * might be moved from a machine with diffrent byte order, or
+       * might be moved from a machine with different byte order, or
        * its running on MacOS X that always uses BE master keys.
        */
       ret =3D read_master_mit(context, filename, =
KRB5_STORAGE_BYTEORDER_LE, mkey);
diff --git a/source4/heimdal/lib/hx509/ca.c =
b/source4/heimdal/lib/hx509/ca.c
index cb5a7be62cc..c7f779bb990 100644
--- a/source4/heimdal/lib/hx509/ca.c
+++ b/source4/heimdal/lib/hx509/ca.c
@@ -1093,7 +1093,7 @@ ca_sign(hx509_context context,
            hx509_set_error_string(context, 0, ret, "Out of memory");
            goto out;
        }
-       /* XXX diffrent */
+       /* XXX different */
        RAND_bytes(tbsc->serialNumber.data, tbsc->serialNumber.length);
        ((unsigned char *)tbsc->serialNumber.data)[0] &=3D 0x7f;
     }
diff --git a/source4/heimdal/lib/hx509/cert.c =
b/source4/heimdal/lib/hx509/cert.c
index 190bdb48a4f..4d4bba4980e 100644
--- a/source4/heimdal/lib/hx509/cert.c
+++ b/source4/heimdal/lib/hx509/cert.c
@@ -1269,7 +1269,7 @@ _hx509_calculate_path(hx509_context context,
        if (path->len > max_depth) {
            hx509_cert_free(current);
            hx509_set_error_string(context, 0, HX509_PATH_TOO_LONG,
-                                  "Path too long while bulding "
+                                  "Path too long while building "
                                   "certificate chain");
            return HX509_PATH_TOO_LONG;
        }
@@ -1916,7 +1916,7 @@ check_name_constraints(hx509_context context,
                hx509_clear_error_string(context);
                return ret;
            }
-           /* allow null subjectNames, they wont matches anything */
+           /* allow null subjectNames, they won't matches anything */
            if (match =3D=3D 0 && !subject_null_p(c)) {
                hx509_set_error_string(context, 0, =
HX509_VERIFY_CONSTRAINTS,
                                       "Error verify constraints, "
diff --git a/source4/heimdal/lib/hx509/print.c =
b/source4/heimdal/lib/hx509/print.c
index 1e8bcabfa7e..4d2c3e2a421 100644
--- a/source4/heimdal/lib/hx509/print.c
+++ b/source4/heimdal/lib/hx509/print.c
@@ -969,7 +969,7 @@ hx509_validate_cert(hx509_context context,
            }
            validate_print(ctx,
                           =
HX509_VALIDATE_F_VALIDATE|HX509_VALIDATE_F_VERBOSE,
-                          "checking extention: %s\n",
+                          "checking extension: %s\n",
                           check_extension[j].name);
            (*check_extension[j].func)(ctx,
                                       &status,
@@ -977,7 +977,7 @@ hx509_validate_cert(hx509_context context,
                                       &t->extensions->val[i]);
        }
     } else
-       validate_print(ctx, HX509_VALIDATE_F_VERBOSE, "no =
extentions\n");
+       validate_print(ctx, HX509_VALIDATE_F_VERBOSE, "no =
extensions\n");

     if (status.isca) {
        if (!status.haveSKI)
diff --git a/source4/heimdal/lib/krb5/cache.c =
b/source4/heimdal/lib/krb5/cache.c
index 616044e67ba..2382d6c7ea3 100644
--- a/source4/heimdal/lib/krb5/cache.c
+++ b/source4/heimdal/lib/krb5/cache.c
@@ -1196,7 +1196,7 @@ krb5_cc_move(krb5_context context, krb5_ccache =
from, krb5_ccache to)

     if (strcmp(from->ops->prefix, to->ops->prefix) !=3D 0) {
        krb5_set_error_message(context, KRB5_CC_NOSUPP,
-                              N_("Moving credentials between diffrent "
+                              N_("Moving credentials between different =
"
                                 "types not yet supported", ""));
        return KRB5_CC_NOSUPP;
     }
@@ -1403,7 +1403,7 @@ krb5_cccol_cursor_new(krb5_context context, =
krb5_cccol_cursor *cursor)
  * @param cache the returned cursor, pointer is set to NULL on failure
  *        and a cache on success. The returned cache needs to be freed
  *        with krb5_cc_close() or destroyed with krb5_cc_destroy().
- *        MIT Kerberos behavies slightly diffrent and sets cache to =
NULL
+ *        MIT Kerberos behavies slightly different and sets cache to =
NULL
  *        when all caches are iterated over and return 0.
  *
  * @return Return 0 or and error, KRB5_CC_END is returned at the end
diff --git a/source4/heimdal/lib/krb5/crypto.c =
b/source4/heimdal/lib/krb5/crypto.c
index 7dd2af51e3f..803e4c67b7e 100644
--- a/source4/heimdal/lib/krb5/crypto.c
+++ b/source4/heimdal/lib/krb5/crypto.c
@@ -318,7 +318,7 @@ get_checksum_key(krb5_context context,
     if (kct =3D=3D NULL || kct->type !=3D ct->type) {
        krb5_set_error_message(context, KRB5_BAD_ENCTYPE,
                               N_("Checksum type %s is keyed, but "
-                                 "the key type %s passed didnt have =
that checksum "
+                                 "the key type %s passed didn't have =
that checksum "
                                  "type as the keyed type", ""),
                               ct->name, crypto->et->name);
        return KRB5_BAD_ENCTYPE;
diff --git a/source4/heimdal/lib/krb5/krbhst.c =
b/source4/heimdal/lib/krb5/krbhst.c
index dae32071b14..2abe366d194 100644
--- a/source4/heimdal/lib/krb5/krbhst.c
+++ b/source4/heimdal/lib/krb5/krbhst.c
@@ -651,7 +651,7 @@ kdc_get_next(krb5_context context,

     if (kd->flags & KD_CONFIG_EXISTS) {
        _krb5_debug(context, 1,
-                   "Configuration exists for realm %s, wont go to DNS",
+                   "Configuration exists for realm %s, won't go to =
DNS",
                    kd->realm);
        return KRB5_KDC_UNREACH;
     }
@@ -716,7 +716,7 @@ admin_get_next(krb5_context context,

     if (kd->flags & KD_CONFIG_EXISTS) {
        _krb5_debug(context, 1,
-                   "Configuration exists for realm %s, wont go to DNS",
+                   "Configuration exists for realm %s, won't go to =
DNS",
                    kd->realm);
        return KRB5_KDC_UNREACH;
     }
@@ -770,7 +770,7 @@ kpasswd_get_next(krb5_context context,

     if (kd->flags & KD_CONFIG_EXISTS) {
        _krb5_debug(context, 1,
-                   "Configuration exists for realm %s, wont go to DNS",
+                   "Configuration exists for realm %s, won't go to =
DNS",
                    kd->realm);
        return KRB5_KDC_UNREACH;
     }
@@ -828,7 +828,7 @@ krb524_get_next(krb5_context context,

     if (kd->flags & KD_CONFIG_EXISTS) {
        _krb5_debug(context, 1,
-                   "Configuration exists for realm %s, wont go to DNS",
+                   "Configuration exists for realm %s, won't go to =
DNS",
                    kd->realm);
        return KRB5_KDC_UNREACH;
     }
diff --git a/source4/heimdal/lib/krb5/log.c =
b/source4/heimdal/lib/krb5/log.c
index 4b289afd807..7365ada805d 100644
--- a/source4/heimdal/lib/krb5/log.c
+++ b/source4/heimdal/lib/krb5/log.c
@@ -318,7 +318,7 @@ krb5_addlog_dest(krb5_context context, =
krb5_log_facility *f, const char *orig)
            if(i < 0) {
                ret =3D errno;
                krb5_set_error_message(context, ret,
-                                      N_("open(%s) logile: %s", ""), =
fn,
+                                      N_("open(%s) logfile: %s", ""), =
fn,
                                       strerror(ret));
                free(fn);
                return ret;
diff --git a/source4/heimdal/lib/krb5/pkinit.c =
b/source4/heimdal/lib/krb5/pkinit.c
index c30a298a15c..5f4e0b55c11 100644
--- a/source4/heimdal/lib/krb5/pkinit.c
+++ b/source4/heimdal/lib/krb5/pkinit.c
@@ -1921,7 +1921,7 @@ _krb5_pk_load_id(krb5_context context,
                                 NULL, *chain_list);
        if (ret) {
            pk_copy_error(context, context->hx509ctx, ret,
-                         "Failed to laod chain %s",
+                         "Failed to load chain %s",
                          *chain_list);
            goto out;
        }
@@ -2071,7 +2071,7 @@ _krb5_parse_moduli_line(krb5_context context,
     m1->name =3D strdup(p1);
     if (m1->name =3D=3D NULL) {
        ret =3D ENOMEM;
-       krb5_set_error_message(context, ret, N_("malloc: out of =
memeory", ""));
+       krb5_set_error_message(context, ret, N_("malloc: out of memory", =
""));
        goto out;
     }

diff --git a/source4/heimdal/lib/wind/utf8.c =
b/source4/heimdal/lib/wind/utf8.c
index e1a1eb7b2b4..c701c05e5d0 100644
--- a/source4/heimdal/lib/wind/utf8.c
+++ b/source4/heimdal/lib/wind/utf8.c
@@ -356,7 +356,7 @@ wind_ucs2write(const uint16_t *in, size_t in_len, =
unsigned int *flags,
     }

     while (in_len) {
-       /** If the output wont fit into out_len, WIND_ERR_OVERRUN is =
returned */
+       /** If the output won't fit into out_len, WIND_ERR_OVERRUN is =
returned */
        if (len < 2)
            return WIND_ERR_OVERRUN;
        if ((*flags) & WIND_RW_LE) {
diff --git a/source4/torture/libsmbclient/libsmbclient.c =
b/source4/torture/libsmbclient/libsmbclient.c
index 586e1772425..5683bd3d6e1 100644
--- a/source4/torture/libsmbclient/libsmbclient.c
+++ b/source4/torture/libsmbclient/libsmbclient.c
@@ -649,7 +649,7 @@ static bool =
torture_libsmbclient_readdirplus_seek(struct torture_context *tctx)
                torture_fail_goto(tctx,
                        done,
                        talloc_asprintf(tctx,
-                               "after seek (20) readdir name missmatch =
"
+                               "after seek (20) readdir name mismatch "
                                "file %s - got %s\n",
                                dirent_20->name,
                                getdentries[0].name));
@@ -680,7 +680,7 @@ static bool =
torture_libsmbclient_readdirplus_seek(struct torture_context *tctx)
                torture_fail_goto(tctx,
                        done,
                        talloc_asprintf(tctx,
-                               "after seek (20) readdirplus name =
missmatch "
+                               "after seek (20) readdirplus name =
mismatch "
                                "file %s - got %s\n",
                                dirent_20->name,
                                direntries_20->name));
@@ -712,7 +712,7 @@ static bool =
torture_libsmbclient_readdirplus_seek(struct torture_context *tctx)
                torture_fail_goto(tctx,
                        done,
                        talloc_asprintf(tctx,
-                               "after seek (20) readdirplus2 name =
missmatch "
+                               "after seek (20) readdirplus2 name =
mismatch "
                                "file %s - got %s\n",
                                dirent_20->name,
                                direntries_20->name));
@@ -916,7 +916,7 @@ static bool torture_libsmbclient_readdirplus2(struct =
torture_context *tctx)
                success,
                done,
                talloc_asprintf(tctx,
-                       "filename '%s' ino missmatch. "
+                       "filename '%s' ino mismatch. "
                        "From smbc_readdirplus2 =3D %"PRIx64" "
                        "From smbc_stat =3D %"PRIx64"",
                        filename,
diff --git a/source4/torture/raw/samba3misc.c =
b/source4/torture/raw/samba3misc.c
index 2f484023bea..ad72b6a25d8 100644
--- a/source4/torture/raw/samba3misc.c
+++ b/source4/torture/raw/samba3misc.c
@@ -776,7 +776,7 @@ static void receive_lock_result(struct =
smbcli_request *req)

 /*
  * Check that Samba3 correctly deals with conflicting local posix byte =
range
- * locks on an underlying file via "normal" SMB1 (without unix =
extentions).
+ * locks on an underlying file via "normal" SMB1 (without unix =
extensions).
  *
  * Note: This test depends on "posix locking =3D yes".
  * Note: To run this test, use =
"--option=3Dtorture:localdir=3D<LOCALDIR>"
diff --git a/source4/torture/smb2/samba3misc.c =
b/source4/torture/smb2/samba3misc.c
index cf4d9bbe18f..6696c062e94 100644
--- a/source4/torture/smb2/samba3misc.c
+++ b/source4/torture/smb2/samba3misc.c
@@ -62,7 +62,7 @@ static void torture_smb2_tree_disconnect_timer(struct =
tevent_context *ev,

 /*
  * Check that Samba3 correctly deals with conflicting local posix byte =
range
- * locks on an underlying file via "normal" SMB2 (without posix =
extentions).
+ * locks on an underlying file via "normal" SMB2 (without posix =
extensions).
  *
  * Note: This test depends on "posix locking =3D yes".
  * Note: To run this test, use =
"--option=3Dtorture:localdir=3D<LOCALDIR>"
diff --git a/source4/torture/winbind/struct_based.c =
b/source4/torture/winbind/struct_based.c
index 9745b621ca9..1b69108f32e 100644
--- a/source4/torture/winbind/struct_based.c
+++ b/source4/torture/winbind/struct_based.c
@@ -1041,7 +1041,7 @@ static bool =
torture_winbind_struct_lookup_name_sid(struct torture_context *tortu
        struct winbindd_response rep;
        const char *invalid_sid =3D "S-0-0-7";
        char *domain =3D NULL;
-       const char *invalid_user =3D "noone";
+       const char *invalid_user =3D "no one";
        char *invalid_name;
        bool strict =3D torture_setting_bool(torture, "strict mode", =
false);
        char **users;
diff --git a/third_party/cmocka/cmocka.c b/third_party/cmocka/cmocka.c
index b21fe15536c..fc83addcbb3 100644
--- a/third_party/cmocka/cmocka.c
+++ b/third_party/cmocka/cmocka.c
@@ -45,7 +45,7 @@
 #include <time.h>

 /*
- * This allows to add a platform specific header file. Some embedded =
platforms
+ * This allows one to add a platform specific header file. Some =
embedded platforms
  * sometimes miss certain types and definitions.
  *
  * Example:
diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
index e6861c83d27..99d88c6ff2a 100644
--- a/third_party/cmocka/cmocka.h
+++ b/third_party/cmocka/cmocka.h
@@ -2284,7 +2284,7 @@ void cmocka_set_message_output(enum =
cm_message_output output);
 /**
  * @brief Set a pattern to only run the test matching the pattern.
  *
- * This allows to filter tests and only run the ones matching the =
pattern. Thep
+ * This allows one to filter tests and only run the ones matching the =
pattern. Thep
  * pattern can include two wildards. The first is '*', a wildcard that =
matches
  * zero or more characters, or =E2=80=98?=E2=80=99, a wildcard that =
matches exactly one
  * character.
diff --git a/third_party/nss_wrapper/wscript =
b/third_party/nss_wrapper/wscript
index dd83083b2e7..6cd46147f65 100644
--- a/third_party/nss_wrapper/wscript
+++ b/third_party/nss_wrapper/wscript
@@ -85,7 +85,7 @@ def configure(conf):

 def build(bld):
     if bld.CONFIG_SET("HAVE_NSS_H") and not =
bld.CONFIG_SET("USING_SYSTEM_NSS_WRAPPER"):
-        # We need to do it this way or the library wont work.
+        # We need to do it this way or the library won't work.
         # Using private_library=3DTrue will add symbol version which
         # breaks preloading!
         bld.SAMBA_LIBRARY('nss_wrapper',
diff --git a/third_party/pam_wrapper/wscript =
b/third_party/pam_wrapper/wscript
index aface6192c5..06fa62092a4 100644
--- a/third_party/pam_wrapper/wscript
+++ b/third_party/pam_wrapper/wscript
@@ -81,7 +81,7 @@ def configure(conf):

 def build(bld):
     if not bld.CONFIG_SET("USING_SYSTEM_PAM_WRAPPER"):
-        # We need to do it this way or the library wont work.
+        # We need to do it this way or the library won't work.
         # Using private_library=3DTrue will add symbol version which
         # breaks preloading!
         bld.SAMBA_LIBRARY('pam_wrapper',
diff --git a/third_party/resolv_wrapper/wscript =
b/third_party/resolv_wrapper/wscript
index 6bd2d51db41..e2d0304dd6a 100644
--- a/third_party/resolv_wrapper/wscript
+++ b/third_party/resolv_wrapper/wscript
@@ -63,7 +63,7 @@ def configure(conf):

 def build(bld):
     if bld.CONFIG_SET("HAVE_RESOLV_H") and not =
bld.CONFIG_SET("USING_SYSTEM_RESOLV_WRAPPER"):
-        # We need to do it this way or the library wont work.
+        # We need to do it this way or the library won't work.
         # Using private_library=3DTrue will add symbol version which
         # breaks preloading!
         bld.SAMBA_LIBRARY('resolv_wrapper',
diff --git a/third_party/socket_wrapper/wscript =
b/third_party/socket_wrapper/wscript
index 68972da0794..a947b8291db 100644
--- a/third_party/socket_wrapper/wscript
+++ b/third_party/socket_wrapper/wscript
@@ -80,7 +80,7 @@ def configure(conf):

 def build(bld):
     if not bld.CONFIG_SET("USING_SYSTEM_SOCKET_WRAPPER"):
-        # We need to do it this way or the library wont work.
+        # We need to do it this way or the library won't work.
         # Using private_library=3DTrue will add symbol version which
         # breaks preloading!
         bld.SAMBA_LIBRARY('socket_wrapper',
diff --git a/third_party/uid_wrapper/wscript =
b/third_party/uid_wrapper/wscript
index 182ef88d3df..e403565f447 100644
--- a/third_party/uid_wrapper/wscript
+++ b/third_party/uid_wrapper/wscript
@@ -114,7 +114,7 @@ syscall(SYS_setgroups32, 0, NULL);

 def build(bld):
     if not bld.CONFIG_SET("USING_SYSTEM_UID_WRAPPER"):
-        # We need to do it this way or the library wont work.
+        # We need to do it this way or the library won't work.
         # Using private_library=3DTrue will add symbol version which
         # breaks preloading!
         bld.SAMBA_LIBRARY('uid_wrapper',
diff --git a/third_party/waf/waflib/extras/boost.py =
b/third_party/waf/waflib/extras/boost.py
index c2aaaa938a2..90f53c451b0 100644
--- a/third_party/waf/waflib/extras/boost.py
+++ b/third_party/waf/waflib/extras/boost.py
@@ -29,7 +29,7 @@ When using this tool, the wscript will look like:
                bld(source=3D'main.cpp', target=3D'app', use=3D'BOOST')

 Options are generated, in order to specify the location of boost =
includes/libraries.
-The `check_boost` configuration function allows to specify the used =
boost libraries.
+The `check_boost` configuration function allows one to specify the used =
boost libraries.
 It can also provide default arguments to the --boost-mt command-line =
arguments.
 Everything will be packaged together in a BOOST component that you can =
use.

diff --git a/third_party/waf/waflib/extras/cfg_altoptions.py =
b/third_party/waf/waflib/extras/cfg_altoptions.py
index 47b1189f476..cd6d4169957 100644
--- a/third_party/waf/waflib/extras/cfg_altoptions.py
+++ b/third_party/waf/waflib/extras/cfg_altoptions.py
@@ -7,7 +7,7 @@ __copyright__ =3D "J=C3=A9r=C3=B4me Carretero, 2014"

 """

-This tool allows to work around the absence of ``*-config`` programs
+This tool allows one to work around the absence of ``*-config`` =
programs
 on systems, by keeping the same clean configuration syntax but =
inferring
 values or permitting their modification via the options interface.

diff --git a/third_party/waf/waflib/extras/cross_gnu.py =
b/third_party/waf/waflib/extras/cross_gnu.py
index 309f53b034d..7cb96055efd 100644
--- a/third_party/waf/waflib/extras/cross_gnu.py
+++ b/third_party/waf/waflib/extras/cross_gnu.py
@@ -6,7 +6,7 @@ __author__ =3D __maintainer__ =3D "J=C3=A9r=C3=B4me =
Carretero <cJ-waf@zougloub.eu>"
 __copyright__ =3D "J=C3=A9r=C3=B4me Carretero, 2014"

 """
-This tool allows to use environment variables to define =
cross-compilation
+This tool allows one to use environment variables to define =
cross-compilation
 variables intended for build variants.

 The variables are obtained from the environment in 3 ways:
diff --git a/third_party/waf/waflib/extras/file_to_object.py =
b/third_party/waf/waflib/extras/file_to_object.py
index 1393b511d63..881459d3adb 100644
--- a/third_party/waf/waflib/extras/file_to_object.py
+++ b/third_party/waf/waflib/extras/file_to_object.py
@@ -7,7 +7,7 @@ __copyright__ =3D "J=C3=A9r=C3=B4me Carretero, 2014"

 """

-This tool allows to embed file contents in object files (.o).
+This tool allows one to embed file contents in object files (.o).
 It is not exactly portable, and the file contents are reachable
 using various non-portable fashions.
 The goal here is to provide a functional interface to the embedding
--
2.20.1

------=_NextPart_000_003D_01D5B427.F2DE5940
Content-Type: text/plain;
	name="typos-lintian.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="typos-lintian.txt"

"usr/lib/python3/dist-packages/samba/param.cpython-37m-x86_64-linux-gnu.s=
o:tempates:templates
usr/bin/net:exising:existing
usr/bin/net:Mirgate:Migrate
usr/bin/net:succedded:succeeded
usr/bin/net:containter:container
usr/bin/net:explicite:explicit
usr/share/man/man5/smb.conf.5.gz:NEGOciation:Negotiation
usr/share/man/man5/smb.conf.5.gz:dont:don't
usr/share/man/man5/smb.conf.5.gz:overriden:overridden
usr/share/man/man5/smb.conf.5.gz:prefered:preferred
usr/share/man/man5/smb.conf.5.gz:allows to:allows one to
usr/share/man/man5/smb.conf.5.gz:allows to:allows one to
usr/share/man/man5/smb.conf.5.gz:allows to:allows one to
usr/share/man/man5/smb.conf.5.gz:allows to:allows one to
usr/share/man/man5/smb.conf.5.gz:allows to:allows one to
usr/share/man/man5/smb.conf.5.gz:allows to:allows one to
usr/share/man/man8/samba-tool.8.gz:accidentially:accidentally
usr/lib/x86_64-linux-gnu/samba/libhdb-samba4.so.11.0.2:extention:extensio=
n
usr/sbin/smbd:inteface:interface
usr/bin/smbtorture:DISLPAY:DISPLAY
usr/bin/smbtorture:serivce:service
usr/bin/smbtorture:BUITIN:BUILTIN
usr/bin/smbtorture:setted:set
usr/bin/smbtorture:encrpted:encrypted
usr/bin/smbtorture:emtpy:empty
usr/bin/smbtorture:missmatch:mismatch
usr/bin/smbtorture:recieved:received
usr/bin/smbtorture:componet:component
usr/bin/smbtorture:nonexistant:nonexistent
usr/bin/smbtorture:avaiable:available
usr/bin/smbtorture:hierachy:hierarchy
usr/bin/smbtorture:noone:no one
usr/bin/smbtorture:optinally:optionally
usr/bin/ctdb:advertisment:advertisement
usr/lib/x86_64-linux-gnu/ctdb/ctdb-eventd:advertisment:advertisement
usr/lib/x86_64-linux-gnu/ctdb/ctdb_killtcp:advertisment:advertisement
usr/lib/x86_64-linux-gnu/ctdb/ctdb_lock_helper:advertisment:advertisement=

usr/lib/x86_64-linux-gnu/ctdb/ctdb_mutex_fcntl_helper:advertisment:advert=
isement
usr/sbin/ctdbd:advertisment advertisement
usr/share/man/man1/ctdb.1.gz:ot:to
usr/share/man/man1/ctdb.1.gz:ot:to
usr/lib/x86_64-linux-gnu/samba/vfs/fruit.so:ressource:resource
usr/share/man/man8/vfs_fruit.8.gz:Therefor:Therefore
usr/share/man/man8/vfs_glusterfs_fuse.8.gz:exisiting:existing
usr/share/man/man8/vfs_nfs4acl_xattr.8.gz:directores:directories
usr/lib/x86_64-linux-gnu/libsamba-hostconfig.so.0.0.1:dont:don't
usr/lib/x86_64-linux-gnu/libsamba-hostconfig.so.0.0.1:prefered:preferred
usr/lib/x86_64-linux-gnu/samba/libads.so.0:convertion:conversion
usr/lib/x86_64-linux-gnu/samba/libasn1-samba4.so.8.0.0:underun:underrun
usr/lib/x86_64-linux-gnu/samba/libhx509-samba4.so.5.0.0:bulding:building
usr/lib/x86_64-linux-gnu/samba/libhx509-samba4.so.5.0.0:extention:extensi=
on
usr/lib/x86_64-linux-gnu/samba/libhx509-samba4.so.5.0.0:extentions:extens=
ions
usr/lib/x86_64-linux-gnu/samba/libkrb5-samba4.so.26.0.0:diffrent:differen=
t
usr/lib/x86_64-linux-gnu/samba/libkrb5-samba4.so.26.0.0:didnt:didn't
usr/lib/x86_64-linux-gnu/samba/libkrb5-samba4.so.26.0.0:wont:won't
usr/lib/x86_64-linux-gnu/samba/libkrb5-samba4.so.26.0.0:logile:logfile
usr/lib/x86_64-linux-gnu/samba/libkrb5-samba4.so.26.0.0:laod:load
usr/lib/x86_64-linux-gnu/samba/libkrb5-samba4.so.26.0.0:memeory:memory
usr/lib/x86_64-linux-gnu/samba/libsamba-net.cpython-37m-x86-64-linux-gnu.=
so.0:tempates:templates
usr/lib/x86_64-linux-gnu/samba/libsamba-security.so.0:upto:up to
usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0:invalide:invalid
usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0:unkown:unknown
usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0:emtpy:empty
usr/share/man/man1/wbinfo.1.gz:sepcific:specific
usr/bin/rpcclient:Unsuported:Unsupported
usr/share/man/man1/rpcclient.1.gz:integrety:integrity
usr/share/man/man1/rpcclient.1.gz:autentication:authentication
usr/share/man/man1/rpcclient.1.gz:autentication:authentication
usr/share/man/man5/pam_winbind.conf.5.gz:simliar:similar

------=_NextPart_000_003D_01D5B427.F2DE5940--


