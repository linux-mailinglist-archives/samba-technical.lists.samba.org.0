Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B818604F
	for <lists+samba-technical@lfdr.de>; Sun, 15 Mar 2020 23:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1yhoUv4kMXivgY0Sb7etbcjFy39MOeOnu80PF6qEXxU=; b=KgG0IjB9Yp68GS/dNlMQpUIRcn
	XLVsV7z3M72zd94sfeeKguKhQJnNRart8yFUUTiQHldYnKF/zUIF+sMZh1CLbAOxl8u1jYMYZSuEU
	5ggHTIWFrfz9YDxj4neSjRnAY8sw93BpEVKULbHubYf18IrGWF4VMxRUPkJ6ncy0iChqAJKbUsUUc
	5cbApdAOEGEefZ8zR6aNvPoWySkbF8XqCfi9rXgjvgAutJt/ar1NB4hFrs+5MGbqyCnAKn0We6aT3
	fnCc3frpnGxxvi+OSrydOlHHQyEQ0Jo5nNeEcz0Yt75aaMZjqY0y42CZrCx4gVVsQd/VOQdKLWDfW
	GxC7IlLw==;
Received: from localhost ([::1]:24936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDc5W-00016x-U2; Sun, 15 Mar 2020 22:50:30 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:43968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDc5R-00016q-Lp
 for samba-technical@lists.samba.org; Sun, 15 Mar 2020 22:50:27 +0000
Received: by mail-qk1-x734.google.com with SMTP id x18so2905935qki.10
 for <samba-technical@lists.samba.org>; Sun, 15 Mar 2020 15:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1yhoUv4kMXivgY0Sb7etbcjFy39MOeOnu80PF6qEXxU=;
 b=W3eCO7z8rT4gPvjr2fsnZMo6/ZhY+NdcFkyZPqJpyWJMzWopnoYOnwvjjL8yYKqabI
 vWlKE3jBP8ZjU4j5qX56GymNVL2TIdfECJZ9EyOqRcsmgFXGhsQoCd8hGu2CkYnChA3j
 phL4t5vBVcyHoTUiZysNh7EZvBqXTBICRRTCIO7mRAINNFH3WjDKu9oyE7+9PlUwPPv8
 WqFnuGxrBO0ZFSjC3a4WjOHAz78xJR2RcVnASfFCJxCthO4t1l01axYJrdFxBfP4zlZe
 5Z7K+S3mE2OBXQSjTLc0fORZlvGrEpjhhiOCEIZiLjE1LwXsj/Y2+g55uhxU34y15RmY
 M9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1yhoUv4kMXivgY0Sb7etbcjFy39MOeOnu80PF6qEXxU=;
 b=X7QontjnqJGkeeAc5KzYrfolThpdwAsHhpiLPQ6EO/tj5j+v9VCVhWuUzSDPaQi46u
 0yiOAotcBV8YLWkpbO39gGuMDy97Hk48SiXW4MJPIG5ToLLfEsVQiwjpN7gL7b3TF/OQ
 mQH0LM0NP6JQzXKQAcR72QWFcEkVSaWAbSoF30Y7ZXW4QDp8lkjcm6TGHhV9m/ZTF+vi
 M5RwyOIgWLkh4QT4sXH+2W0ksdwLs5qnx1UJdVOdZ8rvxRHYDp7Kwg+SLEjlSrY+OHpp
 Pp5jMQe05cI4qGyX2ipGwDiw/PySsAekgHtjplBUegCQNad43ULEp3ErNN6kAcmT6P86
 hywA==
X-Gm-Message-State: ANhLgQ1e67LIEyMP02xOrvOF/oBzRKm9NYIYU7Wf1T3GKrTt0sP6lfjl
 SdliYw4r5Io300CCmKoc0Jme4Fq68gC51ccRErg=
X-Google-Smtp-Source: ADFU+vtdKxen4Ixwp1iR7WDaYWja5LFL8CFEtu1wHKEsxR5juGB1Z3gJoq/bLxbmVT6yLXtIQxmLsoDJt32n7Q2rVOc=
X-Received: by 2002:a25:f20f:: with SMTP id i15mr30560794ybe.364.1584312621004; 
 Sun, 15 Mar 2020 15:50:21 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 15 Mar 2020 17:50:09 -0500
Message-ID: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
Subject: [SMB3] New compression flags
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000fd147c05a0ec86f9"
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

--000000000000fd147c05a0ec86f9
Content-Type: text/plain; charset="UTF-8"

Some compression related flags I noticed were added in the latest MS-SMB2



-- 
Thanks,

Steve

--000000000000fd147c05a0ec86f9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-Add-new-compression-flags.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-Add-new-compression-flags.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k7tmte1v0>
X-Attachment-Id: f_k7tmte1v0

RnJvbSAxMjgzN2FlMDkxZDUzM2I1OGM4MGEwZGE0M2I5Mjk4MGI3ZmY1YjZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjAgMTc6NDI6NDEgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzOiBBZGQgbmV3IGNvbXByZXNzaW9uIGZsYWdzCgpBZGRpdGlvbmFsIGNvbXByZXNzaW9uIGNh
cGFiaWxpdGllcyBjYW4gbm93IGJlIG5lZ290aWF0ZWQgYW5kIGEKbmV3IGNvbXByZXNzaW9uIGFs
Z29yaXRobS4gIEFkZCB0aGUgZmxhZ3MgZm9yIHRoZXNlLgoKU2VlIG5ld2x5IHVwZGF0ZWQgTVMt
U01CMiBzZWN0aW9ucyAzLjEuNC40LjEgYW5kIDIuMi4zLjEuMwoKU2lnbmVkLW9mZi1ieTogU3Rl
dmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5o
IHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMnBkdS5oIGIvZnMvY2lmcy9zbWIycGR1LmgK
aW5kZXggODE3YmMwNTMxNTM2Li40YTdkMTU0ZmZmYWUgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21i
MnBkdS5oCisrKyBiL2ZzL2NpZnMvc21iMnBkdS5oCkBAIC0zMDcsMTEgKzMwNywxNyBAQCBzdHJ1
Y3Qgc21iMl9lbmNyeXB0aW9uX25lZ19jb250ZXh0IHsKICNkZWZpbmUgU01CM19DT01QUkVTU19M
Wk5UMQljcHVfdG9fbGUxNigweDAwMDEpCiAjZGVmaW5lIFNNQjNfQ09NUFJFU1NfTFo3NwljcHVf
dG9fbGUxNigweDAwMDIpCiAjZGVmaW5lIFNNQjNfQ09NUFJFU1NfTFo3N19IVUZGCWNwdV90b19s
ZTE2KDB4MDAwMykKKy8qIFBhdHRlcm4gc2Nhbm5pbmcgYWxnb3JpdGhtIFNlZSBNUy1TTUIyIDMu
MS40LjQuMSAqLworI2RlZmluZSBTTUIzX0NPTVBSRVNTX1BBVFRFUk4JY3B1X3RvX2xlMTYoMHgw
MDA0KQorCisvKiBDb21wcmVzc2lvbiBGbGFncyAqLworI2RlZmluZSBTTUIyX0NPTVBSRVNTSU9O
X0NBUEFCSUxJVElFU19GTEFHX05PTkUJCWNwdV90b19sZTMyKDB4MDAwMDAwMDApCisjZGVmaW5l
IFNNQjJfQ09NUFJFU1NJT05fQ0FQQUJJTElUSUVTX0ZMQUdfQ0hBSU5FRAljcHVfdG9fbGUzMigw
eDAwMDAwMDAxKQogCiBzdHJ1Y3Qgc21iMl9jb21wcmVzc2lvbl9jYXBhYmlsaXRpZXNfY29udGV4
dCB7CiAJX19sZTE2CUNvbnRleHRUeXBlOyAvKiAzICovCiAJX19sZTE2ICBEYXRhTGVuZ3RoOwot
CV9fdTMyCVJlc2VydmVkOworCV9fdTMyCUZsYWdzOwogCV9fbGUxNglDb21wcmVzc2lvbkFsZ29y
aXRobUNvdW50OwogCV9fdTE2CVBhZGRpbmc7CiAJX191MzIJUmVzZXJ2ZWQxOwotLSAKMi4yMC4x
Cgo=
--000000000000fd147c05a0ec86f9--

