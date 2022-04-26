Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CD50FBE3
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 13:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UTyE4kxrqiSYqMnPAVQVCJz3ouFdlfsxdLE7hEs8b+A=; b=AAZMq3AW9XF73G6eohUbz079Qk
	VpDXBpyVaoYa8Z01FhBAK1k91GRQ3liyeeKeSR2xWG8yZbbCNiw0hopTUSVTBIMQIJTrDA3VEQLhZ
	KRD4FDfRK2BNsxlAuwL6rS3iizWQqoIKns3DElJXmYOGkAJMsroGBp7t49W0tFcmJ0aqBtsDjYAN+
	Vb1wNEu+3F4GZYDKFHbKGBC3IJ57OJ7qfHy4cul5mws+4BKq0HNok+knG8EyhauA+hr11bT2uATlq
	Ldvpx2xC6m4tVU3pAJ2y2JUGNgUwRRcGPKr2g2uasyFy/GQixUgAHvxrSvQurE32JFywegAqojbCM
	H2gXKNuQ==;
Received: from ip6-localhost ([::1]:33416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njJH2-002GrH-Ae; Tue, 26 Apr 2022 11:22:28 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41803) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njJGx-002Gr7-1B
 for samba-technical@lists.samba.org; Tue, 26 Apr 2022 11:22:25 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2F34C4078B;
 Tue, 26 Apr 2022 14:22:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id A07F039C;
 Tue, 26 Apr 2022 14:17:05 +0300 (MSK)
Content-Type: multipart/mixed; boundary="------------cIb3V0vjiZturGJIf50oe7M0"
Message-ID: <87f5174b-9eda-5fac-03a4-a328ffb7888a@msgid.tls.msk.ru>
Date: Tue, 26 Apr 2022 14:22:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: msg.sock: is it really private dir, or a runtime/pid dir?
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, Volker Lendecke <vl@samba.org>
References: <14f83e34-b8b1-1c15-2f19-4a010ff96601@msgid.tls.msk.ru>
In-Reply-To: <14f83e34-b8b1-1c15-2f19-4a010ff96601@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------cIb3V0vjiZturGJIf50oe7M0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

24.04.2022 23:08, Michael Tokarev via samba-technical wrote:
> I noticed msg.sock/ subdir is created within samba private directory,
> and it contains sockets for various samba processes.  This smells like
> it should be done in a runtime directory (/run/samba/) instead.
> 
> In the code, in source3/lib/messages.c, this is indeed done in private dir:
> 
>        priv_path = private_path("msg.sock");
> 
> I think the sockets should not be in a private state directory to start
> with.

How about the attached patch?

It moves msg.sock from private_directory to lock_directory, to the same
place where msg.lock directory is created (usually in /run/samba/ or
in /var/lock/samba/).

Note it immediately shows some issues in the existing code:

1. one user (out of two in total) of private_path() in source3/lib/messages.c
checks for the result to be non-NULL, while the other user does not.
(eg 6279773fed4c31bc5fb93979756125b184070443 is exactly this issue)

2. different code use different functions. I guess this is intentional.
source4/lib/messaging/messaging.c uses lpcfg_private_path() while
source3/lib/messages.c open-codes this.

3. the most important: there's no single place where this path is
defined, but it looks like clients should use the same function
to find this pathname as the server which puts the messages into
there.

4. It looks like whole "private path" usage should be audited,
there are all sorts of fun stuff being created there which don't
belong there.

The msg.sock where introduced by this commit:

commit 1aabd9298d59d4f57d321ecaee59e99d966089ff
Author: Stefan Metzmacher <metze@samba.org>
Date:   Wed Sep 16 12:44:43 2015 +0200

     s3:lib/messages: use 'msg.lock' and 'msg.sock' for messaging related subdirs

The intention is clear, but what is NOT clear is why for the
new msg.sock, private_path() was used instead of lock_path().
(Cc'ing Stefan).

Thanks,

/mjt
--------------cIb3V0vjiZturGJIf50oe7M0
Content-Type: text/x-patch; charset=UTF-8;
 name="move-msg.sock-from-var-lib-samba-to-run-samba.patch"
Content-Disposition: attachment;
 filename="move-msg.sock-from-var-lib-samba-to-run-samba.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdXJjZTMvbGliL21lc3NhZ2VzLmMgYi9zb3VyY2UzL2xpYi9tZXNz
YWdlcy5jCmluZGV4IDg2NDFhOWRhZDU2Li5iZjg2NmU2NWU0NCAxMDA2NDQKLS0tIGEvc291
cmNlMy9saWIvbWVzc2FnZXMuYworKysgYi9zb3VyY2UzL2xpYi9tZXNzYWdlcy5jCkBAIC00
NjEsMTEgKzQ2MSw2IEBAIHN0YXRpYyBpbnQgbWVzc2FnaW5nX2NvbnRleHRfZGVzdHJ1Y3Rv
cihzdHJ1Y3QgbWVzc2FnaW5nX2NvbnRleHQgKmN0eCkKIAlyZXR1cm4gMDsKIH0KIAotc3Rh
dGljIGNvbnN0IGNoYXIgKnByaXZhdGVfcGF0aChjb25zdCBjaGFyICpuYW1lKQotewotCXJl
dHVybiB0YWxsb2NfYXNwcmludGYodGFsbG9jX3RvcygpLCAiJXMvJXMiLCBscF9wcml2YXRl
X2RpcigpLCBuYW1lKTsKLX0KLQogc3RhdGljIE5UU1RBVFVTIG1lc3NhZ2luZ19pbml0X2lu
dGVybmFsKFRBTExPQ19DVFggKm1lbV9jdHgsCiAJCQkJCXN0cnVjdCB0ZXZlbnRfY29udGV4
dCAqZXYsCiAJCQkJCXN0cnVjdCBtZXNzYWdpbmdfY29udGV4dCAqKnBtc2dfY3R4KQpAQCAt
NTAwLDcgKzQ5NSw3IEBAIHN0YXRpYyBOVFNUQVRVUyBtZXNzYWdpbmdfaW5pdF9pbnRlcm5h
bChUQUxMT0NfQ1RYICptZW1fY3R4LAogCQlyZXR1cm4gTlRfU1RBVFVTX0FDQ0VTU19ERU5J
RUQ7CiAJfQogCi0JcHJpdl9wYXRoID0gcHJpdmF0ZV9wYXRoKCJtc2cuc29jayIpOworCXBy
aXZfcGF0aCA9IGxvY2tfcGF0aCh0YWxsb2NfdG9zKCksICJtc2cuc29jayIpOwogCWlmIChw
cml2X3BhdGggPT0gTlVMTCkgewogCQlyZXR1cm4gTlRfU1RBVFVTX05PX01FTU9SWTsKIAl9
CkBAIC02NjMsNyArNjU4LDcgQEAgTlRTVEFUVVMgbWVzc2FnaW5nX3JlaW5pdChzdHJ1Y3Qg
bWVzc2FnaW5nX2NvbnRleHQgKm1zZ19jdHgpCiAJCW1zZ19jdHgtPnBlcl9wcm9jZXNzX3Rh
bGxvY19jdHgsCiAJCW1zZ19jdHgtPmV2ZW50X2N0eCwKIAkJJm1zZ19jdHgtPmlkLnVuaXF1
ZV9pZCwKLQkJcHJpdmF0ZV9wYXRoKCJtc2cuc29jayIpLAorCQlsb2NrX3BhdGgodGFsbG9j
X3RvcygpLCAibXNnLnNvY2siKSwKIAkJbGNrX3BhdGgsCiAJCW1lc3NhZ2luZ19yZWN2X2Ni
LAogCQltc2dfY3R4LApkaWZmIC0tZ2l0IGEvc291cmNlNC9saWIvbWVzc2FnaW5nL21lc3Nh
Z2luZy5jIGIvc291cmNlNC9saWIvbWVzc2FnaW5nL21lc3NhZ2luZy5jCmluZGV4IGEwMGMz
NWJlMGQ1Li5kYTY0MWJjMDZhYSAxMDA2NDQKLS0tIGEvc291cmNlNC9saWIvbWVzc2FnaW5n
L21lc3NhZ2luZy5jCisrKyBiL3NvdXJjZTQvbGliL21lc3NhZ2luZy9tZXNzYWdpbmcuYwpA
QCAtNTAwLDcgKzUwMCw3IEBAIHN0cnVjdCBpbWVzc2FnaW5nX2NvbnRleHQgKmltZXNzYWdp
bmdfaW5pdChUQUxMT0NfQ1RYICptZW1fY3R4LAogCQlnb3RvIGZhaWw7CiAJfQogCi0JbXNn
LT5zb2NrX2RpciA9IGxwY2ZnX3ByaXZhdGVfcGF0aChtc2csIGxwX2N0eCwgIm1zZy5zb2Nr
Iik7CisJbXNnLT5zb2NrX2RpciA9IGxwY2ZnX2xvY2tfcGF0aChtc2csIGxwX2N0eCwgIm1z
Zy5zb2NrIik7CiAJaWYgKG1zZy0+c29ja19kaXIgPT0gTlVMTCkgewogCQlnb3RvIGZhaWw7
CiAJfQo=

--------------cIb3V0vjiZturGJIf50oe7M0--

