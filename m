Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63459495
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 09:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sbCtySyG/9fHGgOfVGmRAFyptQXgGv58u3Mjq2Ac6B8=; b=1eZ+U5rLISuR8NTkQ7ekDrRy1Z
	nzAXPJxKlru+zBycmTu7sQ8fhamYD4v64lm1I60xnxih3Ddju6g/CweWyZJteXk6Orbw1dGVd5UJM
	9GCNBKESwMOpui1c9z6Xc9tNeJd9VwYE8S8MLr2dy2OlBoD5aXjTKvawrXD8C6A5Fl93HwTc+r29g
	TWT3xxIL3TTMJPYpUFzUvcVzIv6/qx/noGZHOyw3+MUiF5miXeA7AM9q83BUgAVsMT7H/nkz0znZw
	w+hy3pC7PE3uvw+nk+84XnQ54r7xNwQsPUCh2Qm08yqZncxh9GN6ayI6Nk6WK1fVI+K4AIMJg+Vtx
	3TrBdfvg==;
Received: from localhost ([::1]:62346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgl0D-002H4x-5s; Fri, 28 Jun 2019 07:08:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39637) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgl07-002H4q-Qq
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 07:08:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id b7so2718400pls.6
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sbCtySyG/9fHGgOfVGmRAFyptQXgGv58u3Mjq2Ac6B8=;
 b=aA4yKQ92O1sHsx8lEfkHqJTA/7EVik9dzllu9yAcMzSXoVJewQKBZtSeSJb0Ni3wLa
 K/yUAl/3S3MpOlWX+Fa5sPHFk9HhEYzKx43sDE5naSrTGPD1oVsuWdt3Ug20lH9/47jc
 vJibtNZioN/WJo3aumfb4zhbf8CSt0iA8Ukbvm1m2MS10bPerSJaBBfPeQZL30i+Givy
 S/5hZ+uhgnacpGGr7MqfzWKusve8wCwBTUoueVYUYOSKgx03Q6EMbj3+nLOJIiNztW/e
 BMcIrCfachYJyDWsfB8Z/KBKVPFnUNkleUYdOb9H9XOPiynaoxCQW18QZh8Bosi8DZ/K
 IKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sbCtySyG/9fHGgOfVGmRAFyptQXgGv58u3Mjq2Ac6B8=;
 b=WO2QrYHjaSeEwNki65iDAz4hZQ/zL55vhtCQxl1E+Xib9PJOWOGtR4o30Kdh8SBJD4
 Q505FsbATCvmv2IkDRSOLn504YzsVt5qm3Z9WM1X8Mgr1A+kXhplW6c2EOv1tCLaTAL7
 8jQ31pExw9DxyMGOqzN07BIk/x+FtWpPAG1y6NIJ0z9pZisakYMKTPCSjfYOc1KeZQpX
 gEKEPuabaA5MWhFcwicL8gD8FQYjAZq9vQqzBTdm/D39TpGmA4Pwl4iyKNOv+d36vhtG
 oqXZk5uBbqWQx2fC4NhD2zKWytZmAa8QaXCinwGsHxNs3Ch1BB7enxKcjPEuAuKwS0Pr
 XWYw==
X-Gm-Message-State: APjAAAUyI/4oD4PR/l8xTSHJCi3PVxHQ++gEAHK6HSB/q1d793UoEE5X
 cN60P8fjyCYTfOQX8ppXkkoS3w0fjUwxUp79548=
X-Google-Smtp-Source: APXvYqwVb5nnwm9cm3oprVXuEFHi1uBZp34+mpFGqQ3N6LMf+N3K2RAOIf/I1ZFj62w6shCvPrbXICF9mQsE278dO5U=
X-Received: by 2002:a17:902:20b:: with SMTP id 11mr9852924plc.78.1561705728498; 
 Fri, 28 Jun 2019 00:08:48 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 Jun 2019 02:08:37 -0500
Message-ID: <CAH2r5msqF-Cvq=q7ae1XmnOi6DbB3UKSDSDvZbT8MNscLH3XTA@mail.gmail.com>
Subject: [PATCH]Fix querying symlinks
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000310d91058c5cf3e2"
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

--000000000000310d91058c5cf3e2
Content-Type: text/plain; charset="UTF-8"

Querying of symlinks to the Samba server with POSIX extensions works!

(Also would work for querying symlinks generated in Windows NFS server)

# stat /mnt1/symlink-source
  File: /mnt1/symlink-source -> symlink-target
  Size: 14            Blocks: 2048       IO Block: 16384  symbolic link
Device: 39h/57d    Inode: 10354691    Links: 1
Access: (0000/l---------)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2019-06-28 01:43:37.145324400 -0500
Modify: 2019-06-28 01:43:37.145324400 -0500
Change: 2019-06-28 01:43:37.145324400 -0500
 Birth: -


-- 
Thanks,

Steve

--000000000000310d91058c5cf3e2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-Allow-query-of-symlinks-stored-as-reparse-point.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-Allow-query-of-symlinks-stored-as-reparse-point.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jxfr8gra0>
X-Attachment-Id: f_jxfr8gra0

RnJvbSBhYWFlYWQ3M2IyZmU4NGJmZTU2NDIzY2E1MjhhNmZjZjVjMmVhNGY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMjggSnVuIDIwMTkgMDI6MDQ6MTggLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBBbGxvdyBxdWVyeSBvZiBzeW1saW5rcyBzdG9yZWQgYXMgcmVwYXJzZSBwb2ludHMKClRo
ZSAnTkZTJyBzdHlsZSBzeW1saW5rcyAoc2VlIE1TLUZTQ0MgMi4xLjIuNCkgd2VyZSBub3QKYmVp
bmcgcXVlcmllZCBwcm9wZXJseSBpbiBxdWVyeV9zeW1saW5rLiBGaXggdGhpcy4KClNpZ25lZC1v
ZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZz
L3NtYjJvcHMuYyB8IDYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJvcHMuYyBiL2ZzL2NpZnMvc21iMm9wcy5jCmluZGV4
IDc1ZjMzNDhhNDcxZS4uYzQwNDdhZDdiNDNmIDEwMDY0NAotLS0gYS9mcy9jaWZzL3NtYjJvcHMu
YworKysgYi9mcy9jaWZzL3NtYjJvcHMuYwpAQCAtMjM3Myw2ICsyMzczLDM5IEBAIHNtYjJfZ2V0
X2Rmc19yZWZlcihjb25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3QgY2lmc19zZXMgKnNlcywK
IAlyZXR1cm4gcmM7CiB9CiAKK3N0YXRpYyBpbnQKK3BhcnNlX3JlcGFyc2VfcG9zaXgoc3RydWN0
IHJlcGFyc2VfcG9zaXhfZGF0YSAqc3ltbGlua19idWYsCisJCSAgICAgIHUzMiBwbGVuLCBjaGFy
ICoqdGFyZ2V0X3BhdGgsCisJCSAgICAgIHN0cnVjdCBjaWZzX3NiX2luZm8gKmNpZnNfc2IpCit7
CisJdW5zaWduZWQgaW50IGxlbjsKKworCS8qIFNlZSBNUy1GU0NDIDIuMS4yLjYgZm9yIHRoZSAn
TkZTJyBzdHlsZSByZXBhcnNlIHRhZ3MgKi8KKwlsZW4gPSBsZTE2X3RvX2NwdShzeW1saW5rX2J1
Zi0+UmVwYXJzZURhdGFMZW5ndGgpOworCisJaWYgKGxlbiArIHNpemVvZihzdHJ1Y3QgcmVwYXJz
ZV9kYXRhX2J1ZmZlcikgPiBwbGVuKSB7CisJCWNpZnNfZGJnKFZGUywgInNydiByZXR1cm5lZCBt
YWxmb3JtZWQgc3ltbGluayBidWZmZXJcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlp
ZiAobGU2NF90b19jcHUoc3ltbGlua19idWYtPklub2RlVHlwZSkgIT0gTkZTX1NQRUNGSUxFX0xO
SykgeworCQljaWZzX2RiZyhWRlMsICIlbGxkIG5vdCBhIHN1cHBvcnRlZCBzeW1saW5rIHR5cGVc
biIsCisJCQlsZTY0X3RvX2NwdShzeW1saW5rX2J1Zi0+SW5vZGVUeXBlKSk7CisJCXJldHVybiAt
RU9QTk9UU1VQUDsKKwl9CisKKwkqdGFyZ2V0X3BhdGggPSBjaWZzX3N0cm5kdXBfZnJvbV91dGYx
NigKKwkJCQlzeW1saW5rX2J1Zi0+UGF0aEJ1ZmZlciwKKwkJCQlsZW4sIHRydWUsIGNpZnNfc2It
PmxvY2FsX25scyk7CisJaWYgKCEoKnRhcmdldF9wYXRoKSkKKwkJcmV0dXJuIC1FTk9NRU07CisK
Kwljb252ZXJ0X2RlbGltaXRlcigqdGFyZ2V0X3BhdGgsICcvJyk7CisJY2lmc19kYmcoRllJLCAi
JXM6IHRhcmdldCBwYXRoOiAlc1xuIiwgX19mdW5jX18sICp0YXJnZXRfcGF0aCk7CisKKwlyZXR1
cm4gMDsKK30KKwogc3RhdGljIGludAogcGFyc2VfcmVwYXJzZV9zeW1saW5rKHN0cnVjdCByZXBh
cnNlX3N5bWxpbmtfZGF0YV9idWZmZXIgKnN5bWxpbmtfYnVmLAogCQkgICAgICB1MzIgcGxlbiwg
Y2hhciAqKnRhcmdldF9wYXRoLApAQCAtMjM4MSwxMSArMjQxNCw3IEBAIHBhcnNlX3JlcGFyc2Vf
c3ltbGluayhzdHJ1Y3QgcmVwYXJzZV9zeW1saW5rX2RhdGFfYnVmZmVyICpzeW1saW5rX2J1ZiwK
IAl1bnNpZ25lZCBpbnQgc3ViX2xlbjsKIAl1bnNpZ25lZCBpbnQgc3ViX29mZnNldDsKIAotCS8q
IFdlIG9ubHkgaGFuZGxlIFN5bWJvbGljIExpbmsgOiBNUy1GU0NDIDIuMS4yLjQgKi8KLQlpZiAo
bGUzMl90b19jcHUoc3ltbGlua19idWYtPlJlcGFyc2VUYWcpICE9IElPX1JFUEFSU0VfVEFHX1NZ
TUxJTkspIHsKLQkJY2lmc19kYmcoVkZTLCAic3J2IHJldHVybmVkIGludmFsaWQgc3ltbGluayBi
dWZmZXJcbiIpOwotCQlyZXR1cm4gLUVJTzsKLQl9CisJLyogV2UgaGFuZGxlIFN5bWJvbGljIExp
bmsgcmVwYXJzZSB0YWcgaGVyZS4gU2VlOiBNUy1GU0NDIDIuMS4yLjQgKi8KIAogCXN1Yl9vZmZz
ZXQgPSBsZTE2X3RvX2NwdShzeW1saW5rX2J1Zi0+U3Vic3RpdHV0ZU5hbWVPZmZzZXQpOwogCXN1
Yl9sZW4gPSBsZTE2X3RvX2NwdShzeW1saW5rX2J1Zi0+U3Vic3RpdHV0ZU5hbWVMZW5ndGgpOwpA
QCAtMjQwNyw2ICsyNDM2LDI1IEBAIHBhcnNlX3JlcGFyc2Vfc3ltbGluayhzdHJ1Y3QgcmVwYXJz
ZV9zeW1saW5rX2RhdGFfYnVmZmVyICpzeW1saW5rX2J1ZiwKIAlyZXR1cm4gMDsKIH0KIAorc3Rh
dGljIGludAorcGFyc2VfcmVwYXJzZV9wb2ludChzdHJ1Y3QgcmVwYXJzZV9zeW1saW5rX2RhdGFf
YnVmZmVyICpidWYsCisJCSAgICAgIHUzMiBwbGVuLCBjaGFyICoqdGFyZ2V0X3BhdGgsCisJCSAg
ICAgIHN0cnVjdCBjaWZzX3NiX2luZm8gKmNpZnNfc2IpCit7CisJLyogU2VlIE1TLUZTQ0MgMi4x
LjIgKi8KKwlpZiAobGUzMl90b19jcHUoYnVmLT5SZXBhcnNlVGFnKSA9PSBJT19SRVBBUlNFX1RB
R19ORlMpCisJCXJldHVybiBwYXJzZV9yZXBhcnNlX3Bvc2l4KChzdHJ1Y3QgcmVwYXJzZV9wb3Np
eF9kYXRhICopYnVmLAorCQkJcGxlbiwgdGFyZ2V0X3BhdGgsIGNpZnNfc2IpOworCWVsc2UgaWYg
KGxlMzJfdG9fY3B1KGJ1Zi0+UmVwYXJzZVRhZykgPT0gSU9fUkVQQVJTRV9UQUdfU1lNTElOSykK
KwkJcmV0dXJuIHBhcnNlX3JlcGFyc2Vfc3ltbGluayhidWYsIHBsZW4sIHRhcmdldF9wYXRoLAor
CQkJCQljaWZzX3NiKTsKKworCWNpZnNfZGJnKFZGUywgInNydiByZXR1cm5lZCBpbnZhbGlkIHN5
bWxpbmsgYnVmZmVyIHRhZzolZFxuIiwKKwkJbGUzMl90b19jcHUoYnVmLT5SZXBhcnNlVGFnKSk7
CisKKwlyZXR1cm4gLUVJTzsKK30KKwogI2RlZmluZSBTTUIyX1NZTUxJTktfU1RSVUNUX1NJWkUg
XAogCShzaXplb2Yoc3RydWN0IHNtYjJfZXJyX3JzcCkgLSAxICsgc2l6ZW9mKHN0cnVjdCBzbWIy
X3N5bWxpbmtfZXJyX3JzcCkpCiAKQEAgLTI1NDcsNyArMjU5NSw3IEBAIHNtYjJfcXVlcnlfc3lt
bGluayhjb25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAogCQkJ
Z290byBxdWVydHlfZXhpdDsKIAkJfQogCi0JCXJjID0gcGFyc2VfcmVwYXJzZV9zeW1saW5rKAor
CQlyYyA9IHBhcnNlX3JlcGFyc2VfcG9pbnQoCiAJCQkoc3RydWN0IHJlcGFyc2Vfc3ltbGlua19k
YXRhX2J1ZmZlciAqKXJlcGFyc2VfYnVmLAogCQkJcGxlbiwgdGFyZ2V0X3BhdGgsIGNpZnNfc2Ip
OwogCQlnb3RvIHF1ZXJ0eV9leGl0OwotLSAKMi4yMC4xCgo=
--000000000000310d91058c5cf3e2--

