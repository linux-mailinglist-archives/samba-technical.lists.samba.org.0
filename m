Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C40B1E9432
	for <lists+samba-technical@lfdr.de>; Sun, 31 May 2020 00:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Xv8kKKg/z6tYKPlyvVwWQTDcY+FWSdDFJ4coDTSzcv0=; b=cb+8aC3G4AWkuvsNxwWoRQdp7u
	o6yXz4X6aQJnre6mIPpdzHwcasrXkCcFl3DTpGQvU6aXXK32tPbmD7HM5q014FdGQULFDrqj34ezm
	zMRvqLtCfZf3asjt29Ny57BxNrFT7aupsXduiWIksL1wv4w6g2IyTbboXyA6BzaBSwBbMO6Hc7pV5
	ypP3rLXSPNS0GWZwbJyOOHP3fPGCq1Anec8GNRKjgYBf5kh87k4DzFHMzBflRYmt43Wv1Gu27XJef
	PEFKl49KWv6Axm7kaBid693Gge7sCf8B1waRCOvn+IQhWTDhoMkZvoNbTy6nuDZ/NFcMjW/AG8nVB
	fLwpajyA==;
Received: from localhost ([::1]:50870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jf9jn-006Ret-F4; Sat, 30 May 2020 22:13:55 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:37552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jf9ji-006Rem-Ge
 for samba-technical@lists.samba.org; Sat, 30 May 2020 22:13:52 +0000
Received: by mail-yb1-xb36.google.com with SMTP id m16so2788204ybf.4
 for <samba-technical@lists.samba.org>; Sat, 30 May 2020 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Xv8kKKg/z6tYKPlyvVwWQTDcY+FWSdDFJ4coDTSzcv0=;
 b=gMoW8EnTlwjDqxHwNw623mFHhPy3vZwdDJcf187l1jH47Zddp2KvSe00ZQRT+Lbaak
 xp5ePrWunc29uB+qJnLqEaZxnkGaWZW8dPgzhHTZJ4y8e0Xipwht/n1H1QDrgEF69HNl
 0HGVvBgIdxmoI2DFHiPLU/L4ARe5POg3wHxqR6wE8CppADsBJyv4/YJgIjhNQDupJXEq
 8YUvIw4mAwxqqxNfG6duN3KBTf65o1hVoUHnhVGNoRt0/GjkQeCQKt4X3IV1N3fRrHKN
 WCIKuqV8vfL4zSKjntEEeFPRHR5xVcBhCbseuZ8XGqyEfudLF9ViulJGqYW0rHxC/XoS
 GJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Xv8kKKg/z6tYKPlyvVwWQTDcY+FWSdDFJ4coDTSzcv0=;
 b=NIEKjMAfckphZOcduW9Ym74/gbtpd5bpYXshtLai1LBWvJ4tqicSxjk8qkZwwTrYjw
 hW214LGEtN8OMiW8xsusc5Z5DEgg7AkzT7YmIFoX1V3s0RiHI2lv2YfWxsPlgxH4KHmg
 +sMoSJ+6Mv+pC4uZyaXSZrfMYY1Y03gBzbacy+Cujt3lb7wP2FJeWHwKzi8m6rVAmxBC
 PBtw8o6f3P9pl9/OgVhRvpZukHeMJEhm9DOsepSgBQw1jGpqXomfdc7sJauBTha+KU6b
 GDT+c9z1A4iyQ+DwQ4HJJ/MRzVJxe19lCNzrTWeeIvVL9rh6mNATMQINnC4X7srW7R53
 Gdgw==
X-Gm-Message-State: AOAM531vwqv71NOXnnoRHWr7L1DzLQzP8lxqJalxbpwP5fJPa4/ci72Z
 FyUzAUrBWXMe6qi8H+5O0HcAwYh5FMMJqXcOuv0=
X-Google-Smtp-Source: ABdhPJxWkBFE7En1mDyCtp/NW13ukTw3z/JC07L55HgTHhJo3Vp4iBW1mn9kz3GtfAlcP9lofiHnJ2L5aghZg2+5XmI=
X-Received: by 2002:a25:6c6:: with SMTP id 189mr13036293ybg.375.1590876828739; 
 Sat, 30 May 2020 15:13:48 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 30 May 2020 17:13:37 -0500
Message-ID: <CAH2r5muo=fPArSDa_8AEk0dT-3zA17N9HL7wCb=jP77RHQQQQQ@mail.gmail.com>
Subject: [PATCH][smb3] minor update to compression header definitions
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000042446805a6e4e042"
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
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000042446805a6e4e042
Content-Type: text/plain; charset="UTF-8"

MS-SMB2 specification was updated in March.  Make minor additions
    and corrections to compression related definitions in smb2pdu.h

-- 
Thanks,

Steve

--00000000000042446805a6e4e042
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-minor-update-to-compression-header-definitions.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-minor-update-to-compression-header-definitions.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kau6z5wn0>
X-Attachment-Id: f_kau6z5wn0

RnJvbSBiNzk5ZjhmZDcyYmI0OTE5MjgwYmFiOTg4ZjllNWU5YzljYzdiMjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFNhdCwgMzAgTWF5IDIwMjAgMTc6MTA6MTYgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBtaW5vciB1cGRhdGUgdG8gY29tcHJlc3Npb24gaGVhZGVyIGRlZmluaXRpb25zCgpNUy1T
TUIyIHNwZWNpZmljYXRpb24gd2FzIHVwZGF0ZWQgaW4gTWFyY2guICBNYWtlIG1pbm9yIGFkZGl0
aW9ucwphbmQgY29ycmVjdGlvbnMgdG8gY29tcHJlc3Npb24gcmVsYXRlZCBkZWZpbml0aW9ucyBp
biBzbWIycGR1LmgKClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9z
b2Z0LmNvbT4KLS0tCiBmcy9jaWZzL3NtYjJwZHUuaCB8IDEzICsrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2ZzL2NpZnMvc21iMnBkdS5oIGIvZnMvY2lmcy9zbWIycGR1LmgKaW5kZXggMTBhY2Y5MGY4NThk
Li4zYjBlNmFjZjlkN2QgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5oCisrKyBiL2ZzL2Np
ZnMvc21iMnBkdS5oCkBAIC0xNDMsOCArMTQzLDE3IEBAIHN0cnVjdCBzbWIyX3RyYW5zZm9ybV9o
ZHIgewogCV9fdTY0ICBTZXNzaW9uSWQ7CiB9IF9fcGFja2VkOwogCisvKiBTZWUgTVMtU01CMiAy
LjIuNDIgKi8KK3N0cnVjdCBzbWIyX2NvbXByZXNzaW9uX3RyYW5zZm9ybV9oZHIgeworCV9fbGUz
MiBQcm90b2NvbElkOwkvKiAweEZDICdTJyAnTScgJ0InICovCisJX19sZTMyIE9yaWdpbmFsQ29t
cHJlc3NlZFNlZ21lbnRTaXplOworCV9fbGUxNiBDb21wcmVzc2lvbkFsZ29yaXRobTsKKwlfX2xl
MTYgRmxhZ3M7CisJX19sZTE2IExlbmd0aDsgLyogaWYgY2hhaW5lZCBpdCBpcyBsZW5ndGgsIGVs
c2Ugb2Zmc2V0ICovCit9IF9fcGFja2VkOworCiAvKiBTZWUgTVMtU01CMiAyLjIuNDIuMSAqLwot
c3RydWN0IGNvbXByZXNzaW9uX3BsYXlsb2FkX2hlYWRlciB7CitzdHJ1Y3QgY29tcHJlc3Npb25f
cGF5bG9hZF9oZWFkZXIgewogCV9fbGUxNglBbGdvcml0aG1JZDsKIAlfX2xlMTYJUmVzZXJ2ZWQ7
CiAJX19sZTMyCUxlbmd0aDsKQEAgLTMzMyw3ICszNDIsNyBAQCBzdHJ1Y3Qgc21iMl9lbmNyeXB0
aW9uX25lZ19jb250ZXh0IHsKICNkZWZpbmUgU01CM19DT01QUkVTU19MWjc3CWNwdV90b19sZTE2
KDB4MDAwMikKICNkZWZpbmUgU01CM19DT01QUkVTU19MWjc3X0hVRkYJY3B1X3RvX2xlMTYoMHgw
MDAzKQogLyogUGF0dGVybiBzY2FubmluZyBhbGdvcml0aG0gU2VlIE1TLVNNQjIgMy4xLjQuNC4x
ICovCi0jZGVmaW5lIFNNQjNfQ09NUFJFU1NfUEFUVEVSTgljcHVfdG9fbGUxNigweDAwMDQpCisj
ZGVmaW5lIFNNQjNfQ09NUFJFU1NfUEFUVEVSTgljcHVfdG9fbGUxNigweDAwMDQpIC8qIFBhdHRl
cm5fVjEgKi8KIAogLyogQ29tcHJlc3Npb24gRmxhZ3MgKi8KICNkZWZpbmUgU01CMl9DT01QUkVT
U0lPTl9DQVBBQklMSVRJRVNfRkxBR19OT05FCQljcHVfdG9fbGUzMigweDAwMDAwMDAwKQotLSAK
Mi4yNS4xCgo=
--00000000000042446805a6e4e042--

