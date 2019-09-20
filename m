Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF9B8B75
	for <lists+samba-technical@lfdr.de>; Fri, 20 Sep 2019 09:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lpG2sB4t8yvWerkAcEgJ5s6fFwnyx8IT8lfSkUNq1P4=; b=Wz4FenccPTX1MbkZ4gXD9zfMwx
	vvE0sNkrvvDLfPoiT6RZm/QfR5VmuYxGKkYRKc2buhe38GB6gWaZC+bdkOWLV/e2ooSjqhZ8bcE7h
	0jbfnszIlpQjwqBgf9JjAlOMS2J2TscrsKKWH4k27s66GUOZO8Ub0qTFjh3Z/TEBRcvOWsAMej2KV
	MxqXziZM+Gn+LQIbjcQuxFs3KjJ12pFuLpalizyHNpV/37nSIvGMC2GEtowbsFBfoTpBpO95udStb
	1+jT39PzwuMtqIvRrtR4OlaYdWxVJIiO6m5GWyf2Khpid8ySHYUiXe5mGaODTDbWcJTE/V3eFeKPR
	Q5F9qdmQ==;
Received: from localhost ([::1]:21900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iBDDd-007A8O-0u; Fri, 20 Sep 2019 07:20:41 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:38671) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iBDDX-007A8H-34
 for samba-technical@lists.samba.org; Fri, 20 Sep 2019 07:20:37 +0000
Received: by mail-io1-xd43.google.com with SMTP id k5so13937764iol.5
 for <samba-technical@lists.samba.org>; Fri, 20 Sep 2019 00:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lpG2sB4t8yvWerkAcEgJ5s6fFwnyx8IT8lfSkUNq1P4=;
 b=bdeHKr8oDJ0rBkGmz+GAJ1dEoVYkLGodG7PVMb1s9JBi/VnVJjhec5lp3awjncPgXE
 F9cjaxnfc3HxupWDRfwulYB4qQhOxa1F6PI1A4zBih+chL9lID3K7XYijMP609/ViEQ/
 0V/6K9YaJNk3V2JSTJCw0jjWl+K4Rectbwgo3seiXM4X4KFkBiAqwyhQZWNLsFdw/hok
 F09i3/A6DnTpOEBRblswWbFqa6TfhK9Cm6IxHpw6mpYpCakjbr9peeZqhbzWpQOUJOzw
 CaQikDpwYVNwM9QEkEoUYu47/9vf5pzXAwGMS4ZtwH+eVXO3gibqYSxzUTgddhEn+weY
 HUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lpG2sB4t8yvWerkAcEgJ5s6fFwnyx8IT8lfSkUNq1P4=;
 b=QpyO6ZOeQTSVKofc8k+vnKSWKoXWekG6dRAa5dKHXSHe4mfsOXCcFQJ+grC4hxxceP
 tEzsrsZHmcrg2+dfVXK+V2UUEyhaurRUGOlZ58RByOrNDwpIEbSVZE5Lxg8WB19m9B0l
 Qwe2wbtapFELKe86TpInQ+rlwEqDjr4Op0jTDZBlDCmwBzy1bU7oOi4ffrhAgjUl7STj
 CqsjQHb+TeBruVjmFiqzfmp32D4VCFSxf+bRXA5lMaC7iXBN1UCm1p+7HkyX1HtRHf//
 UZN87NghcqpwxFBgYjQB/Q8V65hDD6lOsjI4RvMnLUc5Z+rtNDEVTCrNpW2zPyCV4EfQ
 HjsA==
X-Gm-Message-State: APjAAAXwzXGwSHOS2yHpPWitO86ZcwD+WJZiKl7eXQd0Q5VL40C5RZe9
 U/Y77l/5p3PWaX2vO0ZPhCUsk1Xj1mOsWmMmjpo=
X-Google-Smtp-Source: APXvYqwz9ZDnqeug/RlNiL+TGM8dcpr4z2p+nB/qPWZ9LlQPVPz+COYUtNL/fgmXMrIvIFwMwOC5nv5VUCphcgc01ek=
X-Received: by 2002:a02:683:: with SMTP id 125mr18142853jav.132.1568964033087; 
 Fri, 20 Sep 2019 00:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvcRuSihH58GgrzXTAHuXnQ9a0N-d8AkLLOigQrqincKg@mail.gmail.com>
In-Reply-To: <CAH2r5mvcRuSihH58GgrzXTAHuXnQ9a0N-d8AkLLOigQrqincKg@mail.gmail.com>
Date: Fri, 20 Sep 2019 02:20:20 -0500
Message-ID: <CAH2r5mvAw3ShBpy39OodU8EgXqR0rFBmAk0TXJbug1N22R8o4w@mail.gmail.com>
Subject: Re: [SMB3][PATCH] dump encryption keys to allow wireshark debugging
 of encrypted
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000dc0f9b0592f6e755"
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

--000000000000dc0f9b0592f6e755
Content-Type: text/plain; charset="UTF-8"

And updated patch for cifs-utils ("smbinfo keys <filename>")


On Fri, Sep 20, 2019 at 2:07 AM Steve French <smfrench@gmail.com> wrote:
>
> kernel patch updated to check if encryption is enabled
>
> In order to debug certain problems it is important to be able
> to decrypt network traces (e.g. wireshark) but to do this we
> need to be able to dump out the encryption/decryption keys.
> Dumping them to an ioctl is safer than dumping then to dmesg,
> (and better than showing all keys in a pseudofile).
>
> Restrict this to root (CAP_SYS_ADMIN), and only for a mount
> that this admin has access to.
>
> Sample smbinfo output:
> SMB3.0 encryption
> Session Id:   0x82d2ec52
> Session Key:  a5 6d 81 d0 e c1 ca e1 d8 13 aa 20 e8 f2 cc 71
> Server Encryption Key:  1a c3 be ba 3d fc dc 3c e bc 93 9e 50 9e 19 c1
> Server Decryption Key:  e0 d4 d9 43 1b a2 1b e3 d8 76 77 49 56 f7 20 88
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--000000000000dc0f9b0592f6e755
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smbinfo-print-the-security-information-needed-to-dec.patch"
Content-Disposition: attachment; 
	filename="0001-smbinfo-print-the-security-information-needed-to-dec.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0rsnvn60>
X-Attachment-Id: f_k0rsnvn60

RnJvbSAzYzJmMTU1Mzc4NTBlZGU1Y2NhMGZlYjFkYzAwOGNjNzYwNDJjNjdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgMTkgU2VwIDIwMTkgMDQ6MjE6MTYgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWJpbmZvOiBwcmludCB0aGUgc2VjdXJpdHkgaW5mb3JtYXRpb24gbmVlZGVkIHRvIGRlY3J5cHQK
IHdpcmVzaGFyayB0cmFjZQoKU2FtcGxlIG91dHB1dDoKCiAgICBTTUIzLjAgZW5jcnlwdGlvbgog
ICAgU2Vzc2lvbiBJZDogICAweDgyZDJlYzUyCiAgICBTZXNzaW9uIEtleTogIGE1IDZkIDgxIGQw
IGUgYzEgY2EgZTEgZDggMTMgYWEgMjAgZTggZjIgY2MgNzEKICAgIFNlcnZlciBFbmNyeXB0aW9u
IEtleTogIDFhIGMzIGJlIGJhIDNkIGZjIGRjIDNjIGUgYmMgOTMgOWUgNTAgOWUgMTkgYzEKICAg
IFNlcnZlciBEZWNyeXB0aW9uIEtleTogIGUwIGQ0IGQ5IDQzIDFiIGEyIDFiIGUzIGQ4IDc2IDc3
IDQ5IDU2IGY3IDIwIDg4CgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1p
Y3Jvc29mdC5jb20+CgptZXJnZQotLS0KIHNtYmluZm8uYyB8IDQ3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NtYmluZm8uYyBiL3NtYmluZm8u
YwppbmRleCBmOWRlN2ZkLi4zODNkZjMzIDEwMDY0NAotLS0gYS9zbWJpbmZvLmMKKysrIGIvc21i
aW5mby5jCkBAIC01NCw3ICs1NCwxNyBAQCBzdHJ1Y3Qgc21iX3F1ZXJ5X2luZm8gewogCS8qIGNo
YXIgYnVmZmVyW107ICovCiB9IF9fcGFja2VkOwogCisjZGVmaW5lIFNNQjNfU0lHTl9LRVlfU0la
RSAxNgorc3RydWN0IHNtYjNfa2V5X2RlYnVnX2luZm8geworCXVpbnQ2NF90IFN1aWQ7CisJdWlu
dDE2X3QgY2lwaGVyX3R5cGU7CisJdWludDhfdCBhdXRoX2tleVsxNl07IC8qIFNNQjJfTlRMTVYy
X1NFU1NLRVlfU0laRSAqLworCXVpbnQ4X3QJc21iM2VuY3J5cHRpb25rZXlbU01CM19TSUdOX0tF
WV9TSVpFXTsKKwl1aW50OF90CXNtYjNkZWNyeXB0aW9ua2V5W1NNQjNfU0lHTl9LRVlfU0laRV07
Cit9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpOworCiAjZGVmaW5lIENJRlNfUVVFUllfSU5GTyBf
SU9XUihDSUZTX0lPQ1RMX01BR0lDLCA3LCBzdHJ1Y3Qgc21iX3F1ZXJ5X2luZm8pCisjZGVmaW5l
IENJRlNfRFVNUF9LRVkgX0lPV1IoQ0lGU19JT0NUTF9NQUdJQywgOCwgc3RydWN0IHNtYjNfa2V5
X2RlYnVnX2luZm8pCiAjZGVmaW5lIElOUFVUX0JVRkZFUl9MRU5HVEggMTYzODQKIAogaW50IHZl
cmJvc2U7CkBAIC05Miw3ICsxMDIsOSBAQCB1c2FnZShjaGFyICpuYW1lKQogCQkiICBxdW90YTpc
biIKIAkJIiAgICAgIFByaW50cyB0aGUgcXVvdGEgZm9yIGEgY2lmcyBmaWxlLlxuIgogCQkiICBz
ZWNkZXNjOlxuIgotCQkiICAgICAgUHJpbnRzIHRoZSBzZWN1cml0eSBkZXNjcmlwdG9yIGZvciBh
IGNpZnMgZmlsZS5cbiIsCisJCSIgICAgICBQcmludHMgdGhlIHNlY3VyaXR5IGRlc2NyaXB0b3Ig
Zm9yIGEgY2lmcyBmaWxlLlxuIgorCQkiICBrZXlzOlxuIgorCQkiICAgICAgUHJpbnRzIHRoZSBk
ZWNyeXB0aW9uIGluZm9ybWF0aW9uIG5lZWRlZCB0byB2aWV3IGVuY3J5cHRlZCBuZXR3b3JrIHRy
YWNlcy5cbiIsCiAJCW5hbWUpOwogCWV4aXQoMSk7CiB9CkBAIC0xMDE1LDYgKzEwMjcsMzcgQEAg
c3RhdGljIHZvaWQgcHJpbnRfc25hcHNob3RzKHN0cnVjdCBzbWJfc25hcHNob3RfYXJyYXkgKnBz
bmFwKQogCXByaW50ZigiXG4iKTsKIH0KIAorc3RhdGljIHZvaWQKK2R1bXBfa2V5cyhpbnQgZikK
K3sKKwlzdHJ1Y3Qgc21iM19rZXlfZGVidWdfaW5mbyBrZXlzX2luZm87CisKKwlpZiAoaW9jdGwo
ZiwgQ0lGU19EVU1QX0tFWSwgJmtleXNfaW5mbykgPCAwKSB7CisJCWZwcmludGYoc3RkZXJyLCAi
UXVlcnlpbmcga2V5cyBpbmZvcm1hdGlvbiBmYWlsZWQgd2l0aCAlc1xuIiwgc3RyZXJyb3IoZXJy
bm8pKTsKKwkJZXhpdCgxKTsKKwl9CisKKwlpZiAoa2V5c19pbmZvLmNpcGhlcl90eXBlID09IDEp
CisJCXByaW50ZigiQ0NNIGVuY3J5cHRpb24iKTsKKwllbHNlIGlmIChrZXlzX2luZm8uY2lwaGVy
X3R5cGUgPT0gMikKKwkJcHJpbnRmKCJHQ00gZW5jcnlwdGlvbiIpOworCWVsc2UgaWYgKGtleXNf
aW5mby5jaXBoZXJfdHlwZSA9PSAwKQorCQlwcmludGYoIlNNQjMuMCBlbmNyeXB0aW9uIik7CisJ
ZWxzZQorCQlwcmludGYoInVua25vd24gZW5jcnlwdGlvbiB0eXBlIik7CisJcHJpbnRmKCJcblNl
c3Npb24gSWQ6ICAgMHglbHgiLCBrZXlzX2luZm8uU3VpZCk7CisJcHJpbnRmKCJcblNlc3Npb24g
S2V5OiAiKTsKKwlmb3IgKGludCBpID0gMDsgaSA8IDE2OyBpKyspCisJCXByaW50ZigiICV4Iiwg
a2V5c19pbmZvLmF1dGhfa2V5W2ldKTsKKwlwcmludGYoIlxuU2VydmVyIEVuY3J5cHRpb24gS2V5
OiAiKTsKKwlmb3IgKGludCBpID0gMDsgaSA8IFNNQjNfU0lHTl9LRVlfU0laRTsgaSsrKQorCQlw
cmludGYoIiAleCIsIGtleXNfaW5mby5zbWIzZW5jcnlwdGlvbmtleVtpXSk7CisJcHJpbnRmKCJc
blNlcnZlciBEZWNyeXB0aW9uIEtleTogIik7CisJZm9yIChpbnQgaSA9IDA7IGkgPCBTTUIzX1NJ
R05fS0VZX1NJWkU7IGkrKykKKwkJcHJpbnRmKCIgJXgiLCBrZXlzX2luZm8uc21iM2RlY3J5cHRp
b25rZXlbaV0pOworCXByaW50ZigiXG4iKTsKK30KKwogI2RlZmluZSBDSUZTX0VOVU1FUkFURV9T
TkFQU0hPVFMgX0lPUihDSUZTX0lPQ1RMX01BR0lDLCA2LCBzdHJ1Y3Qgc21iX3NuYXBzaG90X2Fy
cmF5KQogCiAjZGVmaW5lIE1JTl9TTkFQU0hPVF9BUlJBWV9TSVpFIDE2IC8qIFNlZSBNUy1TTUIy
IHNlY3Rpb24gMy4zLjUuMTUuMSAqLwpAQCAtMTEyNCw2ICsxMTY3LDggQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJcXVvdGEoZik7CiAJZWxzZSBpZiAoIXN0cmNtcChhcmd2
W29wdGluZF0sICJzZWNkZXNjIikpCiAJCXNlY2Rlc2MoZik7CisJZWxzZSBpZiAoIXN0cmNtcChh
cmd2W29wdGluZF0sICJrZXlzIikpCisJCWR1bXBfa2V5cyhmKTsKIAllbHNlIHsKIAkJZnByaW50
ZihzdGRlcnIsICJVbmtub3duIGNvbW1hbmQgJXNcbiIsIGFyZ3Zbb3B0aW5kXSk7CiAJCWV4aXQo
MSk7Ci0tIAoyLjIwLjEKCg==
--000000000000dc0f9b0592f6e755--

