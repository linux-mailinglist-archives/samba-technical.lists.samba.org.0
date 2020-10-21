Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5F29471D
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 06:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NNk8LRssaqazn1wXk6uTM5muK8cWXjM1KrI2CzX5ITY=; b=ybg/V1dTZPSGOi982ECqwyTnHw
	wSdq4qWdjn0dg7YTFwSJbiUUu0dU3NQqMNGK6yHRYE+4PmXa+Q/1lhfLvbROI6qtwC0cTU5m+szsq
	UL0ZDZc5aLNAXTOq+JZtIZlQeYN1BSSR3ZpVO7haPMAFQn1l3HKO2KjoTnbSKPZTcjtS9uTJ9Ibm/
	UloZunCVsJmI7Pcybd8YYIZoN2aFGOHeQeqsO4iVqI466mauq/LMN3GLlRoK77EgBrUbnim22MSre
	o0l7+dxKE5xqNs9jXKW2RqwpTon+MZXmvLDOXzdKGly8A5zESXUho8yiyYq8cxGKKJWbtQld/oYCE
	vQ5g4mMw==;
Received: from ip6-localhost ([::1]:50152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV5Lp-00D0aX-1e; Wed, 21 Oct 2020 04:03:49 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:35695) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV5Lj-00D0aQ-KN
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 04:03:46 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 77so1149321lfl.2
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 21:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=NNk8LRssaqazn1wXk6uTM5muK8cWXjM1KrI2CzX5ITY=;
 b=SA4hdklVZTpZ13GcktHfxVVop4A/J/9h24QQNRz7dfss55GqxE3qYgFNAUxT6VHaya
 4Y6ueJiPS6uayhuiOLbcWIyEgVe6bT7TEgJ8awMaWKOYAnt3UKimAsjcLJVV05tpiNUu
 JOUF5+xR6FU4qHsMZRJ/K+Pn+dWc/vo3klhqeiRnNNJEwrNwh4eWC9sBXR4NGS4OoDzq
 rUtZuiGRl1K+oRHIxuMSd80trAHI3bnR3IDUd4Qh3OKIZzR0SEZNi24zzqt1hFIJQzA/
 JbR7RCo5JShp8efWFefyJeurNfI6VyMjzWeambCeOYVYP05ZimHroWkVgz2kB3vCKkNa
 WMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=NNk8LRssaqazn1wXk6uTM5muK8cWXjM1KrI2CzX5ITY=;
 b=RE4MGfEquSpFOyWhp9srcunnymYhMGs1b08DSJ+5u7CvvuMM4KIRemblv0krX8s0yq
 CrRj7TCFfGKOyOhjb8gPaKkcTozKUh3RlVJuJRVydA5A1bfNIbFmA3n7RDrx+ruwpDqb
 cCfUjrOYbGLkhrJxusZTW8/tKEsuepTN02o6g8PlCI1k0woqnp1LXyJozM2gMMbTuNRT
 SStPapUUF+jgWMDhcci8g2r5h9AFiGxllfjhFpGJGYiU0erxom+yz+CF8eJ9LSFCDu5k
 LlhH/dcnaO1M54ENQc1kwEnWt6XVdsIghEyUaPqDdfds3eAgotxzyKQ2z4oDWsierCdd
 NTDw==
X-Gm-Message-State: AOAM531QAV6/JZpspi+qsHHjRZGbFDHjLOw8rs+YkfZT6AxKXzl1bfkM
 Sr/lS3XnzDb6K7nZc4WxNub0d02IKStQaXqQVtWDLXPgH3rlbA==
X-Google-Smtp-Source: ABdhPJwnyzNztBeW809vxMgFmnm35Wkfcn55N99/KgenvjcmCbHeAPizsnekNxwMNfwvGMt5VJaxGEh6LxE2/X14azs=
X-Received: by 2002:a19:83c1:: with SMTP id f184mr364549lfd.97.1603253022188; 
 Tue, 20 Oct 2020 21:03:42 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 Oct 2020 23:03:31 -0500
Message-ID: <CAH2r5mu2s3Fu+_mWTiXFp+JYTAWZZrPCDyDNtWAhit2DjB890g@mail.gmail.com>
Subject: [PATCH][SMB3] fix stat when special device file and mounted with
 modefromsid
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000df8dd105b2266e80"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000df8dd105b2266e80
Content-Type: text/plain; charset="UTF-8"

When mounting with modefromsid mount option, it was possible to
get the error on stat of a fifo or char or block device:
        "cannot stat <filename>: Operation not supported"

Special devices can be stored as reparse points by some servers
(e.g. Windows NFS server and when using the SMB3.1.1 POSIX
Extensions) but when the modefromsid mount option is used
the client attempts to get the ACL for the file which requires
opening with OPEN_REPARSE_POINT create option.



--
Thanks,

Steve

--000000000000df8dd105b2266e80
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-fix-stat-when-special-device-file-and-mounted-w.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-stat-when-special-device-file-and-mounted-w.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kgivfgvb0>
X-Attachment-Id: f_kgivfgvb0

RnJvbSBkZTNmZTE4NjYzODAxZGRlZDY5ODc0NDE2NjRjZDU0YjMyNzY3MDNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjAgMjI6NTM6NTcgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBmaXggc3RhdCB3aGVuIHNwZWNpYWwgZGV2aWNlIGZpbGUgYW5kIG1vdW50ZWQgd2l0aAog
bW9kZWZyb21zaWQKCldoZW4gbW91bnRpbmcgd2l0aCBtb2RlZnJvbXNpZCBtb3VudCBvcHRpb24s
IGl0IHdhcyBwb3NzaWJsZSB0bwpnZXQgdGhlIGVycm9yIG9uIHN0YXQgb2YgYSBmaWZvIG9yIGNo
YXIgb3IgYmxvY2sgZGV2aWNlOgogICAgICAgICJjYW5ub3Qgc3RhdCA8ZmlsZW5hbWU+OiBPcGVy
YXRpb24gbm90IHN1cHBvcnRlZCIKClNwZWNpYWwgZGV2aWNlcyBjYW4gYmUgc3RvcmVkIGFzIHJl
cGFyc2UgcG9pbnRzIGJ5IHNvbWUgc2VydmVycwooZS5nLiBXaW5kb3dzIE5GUyBzZXJ2ZXIgYW5k
IHdoZW4gdXNpbmcgdGhlIFNNQjMuMS4xIFBPU0lYCkV4dGVuc2lvbnMpIGJ1dCB3aGVuIHRoZSBt
b2RlZnJvbXNpZCBtb3VudCBvcHRpb24gaXMgdXNlZAp0aGUgY2xpZW50IGF0dGVtcHRzIHRvIGdl
dCB0aGUgQUNMIGZvciB0aGUgZmlsZSB3aGljaCByZXF1aXJlcwpvcGVuaW5nIHdpdGggT1BFTl9S
RVBBUlNFX1BPSU5UIGNyZWF0ZSBvcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2gg
PHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lmcy9zbWIyb3BzLmMgfCA2ICsrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMv
c21iMm9wcy5jIGIvZnMvY2lmcy9zbWIyb3BzLmMKaW5kZXggMmMzY2ZiMmU4ZTcyLi43ZTNlZGNk
YTA1NGUgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMm9wcy5jCisrKyBiL2ZzL2NpZnMvc21iMm9w
cy5jCkBAIC0zMDk5LDYgKzMwOTksMTIgQEAgZ2V0X3NtYjJfYWNsX2J5X3BhdGgoc3RydWN0IGNp
ZnNfc2JfaW5mbyAqY2lmc19zYiwKIAogCXJjID0gU01CMl9vcGVuKHhpZCwgJm9wYXJtcywgdXRm
MTZfcGF0aCwgJm9wbG9jaywgTlVMTCwgTlVMTCwgTlVMTCwKIAkJICAgICAgIE5VTEwpOworCWlm
IChyYyA9PSAtRU9QTk9UU1VQUCkgeworCQlvcGFybXMuY3JlYXRlX29wdGlvbnMgfD0gT1BFTl9S
RVBBUlNFX1BPSU5UOworCQlyYyA9IFNNQjJfb3Blbih4aWQsICZvcGFybXMsIHV0ZjE2X3BhdGgs
ICZvcGxvY2ssIE5VTEwsIE5VTEwsCisJCQkJTlVMTCwgTlVMTCk7CisJCWNpZnNfZGJnKFZGUywg
Im9wZW4gcmV0cnkgcmMgJWRcbiIsIHJjKTsgLyogQkIgcmVtb3ZlbWUgKi8KKwl9CiAJa2ZyZWUo
dXRmMTZfcGF0aCk7CiAJaWYgKCFyYykgewogCQlyYyA9IFNNQjJfcXVlcnlfYWNsKHhpZCwgdGxp
bmtfdGNvbih0bGluayksIGZpZC5wZXJzaXN0ZW50X2ZpZCwKLS0gCjIuMjUuMQoK
--000000000000df8dd105b2266e80--

