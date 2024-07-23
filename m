Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1999939916
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jul 2024 07:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PqpSyzfOqfBgpniyCbv/7Z74nENzVCrnnHH4dQbwPEk=; b=BqioUYSo4v2y9MhHATXQDncXsL
	aAoG6HHRttlJfHJROUFz38fouQlliNSMFmBMx60Ba7Z0BNrbIcormGdx1jEITNOCrbjaLKiR97TEA
	bmu5iT3wk/qAAkL3lQtkq1O08TNVvHfJ4wEUDumwolW/39hwaBKRGFjQSn9maMsvHG1pfFb75Ihx9
	TzpqXMKrYMQ3el72nAXnGenL6b8VjHvdcFsKI4iFfV8vCyHx6rmC6cfEojC2pAAnek4EpQCOWFoiK
	ZJTV/UwXmuXXMNnCiDB89/i2NBj7DqH5JObFg29BNzer2ULtH87snt4ghbBvlSh2FHN8K8iw9DrTc
	BkR8eoaw==;
Received: from ip6-localhost ([::1]:44248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sW7ku-001Jdq-S5; Tue, 23 Jul 2024 05:08:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:56609) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sW7kp-001Jdh-DQ
 for samba-technical@lists.samba.org; Tue, 23 Jul 2024 05:08:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f024f468bso2787366e87.1
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2024 22:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721711282; x=1722316082; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PqpSyzfOqfBgpniyCbv/7Z74nENzVCrnnHH4dQbwPEk=;
 b=RXk6SG2Xwwf7nX0WdnSEeN8puTLpI+Nh6YnfDrgEBKiIQ2Zv49RZizWLz166rPTf5W
 sHqeKNd42rylCWsMyjS2Eh3ESxOmLQ3kWYwp9DINDunXc5WFNKMtlQ4lP+x70mNpeJYe
 y8p4PPcHegiNc/njhfrFOsMBy3oSt/h77V0rRmWADE/JH4q3k96eSKA76Cj86YCsecDk
 lFpT/JpqrARpnuapr/T9Y73Z02YQ8xmR5ySEyr6DFQflACXNLaER2OC9y1EkXAvF/xBw
 0isD92iIDb6aPkYmWbHNvo8+34jSVLZKhjEqx+glRSpAiiOta4E73ysMvNKAhN+fgQKp
 I+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721711282; x=1722316082;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqpSyzfOqfBgpniyCbv/7Z74nENzVCrnnHH4dQbwPEk=;
 b=jH0iM77VnD+M24Re/aK9kStkBx/BA24eUGFchp1bLL4wGdr5gsKfbhMYFaEWVQCu2N
 DvOdOC7kwV3+L6hNAjkxg1j2Xvt08wd/DGTP92mqr24dj1rHHMw1mxBm8n00xjj1T0c6
 TYAMNPJ7zCKoGDbk/hK5P0wYiwpDKQiimotvKFY2FMqNDgTwduBA9/eMt/AznLJ+aH9R
 TDpyqlT9lduQdhzAzD6sjY3cd0BPxksTdOkeScLmAtXvj3Vt0wI6V+jCxTOHdt8U+W+q
 4lZSVH9eJSnbqZPFnkS82ogud6AcogtRhVjN3QLt0lxjkgwVETZM/1kpRXQi5Lajgkmp
 BKxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsNp+7DGQfHbNuQ2Su4Keo1vVJE+btmlXff43ekOipLpNXXaWLryd2y9pYpUvWfPdCoQPPJygsSZHnYziuD6pj5HaUl4JMxc/mi71wZUBO
X-Gm-Message-State: AOJu0YxyQexvUkkVF2yt/LjFM1o/GrOwstARwby0NAQqVwY4ZHeZW9ZV
 E6f65x346xBa9JtDxa56NKzgcOOjNTw9077KWvXUlYnZXe8tfhl0cPdWleo5e7/RHSz9b1EuZwn
 BJtEzzk54MiZOtgxyJxudWPGLSPc=
X-Google-Smtp-Source: AGHT+IGFaeQAFoLrUxTqgAbwSwnExwQvEx8ysZRM+N6jejJsr3AfjoUEc5Fmt5oU6JOXIMqMqOS9LInBiS+YhWPdty4=
X-Received: by 2002:a05:6512:2209:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-52efb7e8103mr6118513e87.29.1721711281502; Mon, 22 Jul 2024
 22:08:01 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 23 Jul 2024 00:07:50 -0500
Message-ID: <CAH2r5mu2LTRDPX7KbM3V_d7FybuPnvCMRd6YV3__H-7mn1N9uA@mail.gmail.com>
Subject: [PATCH][CIFS] fix reconnect with SMB1 Unix Extensions
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>, 
 CIFS <linux-cifs@vger.kernel.org>, Kevin Ottens <kevin.ottens@enioka.com>
Content-Type: multipart/mixed; boundary="000000000000571cef061de3251f"
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
Cc: Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000571cef061de3251f
Content-Type: text/plain; charset="UTF-8"

Andrew had pointed out having problems with SMB1 Unix extensions to
Samba when investigating an unrelated problem, and when I tried it I
noticed a serious reconnect issue with the SMB1 Unix Extensions.

When mounting with the SMB1 Unix Extensions (e.g. mounts
to Samba with vers=1.0), cifs.ko reconnects no longer reset the
Unix Extensions (SetFSInfo SET_FILE_UNIX_BASIC) after tcon so most
operations (e.g. stat, ls, open, statfs) will fail continuously
with:
        "Operation not supported"
if the connection ever resets (e.g. due to brief network disconnect)

Fix attached



-- 
Thanks,

Steve

--000000000000571cef061de3251f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-fix-reconnect-with-SMB1-UNIX-Extensions.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-fix-reconnect-with-SMB1-UNIX-Extensions.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyxyflgw0>
X-Attachment-Id: f_lyxyflgw0

RnJvbSAyYTliM2ViMWIwODM4Y2M5OWFhZmRjNTBlMzcxMzg1MzhkNDU5M2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMjIgSnVsIDIwMjQgMjM6NDA6MDggLTA1MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBmaXggcmVjb25uZWN0IHdpdGggU01CMSBVTklYIEV4dGVuc2lvbnMKCldoZW4gbW91bnRp
bmcgd2l0aCB0aGUgU01CMSBVbml4IEV4dGVuc2lvbnMgKGUuZy4gbW91bnRzCnRvIFNhbWJhIHdp
dGggdmVycz0xLjApLCByZWNvbm5lY3RzIG5vIGxvbmdlciByZXNldCB0aGUKVW5peCBFeHRlbnNp
b25zIChTZXRGU0luZm8gU0VUX0ZJTEVfVU5JWF9CQVNJQykgYWZ0ZXIgdGNvbiBzbyBtb3N0Cm9w
ZXJhdGlvbnMgKGUuZy4gc3RhdCwgbHMsIG9wZW4sIHN0YXRmcykgd2lsbCBmYWlsIGNvbnRpbnVv
dXNseQp3aXRoOgogICAgICAgICJPcGVyYXRpb24gbm90IHN1cHBvcnRlZCIKaWYgdGhlIGNvbm5l
Y3Rpb24gZXZlciByZXNldHMgKGUuZy4gZHVlIHRvIGJyaWVmIG5ldHdvcmsgZGlzY29ubmVjdCkK
CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8
c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2Nvbm5lY3QuYyB8IDE1
ICsrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2Nvbm5lY3QuYyBiL2ZzL3NtYi9j
bGllbnQvY29ubmVjdC5jCmluZGV4IDdhMTZlMTJmNWRhOC4uYjY2ZDhiMDNhMzg5IDEwMDY0NAot
LS0gYS9mcy9zbWIvY2xpZW50L2Nvbm5lY3QuYworKysgYi9mcy9zbWIvY2xpZW50L2Nvbm5lY3Qu
YwpAQCAtMzgwNyw4ICszODA3LDIxIEBAIENJRlNUQ29uKGNvbnN0IHVuc2lnbmVkIGludCB4aWQs
IHN0cnVjdCBjaWZzX3NlcyAqc2VzLAogCQllbHNlCiAJCQl0Y29uLT5GbGFncyA9IDA7CiAJCWNp
ZnNfZGJnKEZZSSwgIlRjb24gZmxhZ3M6IDB4JXhcbiIsIHRjb24tPkZsYWdzKTsKLQl9CiAKKwkJ
LyoKKwkJICogcmVzZXRfY2lmc191bml4X2NhcHMgY2FsbHMgUUZTSW5mbyB3aGljaCByZXF1aXJl
cworCQkgKiBuZWVkX3JlY29ubmVjdCB0byBiZSBmYWxzZSwgYnV0IHdlIHdvdWxkIG5vdCBuZWVk
IHRvIGNhbGwKKwkJICogcmVzZXRfY2FwcyBpZiB0aGlzIHdlcmUgbm90IGEgcmVjb25uZWN0IGNh
c2Ugc28gbXVzdCBjaGVjaworCQkgKiBuZWVkX3JlY29ubmVjdCBmbGFnIGhlcmUuICBUaGUgY2Fs
bGVyIHdpbGwgYWxzbyBjbGVhcgorCQkgKiBuZWVkX3JlY29ubmVjdCB3aGVuIHRjb24gd2FzIHN1
Y2Nlc3NmdWwgYnV0IG5lZWRlZCB0byBiZQorCQkgKiBjbGVhcmVkIGVhcmxpZXIgaW4gdGhlIGNh
c2Ugb2YgdW5peCBleHRlbnNpb25zIHJlY29ubmVjdAorCQkgKi8KKwkJaWYgKHRjb24tPm5lZWRf
cmVjb25uZWN0ICYmIHRjb24tPnVuaXhfZXh0KSB7CisJCQljaWZzX2RiZyhGWUksICJyZXNldHRp
bmcgY2FwcyBmb3IgJXNcbiIsIHRjb24tPnRyZWVfbmFtZSk7CisJCQl0Y29uLT5uZWVkX3JlY29u
bmVjdCA9IGZhbHNlOworCQkJcmVzZXRfY2lmc191bml4X2NhcHMoeGlkLCB0Y29uLCBOVUxMLCBO
VUxMKTsKKwkJfQorCX0KIAljaWZzX2J1Zl9yZWxlYXNlKHNtYl9idWZmZXIpOwogCXJldHVybiBy
YzsKIH0KLS0gCjIuNDMuMAoK
--000000000000571cef061de3251f--

