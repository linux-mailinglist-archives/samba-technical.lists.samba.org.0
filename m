Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C218E10978B
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 02:23:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5s/gdlkg00rRAQFhBEJmSZR2mTiUQ5Y8jH6wd6Pjwwc=; b=bXWnfk861G25Vy0p0xsR1ohWXZ
	9QB+MswNV6QLOsEqvIRwslIXOIJKBjv46dbyn45zoVSyixc5a787ZBtBvTHBEOBlMBjwQCMYHwbwf
	3fY1veHZjdM9Lo27VmmAGC275Z9o7IQy1NLYong4C+niT9MxUhVc4IrDDx8Wzm3qIfi3QjgkUNSmz
	PGuqIOfR6fToD6eKfEHRY2rZ5MyRsylphwOBlNmrdKJTxuKDoJxBX6l3B4T2ltUM1/Dk2uo1z/lNB
	sBAYewnLBYuPANW4jEfRX/slFyhbvGuIVWaW5HFHmC+VcF62gpLIMrLVBwFRQHcuvQiUIR8GnSHWM
	ACFq1ZWA==;
Received: from localhost ([::1]:29922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZPZ4-002OFx-Mo; Tue, 26 Nov 2019 01:22:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZPZ0-002OFq-PM
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 01:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=5s/gdlkg00rRAQFhBEJmSZR2mTiUQ5Y8jH6wd6Pjwwc=; b=sdIdf51YAQ+Ok1aFrqQxGeolan
 v8p+57TbEEIuKItnI3Y8wILphVP3ix86VPd4jaHQ8qGciC8tEoCWjGVE3Zpfc/Q3lZjjx5AFsKYfP
 HrfvdSmECp+lQNW3cXZSuiDQhGZBk/ZzkAX3FOziRiU0h81bqWWJ34khGBtmApBg8PYZJQ81RpoXv
 qW4iqjuBj2EBRvaS81ZBfSP40049bQ881WQyx7fZgRgxL0LALcX13dvRtTRtRZ7hVkCEgVpqLqaZM
 Cf1uz+YtbyPIwC57jbjXhlkVFSh+qE5XekTarGhvxJ5u/IWb0k0pNk/E/2LMJlyMKkLqpdSGpmfEz
 tPzcwBWYuawRHYwrEFL8DkYeZDiizjbZU5brBwhUJQ4kJQ7B/9CkFkzx6DzRRtLTVLEjapdHUWt1h
 4Cdu4cvz6yTdqXVo1zpcIPkqq+VipH7WtTxXTlUiXXt6kfJjV6RDU8vUthSlAJMwTDonUIxGBzBms
 8KLlZBok4XLDKhIWBkmsd9VF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZPYz-0000bE-Lk
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 01:22:46 +0000
Message-ID: <f1e2562f43c0d8bf61e0edba00a6debe2fd6594a.camel@samba.org>
Subject: Re: Today's fun fact:  Oldest build of Samba on modern Ubuntu
 18.04: autoconf removal!
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 26 Nov 2019 14:22:42 +1300
In-Reply-To: <712d8619cb2ce1dac1879ec7e7a9260bb88431ef.camel@samba.org>
References: <712d8619cb2ce1dac1879ec7e7a9260bb88431ef.camel@samba.org>
Content-Type: multipart/mixed; boundary="=-vKZiThAOoy+0GTp/dnAV"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-vKZiThAOoy+0GTp/dnAV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-22 at 14:24 +1300, Andrew Bartlett via samba-technical
wrote:
> Today's fun fact is that the oldest Samba version I could build (to
> test an AD DC thing) with --enable-selftest on Ubuntu 18.04 was
> d47c1245788505cfaca9a25c855a2503c83e4315 (I didn't finish the bisect,
> but this is close enough). 
> 
> In an interesting coincidence, this is essentially the point where
> the
> old autoconf build system was removed
> (cd4b413cb0574c459c1c24cf07f8d6b44f5fc077).  That probably means that
> if using autoconf you can go back earlier without breaking out the
> VMs
> or docker containers. 
> 
> The command line (quite likely not minimal) I used was:
> 
> ADDITIONAL_CFLAGS="-Wno-error -Wno-error=format-truncation -Wno-
> error=implicit-function-declaration" ./configure --enable-selftest '
> --with-shared-modules=!vfs_ceph' --disable-gnutls
> 
> I removed libcephfs-dev to make it build (ceph has changed API since
> then). 

To do a build where replication is up and working (eg
SELFTEST_TESTENV=vampire_dc make testenv) you need to move forward a
little, to c6ad8a10c12c8a79dc83cab1591e5279edd62bd6 in Samba master
before Samba 4.3.  Presumably that could also be backported.  

Attached is a small perl build fix
(da67acbcfe2167fce9c360a55416ab10e9537a2a) that is also needed.

Anyway, I hope this helps someone trying to quickly reproduce issues on
a modern workstation. 

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





--=-vKZiThAOoy+0GTp/dnAV
Content-Disposition: attachment; filename="perl.patch"
Content-Type: text/x-patch; name="perl.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

Y29tbWl0IGRhNjdhY2JjZmUyMTY3ZmNlOWMzNjBhNTU0MTZhYjEwZTk1MzdhMmEKQXV0aG9yOiBB
bmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4KRGF0ZTogICBXZWQgT2N0IDI2IDAw
OjA2OjEyIDIwMTYgKzEzMDAKCiAgICBidWlsZDogRml4IGJ1aWxkIHdpdGggcGVybCBvbiBkZWJp
YW4gc2lkLgogICAgCiAgICBidWlsZDogRml4IGJ1aWxkIHdpdGggcGVybCBvbiBkZWJpYW4gc2lk
LgogICAgCiAgICBJdCBhcHBlYXJzIHRoYXQgIi4iIGlzIG5vIGxvbmdlciBpbiBwZXJsX2luYwog
ICAgCiAgICBCVUc6IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MjM5NQogICAgU2lnbmVkLW9mZi1ieTogQW5kcmV3IEJhcnRsZXR0IDxhYmFydGxldEBzYW1iYS5v
cmc+CiAgICBSZXZpZXdlZC1ieTogTWFydGluIFNjaHdlbmtlIDxtYXJ0aW5AbWVsdGluLm5ldD4K
ICAgIAogICAgQXV0b2J1aWxkLVVzZXIobWFzdGVyKTogTWFydGluIFNjaHdlbmtlIDxtYXJ0aW5z
QHNhbWJhLm9yZz4KICAgIEF1dG9idWlsZC1EYXRlKG1hc3Rlcik6IFNhdCBPY3QgMjkgMDk6MzI6
MzcgQ0VTVCAyMDE2IG9uIHNuLWRldmVsLTE0NAoKZGlmZiAtLWdpdCBhL2J1aWxkdG9vbHMvd2Fm
c2FtYmEvc2FtYmFfcGVybC5weSBiL2J1aWxkdG9vbHMvd2Fmc2FtYmEvc2FtYmFfcGVybC5weQpp
bmRleCBmMmYxNzZkODEzYi4uMmU5YTUzYTFlN2YgMTAwNjQ0Ci0tLSBhL2J1aWxkdG9vbHMvd2Fm
c2FtYmEvc2FtYmFfcGVybC5weQorKysgYi9idWlsZHRvb2xzL3dhZnNhbWJhL3NhbWJhX3Blcmwu
cHkKQEAgLTQ5LDcgKzQ5LDggQEAgZGVmIFNBTUJBX0NIRUNLX1BFUkwoY29uZiwgbWFuZGF0b3J5
PVRydWUsIHZlcnNpb249KDUsMCwwKSk6CiAgICAgY29uZi5lbnYuUEVSTF9MSUJfSU5TVEFMTF9E
SVIgPSBwZXJsX2xpYl9pbnN0YWxsX2RpcgogCiAgICAgcGVybF9pbmMgPSByZWFkX3BlcmxfY29u
ZmlnX3ZhcigncHJpbnQgIkBJTkMiJykKLSAgICBwZXJsX2luYy5yZW1vdmUoJy4nKQorICAgIGlm
ICcuJyBpbiBwZXJsX2luYzoKKyAgICAgICAgcGVybF9pbmMucmVtb3ZlKCcuJykKICAgICBjb25m
LnN0YXJ0X21zZygiUEVSTF9JTkM6ICIpCiAgICAgY29uZi5lbmRfbXNnKCIlcyIgJSAocGVybF9p
bmMpLCAnR1JFRU4nKQogICAgIGNvbmYuZW52LlBFUkxfSU5DID0gcGVybF9pbmMK


--=-vKZiThAOoy+0GTp/dnAV--


