Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08883939980
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jul 2024 07:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Eyg85J8K9ihH82p0hRx+2qtj9MLkxnAavrxsh5Wv+NE=; b=yRt4LMdSv4vTr7QxZHfnjX9soT
	WoY/PrO2DduQMTCLdcHBuY79kUx22mXkOZomqt/gKRA4GziwgO5RvDWAyA6X8ezZFYTNK+HasZ7Sz
	EMQyGnnsSOUmUUHDk0rV0PqnIVDAJMVLMkGO40Hh1DclAaOgw8Lx+6invhJz2HzN6TKbpS1RVj8Tq
	4xCzFaVBMLr/kHCW2UeIRBnFmcNod3V4t7cgueXOvZkx0wAOLvub3AlEpH2ofxZ32lQlje4Yz5dHH
	4xmDIeCO8G5GezPxveqotXql+UdsjzhLSYcWyqP2JSOrpbQNMZkhHxGQVd522stLei/L37NqZDr5K
	dbIFPShg==;
Received: from ip6-localhost ([::1]:61058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sW8Vl-001Jow-25; Tue, 23 Jul 2024 05:56:33 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:57414) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sW8Vg-001Jop-DF
 for samba-technical@lists.samba.org; Tue, 23 Jul 2024 05:56:30 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52efaae7edfso2243671e87.2
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2024 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721714187; x=1722318987; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Eyg85J8K9ihH82p0hRx+2qtj9MLkxnAavrxsh5Wv+NE=;
 b=c2jt9eZf2ob8c4y+4gj5ew1uLp8MKY+AQdHbgh2EbNP0fkM59DVUu7OLcrcD4J40EF
 H5FlxHHBWfArNsA2jZ7KvvZrJrbZejnDad/OyKCxMyN4S4AaRm8snKz7AT6+iLasqWlW
 9h15D/HtRNIvNrJ4EYoocRNa1+ssUeFKbZe5yIDrbWmFgWUqkTrZIH9YjM9BaipRlqYp
 sJHLGG+YsXXSoUORfBOpqmibSMydQzItjUliy2WVh64MEfmKWXD2jdtZvzhel/xaLckY
 lw8oF9MgSe5gk7p1d27lrf0bU/gFnO2TuHplKMFWqV8vsiABrnv6GNMB5vg11IMx2+HX
 oHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721714187; x=1722318987;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eyg85J8K9ihH82p0hRx+2qtj9MLkxnAavrxsh5Wv+NE=;
 b=TxdS9ywyj7rv4mXimrjqgdkqAiB07Iil1iQkoOO2jf38Y562vxr3PxLOl1Cdnq/EBE
 aemKKb2DvQPyS2emKWFdiht0SxU3b3CKvWLomn+yHwRmFAW1smWLDDLcyI/8544cuEwc
 pyrNIc9Qe/oS10bdESPLbDeTsYEosuzryXs1b5sb9YVIwRDN9VWTL4dvejp82t42oBIs
 RYAkkg3H4gm/JYLVPiRJ2m/ngvZ4ydXnorp75jbjuhHa+zSipa4AK8enRFGDboxEf6Cg
 +qQbJLMP2uuVfYK6E2e17StZp7bSMlAivWBVNX2jjQkLPgMs7/3YJjrgUWbiFhQDT/9F
 6o7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9bUTJfTICHZj7jEFDMUC7zAlCldh+dpyE+0venUmHWaNSnJJ0k/2A5S5BM105QV5RFbLPDq5z4ci4Xau4Yk6QHDV/TuprzgmOn38gLqic
X-Gm-Message-State: AOJu0Ywf47DPO+Jh++RXZ6IoEtZDub4QDFu3BHWqFp76pCVs6zAiIXnh
 CGikfVQbYrNS/5UL+TVpB+51qO5CcJje8O13KFu5+Ix53Vv5ZVdEBEEzi9vn3b6BRnxZJB6iyWD
 N5/yitS7DyzXgFXMLHJ1db2VsRyk=
X-Google-Smtp-Source: AGHT+IE7ebaVGF0FCj1gjWT7OgagQGgXPXNxI8yTB+YxqCDVea1beFx94JHCQNlZ3cG/eqoEhJFuvr91vfrvReVtKR8=
X-Received: by 2002:a05:6512:2209:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-52efb7e8103mr6190757e87.29.1721714186771; Mon, 22 Jul 2024
 22:56:26 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 23 Jul 2024 00:56:15 -0500
Message-ID: <CAH2r5mse9o8tuS9UM9soq02MwweULT9KnUxOzoBHEirHxB3Gog@mail.gmail.com>
Subject: [PATCH][CIFS] mount with "unix" mount option for SMB1 incorrectly
 handled
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>, 
 Kevin Ottens <kevin.ottens@enioka.com>
Content-Type: multipart/mixed; boundary="00000000000081fa73061de3d20d"
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

--00000000000081fa73061de3d20d
Content-Type: text/plain; charset="UTF-8"

When Andrew Bartlett mentioned problems using the SMB1 Unix Extensions to Samba
I noticed a couple of client bugs.  This fixes the second problem I noticed.

Although by default we negotiate CIFS Unix Extensions for SMB1 mounts
to Samba (and they work if the user does not specify "unix" or "posix"
or "linux" on mount), and we do properly handle when a user turns them
off with "nounix" mount parm, ... but with the  changes to the mount
API we broke cases where the user explicitly specified the "unix"
option (or equivalently "linux" or "posix") on mount with vers=1.0 to
Samba or other servers which support the CIFS Unix Extensions.

   "mount error(95): Operation not supported"

and logged:

   "CIFS: VFS: Check vers= mount option. SMB3.11 disabled but required
for POSIX extensions"

even though CIFS Unix Extensions are supported for vers=1.0  This
patch fixes the case where the user specifies both "unix" (or
equivalently "posix" or "linux") and "vers=1.0" on mount to a server
which supports the CIFS Unix Extensions.

See attached

-- 
Thanks,

Steve

--00000000000081fa73061de3d20d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-mount-with-unix-mount-option-for-SMB1-incorrect.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-mount-with-unix-mount-option-for-SMB1-incorrect.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyy03ev00>
X-Attachment-Id: f_lyy03ev00

RnJvbSA2YmUzNmVlMGFjY2VlZjAzYWI2MTk4NTc4NmNhMjM4YTEzMjcyMWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMjMgSnVsIDIwMjQgMDA6NDQ6NDggLTA1MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBtb3VudCB3aXRoICJ1bml4IiBtb3VudCBvcHRpb24gZm9yIFNNQjEgaW5jb3JyZWN0bHkK
IGhhbmRsZWQKCkFsdGhvdWdoIGJ5IGRlZmF1bHQgd2UgbmVnb3RpYXRlIENJRlMgVW5peCBFeHRl
bnNpb25zIGZvciBTTUIxIG1vdW50cyB0bwpTYW1iYSAoYW5kIHRoZXkgd29yayBpZiB0aGUgdXNl
ciBkb2VzIG5vdCBzcGVjaWZ5ICJ1bml4IiBvciAicG9zaXgiIG9yCiJsaW51eCIgb24gbW91bnQp
LCBhbmQgd2UgZG8gcHJvcGVybHkgaGFuZGxlIHdoZW4gYSB1c2VyIHR1cm5zIHRoZW0gb2ZmCndp
dGggIm5vdW5peCIgbW91bnQgcGFybS4gIEJ1dCB3aXRoIHRoZSBjaGFuZ2VzIHRvIHRoZSBtb3Vu
dCBBUEkgd2UKYnJva2UgY2FzZXMgd2hlcmUgdGhlIHVzZXIgZXhwbGljaXRseSBzcGVjaWZpZXMg
dGhlICJ1bml4IiBvcHRpb24gKG9yCmVxdWl2YWxlbnRseSAibGludXgiIG9yICJwb3NpeCIpIG9u
IG1vdW50IHdpdGggdmVycz0xLjAgdG8gU2FtYmEgb3Igb3RoZXIKc2VydmVycyB3aGljaCBzdXBw
b3J0IHRoZSBDSUZTIFVuaXggRXh0ZW5zaW9ucy4KCiAibW91bnQgZXJyb3IoOTUpOiBPcGVyYXRp
b24gbm90IHN1cHBvcnRlZCIKCmFuZCBsb2dnZWQ6CgogIkNJRlM6IFZGUzogQ2hlY2sgdmVycz0g
bW91bnQgb3B0aW9uLiBTTUIzLjExIGRpc2FibGVkIGJ1dCByZXF1aXJlZCBmb3IgUE9TSVggZXh0
ZW5zaW9ucyIKCmV2ZW4gdGhvdWdoIENJRlMgVW5peCBFeHRlbnNpb25zIGFyZSBzdXBwb3J0ZWQg
Zm9yIHZlcnM9MS4wICBUaGlzIHBhdGNoIGZpeGVzCnRoZSBjYXNlIHdoZXJlIHRoZSB1c2VyIHNw
ZWNpZmllcyBib3RoICJ1bml4IiAob3IgZXF1aXZhbGVudGx5ICJwb3NpeCIgb3IKImxpbnV4Iikg
YW5kICJ2ZXJzPTEuMCIgb24gbW91bnQgdG8gYSBzZXJ2ZXIgd2hpY2ggc3VwcG9ydHMgdGhlCkNJ
RlMgVW5peCBFeHRlbnNpb25zLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9m
Zi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9j
bGllbnQvY29ubmVjdC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jb25uZWN0LmMgYi9mcy9zbWIvY2xpZW50
L2Nvbm5lY3QuYwppbmRleCBiNjZkOGIwM2EzODkuLmMzZDhkN2I3YjQ2YSAxMDA2NDQKLS0tIGEv
ZnMvc21iL2NsaWVudC9jb25uZWN0LmMKKysrIGIvZnMvc21iL2NsaWVudC9jb25uZWN0LmMKQEAg
LTI2MTQsNiArMjYxNCwxMyBAQCBjaWZzX2dldF90Y29uKHN0cnVjdCBjaWZzX3NlcyAqc2VzLCBz
dHJ1Y3Qgc21iM19mc19jb250ZXh0ICpjdHgpCiAJCQljaWZzX2RiZyhWRlMsICJTZXJ2ZXIgZG9l
cyBub3Qgc3VwcG9ydCBtb3VudGluZyB3aXRoIHBvc2l4IFNNQjMuMTEgZXh0ZW5zaW9uc1xuIik7
CiAJCQlyYyA9IC1FT1BOT1RTVVBQOwogCQkJZ290byBvdXRfZmFpbDsKKwkJfSBlbHNlIGlmIChz
ZXMtPnNlcnZlci0+dmFscy0+cHJvdG9jb2xfaWQgPT0gU01CMTBfUFJPVF9JRCkKKwkJCWlmIChj
YXBfdW5peChzZXMpKQorCQkJCWNpZnNfZGJnKEZZSSwgIlVuaXggRXh0ZW5zaW9ucyByZXF1ZXN0
ZWQgb24gU01CMSBtb3VudFxuIik7CisJCQllbHNlIHsKKwkJCQljaWZzX2RiZyhWRlMsICJTTUIx
IFVuaXggRXh0ZW5zaW9ucyBub3Qgc3VwcG9ydGVkIGJ5IHNlcnZlclxuIik7CisJCQkJcmMgPSAt
RU9QTk9UU1VQUDsKKwkJCQlnb3RvIG91dF9mYWlsOwogCQl9IGVsc2UgewogCQkJY2lmc19kYmco
VkZTLAogCQkJCSJDaGVjayB2ZXJzPSBtb3VudCBvcHRpb24uIFNNQjMuMTEgZGlzYWJsZWQgYnV0
IHJlcXVpcmVkIGZvciBQT1NJWCBleHRlbnNpb25zXG4iKTsKLS0gCjIuNDMuMAoK
--00000000000081fa73061de3d20d--

