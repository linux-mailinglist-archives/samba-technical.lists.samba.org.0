Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 966047D075B
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 06:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cJ8v4thUWvHEDZGBSVKt08OJQRuQ1zq3oUS8VnC3WW8=; b=0pkR53N8cmP8emU2nGrzOgXUVm
	wLNPqE7+w+2UQgJJsr1elzDa7zvB7Jnvbefj7McLbK1jSJv3cuVhj4Z04Voe2N435pQ6UnHyYND3i
	PGQETqRepqEZ6t0QoUIFGh01OE3Lp1Lp5uzyCO0NOwDSkchWhJrg7eCabaAe4VQxP43vZiVma6JEu
	TJuC7WQeQvjgCjZGjTcrCMynaVKhjigzkNZLTOssO9FNSUtAfExTXIFnF5Q83He/eL+ENUeWB2hyY
	YrXA0egKSt0eGAWl8UV6h1qJ76tFIUrI06I0MrN2KYSXwf3kQJdKnktsAAGN3J9zggkBpYnlhVAHc
	MwpJmUXw==;
Received: from ip6-localhost ([::1]:44186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qthBs-001SQX-9i; Fri, 20 Oct 2023 04:32:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:46146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qthBm-001SQO-2V
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 04:32:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507a98517f3so476090e87.0
 for <samba-technical@lists.samba.org>; Thu, 19 Oct 2023 21:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697776364; x=1698381164; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cJ8v4thUWvHEDZGBSVKt08OJQRuQ1zq3oUS8VnC3WW8=;
 b=lqw3a0Rkt1AxMjoAxWxQMxZj+asV/JQtNmJf1TLnI01bSR5XStevUcI3tJv1T1KG8j
 20TLfhKHoAR2SnSb3dhZzXCSSqNR89AFeMoEq5rwd70SG4hVhPxcNzcRW8ksmNctvG/d
 8sKGJXEKw1e3G4SLeEQllAV0TlwEWjqvNsVvhcSQuQYn6XKdAS8dF2AuBLysAqSI3wfB
 9lgEyEIswy3Gr7d7Iv9DR8BeIUAumW7vPb3hhZ3ceq5MGND5XGlb5BAAmkNN+QWEBfs3
 I0CoCoHYk6m2An6i9sbiZRCkwrzgeQiy5nOEx0je5PzXHlbdJ45d58u77grPcPbyC9r0
 lNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697776364; x=1698381164;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJ8v4thUWvHEDZGBSVKt08OJQRuQ1zq3oUS8VnC3WW8=;
 b=E8qr8IPT+lI8bWUwRfSvpt4iptQJRYk5pDTNwQCHcIk0EF00lZxMP+MDHHZ9i5hs/I
 XZnsbqq0JfPjFKBK+IvyxvhjdTz0NKXlf92JstlbU0Yl3LKzGSm31LK9mvC+gnvQoRTy
 YqFWLqdEdsnmkCBQUIpuHeOt7L8IWOfFYhEHUc+ko2tia899JlCITbd+8cUhw1xV0mk3
 kobDM7+Wqc1X9xtM1EwKHqU8fAmGS3pYV64hO+5/9QRIkAO2WDvzIxJJsQKz0CMy15Q1
 XYYeLDen7r0MQLcflY9T3HTBk6xwZN15MK2FKO6aNIzm3tg4KmzrsNIEs+or/D5TBHZr
 q5Gg==
X-Gm-Message-State: AOJu0Yzxs0O6bWeX+twsrBK65A1UVv28vMP1kD6LCww3+JkAK/JrleLq
 XNe3arQTzjhNhvmubwZ/+7v+VfRtQaIHXpUSnGM=
X-Google-Smtp-Source: AGHT+IGOTp69NW4A0m+s+fQ2mKgb9bjJnQ0wIIGs9YAWSl20SJpg6PtVkApnjMt1DQrniZvXq0BsY77uLtNki/boFsc=
X-Received: by 2002:ac2:5548:0:b0:507:9996:f62b with SMTP id
 l8-20020ac25548000000b005079996f62bmr395168lfk.56.1697776363599; Thu, 19 Oct
 2023 21:32:43 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 23:32:32 -0500
Message-ID: <CAH2r5mvve4euMUqsBBqRr2VWgz7ukEZ15vZRVDO=zbzY=XhF1Q@mail.gmail.com>
Subject: [PATCH][CIFS] allow creating FIFOs when "sfu" mount option specified
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000000f92e306081e5d0b"
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000000f92e306081e5d0b
Content-Type: text/plain; charset="UTF-8"

mb3: fix creating FIFOs when mounting with "sfu" mount
 option

Fixes some xfstests including generic/564 and generic/157

The "sfu" mount option can be useful for creating special files (character
and block devices in particular) but could not create FIFOs. It did
recognize existing empty files with the "system" attribute flag as FIFOs
but this is too general, so to support creating FIFOs more safely use a new
tag (but the same length as those for char and block devices ie "IntxLNK"
and "IntxBLK") "LnxFIFO" to indicate that the file should be treated as a
FIFO (when mounted with the "sfu").   For some additional context note that
"sfu" followed the way that "Services for Unix" on Windows handled these
special files (at least for character and block devices and symlinks),
which is different than newer Windows which can handle special files
as reparse points (which isn't an option to many servers).

See attached.

-- 
Thanks,

Steve

--0000000000000f92e306081e5d0b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-fix-creating-FIFOs-when-mounting-with-sfu-mount.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-creating-FIFOs-when-mounting-with-sfu-mount.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lny46ebi0>
X-Attachment-Id: f_lny46ebi0

RnJvbSBhNzg4ZGUzMjUyNTUyYWJlYWNiNzU3ZjU1NDczMTZjZWQ3MTcwOTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgMTkgT2N0IDIwMjMgMjM6MDE6NDkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBmaXggY3JlYXRpbmcgRklGT3Mgd2hlbiBtb3VudGluZyB3aXRoICJzZnUiIG1vdW50CiBv
cHRpb24KCkZpeGVzIHNvbWUgeGZzdGVzdHMgaW5jbHVkaW5nIGdlbmVyaWMvNTY0IGFuZCBnZW5l
cmljLzE1NwoKVGhlICJzZnUiIG1vdW50IG9wdGlvbiBjYW4gYmUgdXNlZnVsIGZvciBjcmVhdGlu
ZyBzcGVjaWFsIGZpbGVzIChjaGFyYWN0ZXIKYW5kIGJsb2NrIGRldmljZXMgaW4gcGFydGljdWxh
cikgYnV0IGNvdWxkIG5vdCBjcmVhdGUgRklGT3MuIEl0IGRpZApyZWNvZ25pemUgZXhpc3Rpbmcg
ZW1wdHkgZmlsZXMgd2l0aCB0aGUgInN5c3RlbSIgYXR0cmlidXRlIGZsYWcgYXMgRklGT3MKYnV0
IHRoaXMgaXMgdG9vIGdlbmVyYWwsIHNvIHRvIHN1cHBvcnQgY3JlYXRpbmcgRklGT3MgbW9yZSBz
YWZlbHkgdXNlIGEgbmV3CnRhZyAoYnV0IHRoZSBzYW1lIGxlbmd0aCBhcyB0aG9zZSBmb3IgY2hh
ciBhbmQgYmxvY2sgZGV2aWNlcyBpZSAiSW50eExOSyIKYW5kICJJbnR4QkxLIikgIkxueEZJRk8i
IHRvIGluZGljYXRlIHRoYXQgdGhlIGZpbGUgc2hvdWxkIGJlIHRyZWF0ZWQgYXMgYQpGSUZPICh3
aGVuIG1vdW50ZWQgd2l0aCB0aGUgInNmdSIpLiAgIEZvciBzb21lIGFkZGl0aW9uYWwgY29udGV4
dCBub3RlIHRoYXQKInNmdSIgZm9sbG93ZWQgdGhlIHdheSB0aGF0ICJTZXJ2aWNlcyBmb3IgVW5p
eCIgb24gV2luZG93cyBoYW5kbGVkIHRoZXNlCnNwZWNpYWwgZmlsZXMgKGF0IGxlYXN0IGZvciBj
aGFyYWN0ZXIgYW5kIGJsb2NrIGRldmljZXMgYW5kIHN5bWxpbmtzKSwKd2hpY2ggaXMgZGlmZmVy
ZW50IHRoYW4gbmV3ZXIgV2luZG93cyB3aGljaCBjYW4gaGFuZGxlIHNwZWNpYWwgZmlsZXMKYXMg
cmVwYXJzZSBwb2ludHMgKHdoaWNoIGlzbid0IGFuIG9wdGlvbiB0byBtYW55IHNlcnZlcnMpLgoK
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxz
dGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvY2lmc3BkdS5oIHwgMiAr
LQogZnMvc21iL2NsaWVudC9pbm9kZS5jICAgfCA0ICsrKysKIGZzL3NtYi9jbGllbnQvc21iMm9w
cy5jIHwgOCArKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY2lmc3BkdS5oIGIvZnMvc21i
L2NsaWVudC9jaWZzcGR1LmgKaW5kZXggZTE3MjIyZmVjOWQyLi5hNzUyMjBkYjVjMWUgMTAwNjQ0
Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY2lmc3BkdS5oCisrKyBiL2ZzL3NtYi9jbGllbnQvY2lmc3Bk
dS5oCkBAIC0yNTcwLDcgKzI1NzAsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAKIAogc3RydWN0IHdp
bl9kZXYgewotCXVuc2lnbmVkIGNoYXIgdHlwZVs4XTsgLyogSW50eENIUiBvciBJbnR4QkxLICov
CisJdW5zaWduZWQgY2hhciB0eXBlWzhdOyAvKiBJbnR4Q0hSIG9yIEludHhCTEsgb3IgTG54RklG
TyovCiAJX19sZTY0IG1ham9yOwogCV9fbGU2NCBtaW5vcjsKIH0gX19hdHRyaWJ1dGVfXygocGFj
a2VkKSk7CmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2lub2RlLmMgYi9mcy9zbWIvY2xpZW50
L2lub2RlLmMKaW5kZXggZDdjMzAyNDQyYzFlLi5jMDNhMjg2ZWQ0MTggMTAwNjQ0Ci0tLSBhL2Zz
L3NtYi9jbGllbnQvaW5vZGUuYworKysgYi9mcy9zbWIvY2xpZW50L2lub2RlLmMKQEAgLTU5Miw2
ICs1OTIsMTAgQEAgY2lmc19zZnVfdHlwZShzdHJ1Y3QgY2lmc19mYXR0ciAqZmF0dHIsIGNvbnN0
IGNoYXIgKnBhdGgsCiAJCQljaWZzX2RiZyhGWUksICJTeW1saW5rXG4iKTsKIAkJCWZhdHRyLT5j
Zl9tb2RlIHw9IFNfSUZMTks7CiAJCQlmYXR0ci0+Y2ZfZHR5cGUgPSBEVF9MTks7CisJCX0gZWxz
ZSBpZiAobWVtY21wKCJMbnhGSUZPIiwgcGJ1ZiwgOCkgPT0gMCkgeworCQkJY2lmc19kYmcoRllJ
LCAiRklGT1xuIik7CisJCQlmYXR0ci0+Y2ZfbW9kZSB8PSBTX0lGSUZPOworCQkJZmF0dHItPmNm
X2R0eXBlID0gRFRfRklGTzsKIAkJfSBlbHNlIHsKIAkJCWZhdHRyLT5jZl9tb2RlIHw9IFNfSUZS
RUc7IC8qIGZpbGU/ICovCiAJCQlmYXR0ci0+Y2ZfZHR5cGUgPSBEVF9SRUc7CmRpZmYgLS1naXQg
YS9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYyBiL2ZzL3NtYi9jbGllbnQvc21iMm9wcy5jCmluZGV4
IDlhZWVjZWU2YjkxYi4uMjg5ODVkYzgxYzA5IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L3Nt
YjJvcHMuYworKysgYi9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYwpAQCAtNTA4Nyw3ICs1MDg3LDcg
QEAgc21iMl9tYWtlX25vZGUodW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGlub2RlICppbm9kZSwK
IAkgKiBvdmVyIFNNQjIvU01CMyBhbmQgU2FtYmEgd2lsbCBkbyB0aGlzIHdpdGggU01CMy4xLjEg
UE9TSVggRXh0ZW5zaW9ucwogCSAqLwogCi0JaWYgKCFTX0lTQ0hSKG1vZGUpICYmICFTX0lTQkxL
KG1vZGUpKQorCWlmICghU19JU0NIUihtb2RlKSAmJiAhU19JU0JMSyhtb2RlKSAmJiAhU19JU0ZJ
Rk8obW9kZSkpCiAJCXJldHVybiByYzsKIAogCWNpZnNfZGJnKEZZSSwgInNmdSBjb21wYXQgY3Jl
YXRlIHNwZWNpYWwgZmlsZVxuIik7CkBAIC01MTM1LDYgKzUxMzUsMTIgQEAgc21iMl9tYWtlX25v
ZGUodW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGlub2RlICppbm9kZSwKIAkJcGRldi0+bWlub3Ig
PSBjcHVfdG9fbGU2NChNSU5PUihkZXYpKTsKIAkJcmMgPSB0Y29uLT5zZXMtPnNlcnZlci0+b3Bz
LT5zeW5jX3dyaXRlKHhpZCwgJmZpZCwgJmlvX3Bhcm1zLAogCQkJCQkJCSZieXRlc193cml0dGVu
LCBpb3YsIDEpOworCX0gZWxzZSBpZiAoU19JU0JMSyhtb2RlKSkgeworCQltZW1jcHkocGRldi0+
dHlwZSwgIkxueEZJRk8iLCA4KTsKKwkJcGRldi0+bWFqb3IgPSAwOworCQlwZGV2LT5taW5vciA9
IDA7CisJCXJjID0gdGNvbi0+c2VzLT5zZXJ2ZXItPm9wcy0+c3luY193cml0ZSh4aWQsICZmaWQs
ICZpb19wYXJtcywKKwkJCQkJCQkmYnl0ZXNfd3JpdHRlbiwgaW92LCAxKTsKIAl9CiAJdGNvbi0+
c2VzLT5zZXJ2ZXItPm9wcy0+Y2xvc2UoeGlkLCB0Y29uLCAmZmlkKTsKIAlkX2Ryb3AoZGVudHJ5
KTsKLS0gCjIuMzkuMgoK
--0000000000000f92e306081e5d0b--

