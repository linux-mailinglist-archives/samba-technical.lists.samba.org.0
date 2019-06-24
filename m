Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C24CE503FE
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 09:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3SskdMo5leI5+Y3Rcyqd4zYWcza+XlaybojLeFjPSY0=; b=42YNvx5jUcEy5BJMPv206CJNeg
	Pr3lEkpaYwSw4pY/ORxElcun8Mx3dicoCySDiyTMDOqmGoo90BBJR5vUBxW0zJGeLl5xg6VX+tFVG
	/9SJoWyGmHzCukbCeSTX7t1yrdo+6h3BvtJYTrs20SNXU4t6nps3gieBuBgsafu0nUIvv58PQHYLs
	DgANDv28pAtGvbf9YOq/IhBQJiaxN1xj6/tVK6uznrkbHMbecY5WCN3To/I16N/UlFqnOZW0BDWFb
	+WwuYKBPtsBcSCBG4YiD+pCc1AmZeQTo5Eb3XNwRkP4GMU7bPMzUzPwCzdsZFvPQj1k4Cf42eYPrg
	JM1f0qmg==;
Received: from localhost ([::1]:32002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfJki-001OXM-VK; Mon, 24 Jun 2019 07:51:01 +0000
Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::11]:16003) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfJkf-001OXF-Nn
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 07:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561362656;
 s=strato-dkim-0002; d=habacker.de;
 h=Date:Message-ID:Subject:From:To:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=3SskdMo5leI5+Y3Rcyqd4zYWcza+XlaybojLeFjPSY0=;
 b=J2+oyKp0skNJmwlKpia3nBkR5f1Q82X6OcWCxSYE3maACl98wzhBE3gmiM7MuRLy2y
 BpHSBfFOtdCi/W2ph+GviHz4mnhnutS2eotWXXA9EbDcmi2gOYc5jm1tmLeMhNYeEcQR
 1OsVLxRK03nlQLiXmf5iZ4YZGiqucHjmTqJUjmUPjH2imf0+K0RRsd2QoyEG0QHc3w/B
 IJZ/DPNNyOXZSF6bLjv3qxK5gDTTxMmv7lWjtp4qbgRa6YPbLAQDJOXo5pRjjeZRhkFy
 +xOLPx8j91xnGIQ2/v9Q8GsTVFN49GCwFQghUbdTBFHA88crQLmPbg0NMZL924dE4Bvu
 M3VA==
X-RZG-AUTH: ":Pm0Ic2Cgev01OMJUmdKKi4d4uwm4tenjFH72zyJC3kFMwckWOLT4go9HRj1ypvI="
X-RZG-CLASS-ID: mo05
Received: from [10.68.28.95] by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id w0847cv5O7ouV22
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <samba-technical@lists.samba.org>;
 Mon, 24 Jun 2019 09:50:56 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: [PATCH] winbind: fix crash in fill_domain_username_talloc() if,
 specified username is NULL
Openpgp: preference=signencrypt
Message-ID: <b8d53d4b-0b73-4c70-5bc6-3c5e6f7d8a6a@freenet.de>
Date: Mon, 24 Jun 2019 09:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------46EF80DD72F94ED84C38CED7"
Content-Language: en-US
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
From: Ralf Habacker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralf Habacker <ralf.habacker@freenet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------46EF80DD72F94ED84C38CED7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

attached is a patch for git master branch, that fixes a crash in winbind
when calling wbinfo -u.

Backtrace:
Program received signal SIGSEGV, Segmentation fault.
strlower_m (s=3Ds@entry=3D0x0) at ../source3/lib/util_str.c:474
474 while (*s && !(((unsigned char)s[0]) & 0x80)) {
(gdb) bt
#0 strlower_m (s=3Ds@entry=3D0x0) at ../source3/lib/util_str.c:474
#1 0x00005563f7957ac6 in fill_domain_username_talloc
(mem_ctx=3Dmem_ctx@entry=3D0x5563f8a89480, domain=3D0x5563f8a7b6c0
"SAGWH", user=3D<optimized out>, can_assume=3Dcan_assume@entry=3Dtrue)
at ../source3/winbindd/winbindd_util.c:1209
#2 0x00005563f798df06 in wb_query_user_list_done (subreq=3D<optimized out=
>)
at ../source3/winbindd/wb_query_user_list.c:110
#3 0x00007f3d6620c7f6 in dcerpc_binding_handle_call_done
(subreq=3D<optimized out>) at
=2E./librpc/rpc/binding_handle.c:520
#4 0x00005563f797f3ed in wbint_bh_raw_call_domain_done
(subreq=3D<optimized out>)
at ../source3/winbindd/winbindd_dual_ndr.c:202
#5 0x00005563f797cc3c in wb_domain_request_done (subreq=3D<optimized out>=
) at
=2E./source3/winbindd/winbindd_dual.c:629
#6 0x00005563f797b14d in wb_child_request_done (subreq=3D0x5563f8a89880)
at ../source3/winbindd/winbindd_dual.c:221
#7 0x00005563f79a40c7 in wb_simple_trans_read_done (subreq=3D<optimized
out>) at ../nsswitch/wb_reqtrans.c:432
#8 0x00005563f79a3a06 in wb_resp_read_done (subreq=3D<optimized out>) at
=2E./nsswitch/wb_reqtrans.c:275
#9 0x00007f3d5fe10c10 in ?? () from /usr/lib64/libtevent.so.0
#10 0x00007f3d5fe0f097 in ?? () from /usr/lib64/libtevent.so.0
#11 0x00007f3d5fe0b4ed in _tevent_loop_once () from
/usr/lib64/libtevent.so.0
#12 0x00005563f7950548 in main (argc=3D<optimized out>, argv=3D<optimized=

out>) at
=2E./source3/winbindd/winbindd.c:1797

The related samba version is 4.7.11.

Regards

Ralf


--------------46EF80DD72F94ED84C38CED7
Content-Type: text/x-patch;
 name="0001-winbind-fix-crash-in-fill_domain_username_talloc-if-.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-winbind-fix-crash-in-fill_domain_username_talloc-if-.pa";
 filename*1="tch"

=46rom 9815a7595cb592e340ba4d83e6ff18fb366827f2 Mon Sep 17 00:00:00 2001
From: Ralf Habacker <ralf.habacker@freenet.de>
Date: Mon, 24 Jun 2019 09:25:48 +0200
Subject: [PATCH] winbind: fix crash in fill_domain_username_talloc() if
 specified username is NULL

Signed-off-by: Ralf Habacker <ralf.habacker@freenet.de>
---
 source3/winbindd/winbindd_util.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/source3/winbindd/winbindd_util.c b/source3/winbindd/winbindd=
_util.c
index 91a2f6ef197..83692bdf076 100644
--- a/source3/winbindd/winbindd_util.c
+++ b/source3/winbindd/winbindd_util.c
@@ -1681,6 +1681,10 @@ char *fill_domain_username_talloc(TALLOC_CTX *mem_=
ctx,
 		can_assume =3D false;
 	}
=20
+	if (!user) {
+		return NULL;
+	}
+
 	tmp_user =3D talloc_strdup(mem_ctx, user);
 	if (!strlower_m(tmp_user)) {
 		TALLOC_FREE(tmp_user);
--=20
2.13.7


--------------46EF80DD72F94ED84C38CED7--

