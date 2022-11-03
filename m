Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFC617685
	for <lists+samba-technical@lfdr.de>; Thu,  3 Nov 2022 07:01:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ozxyfahGtcgcP7mhI1e+m4oNCH8hXdm9QHZJ5/rl2FM=; b=CvZ4w9a+Mtk8feYyIwQbNNn5I3
	gGTQLRlZNA33aYPBnLhM7R2uRqIOFNIdBZIhKcpkM1xsPtNl/POosxyLOPyj27befCJwc13r3DBKK
	J6qxDEpnkR2OZlMhcnt6N38sPXs7fotEZmXcjlFJcKpZnjr6vKn8vKUokB15apJ+/Uy042htrLcYn
	AB/XPKFpvYaGRvEL7xwWiXuYPfUkpsRuuyve2duC0BIND1JCx2dpjkbd/lbvU4d4kJdZ/TybQtHmf
	9nh2U6bUKR24H/je76kgma/CbpVron8ojDGznFxNyzON6PuW05PdwUcMhDliCz6iipSaVH8wL0wiz
	+7a0774A==;
Received: from ip6-localhost ([::1]:58302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqTHo-00AEI3-Cj; Thu, 03 Nov 2022 06:01:08 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:40067) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqTHg-00AEH7-6K
 for samba-technical@lists.samba.org; Thu, 03 Nov 2022 06:01:05 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CDB24405CE
 for <samba-technical@lists.samba.org>; Thu,  3 Nov 2022 09:00:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8AB723D3
 for <samba-technical@lists.samba.org>; Thu,  3 Nov 2022 09:01:01 +0300 (MSK)
Content-Type: multipart/mixed; boundary="------------1Yivx240KRk5jzdKZCra7zbw"
Message-ID: <f3548884-736e-f7d8-2eba-af5f02bfa7c4@msgid.tls.msk.ru>
Date: Thu, 3 Nov 2022 09:00:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: Move msg.sock from var/lib/samba to /run/samba?
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
--------------1Yivx240KRk5jzdKZCra7zbw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

What's the reason to have msg.sock directory (for sockets to communicate
with various samba processes) in /var/lib/samba/ (in private_directory)
instead of in run directory where it clearly belongs?

On linux, this would be /run/samba/msg.sock/.

Below is a patch I use in Debian since Apr this year. There's no "rundir"
parameter in samba, it is "lockdir", - I used this one. It smells a bit
hackish, but maybe we should introduce "rundir" parameter and point
"lockdir" to it, or just rename --with-lockdir to --with-rundir.

There's also --with-sockets-dir but that one is used for different purpose.

(A side note, there are many configure-time parameters which are misnamed.
For example, -with-privileged-socket-dir is not used for anything but
ntp_signd/, maybe it should be renamed to --with-ntp-signd-dir. Ditto for
some parameters related to ctdb only, but from the name it looks like it
should affect samba too. Should we clean up this mess?)

Thanks,

/mjt
--------------1Yivx240KRk5jzdKZCra7zbw
Content-Type: text/x-patch; charset=UTF-8;
 name="move-msg.sock-from-var-lib-samba-to-run-samba.patch"
Content-Disposition: attachment;
 filename="move-msg.sock-from-var-lib-samba-to-run-samba.patch"
Content-Transfer-Encoding: base64

RnJvbTogTWljaGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KRGF0ZTogVHVlLCAyNiBB
cHIgMjAyMiAxNjoxMTo0OCArMDMwMApTdWJqZWN0OiBtb3ZlIG1zZy5zb2NrIGZyb20gL3Zh
ci9saWIvc2FtYmEgdG8gL3J1bi9zYW1iYQoKVGhpcyBtb3ZlcyBhIHNvY2tldCBkaXJlY3Rv
cnkgZnJvbSAvdmFyL2xpYi9zYW1iYSB0byAvcnVuL3NhbWJhLgoKaHR0cHM6Ly9saXN0cy5z
YW1iYS5vcmcvYXJjaGl2ZS9zYW1iYS10ZWNobmljYWwvMjAyMi1BcHJpbC8xMzczMjIuaHRt
bAoKZGlmZiAtLWdpdCBhL3NvdXJjZTMvbGliL21lc3NhZ2VzLmMgYi9zb3VyY2UzL2xpYi9t
ZXNzYWdlcy5jCmluZGV4IDg2NDFhOWRhZDU2Li5iZjg2NmU2NWU0NCAxMDA2NDQKLS0tIGEv
c291cmNlMy9saWIvbWVzc2FnZXMuYworKysgYi9zb3VyY2UzL2xpYi9tZXNzYWdlcy5jCkBA
IC00NjEsMTEgKzQ2MSw2IEBAIHN0YXRpYyBpbnQgbWVzc2FnaW5nX2NvbnRleHRfZGVzdHJ1
Y3RvcihzdHJ1Y3QgbWVzc2FnaW5nX2NvbnRleHQgKmN0eCkKIAlyZXR1cm4gMDsKIH0KIAot
c3RhdGljIGNvbnN0IGNoYXIgKnByaXZhdGVfcGF0aChjb25zdCBjaGFyICpuYW1lKQotewot
CXJldHVybiB0YWxsb2NfYXNwcmludGYodGFsbG9jX3RvcygpLCAiJXMvJXMiLCBscF9wcml2
YXRlX2RpcigpLCBuYW1lKTsKLX0KLQogc3RhdGljIE5UU1RBVFVTIG1lc3NhZ2luZ19pbml0
X2ludGVybmFsKFRBTExPQ19DVFggKm1lbV9jdHgsCiAJCQkJCXN0cnVjdCB0ZXZlbnRfY29u
dGV4dCAqZXYsCiAJCQkJCXN0cnVjdCBtZXNzYWdpbmdfY29udGV4dCAqKnBtc2dfY3R4KQpA
QCAtNTAwLDcgKzQ5NSw3IEBAIHN0YXRpYyBOVFNUQVRVUyBtZXNzYWdpbmdfaW5pdF9pbnRl
cm5hbChUQUxMT0NfQ1RYICptZW1fY3R4LAogCQlyZXR1cm4gTlRfU1RBVFVTX0FDQ0VTU19E
RU5JRUQ7CiAJfQogCi0JcHJpdl9wYXRoID0gcHJpdmF0ZV9wYXRoKCJtc2cuc29jayIpOwor
CXByaXZfcGF0aCA9IGxvY2tfcGF0aCh0YWxsb2NfdG9zKCksICJtc2cuc29jayIpOwogCWlm
IChwcml2X3BhdGggPT0gTlVMTCkgewogCQlyZXR1cm4gTlRfU1RBVFVTX05PX01FTU9SWTsK
IAl9CkBAIC02NjMsNyArNjU4LDcgQEAgTlRTVEFUVVMgbWVzc2FnaW5nX3JlaW5pdChzdHJ1
Y3QgbWVzc2FnaW5nX2NvbnRleHQgKm1zZ19jdHgpCiAJCW1zZ19jdHgtPnBlcl9wcm9jZXNz
X3RhbGxvY19jdHgsCiAJCW1zZ19jdHgtPmV2ZW50X2N0eCwKIAkJJm1zZ19jdHgtPmlkLnVu
aXF1ZV9pZCwKLQkJcHJpdmF0ZV9wYXRoKCJtc2cuc29jayIpLAorCQlsb2NrX3BhdGgodGFs
bG9jX3RvcygpLCAibXNnLnNvY2siKSwKIAkJbGNrX3BhdGgsCiAJCW1lc3NhZ2luZ19yZWN2
X2NiLAogCQltc2dfY3R4LApkaWZmIC0tZ2l0IGEvc291cmNlNC9saWIvbWVzc2FnaW5nL21l
c3NhZ2luZy5jIGIvc291cmNlNC9saWIvbWVzc2FnaW5nL21lc3NhZ2luZy5jCmluZGV4IGEw
MGMzNWJlMGQ1Li5kYTY0MWJjMDZhYSAxMDA2NDQKLS0tIGEvc291cmNlNC9saWIvbWVzc2Fn
aW5nL21lc3NhZ2luZy5jCisrKyBiL3NvdXJjZTQvbGliL21lc3NhZ2luZy9tZXNzYWdpbmcu
YwpAQCAtNTAwLDcgKzUwMCw3IEBAIHN0cnVjdCBpbWVzc2FnaW5nX2NvbnRleHQgKmltZXNz
YWdpbmdfaW5pdChUQUxMT0NfQ1RYICptZW1fY3R4LAogCQlnb3RvIGZhaWw7CiAJfQogCi0J
bXNnLT5zb2NrX2RpciA9IGxwY2ZnX3ByaXZhdGVfcGF0aChtc2csIGxwX2N0eCwgIm1zZy5z
b2NrIik7CisJbXNnLT5zb2NrX2RpciA9IGxwY2ZnX2xvY2tfcGF0aChtc2csIGxwX2N0eCwg
Im1zZy5zb2NrIik7CiAJaWYgKG1zZy0+c29ja19kaXIgPT0gTlVMTCkgewogCQlnb3RvIGZh
aWw7CiAJfQo=

--------------1Yivx240KRk5jzdKZCra7zbw--

