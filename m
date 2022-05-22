Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD55306BD
	for <lists+samba-technical@lfdr.de>; Mon, 23 May 2022 01:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ooe+mKEXt9RL6Fgaj75WWsNFXYoZHf4wod9h5uNnXtI=; b=Jo4T+OkQNAOIfpXDfe7rtjnOGg
	O+TNBbEAUMvHb3enDDsI1zLYU7x+zqo97ASdU4LtVzFMZupDWmjw5rVg2SNF1UJloCngO9U1P2/OX
	U24blmuBu6dluq39zLMAuwL+9+gAXXuoRhYm2VabIsuu51kG6Lo797XC24qdVOnurKJLaCRyA7UKT
	NOwUvjzHUVYjQzp3alOk5q5X2o893QZXlhNAez9y6Q735Mm9FxkorpqGZJmla3rIsDNeDST5p+LpT
	vIVTE3ykT6pGoGFyLv2USKz9GrRi/Q2HNlqZ0OE2uxj2sjtdtwjoFfbC4rATknaaoK055AxLCUfQ3
	kHyo09iQ==;
Received: from ip6-localhost ([::1]:43112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nsv88-002RH3-Ru; Sun, 22 May 2022 23:37:00 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:47058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nsv82-002RGr-7v
 for samba-technical@lists.samba.org; Sun, 22 May 2022 23:36:59 +0000
Received: by mail-vk1-xa35.google.com with SMTP id m203so6352851vke.13
 for <samba-technical@lists.samba.org>; Sun, 22 May 2022 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ooe+mKEXt9RL6Fgaj75WWsNFXYoZHf4wod9h5uNnXtI=;
 b=Y3dzzf2CT4uLS6NRrHof3JLM2nKA58c+lKyD/P9W/zGstVwl5j0uxEgar8S6xmckQb
 gUwFr831Soss6lV+ih33d3CUoyQTE4/OKdHc7Ret9rg+aJF4b4ZWEYs+owY21aV8qDfr
 CTpDd5zY7Et8S+rybKTfl2qOxp/yTKOk5BLdAhPSje101ytULl1/GrQ/Mcsx4GXxecO6
 DY13zusudre0VaJZQrL3R53iS8v+IU/SF070P/EdJLaM/p59O8mcGK0lwD5iPrvxMeNq
 OYRAtoN5NO/hpfdRu3SNoAdrpaYg08YZ2yTdjggl5gjBAMiwOy4D1bvIFussuqPTJ+O6
 5zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ooe+mKEXt9RL6Fgaj75WWsNFXYoZHf4wod9h5uNnXtI=;
 b=jKD0h0w6s7yAE+tUnetT1JLTyVPRyJLN2H4/8cbiMjkdKXznVNx6MCrScAIYGGmG7g
 FA9EcnxW4TsHdtq8DXWStwhhkqmoeBHvE4o9eGjJqLMOZLnsvYklXXwtCYjBKu6Yl+i3
 sUHp61J4tY5jxSi4xMgpTl6PQwl7ED/IGoSCYffox4TMJMReJqFToQYme1doH5ZrKAMh
 81gQ/pXu0khKtQuBoQoLSTI7OCUy/VQxcgY+FRh0THswWiKZhHfYNIZD3P6JDaHzJp20
 Q6+es8Fad0UHWUSqBiXfh2ASaRGDHEj0rX8RMTGvTVIf3dHnlCtGyGEx55QZkmSEW6k/
 +ukw==
X-Gm-Message-State: AOAM532W3tWeesq02GEZVOfwQlIs9QSACJswnDx+lna2QbZfqUMKojAY
 nCZIV8BiBYwkUV0Fp0cg9AvlLDYCdfB2OXOox28=
X-Google-Smtp-Source: ABdhPJz2HoZxeivpjO7mZFAafKrnP3SNAyfaxavpbtwoDPNMSg+8Gkrx2cihRD9oH+UNaKPN87M/OcmaCVQIR6R6MJc=
X-Received: by 2002:a1f:a7d5:0:b0:34e:4447:6309 with SMTP id
 q204-20020a1fa7d5000000b0034e44476309mr6968204vke.38.1653262610639; Sun, 22
 May 2022 16:36:50 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 22 May 2022 18:36:39 -0500
Message-ID: <CAH2r5muiMW76Xt2zRNJWTcQVuewEj3Qs3p4oc8tvEyw5f6528g@mail.gmail.com>
Subject: [PATCH][SMB3] Add defines for various newer FSCTLs
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000a0cd9205dfa23245"
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

--000000000000a0cd9205dfa23245
Content-Type: text/plain; charset="UTF-8"

Checking MS-FSCC section 2.3 found six FSCTL defines that were missing

See attached
-- 
Thanks,

Steve

--000000000000a0cd9205dfa23245
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-Add-defines-for-various-newer-FSCTLs.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-Add-defines-for-various-newer-FSCTLs.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l3hxukgx0>
X-Attachment-Id: f_l3hxukgx0

RnJvbSA4MmE3MGUzNDFiOTRmZGYwMmE2MWVmNzExOGFiMzRhOWMxNWY5ZjRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMjIgTWF5IDIwMjIgMTg6MzA6MzggLTA1MDAKU3ViamVjdDogW1BBVENIXSBb
U01CM10gQWRkIGRlZmluZXMgZm9yIHZhcmlvdXMgbmV3ZXIgRlNDVExzCgpDaGVja2luZyBNUy1G
U0NDIHNlY3Rpb24gMi4zIGZvdW5kIHNpeCBGU0NUTCBkZWZpbmVzCnRoYXQgd2VyZSBtaXNzaW5n
CgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0t
LQogZnMvc21iZnNfY29tbW9uL3NtYmZzY3RsLmggfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYmZzX2NvbW1vbi9zbWJmc2N0bC5o
IGIvZnMvc21iZnNfY29tbW9uL3NtYmZzY3RsLmgKaW5kZXggZDUxOTM5YzQzYWQ3Li45ZTllODZk
ZTk1ZjYgMTAwNjQ0Ci0tLSBhL2ZzL3NtYmZzX2NvbW1vbi9zbWJmc2N0bC5oCisrKyBiL2ZzL3Nt
YmZzX2NvbW1vbi9zbWJmc2N0bC5oCkBAIC04OCwyMSArODgsMjcgQEAKICNkZWZpbmUgRlNDVExf
UkVBRF9SQVdfRU5DUllQVEVEICAgICAweDAwMDkwMEUzIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNk
ZWZpbmUgRlNDVExfUkVBRF9GSUxFX1VTTl9EQVRBICAgICAweDAwMDkwMEVCIC8qIEJCIGFkZCBz
dHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfV1JJVEVfVVNOX0NMT1NFX1JFQ09SRCAweDAwMDkwMEVG
IC8qIEJCIGFkZCBzdHJ1Y3QgKi8KKyNkZWZpbmUgRlNDVExfTUFSS19IQU5ETEUJICAgICAweDAw
MDkwMEZDIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfU0lTX0NPUFlGSUxFICAg
ICAgICAgICAweDAwMDkwMTAwIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfUkVD
QUxMX0ZJTEUgICAgICAgICAgICAweDAwMDkwMTE3IC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNkZWZp
bmUgRlNDVExfUVVFUllfU1BBUklOR19JTkZPICAgICAweDAwMDkwMTM4IC8qIEJCIGFkZCBzdHJ1
Y3QgKi8KKyNkZWZpbmUgRlNDVExfUVVFUllfT05fRElTS19WT0xVTUVfSU5GTyAweDAwMDkxM0MK
ICNkZWZpbmUgRlNDVExfU0VUX1pFUk9fT05fREVBTExPQyAgICAweDAwMDkwMTk0IC8qIEJCIGFk
ZCBzdHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfU0VUX1NIT1JUX05BTUVfQkVIQVZJT1IgMHgwMDA5
MDFCNCAvKiBCQiBhZGQgc3RydWN0ICovCiAjZGVmaW5lIEZTQ1RMX0dFVF9JTlRFR1JJVFlfSU5G
T1JNQVRJT04gMHgwMDA5MDI3QworI2RlZmluZSBGU0NUTF9RVUVSWV9GSUxFX1JFR0lPTlMgICAg
IDB4MDAwOTAyODQKICNkZWZpbmUgRlNDVExfR0VUX1JFRlNfVk9MVU1FX0RBVEEgICAweDAwMDkw
MkQ4IC8qIFNlZSBNUy1GU0NDIDIuMy4yNCAqLwogI2RlZmluZSBGU0NUTF9TRVRfSU5URUdSSVRZ
X0lORk9STUFUSU9OX0VYVCAweDAwMDkwMzgwCiAjZGVmaW5lIEZTQ1RMX0dFVF9SRVRSSUVWQUxf
UE9JTlRFUlNfQU5EX1JFRkNPVU5UIDB4MDAwOTAzZDMKICNkZWZpbmUgRlNDVExfR0VUX1JFVFJJ
RVZBTF9QT0lOVEVSX0NPVU5UIDB4MDAwOTA0MmIKICNkZWZpbmUgRlNDVExfUkVGU19TVFJFQU1f
U05BUFNIT1RfTUFOQUdFTUVOVCAweDAwMDkwNDQwCiAjZGVmaW5lIEZTQ1RMX1FVRVJZX0FMTE9D
QVRFRF9SQU5HRVMgMHgwMDA5NDBDRgorI2RlZmluZSBGU0NUTF9PRkZMT0FEX1JFQUQJMHgwMDA5
NDI2NCAvKiBCQiBhZGQgc3RydWN0ICovCisjZGVmaW5lIEZTQ1RMX09GRkxPQURfV1JJVEUJMHgw
MDA5ODI2OCAvKiBCQiBhZGQgc3RydWN0ICovCiAjZGVmaW5lIEZTQ1RMX1NFVF9ERUZFQ1RfTUFO
QUdFTUVOVCAgMHgwMDA5ODEzNCAvKiBCQiBhZGQgc3RydWN0ICovCiAjZGVmaW5lIEZTQ1RMX0ZJ
TEVfTEVWRUxfVFJJTSAgICAgICAgMHgwMDA5ODIwOCAvKiBCQiBhZGQgc3RydWN0ICovCiAjZGVm
aW5lIEZTQ1RMX0RVUExJQ0FURV9FWFRFTlRTX1RPX0ZJTEUgMHgwMDA5ODM0NAorI2RlZmluZSBG
U0NUTF9EVVBMSUNBVEVfRVhURU5UU19UT19GSUxFX0VYIDB4MDAwOTgzRTgKICNkZWZpbmUgRlND
VExfU0lTX0xJTktfRklMRVMgICAgICAgICAweDAwMDlDMTA0CiAjZGVmaW5lIEZTQ1RMX1NFVF9J
TlRFR1JJVFlfSU5GT1JNQVRJT04gMHgwMDA5QzI4MAogI2RlZmluZSBGU0NUTF9QSVBFX1BFRUsg
ICAgICAgICAgICAgIDB4MDAxMTQwMEMgLyogQkIgYWRkIHN0cnVjdCAqLwotLSAKMi4zNC4xCgo=
--000000000000a0cd9205dfa23245--

