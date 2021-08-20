Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E599D3F3742
	for <lists+samba-technical@lfdr.de>; Sat, 21 Aug 2021 01:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=injNyqk0O05AWAjdLiK5Yd2rg5V8yrPBZJK/UIJi/0o=; b=myNTEGT+s2cUkaU+KChSAA9E1/
	a1mbdQ2WrnaP50xFMi+ITDRDXkuPh41dSWj2NzTu53aXoY/78lvQXvp7Xx8qfmhtlPYHJQu5aF4IR
	42T1ItgaBqTUAaAXRQclSBfjqLGzBFPLYDWdOVxfYyLyCMYiJ8TSIHZHY7KTvpeYW8y9mav8hqJ6v
	Qooxbya+o/ZovVCF1PxyM5k5xEEBRk5x7QvFjSHpszWTuLRAU487j575zHp++BDPgtG0C15ABzKmP
	qh9LDffoGIE6pwjMyoce2S4RzMYVs090FTm3U51GcQ3AmYary3HAADc7GgvoAjnbanQHpBHGO0lK9
	fBhh647A==;
Received: from ip6-localhost ([::1]:38594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mHDn5-008JxS-Qb; Fri, 20 Aug 2021 23:19:11 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:44748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mHDmz-008JxI-Ni
 for samba-technical@lists.samba.org; Fri, 20 Aug 2021 23:19:08 +0000
Received: by mail-lj1-x232.google.com with SMTP id s3so19642514ljp.11
 for <samba-technical@lists.samba.org>; Fri, 20 Aug 2021 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=injNyqk0O05AWAjdLiK5Yd2rg5V8yrPBZJK/UIJi/0o=;
 b=OhxktmJd+PAjFzfrGtZaXuFU/maWnJT19lhfCcPO/L8J8X+Oo/ESSzcDGrn4sYcoMk
 kPS4N3xChJi2pDtasRzktUbuMMqZXEAJPH8gLv6BXeGnRaW7cJjI0LMtaezF1G9bH6lU
 WzkRpPRR6a7udCiBtXnRy/ybXzqlb65uC3/GWpQA/G+d4DsX4AFUmkxAtyWV9iaVkSzj
 CcGrhkBuVfsY4013/Bft+F+a4d3+G6z0bkGvNKhmeFdCMacMv7WTHpC/zfDTgyF/6PXk
 DwUdQcy3j3prh7pR1+s7zLIyIPMDjfC8htOkA5m+1sHQV4Rvdea7qOOnjpTGzTXt8lzE
 RaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=injNyqk0O05AWAjdLiK5Yd2rg5V8yrPBZJK/UIJi/0o=;
 b=jQde+pu78evgeyQFJoN/QKPy4comniwFibOa7nS0KhsN23/OKJJAJccGIMlr+4s0zr
 nMWSCzm8gS7yhVp1hvJVp5RVTP7i8E3ykhqGO/Tr1bK+1hJZ+K9EndKH7NSa6nr6yRZx
 2QxWlIYQk0mOCts6CggYKq7IoL3BZ1Pj2D/cril0W8na48VhGsBlbl2k1nbblEL1RoJ7
 89Jjz2azuXkRBNpdXjZLnyAr1Y9xh3Mo/L1wFZ+37HlrsEk6FYGMcsDY6bromP9sJSe+
 V2pwczI4ECcavhKmVgRzxvldWegzWE4dBxKHsLCKTs5YsIWfJne/GgKmmupjvmMCr1bL
 7IYA==
X-Gm-Message-State: AOAM533Ey1MY0eOeoUN0v8RcVr3Hi171s+NexhfHZckX0IUTwNdOhyGS
 fKlAuekR5etmfgo2qi4AKUNnPTVLmpFF4BuZpZQ=
X-Google-Smtp-Source: ABdhPJzyeII4XBwTu1jh+7vIYJxM4YYTmKb9f2YNy+vDAz9XkX6KruBe+a/aKqw7IhEh0xoyZPVueZ3V2sNx4Y8AX0k=
X-Received: by 2002:a2e:2417:: with SMTP id k23mr17886463ljk.256.1629501541700; 
 Fri, 20 Aug 2021 16:19:01 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 20 Aug 2021 18:18:50 -0500
Message-ID: <CAH2r5mvxX6BqLvgWO18QE+rQsAZoAzopvu5S3fyy45a+Y-w_MQ@mail.gmail.com>
Subject: [PATCH] oid_registry: Add OIDs for missing Spnego auth mechanisms to
 Macs
To: CIFS <linux-cifs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 David Howells <dhowells@redhat.com>
Content-Type: multipart/mixed; boundary="0000000000008def7405ca05e408"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000008def7405ca05e408
Content-Type: text/plain; charset="UTF-8"

 In testing mounts to Macs, noticed that the OIDS for some
 GSSAPI/SPNEGO auth mechanisms sent by the server were not
 recognized and were missing from the header.

 Signed-off-by: Steve French <stfrench@microsoft.com>

diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 3d8db1f6a5db..2728842721bc 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -70,6 +70,9 @@ enum OID {

        OID_spnego,                     /* 1.3.6.1.5.5.2 */

+       OID_IAKerb,                     /* 1.3.6.1.5.2.5 */
+       OID_PKU2U                       /* 1.3.5.1.5.2.7 */
+       OID_Scram,                      /* 1.3.6.1.5.5.14 */
        OID_certAuthInfoAccess,         /* 1.3.6.1.5.5.7.1.1 */
        OID_sha1,                       /* 1.3.14.3.2.26 */
        OID_id_ansip384r1,              /* 1.3.132.0.34 */
@@ -104,6 +107,10 @@ enum OID {
        OID_authorityKeyIdentifier,     /* 2.5.29.35 */
        OID_extKeyUsage,                /* 2.5.29.37 */

+       /* Heimdal mechanisms */
+       OID_NetlogonMechanism,          /* 1.2.752.43.14.2 */
+       OID_appleLocalKdcSupported,     /* 1.2.752.43.14.3 */
+
        /* EC-RDSA */
        OID_gostCPSignA,                /* 1.2.643.2.2.35.1 */
        OID_gostCPSignB,                /* 1.2.643.2.2.35.2 */


-- 
Thanks,

Steve

--0000000000008def7405ca05e408
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-oid_registry-Add-OIDs-for-missing-Spnego-auth-mechan.patch"
Content-Disposition: attachment; 
	filename="0001-oid_registry-Add-OIDs-for-missing-Spnego-auth-mechan.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kskz4e7j0>
X-Attachment-Id: f_kskz4e7j0

RnJvbSBmNDRlODEzYmVlNDdhOTA3YTA2MmE4NjNiMWYwMWZmZTJhOGY5ODY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMjAgQXVnIDIwMjEgMTg6MTA6MzYgLTA1MDAKU3ViamVjdDogW1BBVENIXSBv
aWRfcmVnaXN0cnk6IEFkZCBPSURzIGZvciBtaXNzaW5nIFNwbmVnbyBhdXRoIG1lY2hhbmlzbXMg
dG8KIE1hY3MKCkluIHRlc3RpbmcgbW91bnRzIHRvIE1hY3MsIG5vdGljZWQgdGhhdCB0aGUgT0lE
UyBmb3Igc29tZQpHU1NBUEkvU1BORUdPIGF1dGggbWVjaGFuaXNtcyBzZW50IGJ5IHRoZSBzZXJ2
ZXIgd2VyZSBub3QKcmVjb2duaXplZCBhbmQgd2VyZSBtaXNzaW5nIGZyb20gdGhlIGhlYWRlci4K
ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0t
CiBpbmNsdWRlL2xpbnV4L29pZF9yZWdpc3RyeS5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9vaWRfcmVnaXN0
cnkuaCBiL2luY2x1ZGUvbGludXgvb2lkX3JlZ2lzdHJ5LmgKaW5kZXggM2Q4ZGIxZjZhNWRiLi4y
NzI4ODQyNzIxYmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvb2lkX3JlZ2lzdHJ5LmgKKysr
IGIvaW5jbHVkZS9saW51eC9vaWRfcmVnaXN0cnkuaApAQCAtNzAsNiArNzAsOSBAQCBlbnVtIE9J
RCB7CiAKIAlPSURfc3BuZWdvLAkJCS8qIDEuMy42LjEuNS41LjIgKi8KIAorCU9JRF9JQUtlcmIs
CQkJLyogMS4zLjYuMS41LjIuNSAqLworCU9JRF9QS1UyVQkJCS8qIDEuMy41LjEuNS4yLjcgKi8K
KwlPSURfU2NyYW0sCQkJLyogMS4zLjYuMS41LjUuMTQgKi8KIAlPSURfY2VydEF1dGhJbmZvQWNj
ZXNzLAkJLyogMS4zLjYuMS41LjUuNy4xLjEgKi8KIAlPSURfc2hhMSwJCQkvKiAxLjMuMTQuMy4y
LjI2ICovCiAJT0lEX2lkX2Fuc2lwMzg0cjEsCQkvKiAxLjMuMTMyLjAuMzQgKi8KQEAgLTEwNCw2
ICsxMDcsMTAgQEAgZW51bSBPSUQgewogCU9JRF9hdXRob3JpdHlLZXlJZGVudGlmaWVyLAkvKiAy
LjUuMjkuMzUgKi8KIAlPSURfZXh0S2V5VXNhZ2UsCQkvKiAyLjUuMjkuMzcgKi8KIAorCS8qIEhl
aW1kYWwgbWVjaGFuaXNtcyAqLworCU9JRF9OZXRsb2dvbk1lY2hhbmlzbSwJCS8qIDEuMi43NTIu
NDMuMTQuMiAqLworCU9JRF9hcHBsZUxvY2FsS2RjU3VwcG9ydGVkLAkvKiAxLjIuNzUyLjQzLjE0
LjMgKi8KKwogCS8qIEVDLVJEU0EgKi8KIAlPSURfZ29zdENQU2lnbkEsCQkvKiAxLjIuNjQzLjIu
Mi4zNS4xICovCiAJT0lEX2dvc3RDUFNpZ25CLAkJLyogMS4yLjY0My4yLjIuMzUuMiAqLwotLSAK
Mi4zMC4yCgo=
--0000000000008def7405ca05e408--

