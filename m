Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC653B1B0
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jun 2022 04:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Js3IruM4BXSFN0IJZZDQA8cDZgJKRjJtKo73/Xc1HJc=; b=a+Gd7jXgo/1zZmclnN33TvmX7J
	ndeumvG9mRqYNXaDixH5L9z+OXAOZGkw5odb1lfnMgNBYokFFIbkoEtCc/Q+gpPshJ6qi5vQtRyGh
	TT8/l1jvEImj8r72M5b+IKRjkJz+3KB5+KOm51yaZ1ocBKTTMsYnnq68EwtO+E3+uo7QnkLNIYtOA
	fz1hO2wdpUpoh5o8PJMK0LVWgQHgOBnBVpEU1RNTnuv2eOCbagSBRWq0gtURh0ySrCaZVpuiBa/wm
	f+JwwjVnMDXLxhQvlUSrNHozo9Hhz+w2uU965pE5Q49IMXOrkg5hm5QYi9qd6dZLB3Q4r109fdtX0
	dm0Mktgg==;
Received: from ip6-localhost ([::1]:44900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nwakH-006TNl-Li; Thu, 02 Jun 2022 02:39:33 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:38835) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nwak9-006TNb-IW
 for samba-technical@lists.samba.org; Thu, 02 Jun 2022 02:39:30 +0000
Received: by mail-vs1-xe30.google.com with SMTP id 63so3411740vsx.5
 for <samba-technical@lists.samba.org>; Wed, 01 Jun 2022 19:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Js3IruM4BXSFN0IJZZDQA8cDZgJKRjJtKo73/Xc1HJc=;
 b=GhucqSSJJ1V+g6OtPFpDWMhKdX/V3waFjsAd9uH2r8bf4AZ388ai0+42OgDIWFxr56
 bRW2V4Z57++TphOsWrRQPeltbSgr+lunV/4EJMPsJq2LF08hXoWecvvYfPCMogPu81NF
 S1jJ0RWeoTKqHG0fXTUJ/useBMNbhKcngc46i4MrTGApyvfWyeoYgeZwxM+rQwpUIyHY
 UXHNe1ZYQQItjZ2I+iUH6ORfIgPwl4ok4SWdOfXip9QUvnPl3e8+FJn/nUSk/Pjfm9qp
 N757Xw4kTht912+jzOgWAcU76vBbf7S1XcdxXu7EcHsb/Hdk61YQ2Dp8Skkud2dB1p3R
 CSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Js3IruM4BXSFN0IJZZDQA8cDZgJKRjJtKo73/Xc1HJc=;
 b=vNJMxDI8IreDlLZW6EOEP/Gdx/NfUcTL/OXPHnLZxK1vI3IaldI2YbHOjiXQ7LVlRU
 +OqJKaTy9bnLq7xUDqNFFEZ6MR8eUORJ8E3/la5SQOaxncx/EZmMDIAD8fi/mjsUprfZ
 ltUGxxUooLc+JKFO+7P144BVJdVqfVVRng3zTtEOM2xaBz+dyovrp7vuJSpkN+JF0V2y
 5U2xQgsq6u2GHzrDg4o1XMkA1hiRrsfCdO1T1hiMgJjfZiLAmo+pqi5xHUJ6N7zmrgW0
 hCkCnQYPXtf2gwJumyZyYBjiAaJq5LNtOSwEC2f5VvyF8PSN9MyfUrRDY+gGnibDIUtm
 NozQ==
X-Gm-Message-State: AOAM532r1KRYMzOu54fwbScjnwEUeVguOsdQhfuq+AXp53olaiK4Lm/m
 8hZYPrY9wLMbx3MFoRWER9+GvSNx0pCA55Rh57k=
X-Google-Smtp-Source: ABdhPJwxMazGjzBhXnzi8qQSEJ4yxSyjgKkZ8xHA1Fi9YlXSowrFH7r4Q4PT6rNRPPrtDbURnB4WYuqHvIFaOLpD+Zw=
X-Received: by 2002:a67:b607:0:b0:337:b5b7:adc9 with SMTP id
 d7-20020a67b607000000b00337b5b7adc9mr1283599vsm.17.1654137561435; Wed, 01 Jun
 2022 19:39:21 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Jun 2022 21:39:10 -0500
Message-ID: <CAH2r5mtUe2f0xi5zu0Np0bkyv7K9BKKgUkUJp2b25BteHBFjeg@mail.gmail.com>
Subject: [PATCH][CIFS] Do not build smb1ops.c if legacy support is disabled
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000c269b905e06de92b"
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

--000000000000c269b905e06de92b
Content-Type: text/plain; charset="UTF-8"

We should not be including unused SMB1/CIFS functions when legacy
support is disabled (CONFIG_CIFS_ALLOW_INSECURE_LEGACY turned
off), but especially obvious is not needing to build smb1ops.c
at all when legacy support is disabled. Over time we can move
more SMB1/CIFS and SMB2.0 legacy functions into ifdefs but this
is a good start (and shrinks the module size a few percent).

-- 
Thanks,

Steve

--000000000000c269b905e06de92b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-do-not-build-smb1ops-if-legacy-support-is-disab.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-do-not-build-smb1ops-if-legacy-support-is-disab.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l3weqxgp0>
X-Attachment-Id: f_l3weqxgp0

RnJvbSA0MWRiN2E5ZTI4ZjA5ZDU3YzE0NWRmODE0ZjBmYjZmMjAwYzhkMmE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgMSBKdW4gMjAyMiAyMToyNTo0MyAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIGNp
ZnM6IGRvIG5vdCBidWlsZCBzbWIxb3BzIGlmIGxlZ2FjeSBzdXBwb3J0IGlzIGRpc2FibGVkCgpX
ZSBzaG91bGQgbm90IGJlIGluY2x1ZGluZyB1bnVzZWQgU01CMS9DSUZTIGZ1bmN0aW9ucyB3aGVu
IGxlZ2FjeQpzdXBwb3J0IGlzIGRpc2FibGVkIChDT05GSUdfQ0lGU19BTExPV19JTlNFQ1VSRV9M
RUdBQ1kgdHVybmVkCm9mZiksIGJ1dCBlc3BlY2lhbGx5IG9idmlvdXMgaXMgbm90IG5lZWRpbmcg
dG8gYnVpbGQgc21iMW9wcy5jCmF0IGFsbCB3aGVuIGxlZ2FjeSBzdXBwb3J0IGlzIGRpc2FibGVk
LiBPdmVyIHRpbWUgd2UgY2FuIG1vdmUKbW9yZSBTTUIxL0NJRlMgYW5kIFNNQjIuMCBsZWdhY3kg
ZnVuY3Rpb25zIGludG8gaWZkZWZzIGJ1dCB0aGlzCmlzIGEgZ29vZCBzdGFydCAoYW5kIHNocmlu
a3MgdGhlIG1vZHVsZSBzaXplIGEgZmV3IHBlcmNlbnQpLgoKU2lnbmVkLW9mZi1ieTogU3RldmUg
RnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvTWFrZWZpbGUgfCA0
ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9mcy9jaWZzL01ha2VmaWxlIGIvZnMvY2lmcy9NYWtlZmlsZQppbmRleCBjYzhm
ZGNiMzViNzEuLjhjOWYyYzAwYmU3MiAxMDA2NDQKLS0tIGEvZnMvY2lmcy9NYWtlZmlsZQorKysg
Yi9mcy9jaWZzL01ha2VmaWxlCkBAIC04LDcgKzgsNyBAQCBvYmotJChDT05GSUdfQ0lGUykgKz0g
Y2lmcy5vCiBjaWZzLXkgOj0gdHJhY2UubyBjaWZzZnMubyBjaWZzc21iLm8gY2lmc19kZWJ1Zy5v
IGNvbm5lY3QubyBkaXIubyBmaWxlLm8gXAogCSAgaW5vZGUubyBsaW5rLm8gbWlzYy5vIG5ldG1p
c2MubyBzbWJlbmNyeXB0Lm8gdHJhbnNwb3J0Lm8gXAogCSAgY2lmc191bmljb2RlLm8gbnRlcnIu
byBjaWZzZW5jcnlwdC5vIFwKLQkgIHJlYWRkaXIubyBpb2N0bC5vIHNlc3MubyBleHBvcnQubyBz
bWIxb3BzLm8gdW5jLm8gd2ludWNhc2UubyBcCisJICByZWFkZGlyLm8gaW9jdGwubyBzZXNzLm8g
ZXhwb3J0Lm8gdW5jLm8gd2ludWNhc2UubyBcCiAJICBzbWIyb3BzLm8gc21iMm1hcGVycm9yLm8g
c21iMnRyYW5zcG9ydC5vIFwKIAkgIHNtYjJtaXNjLm8gc21iMnBkdS5vIHNtYjJpbm9kZS5vIHNt
YjJmaWxlLm8gY2lmc2FjbC5vIGZzX2NvbnRleHQubyBcCiAJICBkbnNfcmVzb2x2ZS5vIGNpZnNf
c3BuZWdvX25lZ3Rva2VuaW5pdC5hc24xLm8gYXNuMS5vCkBAIC0zMCwzICszMCw1IEBAIGNpZnMt
JChDT05GSUdfQ0lGU19GU0NBQ0hFKSArPSBmc2NhY2hlLm8KIGNpZnMtJChDT05GSUdfQ0lGU19T
TUJfRElSRUNUKSArPSBzbWJkaXJlY3QubwogCiBjaWZzLSQoQ09ORklHX0NJRlNfUk9PVCkgKz0g
Y2lmc3Jvb3QubworCitjaWZzLSQoQ09ORklHX0NJRlNfQUxMT1dfSU5TRUNVUkVfTEVHQUNZKSAr
PSBzbWIxb3BzLm8KLS0gCjIuMzQuMQoK
--000000000000c269b905e06de92b--

