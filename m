Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B329577B
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 07:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jFZ6u6ALdKbHLTZh8LIvvnB8ZJ6omGcOgYQuidf1NB8=; b=Kv2DzNWILVHks/gMp2Zi2bypzH
	+wji1J5CklrDSa3M0Qx8Mcj43fEdWgtYxwynh4DvU28TwPi8E/9qMFZbV9I7W2E9GxF1m/aZaKEPL
	9/7E+BwxJr1uHFZ1PCqTgqZCEaJxdtGpanSgi03DyQDpircS6Ukn+iwpfwla57DfN/NkLPadSgiYN
	f7CC3Oia574tBUy7mo1/Nx79dopmeY0nYS1g8zV6hxi3Sp4PNihuaUtuD0key7AJ0dfNisO94+8gq
	uLTmSRUYM8s7qSyMyQoaAk2+Jiuh+CChnydVp2olz7GWfjQYr4W3JbU6FtuPHDDK/EhTB4n0fNKQ7
	vKvTB1YA==;
Received: from ip6-localhost ([::1]:34050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVSix-00DEFI-O2; Thu, 22 Oct 2020 05:01:15 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:33286) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVSin-00DEFB-81
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 05:01:10 +0000
Received: by mail-lj1-x22f.google.com with SMTP id c21so544040ljj.0
 for <samba-technical@lists.samba.org>; Wed, 21 Oct 2020 22:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jFZ6u6ALdKbHLTZh8LIvvnB8ZJ6omGcOgYQuidf1NB8=;
 b=QCCVXoH1ZRsW0wtfFYU5JzVFEBrSxhNz7qA7ffYaH8CsQitHZsqBjtRny0ksWdrDXY
 7y4aF1Ytd9zOcS1F4Jl0LlY+DttzMCyLQDqgscOGUCLK8DPhkBWZocw9UVW/O823pwrp
 pNxoZ5+KRecdD1KEESAhGT8r0D14X7+QX/yNhXQgTIPJQD6eXvwXwkoWrboe4BNhdRfB
 +fMpstkGm+N1gDkNVjaGMZs3x2Z4rRi0zxmqMCwDkem/BPDjcHdBC7H0eNkgmpo2GOB/
 WAvW/hEdn8TbPNUwDho1cIw1EtcHjb6qzkVrG2Zw12CvRLtSxqnaoNUGb4qxPxqYvlhD
 xl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jFZ6u6ALdKbHLTZh8LIvvnB8ZJ6omGcOgYQuidf1NB8=;
 b=Y0U7GBqGZnBHa7bR28DXTOwHPkCt/aD4g+oOswRmLCmr+rqQa+OnAhN0V24DmLgBLf
 juJWH360/5PFcz0DrU8j6f8rs0vbQtuoFDR4pXQTPtX/ZRG+9RbNwT4qwfJTZHMMRon3
 QWJmGoL+WcbP3mwupvuVmbUS03OK17OIaYcqaa9Yjes/vYCKeQvwG2b+muegnXbkHiTs
 Jd8B4wmk4h2Sevh1lv78MLGwG4v8VxeAdT+VmDUXPCoi7sUnpVzrxEM5qtT9Fe2jaVAP
 g02B2DK8FhKNhNrhXCmwwJj/UAMLg2SEmkAKJfl8v24gcZ+SqH4ZY4IYuZBJeR3nXgCX
 t01w==
X-Gm-Message-State: AOAM531ZEHJe4r95nN2M0OmrNY7Lh74j6n98JCVSDtDcRvrL6+JiWDUC
 v0tfln5U2yO7qzomNLoTciGCWVAgQx6hvY1YjBI=
X-Google-Smtp-Source: ABdhPJwPFM+uXvhV2gqWo5uSOMeTqjGBStT+oFcfKoV5cUVPCm9AnrkzXVJeTSh5a26p6tebDhy6/otaXTgYU/KrwzA=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr280283ljk.372.1603342863818;
 Wed, 21 Oct 2020 22:01:03 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 22 Oct 2020 00:00:52 -0500
Message-ID: <CAH2r5mvWqz2bMX9ut0bT4ZQH8WQNAc8Cjg3bM1TKeXgzupOZMQ@mail.gmail.com>
Subject: [PATCH]SMB3] Add support for WSL reparse tags
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000da0fb705b23b59b3"
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

--000000000000da0fb705b23b59b3
Content-Type: text/plain; charset="UTF-8"

The IO_REPARSE_TAG_LX_ tags originally were used by WSL but they
are preferred by the Linux client in some cases since, unlike
the NFS reparse tag (or EAs), they don't require an extra query
to determine which type of special file they represent.

Add support for readdir to recognize special file types of
FIFO, SOCKET, CHAR, BLOCK and SYMLINK.  This can be tested
by creating these special files in WSL Linux and then
sharing that location on the Windows server and mounting
to the Windows server to access them.

Prior to this patch all of the special files would show up
as being of type 'file' but with this patch they can be seen
with the correct file type as can be seen below:

  brwxr-xr-x 1 root root 0, 0 Oct 21 17:10 block
  crwxr-xr-x 1 root root 0, 0 Oct 21 17:46 char
  drwxr-xr-x 2 root root    0 Oct 21 18:27 dir
  prwxr-xr-x 1 root root    0 Oct 21 16:21 fifo
  -rwxr-xr-x 1 root root    0 Oct 21 15:48 file
  lrwxr-xr-x 1 root root    0 Oct 21 15:52 symlink-to-file

TODO: go through all documented reparse tags to see if we can
reasonably map some of them to directories vs. files vs. symlinks

-- 
Thanks,

Steve

--000000000000da0fb705b23b59b3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-add-support-for-recognizing-WSL-reparse-tags.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-add-support-for-recognizing-WSL-reparse-tags.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kgkcxlpt0>
X-Attachment-Id: f_kgkcxlpt0

RnJvbSBkOWRjODE3NGYxM2Y3YjQzN2Q5NjcwYTg0Y2E4ZDQxZmMyMTEwMDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjAgMjM6NTQ6MTkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzOiBhZGQgc3VwcG9ydCBmb3IgcmVjb2duaXppbmcgV1NMIHJlcGFyc2UgdGFncwoKVGhlIElP
X1JFUEFSU0VfVEFHX0xYXyB0YWdzIG9yaWdpbmFsbHkgd2VyZSB1c2VkIGJ5IFdTTCBidXQgdGhl
eQphcmUgcHJlZmVycmVkIGJ5IHRoZSBMaW51eCBjbGllbnQgaW4gc29tZSBjYXNlcyBzaW5jZSwg
dW5saWtlCnRoZSBORlMgcmVwYXJzZSB0YWcgKG9yIEVBcyksIHRoZXkgZG9uJ3QgcmVxdWlyZSBh
biBleHRyYSBxdWVyeQp0byBkZXRlcm1pbmUgd2hpY2ggdHlwZSBvZiBzcGVjaWFsIGZpbGUgdGhl
eSByZXByZXNlbnQuCgpBZGQgc3VwcG9ydCBmb3IgcmVhZGRpciB0byByZWNvZ25pemUgc3BlY2lh
bCBmaWxlIHR5cGVzIG9mCkZJRk8sIFNPQ0tFVCwgQ0hBUiwgQkxPQ0sgYW5kIFNZTUxJTksuICBU
aGlzIGNhbiBiZSB0ZXN0ZWQKYnkgY3JlYXRpbmcgdGhlc2Ugc3BlY2lhbCBmaWxlcyBpbiBXU0wg
TGludXggYW5kIHRoZW4Kc2hhcmluZyB0aGF0IGxvY2F0aW9uIG9uIHRoZSBXaW5kb3dzIHNlcnZl
ciBhbmQgbW91bnRpbmcKdG8gdGhlIFdpbmRvd3Mgc2VydmVyIHRvIGFjY2VzcyB0aGVtLgoKUHJp
b3IgdG8gdGhpcyBwYXRjaCBhbGwgb2YgdGhlIHNwZWNpYWwgZmlsZXMgd291bGQgc2hvdyB1cAph
cyBiZWluZyBvZiB0eXBlICdmaWxlJyBidXQgd2l0aCB0aGlzIHBhdGNoIHRoZXkgY2FuIGJlIHNl
ZW4Kd2l0aCB0aGUgY29ycmVjdCBmaWxlIHR5cGUgYXMgY2FuIGJlIHNlZW4gYmVsb3c6CgogIGJy
d3hyLXhyLXggMSByb290IHJvb3QgMCwgMCBPY3QgMjEgMTc6MTAgYmxvY2sKICBjcnd4ci14ci14
IDEgcm9vdCByb290IDAsIDAgT2N0IDIxIDE3OjQ2IGNoYXIKICBkcnd4ci14ci14IDIgcm9vdCBy
b290ICAgIDAgT2N0IDIxIDE4OjI3IGRpcgogIHByd3hyLXhyLXggMSByb290IHJvb3QgICAgMCBP
Y3QgMjEgMTY6MjEgZmlmbwogIC1yd3hyLXhyLXggMSByb290IHJvb3QgICAgMCBPY3QgMjEgMTU6
NDggZmlsZQogIGxyd3hyLXhyLXggMSByb290IHJvb3QgICAgMCBPY3QgMjEgMTU6NTIgc3ltbGlu
ay10by1maWxlCgpUT0RPOiBnbyB0aHJvdWdoIGFsbCBkb2N1bWVudGVkIHJlcGFyc2UgdGFncyB0
byBzZWUgaWYgd2UgY2FuCnJlYXNvbmFibHkgbWFwIHNvbWUgb2YgdGhlbSB0byBkaXJlY3Rvcmll
cyB2cy4gZmlsZXMgdnMuIHN5bWxpbmtzCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0
ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lmcy9yZWFkZGlyLmMgfCAyNSArKysrKysr
KysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvcmVhZGRpci5jIGIvZnMvY2lmcy9yZWFk
ZGlyLmMKaW5kZXggNWFiZjFlYTIxYWJlLi43OTliZTNhNWQyNWUgMTAwNjQ0Ci0tLSBhL2ZzL2Np
ZnMvcmVhZGRpci5jCisrKyBiL2ZzL2NpZnMvcmVhZGRpci5jCkBAIC0xNjgsMTAgKzE2OCwzMyBA
QCBjaWZzX2ZpbGxfY29tbW9uX2luZm8oc3RydWN0IGNpZnNfZmF0dHIgKmZhdHRyLCBzdHJ1Y3Qg
Y2lmc19zYl9pbmZvICpjaWZzX3NiKQogCWZhdHRyLT5jZl91aWQgPSBjaWZzX3NiLT5tbnRfdWlk
OwogCWZhdHRyLT5jZl9naWQgPSBjaWZzX3NiLT5tbnRfZ2lkOwogCisJLyoKKwkgKiBUaGUgSU9f
UkVQQVJTRV9UQUdfTFhfIHRhZ3Mgb3JpZ2luYWxseSB3ZXJlIHVzZWQgYnkgV1NMIGJ1dCB0aGV5
CisJICogYXJlIHByZWZlcnJlZCBieSB0aGUgTGludXggY2xpZW50IGluIHNvbWUgY2FzZXMgc2lu
Y2UsIHVubGlrZQorCSAqIHRoZSBORlMgcmVwYXJzZSB0YWcgKG9yIEVBcyksIHRoZXkgZG9uJ3Qg
cmVxdWlyZSBhbiBleHRyYSBxdWVyeQorCSAqIHRvIGRldGVybWluZSB3aGljaCB0eXBlIG9mIHNw
ZWNpYWwgZmlsZSB0aGV5IHJlcHJlc2VudC4KKwkgKiBUT0RPOiBnbyB0aHJvdWdoIGFsbCBkb2N1
bWVudGVkICByZXBhcnNlIHRhZ3MgdG8gc2VlIGlmIHdlIGNhbgorCSAqIHJlYXNvbmFibHkgbWFw
IHNvbWUgb2YgdGhlbSB0byBkaXJlY3RvcmllcyB2cy4gZmlsZXMgdnMuIHN5bWxpbmtzCisJICov
CiAJaWYgKGZhdHRyLT5jZl9jaWZzYXR0cnMgJiBBVFRSX0RJUkVDVE9SWSkgewogCQlmYXR0ci0+
Y2ZfbW9kZSA9IFNfSUZESVIgfCBjaWZzX3NiLT5tbnRfZGlyX21vZGU7CiAJCWZhdHRyLT5jZl9k
dHlwZSA9IERUX0RJUjsKLQl9IGVsc2UgeworCX0gZWxzZSBpZiAoZmF0dHItPmNmX2NpZnN0YWcg
PT0gSU9fUkVQQVJTRV9UQUdfTFhfU1lNTElOSykgeworCQlmYXR0ci0+Y2ZfbW9kZSB8PSBTX0lG
TE5LIHwgY2lmc19zYi0+bW50X2ZpbGVfbW9kZTsKKwkJZmF0dHItPmNmX2R0eXBlID0gRFRfTE5L
OworCX0gZWxzZSBpZiAoZmF0dHItPmNmX2NpZnN0YWcgPT0gSU9fUkVQQVJTRV9UQUdfTFhfRklG
TykgeworCQlmYXR0ci0+Y2ZfbW9kZSB8PSBTX0lGSUZPIHwgY2lmc19zYi0+bW50X2ZpbGVfbW9k
ZTsKKwkJZmF0dHItPmNmX2R0eXBlID0gRFRfRklGTzsKKwl9IGVsc2UgaWYgKGZhdHRyLT5jZl9j
aWZzdGFnID09IElPX1JFUEFSU0VfVEFHX0FGX1VOSVgpIHsKKwkJZmF0dHItPmNmX21vZGUgfD0g
U19JRlNPQ0sgfCBjaWZzX3NiLT5tbnRfZmlsZV9tb2RlOworCQlmYXR0ci0+Y2ZfZHR5cGUgPSBE
VF9TT0NLOworCX0gZWxzZSBpZiAoZmF0dHItPmNmX2NpZnN0YWcgPT0gSU9fUkVQQVJTRV9UQUdf
TFhfQ0hSKSB7CisJCWZhdHRyLT5jZl9tb2RlIHw9IFNfSUZDSFIgfCBjaWZzX3NiLT5tbnRfZmls
ZV9tb2RlOworCQlmYXR0ci0+Y2ZfZHR5cGUgPSBEVF9DSFI7CisJfSBlbHNlIGlmIChmYXR0ci0+
Y2ZfY2lmc3RhZyA9PSBJT19SRVBBUlNFX1RBR19MWF9CTEspIHsKKwkJZmF0dHItPmNmX21vZGUg
fD0gU19JRkJMSyB8IGNpZnNfc2ItPm1udF9maWxlX21vZGU7CisJCWZhdHRyLT5jZl9kdHlwZSA9
IERUX0JMSzsKKwl9IGVsc2UgeyAvKiBUT0RPOiBzaG91bGQgd2UgbWFyayBzb21lIG90aGVyIHJl
cGFyc2UgcG9pbnRzIChsaWtlIERGU1IpIGFzIGRpcmVjdG9yaWVzPyAqLwogCQlmYXR0ci0+Y2Zf
bW9kZSA9IFNfSUZSRUcgfCBjaWZzX3NiLT5tbnRfZmlsZV9tb2RlOwogCQlmYXR0ci0+Y2ZfZHR5
cGUgPSBEVF9SRUc7CiAJfQotLSAKMi4yNS4xCgo=
--000000000000da0fb705b23b59b3--

