Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C782D887BBB
	for <lists+samba-technical@lfdr.de>; Sun, 24 Mar 2024 06:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kcQ7aqapAzWh9V2jYgjZvNL++i4wCg6TaQgakyEunLo=; b=ajuzMqrF0wsjmCf/XC23+/S4cK
	VJ87fbgbrV3CZYpFk0BpVFInGjAX9/XNWJD+r5R2vH818OQdTFS8rOOGOz+Ol3KUhFQayk1FcN2Ic
	4aGQcDd+w+qqjpshGp/sj/HJHEpIFJrxap3ood8NTNMmjDQ4GIFcTwB+GgM4TE4giTyEOwK/T5lVA
	dfaTp97qWSVq9sQEgkxXwDblLxspKqfHaGlPmST9q21hfHFTwukGjyUxE+vgjpeRf3YhGoFQpwOJ4
	h0BrCcyx4KyJl/pTvrTUiJ9h7lR72Y+QxEOZ1eSPx5sRw46qcBgqac5eAdnQJlTMMJdtXHUqKZePS
	9UiUqmFA==;
Received: from ip6-localhost ([::1]:59344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1roG4X-0017mo-8o; Sun, 24 Mar 2024 05:07:06 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:53633) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1roG4T-0017mf-Ga
 for samba-technical@lists.samba.org; Sun, 24 Mar 2024 05:07:04 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-515a81928a1so356343e87.3
 for <samba-technical@lists.samba.org>; Sat, 23 Mar 2024 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711256820; x=1711861620; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kcQ7aqapAzWh9V2jYgjZvNL++i4wCg6TaQgakyEunLo=;
 b=Gdio4oXQSTogB88UuQ/vWq5FCY8XC5GKtnVhx6mGoCLWjKoB6DonhhbjtYNg6bbR95
 c7lWwrNDG4EI+aSNrkcQWl+ztNTPKyGfE7NgyhY0C0cPkEWIlj7x2qhg/Q/DhGj4NnEV
 weMxlN6GT2mPCnmLEYbJ9bJgzwPto5dYF7GfP2wUN1nDxMqyuKwiT4eqqpjkwyZHXTxJ
 tmdvxfnQ8awjU8l9UOPxEYPZ4fNmDU3XKCrs2UBAO3lnlLqlqdJ2Eroia+5AjimUmgpb
 12WymfpEmhqVanJq2fO30YJUjol1ErPaPf8d/S57oekFigo6YiTRlOSVmIEKszxW65qj
 yySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711256820; x=1711861620;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcQ7aqapAzWh9V2jYgjZvNL++i4wCg6TaQgakyEunLo=;
 b=XvqYyY5C4wfOipcIynz45c8hWv9VL0JMxq5jAFPxaF0BQaJA7kzcuk/eP+RPTrVCFk
 8B88BXdgRTdriIUoSD+PTe3cP8ysSQh45EnIpX4EoO++iDdg/PxgPSjo1qz4EKWbaUSp
 uQzS4TAXSfPuBswOyVwrXTwAjSuGq+SxtFNN4r1lPZodFpNy/21a57AqFuZKhy7ZOJh8
 GvTdv1J7vywy4+h5b/pu1YW3RSC5YJy4x2C4Mq+53PW2O6QIG/e6v9pVej+eQx20+t9O
 IZLUas8A/9sK32tQy1gZzqung+eLdd4CglIGcKzo/ytYrPKwJ5AIew62zTgDuUgHBNJH
 2+lw==
X-Gm-Message-State: AOJu0Yzx/rYqRLDotlKHkl+u/CMsjNrPh6U52PlEL2VMF+d5oGfBcmTz
 vpEuSrRsJRspa9AnMXqTxKYImc40b0nOIk4ODBWuEs7i2PA16Q4uCtR+nMCPgzYm91hMVy5kDUc
 yxWm7IymeuCgSyK5XmMR28YAGNXM=
X-Google-Smtp-Source: AGHT+IEjiRV5XamzppIO6hae9gz9OzZSCuvxxDzciOqIO3plgnEYfQJ8Z1a7g7B/mvxwm+w4orKTmCSUKzZgcjakZUU=
X-Received: by 2002:a05:6512:715:b0:513:2f96:72b5 with SMTP id
 b21-20020a056512071500b005132f9672b5mr2482250lfs.33.1711256820226; Sat, 23
 Mar 2024 22:07:00 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 24 Mar 2024 00:06:49 -0500
Message-ID: <CAH2r5mu0HtRs_5hmKFLoh+OhWsHroAAHwvH51chaPJWWmpGPSg@mail.gmail.com>
Subject: [PATCH][SMB3 client] add trace event for mknod
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000e3fe3f06146106ee"
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
Cc: Paulo Alcantara <pc@manguebit.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000e3fe3f06146106ee
Content-Type: text/plain; charset="UTF-8"

See attached

Add trace points to help debug mknod and mkfifo:

   smb3_mknod_done
   smb3_mknod_enter
   smb3_mknod_err

Example output:

      TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
         | |         |   |||||     |         |
    mkfifo-6163    [003] .....   960.425558: smb3_mknod_enter: xid=12
sid=0xb55130f6 tid=0x46e6241c path=\fifo1
    mkfifo-6163    [003] .....   960.432719: smb3_mknod_done: xid=12
sid=0xb55130f6 tid=0x46e6241c


-- 
Thanks,

Steve

--000000000000e3fe3f06146106ee
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-add-trace-event-for-mknod.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-add-trace-event-for-mknod.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lu523hfx0>
X-Attachment-Id: f_lu523hfx0

RnJvbSBiZGEwYjA2YzAyNjNkNGQ0Mjk4OTEyNDgyNjc1MWQ5ZTdmYTgyOTc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMjQgTWFyIDIwMjQgMDA6MDE6MDIgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBhZGQgdHJhY2UgZXZlbnQgZm9yIG1rbm9kCgpBZGQgdHJhY2UgcG9pbnRzIHRvIGhlbHAg
ZGVidWcgbWtub2QgYW5kIG1rZmlmbzoKCiAgIHNtYjNfbWtub2RfZG9uZQogICBzbWIzX21rbm9k
X2VudGVyCiAgIHNtYjNfbWtub2RfZXJyCgpFeGFtcGxlIG91dHB1dDoKCiAgICAgIFRBU0stUElE
ICAgICBDUFUjICB8fHx8fCAgVElNRVNUQU1QICBGVU5DVElPTgogICAgICAgICB8IHwgICAgICAg
ICB8ICAgfHx8fHwgICAgIHwgICAgICAgICB8CiAgICBta2ZpZm8tNjE2MyAgICBbMDAzXSAuLi4u
LiAgIDk2MC40MjU1NTg6IHNtYjNfbWtub2RfZW50ZXI6IHhpZD0xMiBzaWQ9MHhiNTUxMzBmNiB0
aWQ9MHg0NmU2MjQxYyBwYXRoPVxmaWZvMQogICAgbWtmaWZvLTYxNjMgICAgWzAwM10gLi4uLi4g
ICA5NjAuNDMyNzE5OiBzbWIzX21rbm9kX2RvbmU6IHhpZD0xMiBzaWQ9MHhiNTUxMzBmNiB0aWQ9
MHg0NmU2MjQxYwoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3Nv
ZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvZGlyLmMgICB8IDcgKysrKysrKwogZnMvc21iL2Ns
aWVudC90cmFjZS5oIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2Rpci5jIGIvZnMvc21i
L2NsaWVudC9kaXIuYwppbmRleCA4OTMzM2Q5YmNlMzYuLmQxMWRjM2FhNDU4YiAxMDA2NDQKLS0t
IGEvZnMvc21iL2NsaWVudC9kaXIuYworKysgYi9mcy9zbWIvY2xpZW50L2Rpci5jCkBAIC02MTIs
MTEgKzYxMiwxOCBAQCBpbnQgY2lmc19ta25vZChzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwgc3Ry
dWN0IGlub2RlICppbm9kZSwKIAkJZ290byBta25vZF9vdXQ7CiAJfQogCisJdHJhY2Vfc21iM19t
a25vZF9lbnRlcih4aWQsIHRjb24tPnNlcy0+U3VpZCwgdGNvbi0+dGlkLCBmdWxsX3BhdGgpOwor
CiAJcmMgPSB0Y29uLT5zZXMtPnNlcnZlci0+b3BzLT5tYWtlX25vZGUoeGlkLCBpbm9kZSwgZGly
ZW50cnksIHRjb24sCiAJCQkJCSAgICAgICBmdWxsX3BhdGgsIG1vZGUsCiAJCQkJCSAgICAgICBk
ZXZpY2VfbnVtYmVyKTsKIAogbWtub2Rfb3V0OgorCWlmIChyYykKKwkJdHJhY2Vfc21iM19ta25v
ZF9lcnIoeGlkLCAgdGNvbi0+c2VzLT5TdWlkLCB0Y29uLT50aWQsIHJjKTsKKwllbHNlCisJCXRy
YWNlX3NtYjNfbWtub2RfZG9uZSh4aWQsIHRjb24tPnNlcy0+U3VpZCwgdGNvbi0+dGlkKTsKKwog
CWZyZWVfZGVudHJ5X3BhdGgocGFnZSk7CiAJZnJlZV94aWQoeGlkKTsKIAljaWZzX3B1dF90bGlu
ayh0bGluayk7CmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L3RyYWNlLmggYi9mcy9zbWIvY2xp
ZW50L3RyYWNlLmgKaW5kZXggZjljMWZkMzJkMGI4Li41ZTgzY2I5ZGE5MDIgMTAwNjQ0Ci0tLSBh
L2ZzL3NtYi9jbGllbnQvdHJhY2UuaAorKysgYi9mcy9zbWIvY2xpZW50L3RyYWNlLmgKQEAgLTM3
NSw2ICszNzUsNyBAQCBERUZJTkVfU01CM19JTkZfQ09NUE9VTkRfRU5URVJfRVZFTlQoZ2V0X3Jl
cGFyc2VfY29tcG91bmRfZW50ZXIpOwogREVGSU5FX1NNQjNfSU5GX0NPTVBPVU5EX0VOVEVSX0VW
RU5UKGRlbGV0ZV9lbnRlcik7CiBERUZJTkVfU01CM19JTkZfQ09NUE9VTkRfRU5URVJfRVZFTlQo
bWtkaXJfZW50ZXIpOwogREVGSU5FX1NNQjNfSU5GX0NPTVBPVU5EX0VOVEVSX0VWRU5UKHRkaXNf
ZW50ZXIpOworREVGSU5FX1NNQjNfSU5GX0NPTVBPVU5EX0VOVEVSX0VWRU5UKG1rbm9kX2VudGVy
KTsKIAogREVDTEFSRV9FVkVOVF9DTEFTUyhzbWIzX2luZl9jb21wb3VuZF9kb25lX2NsYXNzLAog
CVRQX1BST1RPKHVuc2lnbmVkIGludCB4aWQsCkBAIC00MTUsNyArNDE2LDcgQEAgREVGSU5FX1NN
QjNfSU5GX0NPTVBPVU5EX0RPTkVfRVZFTlQocXVlcnlfd3NsX2VhX2NvbXBvdW5kX2RvbmUpOwog
REVGSU5FX1NNQjNfSU5GX0NPTVBPVU5EX0RPTkVfRVZFTlQoZGVsZXRlX2RvbmUpOwogREVGSU5F
X1NNQjNfSU5GX0NPTVBPVU5EX0RPTkVfRVZFTlQobWtkaXJfZG9uZSk7CiBERUZJTkVfU01CM19J
TkZfQ09NUE9VTkRfRE9ORV9FVkVOVCh0ZGlzX2RvbmUpOwotCitERUZJTkVfU01CM19JTkZfQ09N
UE9VTkRfRE9ORV9FVkVOVChta25vZF9kb25lKTsKIAogREVDTEFSRV9FVkVOVF9DTEFTUyhzbWIz
X2luZl9jb21wb3VuZF9lcnJfY2xhc3MsCiAJVFBfUFJPVE8odW5zaWduZWQgaW50IHhpZCwKQEAg
LTQ2MSw2ICs0NjIsNyBAQCBERUZJTkVfU01CM19JTkZfQ09NUE9VTkRfRVJSX0VWRU5UKHF1ZXJ5
X3dzbF9lYV9jb21wb3VuZF9lcnIpOwogREVGSU5FX1NNQjNfSU5GX0NPTVBPVU5EX0VSUl9FVkVO
VChta2Rpcl9lcnIpOwogREVGSU5FX1NNQjNfSU5GX0NPTVBPVU5EX0VSUl9FVkVOVChkZWxldGVf
ZXJyKTsKIERFRklORV9TTUIzX0lORl9DT01QT1VORF9FUlJfRVZFTlQodGRpc19lcnIpOworREVG
SU5FX1NNQjNfSU5GX0NPTVBPVU5EX0VSUl9FVkVOVChta25vZF9lcnIpOwogCiAvKgogICogRm9y
IGxvZ2dpbmcgU01CMyBTdGF0dXMgY29kZSBhbmQgQ29tbWFuZCBmb3IgcmVzcG9uc2VzIHdoaWNo
IHJldHVybiBlcnJvcnMKLS0gCjIuNDAuMQoK
--000000000000e3fe3f06146106ee--

