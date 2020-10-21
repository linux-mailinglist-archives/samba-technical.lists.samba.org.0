Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FAB2947D9
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 07:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hptYP+sgbBe/kJvWIw/N36ee72twdhgshClkTUCB3Xc=; b=hyk75/uWlRplssOgm4bx+/rjzL
	igEgVwsUTMCGvIRIFPZcoZyb/QxfOokZO1rklOplx7a198t9cAxBLqPP5Uy6YRWAMw18Sz55xsvs3
	Cli3SKFR7egr1KRlGYiG7uEOMsTqi2VH8eUMx0pRWcCJ4NP5NaROcGZ8li9ook2gQb2x/ZEoYgb75
	JirI0WUn2wbIaW7bCunyOrAH3jpXZroOY5oHjc7Xui4GTYfsHu2UWMwLmgGSwqnyeTBMYDEc3jjz7
	oLAzuGbr+TBGMTbSwbwA0MWo1JUWk5VGYsxseIq2naitSohb9NEklPwVAXWZ6XBS5ma9v5djEcVvA
	U5aCaa2Q==;
Received: from ip6-localhost ([::1]:52358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV6db-00D19t-5o; Wed, 21 Oct 2020 05:26:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34369) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV6dW-00D19m-DP
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 05:26:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id y16so1178044ljk.1
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hptYP+sgbBe/kJvWIw/N36ee72twdhgshClkTUCB3Xc=;
 b=BhaHsBSiIX55IVo0pXbjkOKNFp+dCMxlE+qRmYIwVgY56Wvvmh3GgmhJD8rGJMnm7m
 ooaPDhpAI3p4XfzudwIZ9AIuqYVVpjO0aUyB1EGoI2BNNN+Cx53XbI4zbMbxLmeu/f2p
 tJEgKlW9yPzbiAZqIjHUxaBkrgEpnODQUrrdY7qdwcfj7UnSYs9nAjFB2asYmcOktX6L
 mXbVvRL5jPEqL9ddWBQXKFYRZ28HgxPCroKOmJWgL5G3Sz791zkZP2HAIt/MYdfaRD2S
 RBaIAWZRc76GyT+zoSR/sXmoovaxP07sQu8hQ8E+MHmDInIyhqr2d+Xhh0u8AT7GZQy0
 njWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hptYP+sgbBe/kJvWIw/N36ee72twdhgshClkTUCB3Xc=;
 b=ShYIleSHijpydWtSkRov60DC/Qm48fyTaNY8V2NSojt5JjAIGtNtiQus+h9Nk+dlxz
 ik6JZd5K9D8AoJtbHQFL9nzWhwNUJa6GuLbw2reB2OkjP5ZCC6i4+0PllWiwTCnk2mdm
 S+qe4OIlHVp6Vmui98p3dMR67QbjpPl3PYDzESEx/aW2T8JGHrPctmZxFC6DZTA1Sbb4
 2db2MXbvoK4sQhPiuuPEp5Rd0VuI55kM9Va7GWMl8aSUdIcT2rt4jHw0SO/Z/uenfRXe
 J6rECxepAC1kxtHUg1NRsy34/k59jDkCuRZlydHWSkbCrOZ6d3kGwOilbohSKbiK1M2x
 V4nw==
X-Gm-Message-State: AOAM531JC8TPZrY2ZxxIjpFt55+bBTvxt3/ed9VLrZfECdOdPfMh5Y0t
 iRHqzlwTV4NWWoCSEY0XI/HEOJnSUJk1DTQEpEgpUy6sUGOBeg==
X-Google-Smtp-Source: ABdhPJzOIo/1n4B501CEhPADxNRwE+tON6bO4ISYgGZSw90ufeefLXNEhJFYHJI0PDQoaCDHGDb8pq4KxUVUMEodE+w=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr556585ljk.372.1603257967552;
 Tue, 20 Oct 2020 22:26:07 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Oct 2020 00:25:56 -0500
Message-ID: <CAH2r5mvY127tWa5mtGDkxKU4gB6SyW5a_jjuAeoWmyDB9vCGrw@mail.gmail.com>
Subject: [PATCH][SMB3] do not try to cache root directory if dir leases not
 supported
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000a3e74905b22795ec"
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

--000000000000a3e74905b22795ec
Content-Type: text/plain; charset="UTF-8"

To servers which do not support directory leases (e.g. Samba)
    it is wasteful to try to open_shroot (ie attempt to cache the
    root directory handle).  Skip attempt to open_shroot when
    server does not indicate support for directory leases.

    Cuts the number of requests on mount from 17 to 15, and
    cuts the number of requests on stat of the root directory
    from 4 to 3.

(also added cc: stable v5.1+)



-- 
Thanks,

Steve

--000000000000a3e74905b22795ec
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-do-not-try-to-cache-root-directory-if-dir-lease.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-do-not-try-to-cache-root-directory-if-dir-lease.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kgiye1s90>
X-Attachment-Id: f_kgiye1s90

RnJvbSBiNjQwZTM3N2NkODI3NmEyZjc0MDZhNmI0NzNiYTE5Zjk4YTMxZmVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjAgMDA6MTU6NDIgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBkbyBub3QgdHJ5IHRvIGNhY2hlIHJvb3QgZGlyZWN0b3J5IGlmIGRpciBsZWFzZXMgbm90
CiBzdXBwb3J0ZWQKClRvIHNlcnZlcnMgd2hpY2ggZG8gbm90IHN1cHBvcnQgZGlyZWN0b3J5IGxl
YXNlcyAoZS5nLiBTYW1iYSkKaXQgaXMgd2FzdGVmdWwgdG8gdHJ5IHRvIG9wZW5fc2hyb290IChp
ZSBhdHRlbXB0IHRvIGNhY2hlIHRoZQpyb290IGRpcmVjdG9yeSBoYW5kbGUpLiAgU2tpcCBhdHRl
bXB0IHRvIG9wZW5fc2hyb290IHdoZW4Kc2VydmVyIGRvZXMgbm90IGluZGljYXRlIHN1cHBvcnQg
Zm9yIGRpcmVjdG9yeSBsZWFzZXMuCgpDdXRzIHRoZSBudW1iZXIgb2YgcmVxdWVzdHMgb24gbW91
bnQgZnJvbSAxNyB0byAxNSwgYW5kCmN1dHMgdGhlIG51bWJlciBvZiByZXF1ZXN0cyBvbiBzdGF0
IG9mIHRoZSByb290IGRpcmVjdG9yeQpmcm9tIDQgdG8gMy4KClNpZ25lZC1vZmYtYnk6IFN0ZXZl
IEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KQ0M6IFN0YWJsZSA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4gIyB2NS4xKwotLS0KIGZzL2NpZnMvY29ubmVjdC5jIHwgNSArKysrLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2ZzL2NpZnMvY29ubmVjdC5jIGIvZnMvY2lmcy9jb25uZWN0LmMKaW5kZXggYjQyODJhYmMzZDEy
Li5iY2I1MzljMjJlMzkgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvY29ubmVjdC5jCisrKyBiL2ZzL2Np
ZnMvY29ubmVjdC5jCkBAIC0zNjA4LDcgKzM2MDgsMTAgQEAgY2lmc19nZXRfdGNvbihzdHJ1Y3Qg
Y2lmc19zZXMgKnNlcywgc3RydWN0IHNtYl92b2wgKnZvbHVtZV9pbmZvKQogCSAqLwogCXRjb24t
PnJldHJ5ID0gdm9sdW1lX2luZm8tPnJldHJ5OwogCXRjb24tPm5vY2FzZSA9IHZvbHVtZV9pbmZv
LT5ub2Nhc2U7Ci0JdGNvbi0+bm9oYW5kbGVjYWNoZSA9IHZvbHVtZV9pbmZvLT5ub2hhbmRsZWNh
Y2hlOworCWlmIChzZXMtPnNlcnZlci0+Y2FwYWJpbGl0aWVzICYgU01CMl9HTE9CQUxfQ0FQX0RJ
UkVDVE9SWV9MRUFTSU5HKQorCQl0Y29uLT5ub2hhbmRsZWNhY2hlID0gdm9sdW1lX2luZm8tPm5v
aGFuZGxlY2FjaGU7CisJZWxzZQorCQl0Y29uLT5ub2hhbmRsZWNhY2hlID0gMTsKIAl0Y29uLT5u
b2RlbGV0ZSA9IHZvbHVtZV9pbmZvLT5ub2RlbGV0ZTsKIAl0Y29uLT5sb2NhbF9sZWFzZSA9IHZv
bHVtZV9pbmZvLT5sb2NhbF9sZWFzZTsKIAlJTklUX0xJU1RfSEVBRCgmdGNvbi0+cGVuZGluZ19v
cGVucyk7Ci0tIAoyLjI1LjEKCg==
--000000000000a3e74905b22795ec--

