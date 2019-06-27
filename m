Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F058119
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 13:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xDhCBmf2pjvuyw+HWrYhfPcDcWnQjuVHNXzZ40+osd8=; b=YFD1BmWFjxRK0z2aOuz/iI/Rdu
	ChUscN+0mLS16NtPYt+lr/2tzTp/Hv3H9uk1GBt7ZuOrL8eS8A45HOqAI9GTmaCL0+WTLO3Wf7bVg
	g3z5AgXW6t9dSd1j6+snNV0cWK59fsPKDCGPdnQ8YWEbTJ/R+LqtIimptFu8qFlMp/JltLkBQhZbj
	mpQ47q8NHNStsZlgJ2kNhBGzErd1abe3irKYEbH5e3/xKpXt+li4nLJYRxVSJTZu9kbCpSk+3BdEf
	E3RKr1WzBLwc4ipZvm0HUPL0Tj6tls1qbjCM/614IMDPuYr6BHF9oGHuyZ81B2cEBpwUaxB9yE6dz
	kvJLFyng==;
Received: from localhost ([::1]:64856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgSBv-0028Nq-RC; Thu, 27 Jun 2019 11:03:47 +0000
Received: from [109.74.130.141] (port=53950 helo=astralinux.ru) 
 by hr1.samba.org with esmtp (Exim) id 1hgSBr-0028Nj-7z
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 11:03:45 +0000
Received: from [10.77.109.26] (account skorchak@astralinux.ru)
 by astralinux.ru (CommuniGate Pro XIMSS 6.2.7)
 with HTTPU id 1128675 for samba-technical@lists.samba.org;
 Thu, 27 Jun 2019 14:03:14 +0300
X-Mailer: CommuniGate Pronto! HTML5 6.2.4247
Subject: bug 9612 fix
MIME-Version: 1.0
To: "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Thu, 27 Jun 2019 14:03:14 +0300
Message-ID: <ximss-1128743@fe1.astralinux.ru>
Content-Type: multipart/mixed;boundary="_===1128675====fe1.astralinux.ru===_"
X-Warn: EHLO/HELO not verified: Remote host 109.74.130.141
 (mail.astralinux.ru) incorrectly presented itself as astralinux.ru
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
From: =?utf-8?b?0KHQtdGA0LPQtdC5INCa0L7RgNGH0LDQuiB2aWEgc2FtYmEtdGVjaG5pY2Fs?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?0KHQtdGA0LPQtdC5INCa0L7RgNGH0LDQug==?=
 <skorchak@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--_===1128675====fe1.astralinux.ru===_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hello!
My name Sergey Korchak, and i work in AstraLinux company. see 
http://astralinux.ru

I have fixed bug 9612
https://bugzilla.samba.org/show_bug.cgi?id=9612

According to GNU GPL we wish to publish our patch.


--_===1128675====fe1.astralinux.ru===_
Content-Disposition: attachment; filename="bug-9612.patches.txt"
Content-Type: application/plain; name="bug-9612.patches.txt"
Content-Transfer-Encoding: base64

RnJvbSBkYTUzMTY5ZDM1YjA3MzRjZmIxYjI0ODE5YTA3MDMzNjRlYjEyYzgyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTZXJnZXkgS29yY2hhayA8c2tvcmNoYWtAYXN0cmFs
aW51eC5ydT4KRGF0ZTogVGh1LCAyNyBKdW4gMjAxOSAxMzo0NToxNSArMDMwMApTdWJqZWN0
OiBbUEFUQ0hdIFRoaXMgcGF0Y2ggZml4ZXMgYnVnIDk2MTIgLSBTYW1iYSBEQyBhbGxvd2Vk
IHVzZXIgdG8gbG9nb24KIHVzaW5nIHJldm9rZWQgY2VydGlmaWNhdGUgb24gc21hcnQgY2Fy
ZAoKLS0tCiBzb3VyY2U0L2hlaW1kYWwva2RjL3BraW5pdC5jICAgICAgIHwgMTEgKysrKysr
KysrKysKIHNvdXJjZTQvaGVpbWRhbC9saWIvaHg1MDkvcmV2b2tlLmMgfCAxNCArKysrKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvc291cmNlNC9oZWltZGFsL2tkYy9wa2luaXQuYyBiL3NvdXJjZTQvaGVpbWRhbC9rZGMv
cGtpbml0LmMKaW5kZXggYWQ3ZjNlZmMxMGEuLjY2NjI3YWJkNzViIDEwMDY0NAotLS0gYS9z
b3VyY2U0L2hlaW1kYWwva2RjL3BraW5pdC5jCisrKyBiL3NvdXJjZTQvaGVpbWRhbC9rZGMv
cGtpbml0LmMKQEAgLTQ5NSw2ICs0OTUsMTAgQEAgX2tkY19wa19yZF9wYWRhdGEoa3JiNV9j
b250ZXh0IGNvbnRleHQsCiAJCSAgaGRiX2VudHJ5X2V4ICpjbGllbnQsCiAJCSAgcGtfY2xp
ZW50X3BhcmFtcyAqKnJldF9wYXJhbXMpCiB7CisvLyBCZWdpbiBvZiBBc3RyYUxpbnV4IHBh
dGNoIGJ5IFNlcmdleSBLb3JjaGFrCisgICAgaHg1MDlfcmV2b2tlX2N0eCBzZW5kZXJfcmV2
X2N0eDsgCisgICAgY2hhciAqKmpqID0gTlVMTDsKKy8vIEVuZCBvZiBBc3RyYUxpbnV4IHBh
dGNoIGJ5IFNlcmdleSBLb3JjaGFrCiAgICAgcGtfY2xpZW50X3BhcmFtcyAqY3A7CiAgICAg
a3JiNV9lcnJvcl9jb2RlIHJldDsKICAgICBoZWltX29pZCBlQ29udGVudFR5cGUgPSB7IDAs
IE5VTEwgfSwgY29udGVudEluZm9PaWQgPSB7IDAsIE5VTEwgfTsKQEAgLTU2NSw2ICs1Njks
MTMgQEAgX2tkY19wa19yZF9wYWRhdGEoa3JiNV9jb250ZXh0IGNvbnRleHQsCiAgICAgaHg1
MDlfdmVyaWZ5X2F0dGFjaF9hbmNob3JzKGNwLT52ZXJpZnlfY3R4LCB0cnVzdF9hbmNob3Jz
KTsKICAgICBoeDUwOV9jZXJ0c19mcmVlKCZ0cnVzdF9hbmNob3JzKTsKIAorLy8gQmVnaW4g
b2YgQXN0cmFMaW51eCBwYXRjaCBieSBTZXJnZXkgS29yY2hhaworICAgIGh4NTA5X3Jldm9r
ZV9pbml0KGNvbnRleHQtPmh4NTA5Y3R4LCAmc2VuZGVyX3Jldl9jdHgpOworICAgIGpqID0g
Y29uZmlnLT5wa2luaXRfa2RjX3Jldm9rZTsKKyAgICByZXQgPSBoeDUwOV9yZXZva2VfYWRk
X2NybChjb250ZXh0LT5oeDUwOWN0eCxzZW5kZXJfcmV2X2N0eCwqamogKTsKKyAgICBoeDUw
OV92ZXJpZnlfYXR0YWNoX3Jldm9rZShjcC0+dmVyaWZ5X2N0eCwgc2VuZGVyX3Jldl9jdHgp
OworLy8gRW5kIG9mIEFzdHJhTGludXggcGF0Y2ggYnkgU2VyZ2V5IEtvcmNoYWsKKwogICAg
IGlmIChjb25maWctPnBraW5pdF9hbGxvd19wcm94eV9jZXJ0cykKIAloeDUwOV92ZXJpZnlf
c2V0X3Byb3h5X2NlcnRpZmljYXRlKGNwLT52ZXJpZnlfY3R4LCAxKTsKIApkaWZmIC0tZ2l0
IGEvc291cmNlNC9oZWltZGFsL2xpYi9oeDUwOS9yZXZva2UuYyBiL3NvdXJjZTQvaGVpbWRh
bC9saWIvaHg1MDkvcmV2b2tlLmMKaW5kZXggMjkzMjI4MDc0ODcuLjBhNzc3MDIwNTkyIDEw
MDY0NAotLS0gYS9zb3VyY2U0L2hlaW1kYWwvbGliL2h4NTA5L3Jldm9rZS5jCisrKyBiL3Nv
dXJjZTQvaGVpbWRhbC9saWIvaHg1MDkvcmV2b2tlLmMKQEAgLTgxNywxMSArODE3LDIzIEBA
IGh4NTA5X3Jldm9rZV92ZXJpZnkoaHg1MDlfY29udGV4dCBjb250ZXh0LAogCSAgICByZXR1
cm4gMDsKIAogCS8qIGNoZWNrIGlmIGNlcnQgaXMgaW4gY3JsICovCisKKworCiAJZm9yIChq
ID0gMDsgaiA8IGNybC0+Y3JsLnRic0NlcnRMaXN0LnJldm9rZWRDZXJ0aWZpY2F0ZXMtPmxl
bjsgaisrKSB7CiAJICAgIHRpbWVfdCB0OwogCiAJICAgIHJldCA9IGRlcl9oZWltX2ludGVn
ZXJfY21wKCZjcmwtPmNybC50YnNDZXJ0TGlzdC5yZXZva2VkQ2VydGlmaWNhdGVzLT52YWxb
al0udXNlckNlcnRpZmljYXRlLAogCQkJCSAgICAgICAmYy0+dGJzQ2VydGlmaWNhdGUuc2Vy
aWFsTnVtYmVyKTsKKworLy8gQmVnaW4gb2YgQXN0cmFMaW51eCBwYXRjaCBieSBTZXJnZXkg
S29yY2hhaworCSAgICBpZiAoIXJldCkgeworCQkgICAgaHg1MDlfc2V0X2Vycm9yX3N0cmlu
Zyhjb250ZXh0LCAwLAorCQkJCQkgICAgSFg1MDlfQ0VSVF9SRVZPS0VELAorCQkJCQkgICAg
IkNlcnRpZmljYXRlIHJldm9rZWQgYnkgaXNzdWVyIGluIENSTCIpOworCSAgICAJICAgIHJl
dHVybiBIWDUwOV9DRVJUX1JFVk9LRUQ7CisJICAgIH0KKy8qCiAJICAgIGlmIChyZXQgIT0g
MCkKIAkJY29udGludWU7CiAKQEAgLTgzOCw2ICs4NTAsOCBAQCBoeDUwOV9yZXZva2VfdmVy
aWZ5KGh4NTA5X2NvbnRleHQgY29udGV4dCwKIAkJCQkgICBIWDUwOV9DRVJUX1JFVk9LRUQs
CiAJCQkJICAgIkNlcnRpZmljYXRlIHJldm9rZWQgYnkgaXNzdWVyIGluIENSTCIpOwogCSAg
ICByZXR1cm4gSFg1MDlfQ0VSVF9SRVZPS0VEOworKi8KKy8vIEVuZCBvZiBBc3RyYUxpbnV4
IHBhdGNoIGJ5IFNlcmdleSBLb3JjaGFrCiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoyLjExLjAK
Cg==

--_===1128675====fe1.astralinux.ru===_--

