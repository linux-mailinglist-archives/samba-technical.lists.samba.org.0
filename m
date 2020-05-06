Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B31C7275
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 16:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=h7+qaOvtaI1leOfEqsIBkA89dXcDED24STdNWclmLpI=; b=2MBLaCgAoT69OePrOmgG/IiGax
	kMnzJF0L0InntrAnQmh2rzLAM8AXYDsAp+1r4d5kT9esEfTr1xghZ4xAKfeEgPiwSbxvJa8FYxJOn
	x3B28Xx6mqfxzc6WO/kFFUrPAQvFenG74ElsfQ63EdFgPh2OArGxgkT+fAEYmWgVju2N6cG6AmybI
	mqJVflXNbjisrH8RuIk7B9yASbUma01udxc7qcSWPBmuiFnKjG7sqjZXoNVoud0qCcyEXJrMUZZ5B
	n1Hqatxm5zBGtTQHv9FgLOZ5MgxrKit30Jbx9N2IqQe+cy2cnoyVQ+vvBW1mnvfZM52G18uoYgpmK
	/6Ru3AxA==;
Received: from localhost ([::1]:40884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWKil-0031MV-NC; Wed, 06 May 2020 14:08:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14084) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWKia-0031MN-R1
 for samba-technical@lists.samba.org; Wed, 06 May 2020 14:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=h7+qaOvtaI1leOfEqsIBkA89dXcDED24STdNWclmLpI=; b=KfbkXiiS2MVTF2+/UD+GVXTxue
 PamPY7fJj2lhlt+X6e/hnzd9ymDWhPlFgDm5VMLg8dryVMP+iwE1lQbq5P/wM/CO7Vg51bHo2bLBk
 k+scZ8W2sn0NRT9TSCq3fPfO0xMgoBJbG+oJmk9JKPHLWA85t/uHKJoEp7uqiZCrKu4OGEoGbiepS
 XFYKWC77yZXM3uFMuxIlsj8QfcskoUwyQX7sr4ep+tMNpGHUwC6ICIBtlKYvNwfExdqYAA3WirgTk
 pI6QsyabL6rxBa1nnh1RaWOfb1K32s6oBSI89rUK4euGoOQl1S9g9IQKc0TMS0/XN9V3OHEZxnBbv
 niyO3qlIfMZYFOoeZUXDpZ4bNtWWa0IJAZHcUzoiyhOI7kKlDgrx3HVN1i4grM6IvsGiavC+IUOk1
 7hdY2r5Tu6pR3yCGc88qm9a0w9fQbxFNVNX2EY9uns+UFpHbij65XbeRbAoLj3upRQv21Dm0sYDOj
 jLjNeBZCLrdTYsXgDcfUP/DA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWKiW-0006Mu-5p; Wed, 06 May 2020 14:08:08 +0000
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
Date: Wed, 6 May 2020 16:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="oqSFiBMp4xkjD5VCJI2wb8vnqVFKtW360"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oqSFiBMp4xkjD5VCJI2wb8vnqVFKtW360
Content-Type: multipart/mixed; boundary="76p3eEz3rag006ZS10VQa6qLZFX1I4Fp4";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>
Message-ID: <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
In-Reply-To: <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>

--76p3eEz3rag006ZS10VQa6qLZFX1I4Fp4
Content-Type: multipart/mixed;
 boundary="------------F4CE884FA60F731499A631B0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F4CE884FA60F731499A631B0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 06.05.20 um 14:41 schrieb Anoop C S:
> On Wed, 2020-05-06 at 12:33 +0200, Stefan Metzmacher wrote:
>> Hi Anoop,
>>
>>> I could reproduce the difference in SHA256 checksum after copying a
>>> directory with 100 copies of test file(provided by reporter) from
>>> io_uring VFS module enabled share using Windows explorer(right-
>>> click-
>>>> copy/paste). Only 5 out of 100 files had correct checksum after
>>>> copy
>>> operation :-/
>>
>> Great! Can you please try to collect level 1 log files with
>> the patch https://bugzilla.samba.org/attachment.cgi?id=3D15955
>> applied?
>=20
> I have attached three log files.
> log.io_uring.smbd -- Copy using Windows explorer
> log.io_uring-mget.smd -- Copy using smbclient
> log.io_uring-powershell.smd -- Copy using `Copy-Item`

Thanks! All of them show short reads like:

> [2020/05/06 17:27:28.130248,  1] ../../source3/modules/vfs_io_uring.c:1=
03(vfs_io_uring_finish_req)
>   vfs_io_uring_finish_req: pread ofs=3D0 (0x0) len=3D32768 (0x8000) nre=
ad=3D32768 (0x32768) eof=3D10000000 (0x989680) blks=3D4096 blocks=3D19536=
 dir/1.bin fnum 1607026405
> [2020/05/06 17:27:28.131049,  1] ../../source3/modules/vfs_io_uring.c:1=
03(vfs_io_uring_finish_req)
>   vfs_io_uring_finish_req: pread ofs=3D9969664 (0x982000) len=3D30336 (=
0x7680) nread=3D30336 (0x30336) eof=3D10000000 (0x989680) blks=3D4096 blo=
cks=3D19536 dir/1.bin fnum 1607026405
> [2020/05/06 17:27:28.133679,  1] ../../source3/modules/vfs_io_uring.c:1=
03(vfs_io_uring_finish_req)
>   vfs_io_uring_finish_req: pread ofs=3D61440 (0xf000) len=3D32768 (0x80=
00) nread=3D32768 (0x32768) eof=3D10000000 (0x989680) blks=3D4096 blocks=3D=
19536 dir/1.bin fnum 1607026405
> [2020/05/06 17:27:28.140184,  0] ../../source3/modules/vfs_io_uring.c:8=
8(vfs_io_uring_finish_req)
>   vfs_io_uring_finish_req: Invalid pread ofs=3D0 (0x0) len=3D1048576 (0=
x100000) nread=3D32768 (0x32768) eof=3D10000000 (0x989680) blks=3D4096 bl=
ocks=3D19536 dir/1.bin fnum 1607026405

It seems the first request is at ofs=3D0 len=3D32768 (0x8000) and we get
32768 back.
A follow up request with ofs=3D0 len=3D1048576 (0x100000) only gets the
first 32768 bytes which are already in the page cache.

I can easily reproduce this with the Ubuntu 5.4 kernel once I add
state->ur.sqe.rw_flags |=3D RWF_NOWAIT; to vfs_io_uring_pread_send()
and use this.

echo 1 > /proc/sys/vm/drop_caches
head -c 1024 /root/samba-test/ff1.dat | hexdump -C
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
*
00000400
smbclient //172.31.9.167/uringff -Uroot%test -c "get ff1.dat"

results in this log entries:
> [2020/05/06 06:51:57.069990,  0] ../../source3/modules/vfs_io_uring.c:8=
9(vfs_io_uring_finish_req)
>   vfs_io_uring_finish_req: Invalid pread ofs=3D0 (0x0) len=3D8388608 (0=
x800000) nread=3D16384 (0x4000) eof=3D8388608 (0x800000) blks=3D4096 bloc=
ks=3D16384 ff1.dat fnum 840153065
> [2020/05/06 06:51:57.076882,  1] ../../source3/modules/vfs_io_uring.c:1=
04(vfs_io_uring_finish_req)
>   vfs_io_uring_finish_req: pread ofs=3D16384 (0x4000) len=3D8372224 (0x=
7fc000) nread=3D8372224 (0x7fc000) eof=3D8388608 (0x800000) blks=3D4096 b=
locks=3D16384 ff1.dat fnum 840153065

smbclient is just smart enough to recover itself from the short read.
But the windows client isn't.

The attached test against liburing (git://git.kernel.dk/liburing) should
be able to demonstrate the problem. It can also be found in
https://github.com/metze-samba/liburing/tree/implicit-rwf-nowaithttps://g=
ithub.com/metze-samba/liburing/commit/eb06dcfde747e46bd08bedf9def2e6cb536=
c39e3


I added the sqe->rw_flags =3D RWF_NOWAIT; line in order to demonstrate it=

against the Ubuntu 5.3 and 5.4 kernels. They both seem to have the bug.

Can someone run the unmodified test/implicit-rwf_nowait against
a newer kernel?

Thanks!
metze

--------------F4CE884FA60F731499A631B0
Content-Type: text/plain; charset=UTF-8;
 name="tmp.diff.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="tmp.diff.txt"

RnJvbSBlYjA2ZGNmZGU3NDdlNDZiZDA4YmVkZjlkZWYyZTZjYjUzNmMzOWUzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEu
b3JnPgpEYXRlOiBXZWQsIDYgTWF5IDIwMjAgMTU6MzM6NTMgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBUT0RPISEhIHRlc3QvaW1wbGljaXQtcndmX25vd2FpdC5jCgpPbmNlIHRoaXMgcHJv
dmVzIHRoZSBwcm9ibGVtLCB3ZSBuZWVkIGEgbW9yZSBkZXRhaWxlZCBjb21taXQgbWVzc2Fn
ZS4uLgotLS0KIHRlc3QvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICA0ICstCiB0ZXN0L2lt
cGxpY2l0LXJ3Zl9ub3dhaXQuYyB8IDE2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3QvaW1wbGljaXQtcndmX25vd2FpdC5j
CgpkaWZmIC0tZ2l0IGEvdGVzdC9NYWtlZmlsZSBiL3Rlc3QvTWFrZWZpbGUKaW5kZXggZmY0
ZDRiOGVjMDRhLi41MGE3NTU4OGFjYTcgMTAwNjQ0Ci0tLSBhL3Rlc3QvTWFrZWZpbGUKKysr
IGIvdGVzdC9NYWtlZmlsZQpAQCAtMjEsNyArMjEsNyBAQCBhbGxfdGFyZ2V0cyArPSBwb2xs
IHBvbGwtY2FuY2VsIHJpbmctbGVhayBmc3luYyBpb191cmluZ19zZXR1cCBpb191cmluZ19y
ZWdpc3RlcgogCQlmaWxlLXVwZGF0ZSBhY2NlcHQtcmV1c2UgcG9sbC12LXBvbGwgZmFkdmlz
ZSBtYWR2aXNlIFwKIAkJc2hvcnQtcmVhZCBvcGVuYXQyIHByb2JlIHNoYXJlZC13cSBwZXJz
b25hbGl0eSBldmVudGZkIFwKIAkJc2VuZF9yZWN2IGV2ZW50ZmQtcmluZyBhY3Jvc3MtZm9y
ayBzcS1wb2xsLWt0aHJlYWQgc3BsaWNlIFwKLQkJbGZzLW9wZW5hdCBsZnMtb3BlbmF0LXdy
aXRlCisJCWxmcy1vcGVuYXQgbGZzLW9wZW5hdC13cml0ZSBpbXBsaWNpdC1yd2Zfbm93YWl0
CiAKIGluY2x1ZGUgLi4vTWFrZWZpbGUucXVpZXQKIApAQCAtNTMsNyArNTMsNyBAQCB0ZXN0
X3NyY3MgOj0gcG9sbC5jIHBvbGwtY2FuY2VsLmMgcmluZy1sZWFrLmMgZnN5bmMuYyBpb191
cmluZ19zZXR1cC5jIFwKIAlmaWxlLXVwZGF0ZS5jIGFjY2VwdC1yZXVzZS5jIHBvbGwtdi1w
b2xsLmMgZmFkdmlzZS5jIFwKIAltYWR2aXNlLmMgc2hvcnQtcmVhZC5jIG9wZW5hdDIuYyBw
cm9iZS5jIHNoYXJlZC13cS5jIFwKIAlwZXJzb25hbGl0eS5jIGV2ZW50ZmQuYyBldmVudGZk
LXJpbmcuYyBhY3Jvc3MtZm9yay5jIHNxLXBvbGwta3RocmVhZC5jIFwKLQlzcGxpY2UuYyBs
ZnMtb3BlbmF0LmMgbGZzLW9wZW5hdC13cml0ZS5jCisJc3BsaWNlLmMgbGZzLW9wZW5hdC5j
IGxmcy1vcGVuYXQtd3JpdGUuYyBpbXBsaWNpdC1yd2Ytbm93YWl0LmMKIAogaWZkZWYgQ09O
RklHX0hBVkVfU1RBVFgKIHRlc3Rfc3JjcyArPSBzdGF0eC5jCmRpZmYgLS1naXQgYS90ZXN0
L2ltcGxpY2l0LXJ3Zl9ub3dhaXQuYyBiL3Rlc3QvaW1wbGljaXQtcndmX25vd2FpdC5jCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNTgxZGYyMDlkMjk1Ci0t
LSAvZGV2L251bGwKKysrIGIvdGVzdC9pbXBsaWNpdC1yd2Zfbm93YWl0LmMKQEAgLTAsMCAr
MSwxNjIgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8KKy8qCisgKiBE
ZXNjcmlwdGlvbjogSW1wbGljaXQgUldGX05PV0FJVCBidWcKKyAqCisgKi8KKyNpbmNsdWRl
IDxlcnJuby5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSA8dW5pc3RkLmg+Cisj
aW5jbHVkZSA8c3RkbGliLmg+CisjaW5jbHVkZSA8c3RyaW5nLmg+CisjaW5jbHVkZSA8ZmNu
dGwuaD4KKworI2luY2x1ZGUgImxpYnVyaW5nLmgiCisKKyNkZWZpbmUgQkxPQ0sJNDA5Ngor
CisjaWZuZGVmIFJXRl9OT1dBSVQKKyNkZWZpbmUgUldGX05PV0FJVAk4CisjZW5kaWYKKwor
c3RhdGljIGludCBnZXRfZmlsZV9mZCh2b2lkKQoreworCXNzaXplX3QgcmV0OworCWNoYXIg
KmJ1ZjsKKwlpbnQgZmQ7CisKKwlmZCA9IG9wZW4oInRlc3RmaWxlIiwgT19SRFdSIHwgT19D
UkVBVCwgMDY0NCk7CisJaWYgKGZkIDwgMCkgeworCQlwZXJyb3IoIm9wZW4gZmlsZSIpOwor
CQlyZXR1cm4gLTE7CisJfQorCisJYnVmID0gbWFsbG9jKEJMT0NLKTsKKwltZW1zZXQoYnVm
LCAweGZmLCBCTE9DSyk7CisJcmV0ID0gcHdyaXRlKGZkLCBidWYsIEJMT0NLLCAwKTsKKwlp
ZiAocmV0ICE9IEJMT0NLKSB7CisJCWlmIChyZXQgPCAwKQorCQkJcGVycm9yKCJ3cml0ZSIp
OworCQllbHNlCisJCQlwcmludGYoIlNob3J0IHdyaXRlXG4iKTsKKwkJZ290byBlcnI7CisJ
fQorCXJldCA9IHB3cml0ZShmZCwgYnVmLCBCTE9DSywgQkxPQ0spOworCWlmIChyZXQgIT0g
QkxPQ0spIHsKKwkJaWYgKHJldCA8IDApCisJCQlwZXJyb3IoIndyaXRlIik7CisJCWVsc2UK
KwkJCXByaW50ZigiU2hvcnQgd3JpdGVcbiIpOworCQlnb3RvIGVycjsKKwl9CisJZnN5bmMo
ZmQpOworCisJaWYgKHBvc2l4X2ZhZHZpc2UoZmQsIEJMT0NLLCBCTE9DSywgUE9TSVhfRkFE
Vl9ET05UTkVFRCkpIHsKKwkJcGVycm9yKCJmYWR2aXNlIik7CitlcnI6CisJCWNsb3NlKGZk
KTsKKwkJZnJlZShidWYpOworCQlyZXR1cm4gLTE7CisJfQorCisJZnJlZShidWYpOworCXJl
dHVybiBmZDsKK30KKworc3RhdGljIHZvaWQgcHV0X2ZpbGVfZmQoaW50IGZkKQoreworCWNs
b3NlKGZkKTsKKwl1bmxpbmsoInRlc3RmaWxlIik7Cit9CisKK2ludCBtYWluKGludCBhcmdj
LCBjaGFyICphcmd2W10pCit7CisJc3RydWN0IGlvX3VyaW5nIHJpbmc7CisJc3RydWN0IGlv
X3VyaW5nX3NxZSAqc3FlOworCXN0cnVjdCBpb191cmluZ19jcWUgKmNxZTsKKwlzdHJ1Y3Qg
aW92ZWMgaW92OworCWludCByZXQsIGZkOworCisJaW92Lmlvdl9iYXNlID0gbWFsbG9jKDIq
QkxPQ0spOworCWlvdi5pb3ZfbGVuID0gQkxPQ0s7CisKKwlyZXQgPSBpb191cmluZ19xdWV1
ZV9pbml0KDEsICZyaW5nLCAwKTsKKwlpZiAocmV0KSB7CisJCXByaW50ZigicmluZyBzZXR1
cCBmYWlsZWRcbiIpOworCQlyZXR1cm4gMTsKKworCX0KKworCXNxZSA9IGlvX3VyaW5nX2dl
dF9zcWUoJnJpbmcpOworCWlmICghc3FlKSB7CisJCXByaW50ZigiZ2V0IHNxZSBmYWlsZWRc
biIpOworCQlyZXR1cm4gMTsKKwl9CisKKwlmZCA9IGdldF9maWxlX2ZkKCk7CisJaWYgKGZk
IDwgMCkKKwkJcmV0dXJuIDE7CisKKwlpb191cmluZ19wcmVwX3JlYWR2KHNxZSwgZmQsICZp
b3YsIDEsIDApOworCWlvX3VyaW5nX3NxZV9zZXRfZGF0YShzcWUsICh2b2lkICopKHVpbnRw
dHJfdCkweDExMTExMTExKTsKKwlyZXQgPSBpb191cmluZ19zdWJtaXQoJnJpbmcpOworCWlm
IChyZXQgIT0gMSkgeworCQlwcmludGYoIkdvdCBzdWJtaXQgJWQsIGV4cGVjdGVkIDFcbiIs
IHJldCk7CisJCWdvdG8gZXJyOworCX0KKworCXJldCA9IGlvX3VyaW5nX3dhaXRfY3FlKCZy
aW5nLCAmY3FlKTsKKwlpZiAocmV0KSB7CisJCXByaW50ZigiUmluZyB3YWl0IGdvdCAlZFxu
IiwgcmV0KTsKKwkJZ290byBlcnI7CisJfQorCXJldCA9ICh1aW50cHRyX3QpaW9fdXJpbmdf
Y3FlX2dldF9kYXRhKGNxZSk7CisJaWYgKHJldCAhPSAweDExMTExMTExKSB7CisJCXByaW50
ZigiR290IGludmFsaWQgZGF0YSAweCUwOHgsIGV4cGVjdGVkIDB4MTExMTExMTFcbiIsIHJl
dCk7CisJCWdvdG8gZXJyOworCX0KKwlpb191cmluZ19jcV9hZHZhbmNlKCZyaW5nLCAxKTsK
KworCWlmIChjcWUtPnJlcyAhPSBCTE9DSykgeworCQlwcmludGYoImNxZSByZXM9JWQgIT0g
JXVcbiIsIGNxZS0+cmVzLCBCTE9DSyk7CisJCWdvdG8gZXJyOworCX0KKworCXNxZSA9IGlv
X3VyaW5nX2dldF9zcWUoJnJpbmcpOworCWlmICghc3FlKSB7CisJCXByaW50ZigiZ2V0IHNx
ZSBmYWlsZWRcbiIpOworCQlyZXR1cm4gMTsKKwl9CisKKwlpb3YuaW92X2xlbiA9IDIqQkxP
Q0s7CisJaW9fdXJpbmdfcHJlcF9yZWFkdihzcWUsIGZkLCAmaW92LCAxLCAwKTsKKwkvLyBJ
bXBsaWV0IGJ5IGJyb2tlbiBrZXJuZWxzPyBzcWUtPnJ3X2ZsYWdzID0gUldGX05PV0FJVDsK
Kwlpb191cmluZ19zcWVfc2V0X2RhdGEoc3FlLCAodm9pZCAqKSh1aW50cHRyX3QpMHgyMjIy
MjIyMik7CisJcmV0ID0gaW9fdXJpbmdfc3VibWl0KCZyaW5nKTsKKwlpZiAocmV0ICE9IDEp
IHsKKwkJcHJpbnRmKCJHb3Qgc3VibWl0ICVkLCBleHBlY3RlZCAxXG4iLCByZXQpOworCQln
b3RvIGVycjsKKwl9CisKKwlyZXQgPSBpb191cmluZ193YWl0X2NxZSgmcmluZywgJmNxZSk7
CisJaWYgKHJldCkgeworCQlwcmludGYoIlJpbmcgcGVlayBnb3QgJWRcbiIsIHJldCk7CisJ
CWdvdG8gZXJyOworCX0KKwlyZXQgPSAodWludHB0cl90KWlvX3VyaW5nX2NxZV9nZXRfZGF0
YShjcWUpOworCWlmIChyZXQgIT0gMHgyMjIyMjIyMikgeworCQlwcmludGYoIkdvdCBpbnZh
bGlkIGRhdGEgMHglMDh4LCBleHBlY3RlZCAweDIyMjIyMjIyXG4iLCByZXQpOworCQlnb3Rv
IGVycjsKKwl9CisJaW9fdXJpbmdfY3FfYWR2YW5jZSgmcmluZywgMSk7CisKKwlpZiAoY3Fl
LT5yZXMgIT0gMipCTE9DSykgeworCQlwcmludGYoImNxZSByZXM9JWQgIT0gJXVcbiIsIGNx
ZS0+cmVzLCAyKkJMT0NLKTsKKwkJZ290byBlcnI7CisJfQorCisJcHV0X2ZpbGVfZmQoZmQp
OworCXJldHVybiAwOworZXJyOgorCXB1dF9maWxlX2ZkKGZkKTsKKwlyZXR1cm4gMTsKK30K
LS0gCjIuMTcuMQoK
--------------F4CE884FA60F731499A631B0--

--76p3eEz3rag006ZS10VQa6qLZFX1I4Fp4--

--oqSFiBMp4xkjD5VCJI2wb8vnqVFKtW360
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6yxMMACgkQDbX1YShp
vVacxBAAkav6TeThEocvLLQKCvvgGqRzMChep5btyqbZZGLgG8YtWSl6q0OYYt8r
/gZr73ueAaIsjUrN5BARQNyd2rlyaq2hmr12iMAJj8lI3qvmGjpi3VMrxSLyNjqj
aB2nXriS8bqRzZWNDZzQb/nzQCCcDHDr15N0q7j2fb+ih5AA6PoUkDXlTgCx8vS0
4TcwjMJqkiwS0JNj4LIFNb20wOxCaQ9UnbINHBKadmg8bLCK1gzriB09CPgSIkhQ
BdzRkJEgopF/UI5DG25d8Y4MnP11F+ajREgK/iAgY3toCX3xQ0o4/KN415en5TgL
g5dc2jo2l23FPPSNOOe3sNTIE563PEXt1BwMsYHSU6vUydkXpGj4ghee5zG79rvs
ySXCtSI6Bqa26Rk87tLociZvpQSRc8Rz7ndZgmfQa8aWfQGEIVhp15N0MTN13MEp
BqSh1Ix2J0PJeBpCo+h2oY0frpzrvSQJhbJ6ZcIsXxKLY1oNjSN4cw6vZ0wk6+h7
ZikFZJscmcvp2SSCoPZx621YOpuPXnXUId+OrNzqniBm4vBD3oMxGwzN6dTvUCRB
Iwb6TfuIQjlDKKplSOP00ND7EH+/Vte8XwkljBlaJnRJ/uv5Yj+lV4ZMqAgZo2E/
vw3bhQtb/cw3vZjJ3PD5LQOiPey/WgtZUiLxgLInmGlhcg4Di60=
=U5z1
-----END PGP SIGNATURE-----

--oqSFiBMp4xkjD5VCJI2wb8vnqVFKtW360--

