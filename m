Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A93891E945E
	for <lists+samba-technical@lfdr.de>; Sun, 31 May 2020 01:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=w50qEa13vUloOZC3BoqoktatJ6h2xmJIyk0twZtAbxs=; b=tN+1lxQUjePEqtTsWWwGe+2PwT
	H0wzP3LudREV5Jw9/se1jQjHIgZjlBUzcedaFXoRpWCNYwpkK4Dpmi1MYSD3Kj6SNwnf5qZa8K1dB
	5qSYwqcZ6MgqQETdOODiEe6fx/U+BjjGS/dSM322fBwmFQZB2/YZr0AqHjqOOLYnk7PHCUQc40Svt
	JBUx9C4IXJDOZwIKNym2a7cL083VmKkgLOTmsJ3JwWLammtaltFaf0vqbQ62vnYu8lyTfMWwTw6oi
	g9zNFed4x19cd34hv/sdnaQy2d4tprQyfYJ4B9cliuBDYAfMWFUL3JP3JkFnXRL1KLFQuuloiE6E2
	AyVi5EkA==;
Received: from localhost ([::1]:51612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jfAW2-006Rmj-Ef; Sat, 30 May 2020 23:03:46 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39151) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jfAVu-006Rmc-NY
 for samba-technical@lists.samba.org; Sat, 30 May 2020 23:03:43 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id p123so3153629yba.6
 for <samba-technical@lists.samba.org>; Sat, 30 May 2020 16:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=w50qEa13vUloOZC3BoqoktatJ6h2xmJIyk0twZtAbxs=;
 b=Gzcwn9kaG+5CI1ixYQ0vDz38fVpWnZhILeINeZn1TJDlzgXCFSr8st5NQJxdSCEvIL
 VbQ10DUBcSWrlHkbi689NgMdEGmWoYDCtsVGpMmhbuFoteF/8DFAOUCpboYOnit+kjxz
 CXgs6U7PHVAMo2BPrCjt57lt1Q4aXtlw4XZbMi1va3pwO4eNwJu61f7DwmE5OQtm/59c
 0frsikuGwuPHg4IXD+S9uUugGy1R97rGmj0imEk4qZx7KtPC8iuO2Ew4IPQi+M+p+e9c
 b89pizippDbjo7ol9K7C2JrNjORzzUhVqLkw8MDl+IoimnkUhTrw5KpRAUqSOG1XBxKA
 YVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=w50qEa13vUloOZC3BoqoktatJ6h2xmJIyk0twZtAbxs=;
 b=VzYTqdolC04vhkuBi1LTdcD0pzhfz5iO3VuY4yTnZStJbip7Pbor7NNUBbyvSsGkG0
 bCUl4HFzMsYamM3BmeHVO9uSVpMFkuw9rpqfcrKfMxSOVDXMSoXRW4r5V1yGJ078IVin
 BBnNWQjkboB3qtdfJQVJ5CY1eUvSF9q5pFoQ614SzKAQCclilC3lgwvbWu7tZwjMncHG
 MIMXikLmTHE6lChxwhTbBKCpRLDk7Y8543kh84V8Iykmmbde4DVnaQYuxbYxdrmRsy/o
 XTRmBGIXa1FmpM1TKRj5ZE7ILY4kK8BkcQS3VCGyxapclKzBkyVI0fg0TrBHJlysBd5C
 w0eg==
X-Gm-Message-State: AOAM533uOWV/QY8GbNXOuJj9Eq04CG/TvGf9ViVMB+YsqAXd12ve3Dm3
 32KMG3TFmrkFwk+GH54VZ1W8gbtOszVnTtH3ucCv0LVZZ80=
X-Google-Smtp-Source: ABdhPJwI+A0RUlzBfmkegGN6PxBvYGrcsud8u4sfgI7BV9LBt/WF4psEzK+xxD/0AGy2J2O7iOD+oFzcgoQsE0DFphA=
X-Received: by 2002:a25:3bd8:: with SMTP id i207mr3999811yba.167.1590879817014; 
 Sat, 30 May 2020 16:03:37 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 30 May 2020 18:03:26 -0500
Message-ID: <CAH2r5muqPLibwgguZ+gJBD6HumSDHJYO-wFBxExV_5jYNe6=8w@mail.gmail.com>
Subject: [PATCH][SMB3] multichannel: move channel selection in function
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000005fc81805a6e59214"
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

--0000000000005fc81805a6e59214
Content-Type: text/plain; charset="UTF-8"

Wasn't sure if these had been sent to the list again.

This commit moves channel picking code in separate function.

    Signed-off-by: Aurelien Aptel <aaptel@suse.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>



-- 
Thanks,

Steve

--0000000000005fc81805a6e59214
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-multichannel-move-channel-selection-in-function.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-multichannel-move-channel-selection-in-function.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kau8qt2u0>
X-Attachment-Id: f_kau8qt2u0

RnJvbSBhN2NkY2EyZGJkMmJhNzJkYjU5ZmZjYjFjMzk2MTViODAyMDYyMDIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXJlbGllbiBBcHRlbCA8YWFwdGVsQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDE1OjU4OjU3ICswMjAwClN1YmplY3Q6IFtQQVRDSCAxLzRdIGNp
ZnM6IG11bHRpY2hhbm5lbDogbW92ZSBjaGFubmVsIHNlbGVjdGlvbiBpbiBmdW5jdGlvbgoKVGhp
cyBjb21taXQgbW92ZXMgY2hhbm5lbCBwaWNraW5nIGNvZGUgaW4gc2VwYXJhdGUgZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBBdXJlbGllbiBBcHRlbCA8YWFwdGVsQHN1c2UuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lm
cy9jaWZzcHJvdG8uaCB8ICAxICsKIGZzL2NpZnMvdHJhbnNwb3J0LmMgfCAzOCArKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL2NpZnNwcm90by5o
IGIvZnMvY2lmcy9jaWZzcHJvdG8uaAppbmRleCAxMmE4OTVlMDJkYjQuLjY5MjgyMmQ0NTIzYSAx
MDA2NDQKLS0tIGEvZnMvY2lmcy9jaWZzcHJvdG8uaAorKysgYi9mcy9jaWZzL2NpZnNwcm90by5o
CkBAIC05NSw2ICs5NSw3IEBAIGV4dGVybiBpbnQgY2lmc19jYWxsX2FzeW5jKHN0cnVjdCBUQ1Bf
U2VydmVyX0luZm8gKnNlcnZlciwKIAkJCW1pZF9yZWNlaXZlX3QgKnJlY2VpdmUsIG1pZF9jYWxs
YmFja190ICpjYWxsYmFjaywKIAkJCW1pZF9oYW5kbGVfdCAqaGFuZGxlLCB2b2lkICpjYmRhdGEs
IGNvbnN0IGludCBmbGFncywKIAkJCWNvbnN0IHN0cnVjdCBjaWZzX2NyZWRpdHMgKmV4aXN0X2Ny
ZWRpdHMpOworZXh0ZXJuIHN0cnVjdCBUQ1BfU2VydmVyX0luZm8gKmNpZnNfcGlja19jaGFubmVs
KHN0cnVjdCBjaWZzX3NlcyAqc2VzKTsKIGV4dGVybiBpbnQgY2lmc19zZW5kX3JlY3YoY29uc3Qg
dW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfc2VzICpzZXMsCiAJCQkgIHN0cnVjdCBzbWJf
cnFzdCAqcnFzdCwgaW50ICpyZXNwX2J1Zl90eXBlLAogCQkJICBjb25zdCBpbnQgZmxhZ3MsIHN0
cnVjdCBrdmVjICpyZXNwX2lvdik7CmRpZmYgLS1naXQgYS9mcy9jaWZzL3RyYW5zcG9ydC5jIGIv
ZnMvY2lmcy90cmFuc3BvcnQuYwppbmRleCBjOTc1NzBlYjJjMTguLjZiZTI5M2RkYmE3MiAxMDA2
NDQKLS0tIGEvZnMvY2lmcy90cmFuc3BvcnQuYworKysgYi9mcy9jaWZzL3RyYW5zcG9ydC5jCkBA
IC05OTMsNiArOTkzLDMyIEBAIGNpZnNfY2FuY2VsbGVkX2NhbGxiYWNrKHN0cnVjdCBtaWRfcV9l
bnRyeSAqbWlkKQogCURlbGV0ZU1pZFFFbnRyeShtaWQpOwogfQogCisvKgorICogUmV0dXJuIGEg
Y2hhbm5lbCAobWFzdGVyIGlmIG5vbmUpIG9mIEBzZXMgdGhhdCBjYW4gYmUgdXNlZCB0byBzZW5k
CisgKiByZWd1bGFyIHJlcXVlc3RzLgorICoKKyAqIElmIHdlIGFyZSBjdXJyZW50bHkgYmluZGlu
ZyBhIG5ldyBjaGFubmVsIChuZWdwcm90L3Nlc3Muc2V0dXApLAorICogcmV0dXJuIHRoZSBuZXcg
aW5jb21wbGV0ZSBjaGFubmVsLgorICovCitzdHJ1Y3QgVENQX1NlcnZlcl9JbmZvICpjaWZzX3Bp
Y2tfY2hhbm5lbChzdHJ1Y3QgY2lmc19zZXMgKnNlcykKK3sKKwl1aW50IGluZGV4ID0gMDsKKwor
CWlmICghc2VzKQorCQlyZXR1cm4gTlVMTDsKKworCWlmICghc2VzLT5iaW5kaW5nKSB7CisJCS8q
IHJvdW5kIHJvYmluICovCisJCWlmIChzZXMtPmNoYW5fY291bnQgPiAxKSB7CisJCQlpbmRleCA9
ICh1aW50KWF0b21pY19pbmNfcmV0dXJuKCZzZXMtPmNoYW5fc2VxKTsKKwkJCWluZGV4ICU9IHNl
cy0+Y2hhbl9jb3VudDsKKwkJfQorCQlyZXR1cm4gc2VzLT5jaGFuc1tpbmRleF0uc2VydmVyOwor
CX0gZWxzZSB7CisJCXJldHVybiBjaWZzX3Nlc19zZXJ2ZXIoc2VzKTsKKwl9Cit9CisKIGludAog
Y29tcG91bmRfc2VuZF9yZWN2KGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZzX3Nl
cyAqc2VzLAogCQkgICBjb25zdCBpbnQgZmxhZ3MsIGNvbnN0IGludCBudW1fcnFzdCwgc3RydWN0
IHNtYl9ycXN0ICpycXN0LApAQCAtMTAxOCwxNyArMTA0NCw3IEBAIGNvbXBvdW5kX3NlbmRfcmVj
dihjb25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3QgY2lmc19zZXMgKnNlcywKIAkJcmV0dXJu
IC1FSU87CiAJfQogCi0JaWYgKCFzZXMtPmJpbmRpbmcpIHsKLQkJdWludCBpbmRleCA9IDA7Ci0K
LQkJaWYgKHNlcy0+Y2hhbl9jb3VudCA+IDEpIHsKLQkJCWluZGV4ID0gKHVpbnQpYXRvbWljX2lu
Y19yZXR1cm4oJnNlcy0+Y2hhbl9zZXEpOwotCQkJaW5kZXggJT0gc2VzLT5jaGFuX2NvdW50Owot
CQl9Ci0JCXNlcnZlciA9IHNlcy0+Y2hhbnNbaW5kZXhdLnNlcnZlcjsKLQl9IGVsc2UgewotCQlz
ZXJ2ZXIgPSBjaWZzX3Nlc19zZXJ2ZXIoc2VzKTsKLQl9CisJc2VydmVyID0gY2lmc19waWNrX2No
YW5uZWwoc2VzKTsKIAogCWlmIChzZXJ2ZXItPnRjcFN0YXR1cyA9PSBDaWZzRXhpdGluZykKIAkJ
cmV0dXJuIC1FTk9FTlQ7Ci0tIAoyLjIwLjEKCg==
--0000000000005fc81805a6e59214--

