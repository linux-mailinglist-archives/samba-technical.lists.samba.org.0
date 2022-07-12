Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A815711DC
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jul 2022 07:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LGs9JyoVpvCiq2kVkyuR1T4N2KrkXSFfXc1vKiYlBUw=; b=XlGrQKY+mnK/7s/NBf5rvWmsqZ
	IKyfe7I9HCor85uQ4Ajxl3ZeliSwzQVqWf6EsqHR/d0sOy6wNlEfGq9J9QU63YjZmSpQ5YTmd65Q9
	9HtCmpZEecjffDrtsWNB1lgTATmT7TCT8A5F4cKc26lGIuf/Yepxx5xOS+uq27mP6fa3810gmhsBJ
	rvjoToQXAVRLPukgyVSTh1nVuWqBXbwWk22Ch0BssKoqfh6qNnbc5/5MDKoss0130RQnXeqp9bLDz
	oQS/coEFL86+NquppFjG7BAmNXt/SXSH+TKaR3T4iiHV3sMstaaC9C5K7pCUbHuTBBB56m7xXj4GL
	A1DtL8xg==;
Received: from ip6-localhost ([::1]:30576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oB8Xf-00H6Yp-0O; Tue, 12 Jul 2022 05:34:39 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:33484) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oB8Xa-00H6YY-1b
 for samba-technical@lists.samba.org; Tue, 12 Jul 2022 05:34:36 +0000
Received: by mail-vs1-xe34.google.com with SMTP id l190so6874692vsc.0
 for <samba-technical@lists.samba.org>; Mon, 11 Jul 2022 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LGs9JyoVpvCiq2kVkyuR1T4N2KrkXSFfXc1vKiYlBUw=;
 b=pZjMKJL1y+hW5NBl8ezagz/tDW6wST8LZ6Ly9iVT2VOcjbYSaYUkAfSu6hJr6IZbuk
 ENrx5D+6R480CP6BC9OWUmzG+QX45HB1WZ8Wa9kVh5UTaL4+t1KpNJFcbv9TU2wXz/Z5
 wi3BZdMaQPhI6fdEU5g6cPy5wiJElsPScqmnmFog+Rwmg/FiwKijBQeWnQMFdMIQR97f
 cpelQDlWRDwwg2MCMemv4GacM/xr5lVXjcis+gx+TWTNzsmpUke5UI+BylWhyzQzh/LS
 BHj9iDf5dujYOTrehxe44itVEcwgss5JP85/dw52qDMsqQnvpbBpSrVWN5oyt9agYgO2
 /CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LGs9JyoVpvCiq2kVkyuR1T4N2KrkXSFfXc1vKiYlBUw=;
 b=yNaLj3bpSdE7EIcTnE95Wx0SVMvjbzQo1zgCyt2S2VsPzQJv8aCM3CV0PYHxojLb+z
 LgHFFxL3MMtEE1rpr0+BU6JHFJSRPzdgdUG8iwngM0i3y02/0VOu3XVLnhgVyNX0QVUo
 nxxdKnVlV3v1emGCsrZg6cuKbO/hOy+JZn2QmMfd3ec6lRwMwTpeO0qiVWa2aYEzesYQ
 XKK6c+eKEvJrYu0XksiP/4BC9kWDXUEHp06VQlYd65DjvYNcBst48RuujsCy2PjH8CSl
 7HCAsKIprU4jwJn7VLSEfFx7PpMPljZMVOJGCtSjt3AVrpwnpfFW1pbm/nplLzIwSXhM
 qd/w==
X-Gm-Message-State: AJIora9vLfbcY1mosqUOvw+C0i9IcQQV5Zs37xeXFsPVo8fGOnq9JjDY
 1inMNqUgU2qeW13NoSFRCwo0kXNWPVXPbeII7fs=
X-Google-Smtp-Source: AGRyM1tuc1bOmS5NfSmyHLMQgHxXONpP1zjOIaaUQg0QsSlhadPuiPtNsxdBPtW0lYod8X1A8tu8Dpzijurv3Fq4ijk=
X-Received: by 2002:a67:6d86:0:b0:357:3d99:ec77 with SMTP id
 i128-20020a676d86000000b003573d99ec77mr6931141vsc.6.1657604071919; Mon, 11
 Jul 2022 22:34:31 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 12 Jul 2022 00:34:21 -0500
Message-ID: <CAH2r5mtuN-yswT5VTbNPzj02fwiHYOCe2eR8mcgRgRE8Qpkjgw@mail.gmail.com>
Subject: [PATCH][SMB3] workaround negprot bug in some Samba servers by
 changing order of negcontexts sent by Linux kernel client
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000e2ac8c05e39505f1"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 "Stefan \(metze\) Metzmacher" <metze@samba.org>, Paulo Alcantara <pc@cjr.nz>,
 Brian Caine <brian.d.caine@gmail.com>, Julian Sikorski <belegdol@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000e2ac8c05e39505f1
Content-Type: text/plain; charset="UTF-8"

Starting with 5.18.8 (and 5.19-rc4) mount can now fail to older Samba
servers due to a server bug handling padding at the end of the last
negotiate context (negotiate contexts typically round up to 8 byte
lengths by adding padding if needed). This server bug can be avoided
by switching the order of negotiate contexts, placing a negotiate
context at the end that does not require padding (prior to the recent
netname context fix this was the case on the client).

Fixes: 73130a7b1ac9 ("smb3: fix empty netname context on secondary channels")

See attached fix to cifs.ko
-- 
Thanks,

Steve

--000000000000e2ac8c05e39505f1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-workaround-negprot-bug-in-some-Samba-servers.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-workaround-negprot-bug-in-some-Samba-servers.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l5hqgxgu0>
X-Attachment-Id: f_l5hqgxgu0

RnJvbSBhOGQ4NTMyZTRjMzM1ZjBhMzFkZDIxM2FiZTRlMzE2ODJmMzQ2NDdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMTIgSnVsIDIwMjIgMDA6MTE6NDIgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiB3b3JrYXJvdW5kIG5lZ3Byb3QgYnVnIGluIHNvbWUgU2FtYmEgc2VydmVycwoKTW91bnQg
Y2FuIG5vdyBmYWlsIHRvIG9sZGVyIFNhbWJhIHNlcnZlcnMgZHVlIHRvIGEgc2VydmVyCmJ1ZyBo
YW5kbGluZyBwYWRkaW5nIGF0IHRoZSBlbmQgb2YgdGhlIGxhc3QgbmVnb3RpYXRlCmNvbnRleHRz
IChuZWdvdGlhdGUgY29udGV4dHMgdHlwaWNhbGx5IHJvdW5kIHVwIHRvIDggYnl0ZQpsZW5ndGhz
IGJ5IGFkZGluZyBwYWRkaW5nIGlmIG5lZWRlZCkuIFRoaXMgc2VydmVyIGJ1ZyBjYW4KYmUgYXZv
aWRlZCBieSBzd2l0Y2hpbmcgdGhlIG9yZGVyIG9mIG5lZ290aWF0ZSBjb250ZXh0cywKcGxhY2lu
ZyBhIG5lZ290aWF0ZSBjb250ZXh0IGF0IHRoZSBlbmQgdGhhdCBkb2VzIG5vdApyZXF1aXJlIHBh
ZGRpbmcgKHByaW9yIHRvIHRoZSByZWNlbnQgbmV0bmFtZSBjb250ZXh0IGZpeAp0aGlzIHdhcyB0
aGUgY2FzZSBvbiB0aGUgY2xpZW50KS4KCkZpeGVzOiA3MzEzMGE3YjFhYzkgKCJzbWIzOiBmaXgg
ZW1wdHkgbmV0bmFtZSBjb250ZXh0IG9uIHNlY29uZGFyeSBjaGFubmVscyIpClJlcG9ydGVkLWJ5
OiBKdWxpYW4gU2lrb3Jza2kgPGJlbGVnZG9sQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogU3Rl
dmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5j
IHwgMTMgKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJwZHUuYyBiL2ZzL2NpZnMvc21i
MnBkdS5jCmluZGV4IDEyYjRkZGRhZWRiMC4uYzcwNWRlMzJlMjI1IDEwMDY0NAotLS0gYS9mcy9j
aWZzL3NtYjJwZHUuYworKysgYi9mcy9jaWZzL3NtYjJwZHUuYwpAQCAtNTcxLDEwICs1NzEsNiBA
QCBhc3NlbWJsZV9uZWdfY29udGV4dHMoc3RydWN0IHNtYjJfbmVnb3RpYXRlX3JlcSAqcmVxLAog
CSp0b3RhbF9sZW4gKz0gY3R4dF9sZW47CiAJcG5lZ19jdHh0ICs9IGN0eHRfbGVuOwogCi0JYnVp
bGRfcG9zaXhfY3R4dCgoc3RydWN0IHNtYjJfcG9zaXhfbmVnX2NvbnRleHQgKilwbmVnX2N0eHQp
OwotCSp0b3RhbF9sZW4gKz0gc2l6ZW9mKHN0cnVjdCBzbWIyX3Bvc2l4X25lZ19jb250ZXh0KTsK
LQlwbmVnX2N0eHQgKz0gc2l6ZW9mKHN0cnVjdCBzbWIyX3Bvc2l4X25lZ19jb250ZXh0KTsKLQog
CS8qCiAJICogc2Vjb25kYXJ5IGNoYW5uZWxzIGRvbid0IGhhdmUgdGhlIGhvc3RuYW1lIGZpZWxk
IHBvcHVsYXRlZAogCSAqIHVzZSB0aGUgaG9zdG5hbWUgZmllbGQgaW4gdGhlIHByaW1hcnkgY2hh
bm5lbCBpbnN0ZWFkCkBAIC01ODYsOSArNTgyLDE0IEBAIGFzc2VtYmxlX25lZ19jb250ZXh0cyhz
dHJ1Y3Qgc21iMl9uZWdvdGlhdGVfcmVxICpyZXEsCiAJCQkJCSAgICAgIGhvc3RuYW1lKTsKIAkJ
KnRvdGFsX2xlbiArPSBjdHh0X2xlbjsKIAkJcG5lZ19jdHh0ICs9IGN0eHRfbGVuOwotCQluZWdf
Y29udGV4dF9jb3VudCA9IDQ7Ci0JfSBlbHNlIC8qIHNlY29uZCBjaGFubmVscyBkbyBub3QgaGF2
ZSBhIGhvc3RuYW1lICovCiAJCW5lZ19jb250ZXh0X2NvdW50ID0gMzsKKwl9IGVsc2UKKwkJbmVn
X2NvbnRleHRfY291bnQgPSAyOworCisJYnVpbGRfcG9zaXhfY3R4dCgoc3RydWN0IHNtYjJfcG9z
aXhfbmVnX2NvbnRleHQgKilwbmVnX2N0eHQpOworCSp0b3RhbF9sZW4gKz0gc2l6ZW9mKHN0cnVj
dCBzbWIyX3Bvc2l4X25lZ19jb250ZXh0KTsKKwlwbmVnX2N0eHQgKz0gc2l6ZW9mKHN0cnVjdCBz
bWIyX3Bvc2l4X25lZ19jb250ZXh0KTsKKwluZWdfY29udGV4dF9jb3VudCsrOwogCiAJaWYgKHNl
cnZlci0+Y29tcHJlc3NfYWxnb3JpdGhtKSB7CiAJCWJ1aWxkX2NvbXByZXNzaW9uX2N0eHQoKHN0
cnVjdCBzbWIyX2NvbXByZXNzaW9uX2NhcGFiaWxpdGllc19jb250ZXh0ICopCi0tIAoyLjM0LjEK
Cg==
--000000000000e2ac8c05e39505f1--

