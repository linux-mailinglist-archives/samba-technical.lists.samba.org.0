Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5E187A1C
	for <lists+samba-technical@lfdr.de>; Tue, 17 Mar 2020 08:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=YyP5/uYDqMbCadMIux2UsmVfY9d250YvoW2fEJzqdFM=; b=JhQKUq7f+lGu5nOZ/t36nzBy83
	JaCIz1jzAda0ZnFpbfFf7TC4nub02UQaY3dRxE4mXNhVeX2FgkzLsWgfs4NumG+IsndnabWH0RNBQ
	vjT0Ul1M0FKN6bxjxE6MNdlO0ZR2/hpSOXLCd0iA3e7VONpWWHECXFrCxclAu9rUmh9Ck+rAjpN54
	cC/Ekc+uaKrz903JkunkjXD510hwtprRLIMT7YbDdVVoHfqVy4YnM2IYPylhe9ImkjmeikSvVZKwO
	Vk8v9caEx3qrIxA/4EqpY7fgnLzaykeDP3CXMYn9uwNlIg3f1JKZ/I9YQBPjzwuJmSbuO62DEQvEf
	XRdepTkg==;
Received: from localhost ([::1]:63744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jE6DI-000EH8-Ud; Tue, 17 Mar 2020 07:00:33 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36017) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jE6Cv-000EH1-Pb
 for samba-technical@lists.samba.org; Tue, 17 Mar 2020 07:00:14 +0000
Received: by mail-qk1-x736.google.com with SMTP id u25so30800241qkk.3
 for <samba-technical@lists.samba.org>; Tue, 17 Mar 2020 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YyP5/uYDqMbCadMIux2UsmVfY9d250YvoW2fEJzqdFM=;
 b=olE5qSaXa2r5wam1wT7beEWZlu0g4GoB25ymqdg63uHMu+oSacmuXCO6ggcH5BWwVv
 4qIxkNG1E4SXYjVGOEYccDZqrhmjXJ7UucC7kU0oM50m5Y0SGdvEOohY6K3oy8LHQhlN
 S76hB0Xr1XZFA+NR8jxyZS8H21540wbL1zGk0TvLv9HAuP0591GJUNV2W0YWDJZ1OGho
 gnLRPKGgIcu+6vzpnNb6ZqfdSDa1QyYOXod7d7zVgvzTF/9przmpUJTmMWFf8UXQi2KQ
 7DNtsDhaQD/MJ/3ODRimTt1mWCfoa+BVlae/x5sGhdB/tYSrz3YA7X3wtoZoLvDn+QJj
 qgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YyP5/uYDqMbCadMIux2UsmVfY9d250YvoW2fEJzqdFM=;
 b=i1IP34RNyN6qVOS6c0i+jVvEJSW+VYDC3Yvv2C5XzeeIaZ8bGsG88hwNvIZbiCYNqR
 K+ukae3sBQSOxd4t+0R9e1Nf1gskRURcSdO/Nlkw2EQIREQjY+bG76e7twZvPbCAxQVd
 eQOXh0cr6qpKCtzpb8ujEhFlX4PeJ7Ss2JUFo7Awbu9AqvXFBU2M1oiFw9FoRwZrN6Ef
 l0FZM/Cb3AoJgOP6fG89qJ88wh3VbF+VJNBHFHS0MHRe3OY+PAJ+gis6bqKNU+hHPVwP
 VGcgQQtYOMASzVAd3c6u99iZOdTx0xTdEQw2K978jXZrLvnBe+W3FF6CIZZm9gDgHyEu
 SVnw==
X-Gm-Message-State: ANhLgQ0FcQo5uxmKqrezClaVqQbte1wSs0HFQ7qkbxNsvDP9p+SUkSnu
 USEjEuIYcMUREu/0HPS0Mu7SZ+DAme53eP1lSYw=
X-Google-Smtp-Source: ADFU+vs+t7cmamUAkGeCPZWQe15f2ARDCtA+sEcR09v1mN9nu4YPLisboW8MtmXo1p91yD88U0YX5V1/ZhA65GJMf2M=
X-Received: by 2002:a05:6902:685:: with SMTP id
 i5mr5840971ybt.376.1584428404767; 
 Tue, 17 Mar 2020 00:00:04 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 17 Mar 2020 01:59:53 -0500
Message-ID: <CAH2r5mtLBZJA+xcyOF9MsPL5ikM+omELUq4Uj6BadueVgHoRMg@mail.gmail.com>
Subject: [PATCH][SMB3] Add two missing flags and minor cleanup to smb2pdu.h
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000003d1b4605a1077cbb"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000003d1b4605a1077cbb
Content-Type: text/plain; charset="UTF-8"

Minor cleanup and add one missing define (COMPRESSION_TRANSFORM_ID)
and flag (TRANSFORM_FLAG_ENCRYPTED)


-- 
Thanks,

Steve

--0000000000003d1b4605a1077cbb
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-Minor-cleanup-of-protocol-definitions.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-Minor-cleanup-of-protocol-definitions.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k7vjr53l0>
X-Attachment-Id: f_k7vjr53l0

RnJvbSA5MmIxY2RlOWY2MzZhZWQ4MjBhNmE3NTkzMTZiYTA5Njk0YTE0MTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMTcgTWFyIDIwMjAgMDE6NTM6MzkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzOiBNaW5vciBjbGVhbnVwIG9mIHByb3RvY29sIGRlZmluaXRpb25zCgpBbmQgYWRkIG9uZSBt
aXNzaW5nIGRlZmluZSAoQ09NUFJFU1NJT05fVFJBTlNGT1JNX0lEKSBhbmQKZmxhZyAoVFJBTlNG
T1JNX0ZMQUdfRU5DUllQVEVEKQoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5j
aEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5oIHwgMTUgKysrKysrKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJwZHUuaCBiL2ZzL2NpZnMvc21iMnBkdS5oCmluZGV4IDhi
OWY1NDZkZDg0Mi4uZGRhOTI4ZDA1YzEzIDEwMDY0NAotLS0gYS9mcy9jaWZzL3NtYjJwZHUuaAor
KysgYi9mcy9jaWZzL3NtYjJwZHUuaApAQCAtOTEsNiArOTEsNyBAQAogCiAjZGVmaW5lIFNNQjJf
UFJPVE9fTlVNQkVSIGNwdV90b19sZTMyKDB4NDI0ZDUzZmUpCiAjZGVmaW5lIFNNQjJfVFJBTlNG
T1JNX1BST1RPX05VTSBjcHVfdG9fbGUzMigweDQyNGQ1M2ZkKQorI2RlZmluZSBTTUIyX0NPTVBS
RVNTSU9OX1RSQU5TRk9STV9JRCBjcHVfdG9fbGUzMigweDQyNGQ1M2ZjKQogCiAvKgogICogU01C
MiBIZWFkZXIgRGVmaW5pdGlvbgpAQCAtMTI3LDEzICsxMjgsMTUgQEAgc3RydWN0IHNtYjJfc3lu
Y19wZHUgewogI2RlZmluZSBTTUIzX0FFUzEyOENDTV9OT05DRSAxMQogI2RlZmluZSBTTUIzX0FF
UzEyOEdDTV9OT05DRSAxMgogCisvKiBUcmFuc2Zvcm0gZmxhZ3MgKGZvciAzLjAgZGlhbGVjdCB0
aGlzIGZsYWcgaW5kaWNhdGVzIENDTSAqLworI2RlZmluZSBUUkFOU0ZPUk1fRkxBR19FTkNSWVBU
RUQJMHgwMDAxCiBzdHJ1Y3Qgc21iMl90cmFuc2Zvcm1faGRyIHsKIAlfX2xlMzIgUHJvdG9jb2xJ
ZDsJLyogMHhGRCAnUycgJ00nICdCJyAqLwogCV9fdTggICBTaWduYXR1cmVbMTZdOwogCV9fdTgg
ICBOb25jZVsxNl07CiAJX19sZTMyIE9yaWdpbmFsTWVzc2FnZVNpemU7CiAJX191MTYgIFJlc2Vy
dmVkMTsKLQlfX2xlMTYgRmxhZ3M7IC8qIEVuY3J5cHRpb25BbGdvcml0aG0gKi8KKwlfX2xlMTYg
RmxhZ3M7IC8qIEVuY3J5cHRpb25BbGdvcml0aG0gZm9yIDMuMCwgZW5jIGVuYWJsZWQgZm9yIDMu
MS4xICovCiAJX191NjQgIFNlc3Npb25JZDsKIH0gX19wYWNrZWQ7CiAKQEAgLTIwNyw2ICsyMTAs
MTAgQEAgc3RydWN0IHNtYjJfZXJyb3JfY29udGV4dF9yc3AgewogCV9fdTggIEVycm9yQ29udGV4
dERhdGE7IC8qIEVycm9yRGF0YUxlbmd0aCBsb25nIGFycmF5ICovCiB9IF9fcGFja2VkOwogCisv
KiBFcnJvcklkIHZhbHVlcyAqLworI2RlZmluZSBTTUIyX0VSUk9SX0lEX0RFRkFVTFQJCTB4MDAw
MDAwMDAKKyNkZWZpbmUgU01CMl9FUlJPUl9JRF9TSEFSRV9SRURJUkVDVAljcHVfdG9fbGUzMigw
eDcyNjQ1MjUzKQkvKiAicmRSUyIgKi8KKwogLyogRGVmaW5lcyBmb3IgVHlwZSBmaWVsZCBiZWxv
dyAoc2VlIE1TLVNNQjIgMi4yLjIuMi4yLjEpICovCiAjZGVmaW5lIE1PVkVfRFNUX0lQQUREUl9W
NAljcHVfdG9fbGUzMigweDAwMDAwMDAxKQogI2RlZmluZSBNT1ZFX0RTVF9JUEFERFJfVjYJY3B1
X3RvX2xlMzIoMHgwMDAwMDAwMikKQEAgLTQyNyw3ICs0MzQsNyBAQCBzdHJ1Y3Qgc21iMl9sb2dv
ZmZfcnNwIHsKIHN0cnVjdCBzbWIyX3RyZWVfY29ubmVjdF9yZXEgewogCXN0cnVjdCBzbWIyX3N5
bmNfaGRyIHN5bmNfaGRyOwogCV9fbGUxNiBTdHJ1Y3R1cmVTaXplOwkvKiBNdXN0IGJlIDkgKi8K
LQlfX2xlMTYgUmVzZXJ2ZWQ7IC8qIEZsYWdzIGluIFNNQjMuMS4xICovCisJX19sZTE2IEZsYWdz
OyAvKiBSZXNlcnZlZCBNQlogZm9yIGRpYWxlY3RzIHByaW9yIHRvIFNNQjMuMS4xICovCiAJX19s
ZTE2IFBhdGhPZmZzZXQ7CiAJX19sZTE2IFBhdGhMZW5ndGg7CiAJX191OCAgIEJ1ZmZlclsxXTsJ
LyogdmFyaWFibGUgbGVuZ3RoICovCkBAIC02NTQsNyArNjYxLDcgQEAgc3RydWN0IHNtYjJfdHJl
ZV9kaXNjb25uZWN0X3JzcCB7CiAJCQl8IEZJTEVfV1JJVEVfRUFfTEUgfCBGSUxFX1dSSVRFX0FU
VFJJQlVURVNfTEUpCiAjZGVmaW5lIEZJTEVfRVhFQ19SSUdIVFNfTEUgKEZJTEVfRVhFQ1VURV9M
RSkKIAotLyogSW1wZXJzb25hdGlvbiBMZXZlbHMgKi8KKy8qIEltcGVyc29uYXRpb24gTGV2ZWxz
LiBTZWUgTVMtV1BPIHNlY3Rpb24gOS43IGFuZCBNU0ROLUlNUEVSUyAqLwogI2RlZmluZSBJTF9B
Tk9OWU1PVVMJCWNwdV90b19sZTMyKDB4MDAwMDAwMDApCiAjZGVmaW5lIElMX0lERU5USUZJQ0FU
SU9OCWNwdV90b19sZTMyKDB4MDAwMDAwMDEpCiAjZGVmaW5lIElMX0lNUEVSU09OQVRJT04JY3B1
X3RvX2xlMzIoMHgwMDAwMDAwMikKQEAgLTc2MCw3ICs3NjcsNyBAQCBzdHJ1Y3QgY3JlYXRlX2Nv
bnRleHQgewogI2RlZmluZSBTTUIyX0xFQVNFX0hBTkRMRV9DQUNISU5HCWNwdV90b19sZTMyKDB4
MDIpCiAjZGVmaW5lIFNNQjJfTEVBU0VfV1JJVEVfQ0FDSElORwljcHVfdG9fbGUzMigweDA0KQog
Ci0jZGVmaW5lIFNNQjJfTEVBU0VfRkxBR19CUkVBS19JTl9QUk9HUkVTUyBjcHVfdG9fbGUzMigw
eDAyKQorI2RlZmluZSBTTUIyX0xFQVNFX0ZMQUdfQlJFQUtfSU5fUFJPR1JFU1MgY3B1X3RvX2xl
MzIoMHgwMDAwMDAwMikKICNkZWZpbmUgU01CMl9MRUFTRV9GTEFHX1BBUkVOVF9MRUFTRV9LRVlf
U0VUIGNwdV90b19sZTMyKDB4MDAwMDAwMDQpCiAKICNkZWZpbmUgU01CMl9MRUFTRV9LRVlfU0la
RSAxNgotLSAKMi4yMC4xCgo=
--0000000000003d1b4605a1077cbb--

