Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B313A0675
	for <lists+samba-technical@lfdr.de>; Tue,  8 Jun 2021 23:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BSS4C+Tof4hX7XOl0u8vZzIzOJkeQij5kHDcnOxRbtQ=; b=0Rct/pFi8M3awKObmzYpIp0RnC
	JIkGgg3c6SVHaQrXBP7vmZLzUi80SLXIheS/NrGEC+nj3cz+TEKqncXjZxDNeIGxrNIpdrsfcD+mo
	LEe7X/mUASSO8SjPOZbijUC4hAxv5910Pb3l0uLMg8BA+DadCgbh3/DBf8fmBy291OCLOydhnAQ52
	6Q1+VgvMvJ9GJjG8x8GhSQuIlUePntnM3tYwI3a7MPaxMpqeIosSyV/o9AYG+4NYtYg6NsYG99psB
	dIDgdpgQgjHiML5aztd3aud/F2GcumsCTrV9Se9YD4I1YDde8AXK/5QH4CpnUfnUDPigS+0yZGcGz
	W1DdPgeA==;
Received: from ip6-localhost ([::1]:30972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lqjbb-004d16-Gs; Tue, 08 Jun 2021 21:49:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:41708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lqjbX-004d0x-1l
 for samba-technical@lists.samba.org; Tue, 08 Jun 2021 21:49:49 +0000
Received: by mail-lf1-x129.google.com with SMTP id j20so5165611lfe.8
 for <samba-technical@lists.samba.org>; Tue, 08 Jun 2021 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BSS4C+Tof4hX7XOl0u8vZzIzOJkeQij5kHDcnOxRbtQ=;
 b=u9hj/yoXRsvtCUvpFePU7s2TiK+2tivLMfkX5m6iJFRZrIZzt8312bf7U0Qa4ahyuU
 MzeHFa/IuBbB2yBDJOaIowEMKVDd/SWB8SX0dig0uQdWFmzTg7IE3TMA6I0mJGxe/5Rc
 Y/dE85naosBmQxURJ8jbtHUAc2k3OrrKeT/4PRYsM41zALOb2A2B+MgIGaf3Ep3Qv03B
 q9FXCk5mLAPHgTv5Uut67j/EG3ERdXf1SJRHCP3J4RrHSKC5L94ys0ZMylzSe7tlJdpo
 K9dB51dj13JUev4f5ONQoHYd5wNtKQ7uE+E/+QcxrJjSefXcP3mjP7WFX2nuFziYS8/I
 up/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BSS4C+Tof4hX7XOl0u8vZzIzOJkeQij5kHDcnOxRbtQ=;
 b=IqIBM3v/45bFAcu1zSWZpGl7kW0uZfmuLLSB1uIsHmMVDSarJPLJY6vFgYHSaoQu2a
 EKJjto35vUzRXBQ7nyEMTH2Kcjr2so6zkCcRO9nEAY+O1QHIYpvozB/aTGARjTKy9S6h
 i8dMKJOkPDn2NiOgo9w6BDugGwfkVI0m+vK13ANnPnp7tOnrIE/MGgl1hLSZnSNgQynA
 J9xo45Qbl4zp5VeR70oGtcldyfxt1mXDYIDB7pOVkL5B3W2KatBx9TYp6aZdm/QqyPZ9
 +GDBhVEOxDzX3GdpPh+fnEUkwNAKn2dfhWHHUF0fURCyXnfD79bfxcOxh8yVy5FxolLo
 ToRQ==
X-Gm-Message-State: AOAM531jXY5gs+gV8SwdA44w7gTZvAKtCrxudPOiJUNilrJrH83rjnBi
 f4eW/627gVrQhT5Z0vk4GY8WOYjKFroGnAw9F+0=
X-Google-Smtp-Source: ABdhPJz0r+myW7wXzehh/u9I4qp8s9yNYWkKTuV6fXEQni7Q4eJ9LWDU3QSCbb3mlJBWaylwYcUS/XauJ4A1j+eritw=
X-Received: by 2002:a05:6512:3694:: with SMTP id
 d20mr8645060lfs.184.1623188985306; 
 Tue, 08 Jun 2021 14:49:45 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 8 Jun 2021 16:49:34 -0500
Message-ID: <CAH2r5mtXtY9K5=DA8dfgNm2rbvLB7GJUUvC7_0q8R1uGLtxV0Q@mail.gmail.com>
Subject: [CIFS][PATCH] Enable extended stats by default
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000df7b6a05c4482259"
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER
 <linux-cifsd-devel@lists.sourceforge.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000df7b6a05c4482259
Content-Type: text/plain; charset="UTF-8"

Patch to enable CONFIG_CIFS_STATS2 by default



-- 
Thanks,

Steve

--000000000000df7b6a05c4482259
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-enable-extended-stats-by-default.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-enable-extended-stats-by-default.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kpoksrh60>
X-Attachment-Id: f_kpoksrh60

RnJvbSA3YTZiNmQ1YTVmZmU5YmFlNzViZjEzMGUyZDgyYTM0YzM5ZGJlZTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgOCBKdW4gMjAyMSAxNjo0Mzo0MSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIGNp
ZnM6IGVuYWJsZSBleHRlbmRlZCBzdGF0cyBieSBkZWZhdWx0CgpDT05GSUdfQ0lGU19TVEFUUzIg
Y2FuIGJlIHZlcnkgdXNlZnVsIHNpbmNlIGl0IHNob3dzCmxhdGVuY2llcyBieSBjb21tYW5kLCBh
bmQgYWxsb3dzIGVuYWJsaW5nIHRoZSBzbG93IHJlc3BvbnNlCmR5bmFtaWMgdHJhY2Vwb2ludCB3
aGljaCBjYW4gYmUgdXNlZnVsIHRvIGlkZW50aWZ5CnBlcmZvcm1hbmNlIHByb2JsZW1zLgoKRm9y
IGV4YW1wbGU6CgpUb3RhbCB0aW1lIHNwZW50IHByb2Nlc3NpbmcgYnkgY29tbWFuZC4gVGltZSB1
bml0cyBhcmUgamlmZmllcyAoMTAwMCBwZXIgc2Vjb25kKQogIFNNQjMgQ01ECU51bWJlcglUb3Rh
bCBUaW1lCUZhc3Rlc3QJU2xvd2VzdAogIC0tLS0tLS0tCS0tLS0tLQktLS0tLS0tLS0tCS0tLS0t
LS0JLS0tLS0tLQogIDAJCTEJMgkJMgkyCiAgMQkJMgk2CQkyCTQKICAyCQkwCTAJCTAJMAogIDMJ
CTQJMTEJCTIJNAogIDQJCTIJMTYJCTUJMTEKICA1CQk0NTQ2CTM0MTA0CQkyCTQ4NwogIDYJCTQ0
MjEJMzI5MDEJCTIJNDg3CiAgNwkJMAkwCQkwCTAKICA4CQk2OTUJMjc4MQkJMgkzOQogIDkJCTM5
MQkxNzA4CQkyCTI3CiAgMTAJCTAJMAkJMAkwCiAgMTEJCTQJNgkJMQkyCiAgMTIJCTAJMAkJMAkw
CiAgMTMJCTAJMAkJMAkwCiAgMTQJCTM4ODcJMTc2OTYJCTAJMTI4CiAgMTUJCTAJMAkJMAkwCiAg
MTYJCTE0NzEJOTk1MAkJMQk0ODcKICAxNwkJMTY5CTI2OTUJCTkJMTE2CiAgMTgJCTgwCTM4MQkJ
MgkxMAogIDEJCTIJNgkJMgk0CiAgMgkJMAkwCQkwCTAKICAzCQk0CTExCQkyCTQKICA0CQkyCTE2
CQk1CTExCiAgNQkJNDU0NgkzNDEwNAkJMgk0ODcKICA2CQk0NDIxCTMyOTAxCQkyCTQ4NwogIDcJ
CTAJMAkJMAkwCiAgOAkJNjk1CTI3ODEJCTIJMzkKICA5CQkzOTEJMTcwOAkJMgkyNwogIDEwCQkw
CTAJCTAJMAogIDExCQk0CTYJCTEJMgogIDEyCQkwCTAJCTAJMAogIDEzCQkwCTAJCTAJMAogIDE0
CQkzODg3CTE3Njk2CQkwCTEyOAogIDE1CQkwCTAJCTAJMAogIDE2CQkxNDcxCTk5NTAJCTEJNDg3
CiAgMTcJCTE2OQkyNjk1CQk5CTExNgogIDE4CQk4MAkzODEJCTIJMTAKClNpZ25lZC1vZmYtYnk6
IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL0tjb25m
aWcgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9LY29uZmlnIGIvZnMvY2lmcy9LY29uZmlnCmluZGV4
IDdkZTVjODkzYzE4MS4uNzM2NDk1MGE5ZWY0IDEwMDY0NAotLS0gYS9mcy9jaWZzL0tjb25maWcK
KysrIGIvZnMvY2lmcy9LY29uZmlnCkBAIC01OSw2ICs1OSw3IEBAIGNvbmZpZyBDSUZTCiBjb25m
aWcgQ0lGU19TVEFUUzIKIAlib29sICJFeHRlbmRlZCBzdGF0aXN0aWNzIgogCWRlcGVuZHMgb24g
Q0lGUworCWRlZmF1bHQgeQogCWhlbHAKIAkgIEVuYWJsaW5nIHRoaXMgb3B0aW9uIHdpbGwgYWxs
b3cgbW9yZSBkZXRhaWxlZCBzdGF0aXN0aWNzIG9uIFNNQgogCSAgcmVxdWVzdCB0aW1pbmcgdG8g
YmUgZGlzcGxheWVkIGluIC9wcm9jL2ZzL2NpZnMvRGVidWdEYXRhIGFuZCBhbHNvCkBAIC02Nyw4
ICs2OCw3IEBAIGNvbmZpZyBDSUZTX1NUQVRTMgogCSAgZm9yIG1vcmUgZGV0YWlscy4gVGhlc2Ug
YWRkaXRpb25hbCBzdGF0aXN0aWNzIG1heSBoYXZlIGEgbWlub3IgZWZmZWN0CiAJICBvbiBwZXJm
b3JtYW5jZSBhbmQgbWVtb3J5IHV0aWxpemF0aW9uLgogCi0JICBVbmxlc3MgeW91IGFyZSBhIGRl
dmVsb3BlciBvciBhcmUgZG9pbmcgbmV0d29yayBwZXJmb3JtYW5jZSBhbmFseXNpcwotCSAgb3Ig
dHVuaW5nLCBzYXkgTi4KKwkgIElmIHVuc3VyZSwgc2F5IFkuCiAKIGNvbmZpZyBDSUZTX0FMTE9X
X0lOU0VDVVJFX0xFR0FDWQogCWJvb2wgIlN1cHBvcnQgbGVnYWN5IHNlcnZlcnMgd2hpY2ggdXNl
IGxlc3Mgc2VjdXJlIGRpYWxlY3RzIgotLSAKMi4zMC4yCgo=
--000000000000df7b6a05c4482259--

