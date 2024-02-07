Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063B84C4A6
	for <lists+samba-technical@lfdr.de>; Wed,  7 Feb 2024 07:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ADXEMElfjIHUfaepUHiUfsHqNMNprQGCgn7+GCgP9EE=; b=xVuCvvr6YXTePtBbWOAxyprpwB
	j8SP7T9cCBp2K4tIG8PTzdx0S84GJKuPyKfpOn2PxatVwoF6JWMCj9A52D9TyT3y7iVb+mtYbG0jc
	JnrZ4uOIyWq/l8hIJj9jpO7KoJrFCGz4J/JzTP2JeG9tHFbe4I9X16SVz7sjFWf6S6g0OLlViCuSD
	+zWIlTmRMKnKo5w9c0eMXO0zUowd3brdU2bi9ka1FYo4fkKOzi670X0jIRe1MgS+NmijqqvF+qhKk
	aFrS8ToGrt3r+dxOYsRmtwbsp5EBe0RsIQ8ER2dCcLM4jEE4f4xh0VCnKxMVTgidRKEo67+hshUUS
	2LLBqWDg==;
Received: from ip6-localhost ([::1]:36284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rXb73-007gXr-2q; Wed, 07 Feb 2024 06:08:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:58508) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rXb6v-007gXk-N1
 for samba-technical@lists.samba.org; Wed, 07 Feb 2024 06:08:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5114b2b3b73so251595e87.0
 for <samba-technical@lists.samba.org>; Tue, 06 Feb 2024 22:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707286120; x=1707890920; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ADXEMElfjIHUfaepUHiUfsHqNMNprQGCgn7+GCgP9EE=;
 b=AsYrUz0ZvzCXJaoG1aSJyQjOrAfu3hFkEqf9DoK+TeXwFLiIR0vKzuFV2uD/i4dcsA
 EVldEZkDxxbQt9kDuazaPN6Guo+pDLIiIGhpcpV/6qEZ37UNaSFtDFcaZl45BiFYdZ2u
 wJfqdyW5zdq6yO4VwnrP6M2y6yCIy0Wbma2Oq8TZqdI8OLQWrzAjNv59rLYKaMqYd5lZ
 Pw+EnXC8VrdhhZnO0YrXjZMiAI3uswZX0PPblfFe7BddODFIgakgC78gYki6MprcRDDb
 lIwTZNHAD4LuMbeFyEfVxD2ZRYSdnKUbPSb2uozraF9g7XNXGtVWoTnKGuI20O/I10c4
 YKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707286120; x=1707890920;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ADXEMElfjIHUfaepUHiUfsHqNMNprQGCgn7+GCgP9EE=;
 b=Sh57P2ojeG+/rc94UWWuIcrNSBGT+kfP2gE1uuwv7pXJk3Si1wOYwkODQmpZgbqoc+
 gB4ePe6DohCMukDXZ7ktY5WEi8OBpxsk7/2XO0b9nzJIJOWSZKSXSvOA2uz3Nh/O9Icq
 WOhcWoe8zyWTNJX2pEkG9E41w21tC3xmPnQg77Sg4L55p2GpTrjpdCteKEbCxlW5QIKf
 86nUVMxIUzKapudxPzfbYshBQbSoxjlyOetKntfTnkZ9AkaQB5txs6xVAue+FqEt9YSp
 H/Iv3dKRyMYiAgYVX2C+a6oIwmBg3UukTjR03zfBb7dvhgTl0FUcdTWPAy9h0ipV9veF
 ZjqA==
X-Gm-Message-State: AOJu0YyDYgx5rpcL0FRUSVsKjlZX1uJor0UObDsG/eprD7MJSr2NNgeI
 1LGbxY+Hf9LuTQnnPh2LAZw28hNAdvRh9VERSW9auYb4J8gAYe1MVSX1tnskhAzhJGaORZZJshT
 5L4G2hw4st+RglOwOtX0WBTTfEwRou4jZlqw=
X-Google-Smtp-Source: AGHT+IEegdTGD0uwj8MW5iwQbvbtw0M2QT7eszRTwqGLA3sBmKNqd8Ht3r/OZO5EZ1PXLyQqBWolBkOZK4rd0PPmhyU=
X-Received: by 2002:ac2:5f52:0:b0:511:47cf:d09d with SMTP id
 18-20020ac25f52000000b0051147cfd09dmr3082269lfz.3.1707286119645; Tue, 06 Feb
 2024 22:08:39 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 7 Feb 2024 00:08:28 -0600
Message-ID: <CAH2r5mutYBiXyBnMWKF66DGrKHd7=ypsPGcg_XSrJW=JykNBbQ@mail.gmail.com>
Subject: [PATCH][smb client] updating warning message for sec=krb5p
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000b11cdf0610c4860d"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000b11cdf0610c4860d
Content-Type: text/plain; charset="UTF-8"

    smb3: clarify mount warning

    When a user tries to use the "sec=krb5p" mount parameter to encrypt
    data on connection to a server (when authenticating with Kerberos), we
    indicate that it is not supported, but do not note the equivalent
    recommended mount parameter ("sec=krb5,seal") which turns on encryption
    for that mount (and uses Kerberos for auth).  Without an updated
mount warning
    it could confuse some NFS users.   Note that for SMB3+ we support
encryption,
    but consider it ("seal") a distinct mount parameter since the same
user may choose
    to encrypt to one share but not another from the same client.
Update the warning message
    to reduce confusion.

    See attached.
-- 
Thanks,

Steve

--000000000000b11cdf0610c4860d
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-smb3-clarify-mount-warning.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-clarify-mount-warning.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lsbdxbje0>
X-Attachment-Id: f_lsbdxbje0

RnJvbSA2MDhiMGQ1ODBmOTE3ZTAyYjZhZmQxYmUzZTQ3OWIyOTU4N2JiODhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgNiBGZWIgMjAyNCAyMzo1NzoxOCAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGNsYXJpZnkgbW91bnQgd2FybmluZwoKV2hlbiBhIHVzZXIgdHJpZXMgdG8gdXNlIHRoZSAi
c2VjPWtyYjVwIiBtb3VudCBwYXJhbWV0ZXIgdG8gZW5jcnlwdApkYXRhIG9uIGNvbm5lY3Rpb24g
dG8gYSBzZXJ2ZXIgKHdoZW4gYXV0aGVudGljYXRpbmcgd2l0aCBLZXJiZXJvcyksIHdlCmluZGlj
YXRlIHRoYXQgaXQgaXMgbm90IHN1cHBvcnRlZCwgYnV0IGRvIG5vdCBub3RlIHRoZSBlcXVpdmFs
ZW50CnJlY29tbWVuZGVkIG1vdW50IHBhcmFtZXRlciAoInNlYz1rcmI1LHNlYWwiKSB3aGljaCB0
dXJucyBvbiBlbmNyeXB0aW9uCmZvciB0aGF0IG1vdW50IChhbmQgdXNlcyBLZXJiZXJvcyBmb3Ig
YXV0aCkuICBVcGRhdGUgdGhlIHdhcm5pbmcgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6IFN0ZXZl
IEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2ZzX2Nv
bnRleHQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvZnNfY29udGV4dC5jIGIvZnMvc21iL2Ns
aWVudC9mc19jb250ZXh0LmMKaW5kZXggNjAwYTc3MDUyYzNiLi42OTkzY2QzNThiOTQgMTAwNjQ0
Ci0tLSBhL2ZzL3NtYi9jbGllbnQvZnNfY29udGV4dC5jCisrKyBiL2ZzL3NtYi9jbGllbnQvZnNf
Y29udGV4dC5jCkBAIC0yMTEsNyArMjExLDcgQEAgY2lmc19wYXJzZV9zZWN1cml0eV9mbGF2b3Jz
KHN0cnVjdCBmc19jb250ZXh0ICpmYywgY2hhciAqdmFsdWUsIHN0cnVjdCBzbWIzX2ZzX2MKIAog
CXN3aXRjaCAobWF0Y2hfdG9rZW4odmFsdWUsIGNpZnNfc2VjZmxhdm9yX3Rva2VucywgYXJncykp
IHsKIAljYXNlIE9wdF9zZWNfa3JiNXA6Ci0JCWNpZnNfZXJyb3JmKGZjLCAic2VjPWtyYjVwIGlz
IG5vdCBzdXBwb3J0ZWQhXG4iKTsKKwkJY2lmc19lcnJvcmYoZmMsICJzZWM9a3JiNXAgaXMgbm90
IHN1cHBvcnRlZC4gVXNlIHNlYz1rcmI1LHNlYWwgaW5zdGVhZFxuIik7CiAJCXJldHVybiAxOwog
CWNhc2UgT3B0X3NlY19rcmI1aToKIAkJY3R4LT5zaWduID0gdHJ1ZTsKLS0gCjIuNDAuMQoK
--000000000000b11cdf0610c4860d--

