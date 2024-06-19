Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1AE90F755
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2024 22:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ObTKtlaoAucWuUDiB7Ljvkt+4uv8qsHp5amrOpfAu8w=; b=AteKeqZrR4TH3FGPGJwJFHyswq
	umq55LndJ8UoClGNmKuDOyBwfxv5wNUb7u3hlBi+R8XDs68Lnn9zEAqt2rsZfJ7Fb7UZbzsdTh5Ja
	cf+EX7wvhs2gg4amVyHHSGHos0Ki0Qs6YkPkYNAn1X7iwWkst07a9aBuB7zPIYAOCnuV6pZeQyTkE
	+6K8I4dT03TOxJuLHYE1nwCUFlnkaKaeJX9Ex9T11AEEkOrJ6GY0xY1vGy1rGY04ZzTvSV80Ci4xw
	o3OPwh16qvo2z/R3bCG31WdeauErvIYLSRj3swaemD1P7OdZN2sqltxgsaB10rZWANGnlJ7E3UnaG
	PfNIYucA==;
Received: from ip6-localhost ([::1]:52266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sK1Vp-00EWvK-IX; Wed, 19 Jun 2024 20:02:33 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:43332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sK1Vl-00EWvD-HN
 for samba-technical@lists.samba.org; Wed, 19 Jun 2024 20:02:31 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec1e5505abso10145351fa.1
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2024 13:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718827348; x=1719432148; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ObTKtlaoAucWuUDiB7Ljvkt+4uv8qsHp5amrOpfAu8w=;
 b=Tk6H8r48ZU8ND1fO40GYM575ZwzTSmJo+Zl6mdBjUjlRV7A5mPxC4xStAbAg9H9ozY
 WIMRmInKllRKC19KzTrRy3QH9VaU0syPffcuPbkAMkPENVwEgik6GeNAr8OdsZO6/i7S
 iJ7/nmBkjcqqtGdSCwOlvu6LG2qIo4YMU02QerhWx4hTw/M9mmwYJ61vOX+ExlfIAl/d
 bObiYw7i4cXC2VPpTD4oetOAXxusUpvbby1sQ7Jc2K2Ez6F9Ec3tapZg8dPumgZ5fm/n
 js3jTXhGh9+oMHlJ8MoqETcaMJ3yrtdMhb/RYMS9CoRFVrXOWsv660UnLrgzxsrugRtx
 BvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718827348; x=1719432148;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ObTKtlaoAucWuUDiB7Ljvkt+4uv8qsHp5amrOpfAu8w=;
 b=QPcsaWtqRC0fNKzXii41JgHLVJ2Rmp2BfVjISVx9dPZb22anZSn/ya7TOOwfR78fhy
 kc3vjYS2gWwWpHtR0yeYDnpFlSpCKXTgF0pLK0gDwIe4nDrK5sNkrX0X08lklgD+QGHr
 uMZ1zhNsg2TbSO7s+1B3xoyJ3hLo513m0+fEQ8qG5AyeEzdW/U9rD8jX1jIN9coGw/tk
 vwmZhM5bufIgontQQ0WhdfYLejH2zH5rWGao2vT5c0tzpjvOrQBZkh/Z7i0TzMNLJ9bA
 2xk1QTpIDQeIHRc8m9ZbGit8v/YlV+IfzJdhPQkXqZtMy433OMrHSn5Aw5eAwIKC4+yS
 twbQ==
X-Gm-Message-State: AOJu0Yy1wyY5iJtFUu5MjM535x13BJcWTCRSyE7t+tNq9mmMYGrNJo71
 T8UD9KfZWDHMlIJbT8dh0evmlnYc6tk5vBRsaH2nFQpZDNlTvUvsq6AGRg+dr1yBDloQo38ur0b
 4VOEMuhuE1sJGV+LyN4e17KrAQJE=
X-Google-Smtp-Source: AGHT+IE3mjtYTiVPHQBo+4xKQHM3j4/HpnZWXTf5BjtCKQn6ZLjhWTnqEr5ETpMRt9hufBzq2NdH2G4Do2x56MqNkKg=
X-Received: by 2002:a2e:9d90:0:b0:2ec:3747:fcc4 with SMTP id
 38308e7fff4ca-2ec374800b1mr16975501fa.5.1718827347633; Wed, 19 Jun 2024
 13:02:27 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 19 Jun 2024 15:02:16 -0500
Message-ID: <CAH2r5mviMs7VW5ofa0hZiVkx6RdH-LcnpYYDhyGOxnXxtB=t=A@mail.gmail.com>
Subject: [PATCH][SMB client] fix typo in description of enable_gcm_256 module
 load parameter
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000007c8454061b43ad2a"
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

--0000000000007c8454061b43ad2a
Content-Type: text/plain; charset="UTF-8"

enable_gcm_256 (which allows the server to require the strongest
encryption) is enabled by default (in the 5.13 kernel and later), but
the modinfo description
incorrectly showed it disabled by default. Fix the typo.

Cc: stable@vger.kernel.org
Fixes: fee742b50289 ("smb3.1.1: enable negotiating stronger encryption
by default")
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/cifsfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index bb86fc0641d8..6397fdefd876 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -134,7 +134,7 @@ module_param(enable_oplocks, bool, 0644);
 MODULE_PARM_DESC(enable_oplocks, "Enable or disable oplocks. Default: y/Y/1");

 module_param(enable_gcm_256, bool, 0644);
-MODULE_PARM_DESC(enable_gcm_256, "Enable requesting strongest (256
bit) GCM encryption. Default: n/N/0");
+MODULE_PARM_DESC(enable_gcm_256, "Enable requesting strongest (256
bit) GCM encryption. Default: y/Y/0");

 module_param(require_gcm_256, bool, 0644);
 MODULE_PARM_DESC(require_gcm_256, "Require strongest (256 bit) GCM
encryption. Default: n/N/0");

-- 
Thanks,

Steve

--0000000000007c8454061b43ad2a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-fix-typos-in-module-parameter-enable_gcm_256.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-fix-typos-in-module-parameter-enable_gcm_256.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lxm97mp70>
X-Attachment-Id: f_lxm97mp70

RnJvbSBjMzc2NDBjNjk1NzRiNDI0ZTY4N2M0ZTNmYWMxNWM4YzJhOTM0M2Q1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgMTkgSnVuIDIwMjQgMTQ6NDY6NDggLTA1MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBmaXggdHlwb3MgaW4gbW9kdWxlIHBhcmFtZXRlciBlbmFibGVfZ2NtXzI1NgoKZW5hYmxl
X2djbV8yNTYgKHdoaWNoIGFsbG93cyB0aGUgc2VydmVyIHRvIHJlcXVpcmUgdGhlIHN0cm9uZ2Vz
dAplbmNyeXB0aW9uKSBpcyBlbmFibGVkIGJ5IGRlZmF1bHQsIGJ1dCB0aGUgbW9kaW5mbyBkZXNj
cmlwdGlvbgppbmNvcnJlY3RseSBzaG93ZWQgaXQgZGlzYWJsZWQgYnkgZGVmYXVsdC4gRml4IHRo
ZSB0eXBvLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IGZlZTc0MmI1MDI4OSAo
InNtYjMuMS4xOiBlbmFibGUgbmVnb3RpYXRpbmcgc3Ryb25nZXIgZW5jcnlwdGlvbiBieSBkZWZh
dWx0IikKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29t
PgotLS0KIGZzL3NtYi9jbGllbnQvY2lmc2ZzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2Np
ZnNmcy5jIGIvZnMvc21iL2NsaWVudC9jaWZzZnMuYwppbmRleCBiYjg2ZmMwNjQxZDguLjYzOTdm
ZGVmZDg3NiAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jaWZzZnMuYworKysgYi9mcy9zbWIv
Y2xpZW50L2NpZnNmcy5jCkBAIC0xMzQsNyArMTM0LDcgQEAgbW9kdWxlX3BhcmFtKGVuYWJsZV9v
cGxvY2tzLCBib29sLCAwNjQ0KTsKIE1PRFVMRV9QQVJNX0RFU0MoZW5hYmxlX29wbG9ja3MsICJF
bmFibGUgb3IgZGlzYWJsZSBvcGxvY2tzLiBEZWZhdWx0OiB5L1kvMSIpOwogCiBtb2R1bGVfcGFy
YW0oZW5hYmxlX2djbV8yNTYsIGJvb2wsIDA2NDQpOwotTU9EVUxFX1BBUk1fREVTQyhlbmFibGVf
Z2NtXzI1NiwgIkVuYWJsZSByZXF1ZXN0aW5nIHN0cm9uZ2VzdCAoMjU2IGJpdCkgR0NNIGVuY3J5
cHRpb24uIERlZmF1bHQ6IG4vTi8wIik7CitNT0RVTEVfUEFSTV9ERVNDKGVuYWJsZV9nY21fMjU2
LCAiRW5hYmxlIHJlcXVlc3Rpbmcgc3Ryb25nZXN0ICgyNTYgYml0KSBHQ00gZW5jcnlwdGlvbi4g
RGVmYXVsdDogeS9ZLzAiKTsKIAogbW9kdWxlX3BhcmFtKHJlcXVpcmVfZ2NtXzI1NiwgYm9vbCwg
MDY0NCk7CiBNT0RVTEVfUEFSTV9ERVNDKHJlcXVpcmVfZ2NtXzI1NiwgIlJlcXVpcmUgc3Ryb25n
ZXN0ICgyNTYgYml0KSBHQ00gZW5jcnlwdGlvbi4gRGVmYXVsdDogbi9OLzAiKTsKLS0gCjIuNDMu
MAoK
--0000000000007c8454061b43ad2a--

