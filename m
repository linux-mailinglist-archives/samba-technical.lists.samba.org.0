Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA34C512
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 03:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0zOxBKUCYDOIWhRf58Otm+dLo3EckbJIQoYgCqazd24=; b=amgdY6GKxRMORP4YVzTwYxQ5lf
	4SLXeVNijuYERheufGAkPss5Ib43iI7auPhdX+yOAdbZCH0GurxAVhMMQms367em/VY+qzlmRmTmV
	vNWvBUnsgZUjDXXD7WgVVNMS76FltmlLIvWpaqyGHI00OK8uDQQBQSBpV2OgsqZjChUnxP7fNAndl
	vOL5G1st+h1Izdh8H6Xsi4Trj3Y4RR+RtmEalfHFNRlcM6F37YvR49gCv0FMFQlJUEUXIDTLwO858
	VtgON3AhezYbuH5VGwoKzpnFi+LLDO+MH+jmK6S3+Qhq0MAztJqJ1rgDUEs7ShZoqsheeVwnPwIJ+
	+RWEzGgw==;
Received: from localhost ([::1]:43074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdm85-000Z9e-TL; Thu, 20 Jun 2019 01:44:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36769) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdm7y-000Z9X-HV
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 01:44:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id r7so681917pfl.3
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 18:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0zOxBKUCYDOIWhRf58Otm+dLo3EckbJIQoYgCqazd24=;
 b=l32nv//PIdQ6sTQprdgpqu/QVROQXBFnnpZqHlApr4HhKUtzqHFfj8qTB5yZuj50eC
 07z9A/7y8sj0jCEX+DPD0UN5mwf4HRV/NCL340qCxnN2AD8bs1pD61DRndPUMRYSSiJq
 fqAz/oNvuLaMqHL+u1DeLKqVl5AQYJL1vYhLvmP1EQhqvg2J8zUPUFYV5g3/IzIxJjHJ
 20/n4YdtrRMMkCSdELpNGWt3CQ6yR7NqRGxAju/9S4dgHzoeGJgBv5ZPmXKdx7KwpEGa
 COyUmiLexj+O2560FEwBc5233BAq3XKRCMLNoF1kDBAzffblX50MC5nSJ1kWOo1lwWqi
 txzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0zOxBKUCYDOIWhRf58Otm+dLo3EckbJIQoYgCqazd24=;
 b=o//FvUo/ncFdFBKNPS2th+twO8KUe8g7HeXyAxYdkSz7lJ8iCHwxMprl5j+8Dzaziy
 vdBJCtafVyyXfrPpAVLJ3BDzxsA732Vvv0rM40ZJ3LT4b51f43EFg45nS4V43am2U6+U
 9/hoRmleb8BCGg20gTyZyogO3Xe6VdfV6cGppZg7Gqr11eJ8AQKEqJHNXiv/dVEnSGhA
 wlBij8x6ukxy4IKSr247VGxJg0n4YZ/G8opibQibuDPLkDoObZEa6EIWsEU/Fifxshes
 C7853/h2yYDltkxux1KyP0qG7gTs9pktv4bCHhDeQoJCGET1+1KJQ4aT479Mco5PC5+x
 VBrA==
X-Gm-Message-State: APjAAAXCWoZKmdhPzwHXeDAAbzZAgLXFoTK9JvlpoF8ul7EAT1dFfRXa
 UNIUvYfxFus44krFqX0BRL4QdWkMWAhnRnKgBpE=
X-Google-Smtp-Source: APXvYqweuRogMqI/AyZMce/SUayiDeo6KgbY5HyVeSwFAhYC7CAqdWxtN53Z6M3DE3mV2nMNMQq0/lq0KQU0QUBP6Bw=
X-Received: by 2002:a63:d4c:: with SMTP id 12mr10787654pgn.30.1560995073972;
 Wed, 19 Jun 2019 18:44:33 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 19 Jun 2019 20:44:22 -0500
Message-ID: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
Subject: [SMB3][PATCH] fix copy_file_range when copying beyond end of source
 file
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 Amir Goldstein <amir73il@gmail.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: multipart/mixed; boundary="000000000000e1ad76058bb77c0c"
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

--000000000000e1ad76058bb77c0c
Content-Type: text/plain; charset="UTF-8"

Patch attached fixes the case where copy_file_range over an SMB3 mount
tries to go beyond the end of file of the source file.  This fixes
xfstests generic/430 and generic/431

Amir's patches had added a similar change in the VFS layer, but
presumably harmless to have the check in cifs.ko as well to ensure
that we don't try to copy beyond end of the source file (otherwise
SMB3 servers will return an error on copychunk rather than doing the
partial copy (up to end of the source file) that copy_file_range
expects).



-- 
Thanks,

Steve

--000000000000e1ad76058bb77c0c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-fix-copy-file-range-when-beyond-size-of-source-.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-fix-copy-file-range-when-beyond-size-of-source-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jx402gjq0>
X-Attachment-Id: f_jx402gjq0

RnJvbSBhM2Q5MDMzZGY3YmI1MjA2MDkzZjAwZWIwMzcyNDIzMzZmZjdjY2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgMTkgSnVuIDIwMTkgMTU6MTA6MTIgLTA1MDAKU3ViamVjdDogW1BBVENIXSBb
U01CM10gZml4IGNvcHkgZmlsZSByYW5nZSB3aGVuIGJleW9uZCBzaXplIG9mIHNvdXJjZSBmaWxl
CgpXaGVuIHJlcXVlc3RpbmcgYSBjb3B5IHdoaWNoIHdvdWxkIGdvIGJleW9uZCB0aGUgZW5kIG9m
IHRoZQpzb3VyY2UgZmlsZSwgb25seSBjb3B5IHRvIHRoZSBlbmQgb2YgdGhlIHNvdXJjZSBmaWxl
IGluc3RlYWQKb2YgcmV0dXJuaW5nIGFuIGVycm9yLiAgRml4ZXMgeGZzdGVzdHMgZ2VuZXJpYy80
MzAgYW5kCmdlbmVyaWMvNDMxCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNo
QG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lmcy9zbWIyb3BzLmMgfCA5ICsrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMm9w
cy5jIGIvZnMvY2lmcy9zbWIyb3BzLmMKaW5kZXggMzc2NTc3Y2M0MTU5Li4xY2RiZWVjNTY0NTMg
MTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMm9wcy5jCisrKyBiL2ZzL2NpZnMvc21iMm9wcy5jCkBA
IC0xNTIyLDYgKzE1MjIsNyBAQCBzbWIyX2NvcHljaHVua19yYW5nZShjb25zdCB1bnNpZ25lZCBp
bnQgeGlkLAogCWludCBjaHVua3NfY29waWVkID0gMDsKIAlib29sIGNodW5rX3NpemVzX3VwZGF0
ZWQgPSBmYWxzZTsKIAlzc2l6ZV90IGJ5dGVzX3dyaXR0ZW4sIHRvdGFsX2J5dGVzX3dyaXR0ZW4g
PSAwOworCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBkX2lub2RlKHNyY2ZpbGUtPmRlbnRyeSk7CiAK
IAlwY2NodW5rID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGNvcHljaHVua19pb2N0bCksIEdGUF9L
RVJORUwpOwogCkBAIC0xNTQ2LDYgKzE1NDcsMTQgQEAgc21iMl9jb3B5Y2h1bmtfcmFuZ2UoY29u
c3QgdW5zaWduZWQgaW50IHhpZCwKIAl0Y29uID0gdGxpbmtfdGNvbih0cmd0ZmlsZS0+dGxpbmsp
OwogCiAJd2hpbGUgKGxlbiA+IDApIHsKKwkJaWYgKHNyY19vZmYgPj0gaW5vZGUtPmlfc2l6ZSkg
eworCQkJY2lmc19kYmcoRllJLCAibm90aGluZyB0byBkbyBvbiBjb3B5Y2h1bmtcbiIpOworCQkJ
Z290byBjY2h1bmtfb3V0OyAvKiBub3RoaW5nIHRvIGRvICovCisJCX0gZWxzZSBpZiAoc3JjX29m
ZiArIGxlbiA+IGlub2RlLT5pX3NpemUpIHsKKwkJCS8qIGNvbnNpZGVyIGFkZGluZyBjaGVjayB0
byBzZWUgaWYgc3JjIG9wbG9ja2VkICovCisJCQlsZW4gPSBpbm9kZS0+aV9zaXplIC0gc3JjX29m
ZjsKKwkJCWNpZnNfZGJnKEZZSSwgImFkanVzdCBjb3B5Y2h1bmsgbGVuICVsbGQgbGVzc1xuIiwg
bGVuKTsKKwkJfQogCQlwY2NodW5rLT5Tb3VyY2VPZmZzZXQgPSBjcHVfdG9fbGU2NChzcmNfb2Zm
KTsKIAkJcGNjaHVuay0+VGFyZ2V0T2Zmc2V0ID0gY3B1X3RvX2xlNjQoZGVzdF9vZmYpOwogCQlw
Y2NodW5rLT5MZW5ndGggPQotLSAKMi4yMC4xCgo=
--000000000000e1ad76058bb77c0c--

