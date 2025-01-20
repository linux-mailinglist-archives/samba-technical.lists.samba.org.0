Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91AA16534
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2025 02:49:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Xf98GyAdie4SfKgORppb7AAbGu2pyVw7mK348IGm1GY=; b=O18HyeDQUT1DOGHRE55JF9T5rJ
	RGdHAWfQf3nyRROsozqfUE2WiVj5ceQrF5H+cAjWxYhvU9aLIBeOyaq/w4iAq0bR+PLZdVXwJOtjl
	g0LbTdzMeZyoC4JxxKA0h/HVUWuLDkrXAvzAgwdDdRqrdy26asyXGathL0gxDGH4D56jNIqzAAtO5
	pd+mkOB6C5YGHqfHvoQu66eOm+CbO7ddD13QDVMwpjwSPSZMVJHnHb4GjfwNlBtLtLoXzQfWc5WoI
	fbLtTunCvNXlKCZIbLasFoLIbO44VTrTCNPIGP8fmz1EqW2LR9E5ri1ecoJ1AlDpHXiERKtt4mS2U
	9c9sn9bw==;
Received: from ip6-localhost ([::1]:46462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tZguP-008gIY-U7; Mon, 20 Jan 2025 01:48:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:56709) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZguL-008gIR-1c
 for samba-technical@lists.samba.org; Mon, 20 Jan 2025 01:48:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53e399e3310so4128330e87.1
 for <samba-technical@lists.samba.org>; Sun, 19 Jan 2025 17:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737337731; x=1737942531; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Xf98GyAdie4SfKgORppb7AAbGu2pyVw7mK348IGm1GY=;
 b=ZAj8pnDj6GFzO/OkPm6D0oPVvdGF5ylygcXQWhknIIXHzX+J8ThpZbZTmHddQUV9XR
 zHHgH+AqKANnsanTqZBUWA/td3Wpizl9XGbV87PFyrpf6DpGIakLL6VA6lo03EY1jSRZ
 7BAgnJEy4ZyHmpfOvnuXl2G0v4thmimgBykDsPfkNJY/htbhW5ARUb6qGNq0ImlTnjsB
 SXuZrrodgrnP+7+ToA53kJYb5tJRxav0bEurS3RcL9kwxaRtGTlLR6eTZ43V4z3LemM3
 H7UprKGm8SyIZPn6c5722iO7uK2mj/0lNxFFqwjf4WMrbdswBSYqmWc+S9NGW6BSFdUC
 uBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737337731; x=1737942531;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xf98GyAdie4SfKgORppb7AAbGu2pyVw7mK348IGm1GY=;
 b=o8Ah5rahAyTdlDZl8rjZWMhUaz+cYytOA3A/rpPeJcdCnBpECzgP2X6SQpDgqrFA/A
 x/p4x2P7ePV4s+vXEzSaiFKC2zh/b2keLNVw8OPsJU3J0jSzt65rRtYG1fsugg/AbU80
 r6qtbJp2pDoPYoLrD0XT7D9gUZzOOAniaNw+d2Pn0NjHkJPZUsegGIbgIt6S+e3BnY4H
 LKH0CM09nr8GRnVOjJvluH1PUySdC4MbajfeoxsZ/qLNM4yfvWEeymTBa3BRgfDtWF7U
 2MBro806gKNnjF1EJsYzuaBo1mAfAxg3B6oVGZCWsMm1ndy1fQU8luFr5C8nEJzk/eMA
 qrMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLZqugMVRe1O02oainIVwIl2PKtD5KHOWfvwTzyfQQRf41oNEmfkyvHtM/jSmzZZzlOgy1w5sF/MfdmFQPwRc=@lists.samba.org
X-Gm-Message-State: AOJu0Yzto+vrP0TfANhpri7Oiuf517p8jLcr+j75EcjXZsgZv1b0zVX5
 wMX/Sm3A1HmezysrAT+5Fnjzk8m796I1yQuaKdAHY0n85ZQ7ONKlR+Bu5U6v4RztHNE4uC7J2g6
 MZ5hL4lrOARa+PgorAN9hXnFn5lfx7y5A
X-Gm-Gg: ASbGncuLo2UL2AbsTcN4fzIl5ZnUNSl56yRn05vCwmYUFi/blQ1J+OzJoxexNF1BNC7
 1WVid8/L1iY+h9lJo158G+o/PTtLi0pVKsoG00UZjAqWIwNt65F+pRwQ6Moq2sd3ecBvyn53D1q
 06FF81MT7WVw==
X-Google-Smtp-Source: AGHT+IGhzzP4UeBXT/UJ94U+n35AkpNQwT4Noc9VZmppWWbMvGX8wcZZxe6rwLgwn7aLKUIrbQaWsMpTwCW38Oj2540=
X-Received: by 2002:a05:6512:b99:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-5439c269828mr4346250e87.35.1737337731029; Sun, 19 Jan 2025
 17:48:51 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 19:48:39 -0600
X-Gm-Features: AbW1kvalQ7S0BwkX_MDoPIG6gfucAW2tRl1os7vF-9fgMOfCVSnQda0-OfFSwd8
Message-ID: <CAH2r5msUp2xqY062MRRXkNApwekZ_CJYL3q_J0boGFPzw4W1LQ@mail.gmail.com>
Subject: [PATCH] cifs: Fix printing Status code into dmesg
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000005043ce062c1976bc"
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005043ce062c1976bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any thoughts on the attached patch (which is tentatively in
cifs-2.6.git for-next)?

NT Status code is 32-bit number, so for comparing two NT Status codes is
needed to check all 32 bits, and not just low 24 bits.

Before this change kernel printed message:
"Status code returned 0x8000002d NT_STATUS_NOT_COMMITTED"

It was incorrect as because NT_STATUS_NOT_COMMITTED is defined as
0xC000002d and 0x8000002d has defined name NT_STATUS_STOPPED_ON_SYMLINK.

With this change kernel prints message:
"Status code returned 0x8000002d NT_STATUS_STOPPED_ON_SYMLINK"

Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>


--=20
Thanks,

Steve

--0000000000005043ce062c1976bc
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0042-cifs-Fix-printing-Status-code-into-dmesg.patch"
Content-Disposition: attachment; 
	filename="0042-cifs-Fix-printing-Status-code-into-dmesg.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m64e02zn0>
X-Attachment-Id: f_m64e02zn0

RnJvbSA2ZmE5ZDhhM2NiMjFmZjIxZGJmYTU3NTU1ZjZhNDE2MTViODI5NTI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/UGFsaT0yMFJvaD1DMz1BMXI/PSA8cGFsaUBr
ZXJuZWwub3JnPgpEYXRlOiBUaHUsIDI2IERlYyAyMDI0IDE0OjI3OjE2ICswMTAwClN1YmplY3Q6
IFtQQVRDSCA0Mi83MV0gY2lmczogRml4IHByaW50aW5nIFN0YXR1cyBjb2RlIGludG8gZG1lc2cK
TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCk5UIFN0YXR1cyBjb2RlIGlzIDMyLWJp
dCBudW1iZXIsIHNvIGZvciBjb21wYXJpbmcgdHdvIE5UIFN0YXR1cyBjb2RlcyBpcwpuZWVkZWQg
dG8gY2hlY2sgYWxsIDMyIGJpdHMsIGFuZCBub3QganVzdCBsb3cgMjQgYml0cy4KCkJlZm9yZSB0
aGlzIGNoYW5nZSBrZXJuZWwgcHJpbnRlZCBtZXNzYWdlOgoiU3RhdHVzIGNvZGUgcmV0dXJuZWQg
MHg4MDAwMDAyZCBOVF9TVEFUVVNfTk9UX0NPTU1JVFRFRCIKCkl0IHdhcyBpbmNvcnJlY3QgYXMg
YmVjYXVzZSBOVF9TVEFUVVNfTk9UX0NPTU1JVFRFRCBpcyBkZWZpbmVkIGFzCjB4QzAwMDAwMmQg
YW5kIDB4ODAwMDAwMmQgaGFzIGRlZmluZWQgbmFtZSBOVF9TVEFUVVNfU1RPUFBFRF9PTl9TWU1M
SU5LLgoKV2l0aCB0aGlzIGNoYW5nZSBrZXJuZWwgcHJpbnRzIG1lc3NhZ2U6CiJTdGF0dXMgY29k
ZSByZXR1cm5lZCAweDgwMDAwMDJkIE5UX1NUQVRVU19TVE9QUEVEX09OX1NZTUxJTksiCgpTaWdu
ZWQtb2ZmLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgotLS0KIGZzL3NtYi9jbGll
bnQvbmV0bWlzYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvbmV0bWlzYy5jIGIvZnMv
c21iL2NsaWVudC9uZXRtaXNjLmMKaW5kZXggMGZmM2NjYzdhMzU2Li40ODMyYmM5ZGE1OTggMTAw
NjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvbmV0bWlzYy5jCisrKyBiL2ZzL3NtYi9jbGllbnQvbmV0
bWlzYy5jCkBAIC03NzUsMTAgKzc3NSwxMCBAQCBjaWZzX3ByaW50X3N0YXR1cyhfX3UzMiBzdGF0
dXNfY29kZSkKIAlpbnQgaWR4ID0gMDsKIAogCXdoaWxlIChudF9lcnJzW2lkeF0ubnRfZXJyc3Ry
ICE9IE5VTEwpIHsKLQkJaWYgKCgobnRfZXJyc1tpZHhdLm50X2VycmNvZGUpICYgMHhGRkZGRkYp
ID09Ci0JCSAgICAoc3RhdHVzX2NvZGUgJiAweEZGRkZGRikpIHsKKwkJaWYgKG50X2VycnNbaWR4
XS5udF9lcnJjb2RlID09IHN0YXR1c19jb2RlKSB7CiAJCQlwcl9ub3RpY2UoIlN0YXR1cyBjb2Rl
IHJldHVybmVkIDB4JTA4eCAlc1xuIiwKIAkJCQkgIHN0YXR1c19jb2RlLCBudF9lcnJzW2lkeF0u
bnRfZXJyc3RyKTsKKwkJCXJldHVybjsKIAkJfQogCQlpZHgrKzsKIAl9Ci0tIAoyLjQzLjAKCg==
--0000000000005043ce062c1976bc--

