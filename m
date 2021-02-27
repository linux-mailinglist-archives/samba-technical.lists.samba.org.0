Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1BF326D8B
	for <lists+samba-technical@lfdr.de>; Sat, 27 Feb 2021 16:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=KIKTZbrG9Yd9/ux/RUEoaXc0mXGl0pj+6oBIN2C2BHw=; b=s7cT/+RUjHARzpspMpbvALXFeZ
	kKozbna0hLy3eDHKdQFsxgAZAW0lbBs4rOrkyf/9aSXFq2PCxlGVI4joTzjlS7J3Qa3v76Wb+fk7s
	ZXcyrtZHFOL3oPUOQEz/HN8mLviqbRIQ0hiVegCwjl4qykuygTuuZ+RfthG3yiWPFlLj0YlYj4qlZ
	vKwmZhWfSxD8bBrozrdIzCaAHdDA2tdg/7c6c9Plvch3PA78uVZN5R9/QOvmgMI+DG49mqCLUapMr
	7P2xN14Lo2m5dM2ordTVX7QkP0YrlLoscskO36HoejOQNLUhei2MWLOVg5O5IJ5HaCHk9FIkdMR78
	7xe1vJiA==;
Received: from ip6-localhost ([::1]:25602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lG1N3-001gPW-VR; Sat, 27 Feb 2021 15:19:06 +0000
Received: from mail-eopbgr70077.outbound.protection.outlook.com
 ([40.107.7.77]:17984 helo=EUR04-HE1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lG1My-001gPP-2q
 for samba-technical@lists.samba.org; Sat, 27 Feb 2021 15:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSKm2FWnqqj+XZhdeROjlw88hL/pveFr+Mr/6f2Yv2WhgoLj+4Th+ILAbLHIReX96yhnfRcHvkCmZ6l5lexF98aN7kdg6xbj7U/zL8bzodQZUqH6iu84FAbAXQESaMmCThRFmgmTKUP7/kyRX+fjNBZ0EQilhHof/WZYBrJU47U0QM3U5V2of5fR8fLn6h4lMsBgB77bDdvq9FI2fHQDiNyyJGPZ9JtknDf05tpBHfFJ+99RnzPBbGJ1AgvHQKc+/35Ooh8Go/2fBI/v9q111isioLwy7zjHKrmxw71Z/plrUSdWdDhDm86lp81u7p88+/BfEEB9CqRD6Y1OCKEgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtjVlCWkbYAIGdm6l3efP32iEi/Dc4dUm/HiidBCkvQ=;
 b=iuUjrE57JlZ6AzpS3iIzxHZ/8O9tJq/gG0KKlrrnw8NxXsN+lcJQnKDsjC9jMCTF5Mad6VUahVw48esoHfsa6PyG6ZLqsEcNCgv05tzpJp6U0x9EymdzN3NAVSNQ6w2ZSdvh/UTpiOxkuYNkADSq1LY3dQCoMCNxueKwyTie2cCLxiRyVsqdONjgFfDTNsHmNzrwoR+TCzXaKXVUBvCcREVYxrcKK9uFhLGuEnJ+d8dHWvIbhkryi3iBIklepnMpe6xxdOFNCqFnPJL5xXDT+qmo4BVCCUHoLOeoda7ohDzslV5GLJCRMfuElyn2TQL4k2ATI8u6qWJD+q5LmiUgPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digitx.de; dmarc=pass action=none header.from=digitx.de;
 dkim=pass header.d=digitx.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitxgbr.onmicrosoft.com; s=selector2-digitxgbr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtjVlCWkbYAIGdm6l3efP32iEi/Dc4dUm/HiidBCkvQ=;
 b=JXg1SFDOvT7EzHYBvgsUGLAHPyxmTrY91eyu+TxkNLiPvGALq7O2vd0Z8BtQv9RGbhwe2F9JjVL+K9gfTyxW/qshetPW57NVumZYYzJSAkl0C7EDEFekxGGfxzJUkNrxgF6TM+IvSgxLnNrMTne/ezL9y7OxlIfAovM5dY1V/WY=
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com (2603:10a6:20b:2c8::19)
 by AM8PR05MB7905.eurprd05.prod.outlook.com (2603:10a6:20b:356::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sat, 27 Feb
 2021 15:18:24 +0000
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b]) by AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b%6]) with mapi id 15.20.3890.026; Sat, 27 Feb 2021
 15:18:24 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: "make test" of samba master fails in a privileged Linux container
Thread-Topic: "make test" of samba master fails in a privileged Linux container
Thread-Index: AdcNG8nJepFNSaPLTkq06ebMQr602Q==
Date: Sat, 27 Feb 2021 15:18:23 +0000
Message-ID: <AM9PR05MB7636914952B5F2FFB0567C54CF9C9@AM9PR05MB7636.eurprd05.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=digitx.de;
x-originating-ip: [93.217.244.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8373fa32-db07-49f5-a52a-08d8db32eceb
x-ms-traffictypediagnostic: AM8PR05MB7905:
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IIltBC/n3zeJx44Q/UwUwe5lx67UdZmmc0vEN7bhNaNWnq//vkNJrgW/JulPl5Hc++q+GXXK/7MCrZLP3y1I50kqxc4KC+0/Ik/MFCzxeoYI6hwoA0u2hDYUkwnjpcxldcD++pRu1sKukJNzrCsDx8uCAsPuPT2IhwlgPSJTHvBiFbM05cJ78aMotiQ0UhpUgaasodqN5GUFtNN3mp+iIArsu1vwM3aqyFOO8ROLO3Pp8vMFD48w3nnqt0NAE5342LvWsiN6ZQ7oB7f62ZkebF88/gBmzavV50JCf/ksMxlXP1RtIEv9JSSbttDntdwBLeA+XSmh9KIOnpzSOA3qXAtYvzV/zFdz8uiF8L5bZO5Xw+BSKmmAvuU7bpWhf5cL6rW7O/5ak+Xw14IGQ914zGE6L+f2CsgFvyWUzim6SRYIenwtKuUMqy95hePtAwUhD9pHEfiNAbhLBFUTbCsdmDiUJUuFqmg+KkDppe/mbehxSWlSz0/s3BKey96N6eCh3TUIffOPVOvFXKmRWNn8H6iY2WQYCqvpetASawjR1LEf5TDYZte0Pw8XUkBZHWRX/He1E8MMnDZQJ/BXhf4wbSaFUa2Mp0XgVhnYqNI0Mjs=
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?28dzGPVmXWA357q9IvyRwqgh6f5JbbLUIUva+CQl9SHSqQxKN8yBHCq4geLH?=
 =?us-ascii?Q?6b+GmnVJjNGMD7KuAIdh39PAv7ivBXFAr2darF/V3ZI7x2X9cyiJFwEVTe0v?=
 =?us-ascii?Q?60thr9yIPxWD/2WBmVUUiZJFWvMEFAlAl/5Ic9Emvzyl05C1N3RJ7eLg42ml?=
 =?us-ascii?Q?KroHsN5kMZ4l+TZ5xjLU2CGBlXpzqaswS2II42kd/KHAtYTXqNPlZsLBnO0R?=
 =?us-ascii?Q?+uQWXSKlg0qKFfoO+3Xfe9smNQyWsiJ9dxmuJDcx74cZ4Pr0qfs3bB/E0sss?=
 =?us-ascii?Q?BLDuXJSd+1d05viXiiESRCKY+dirJRRt9DUN4C9rc3OleUOBhoAMJmeZTbk4?=
 =?us-ascii?Q?VBObymUmXS6nBrqUOz80Z7qH4I3XungAylEKoBu4EPg8KWcJBm9k7PB2lkg8?=
 =?us-ascii?Q?UkPiwO7MmK/TCPIYVBKMelXkfCWAAFffO0pMndHPpiPB+QoCQaAZr8nMurWo?=
 =?us-ascii?Q?IQ2z3cH5Q0CPrzzrR1GLo2zzpx3iqtHyaHrYqgdMhaXjFAItwvR59LFKs2nu?=
 =?us-ascii?Q?noECw9HufDuujpOKc5IdOI05fw+Z0T+eMHWrK04UGIk6beMwlsN9lJ/sKNxB?=
 =?us-ascii?Q?PyV3XEoNfaq0a/Uk8lMF7IjH1rSKTeg0iEhf2QKK6+k5BkvkDbV6wxrMpW01?=
 =?us-ascii?Q?FrSkbqqUWTGclbErIFIrjJf2mj3VBfu/bZf9BQWvuzPK56NMP6ULlwhsczLS?=
 =?us-ascii?Q?9dZ7i777l9AHPlsqIlIWmZ7WEtgmluSA9AyBtIOwotI7qi9jKGZZIXHBfRD5?=
 =?us-ascii?Q?j5azcJ3gZhR3Ke+oyEpYy53/4nJQ3PfBeWmFqaK/puJvHYLKw47lrNFeGo/r?=
 =?us-ascii?Q?qHj9nFDIQBdiBov0y1jtUu0/B0hlNS35tHGO8arAZ8T/fXXjsbYzmdoZIzmY?=
 =?us-ascii?Q?upMZeojohwrzx3WkMevS4ah+WTmDgEidOlfT4ZYRTWh9+e0tu9rEO7qQhHTh?=
 =?us-ascii?Q?ijaT1eTnc3r/BqJSaHTdOo7WuWkCq4uQz3WnqoZQQCwxEX9gns5k+eqffZ3C?=
 =?us-ascii?Q?6XKGQjA+fnSNdK90oh71v2s4QFQ2K35854EZZV4HiiKSTim+4NyqJ7UEu/PM?=
 =?us-ascii?Q?DyDF+d93MFEd0k2PhkQ7ezq/G3qOCw5YSysABKJVP1vbf83OVPghia5VO8T9?=
 =?us-ascii?Q?qlfUyrppmK0pkq2LL7lW+mlXPJvln8BtZGmk5wc5SK7aD9SK3oVm70BPIvNz?=
 =?us-ascii?Q?Bqvc9jyW1VNGgPqU6D1/2nMcEydzO61qcX+DWnqSRqFcXCd/txWz80vUqEwa?=
 =?us-ascii?Q?HORAgn72x6SNDcrneRH7vKbuXeWyAtGYtpfubPOn9/QHzXYV61U8xOOAVuEo?=
 =?us-ascii?Q?t18=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: digitx.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB7636.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8373fa32-db07-49f5-a52a-08d8db32eceb
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 545eefb3-8b20-4e2a-bcdb-884c876d0f6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQuvzQL4CeRIT8wEFQZVHvM6qY3hBO9Sl7hETrOSCj2cQhDs/KxfcKpcGFAIOGOcemC8dHa5CZNcszEp2VvgxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR05MB7905
X-Warn: EHLO/HELO not verified: Remote host 40.107.7.77
 (mail-eopbgr70077.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-HE1-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Thomas via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas <tgeppert@digitx.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I did clone the samba git repo within a privileged Debian 10 LXC.
"configure" and "make" completed successful but "make test" fails with:

FAILED (183 failures, 0 errors and 2 unexpected successes in 63 testsuites)

It is an unmodified build of samba master. What am I missing ?
Is it not possible to successfully run "make test" in a privileged Linux co=
ntainer ?

The details:

lsb_release -a
               No LSB modules are available.
               Distributor ID: Debian
               Description:    Debian GNU/Linux 10 (buster)
               Release:        10
               Codename:       buster
uname -r
5.4.98-1-pve

git clone https://git.samba.org/samba.git
cd samba
git status
               On branch master
               Your branch is up to date with 'origin/master'.
               nothing to commit, working tree clean
git log
               commit d6ddb8aa2a91de8b527709658f9a113e5b73377e (HEAD -> mas=
ter, origin/master, origin/HEAD)
               Author: Noel Power <noel.power@suse.com<mailto:noel.power@su=
se.com>>
               Date:   Fri Feb 12 15:06:40 2021 +0000
                              vfs: update status of SMB_VFS_LISTXATTR
                              Autobuild-User(master): Jeremy Allison <jra@s=
amba.org<mailto:jra@samba.org>>
                              Autobuild-Date(master): Fri Feb 26 22:35:04 U=
TC 2021 on sn-devel-184

bootstrap/generated-dists/debian10/bootstrap.sh
bootstrap/generated-dists/debian10//locale.sh

./configure --enable-selftest
               'configure' finished successfully (1m46.519s)
make
               'build' finished successfully (26m50.803s)
make test
......
[1237(7354)/2756 at 2h7m27s, 63 errors] samba3.net_lookup_ldap(ad_dc:local)
[1238(7357)/2756 at 2h7m31s, 63 errors] samba3.blackbox.force-user-unlink(m=
aptoguest:local)
[1239(7358)/2756 at 2h7m32s, 63 errors] samba3.clustered.smb2.deny.deny2(cl=
usteredmember)
Can't call method "getlog_env" on an undefined value at /root/dev/samba/sel=
ftest/selftest.pl line 863.
server_stdin_handler: samba: EOF on stdin - PID 7175 terminating
server_stdin_handler: samba: EOF on stdin - PID 6877 terminating
server_stdin_handler: samba: EOF on stdin - PID 7348 terminating
server_stdin_handler: samba: EOF on stdin - PID 753 terminating
server_stdin_handler: samba: EOF on stdin - PID 28071 terminating
server_stdin_handler: samba: EOF on stdin - PID 895 terminating
dns_hub: after poll()
dns_hub[UDP[10.53.57.64]]: before shutdown()
server_stdin_handler: samba: EOF on stdin - PID 27184 terminating
server_stdin_handler: samba: EOF on stdin - PID 27714 terminating
dns_hub[UDP[10.53.57.64]]: after serve_forever()
dns_hub[UDP[10.53.57.64]]: after shutdown()
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: before shutdown()
smbtorture 4.15.0pre1-DEVELOPERBUILD
Using seed 1614435528
Failed to load unc names list from './st/clusteredmember/unclists/tmp.txt'
UNEXPECTED(failure): samba3.clustered.smb2.deny.deny2.deny2(clusteredmember=
)
REASON: Exception: Exception: ../../source4/torture/smb2/smb2.c:96: Establi=
shing SMB2 connection failed
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: after serve_forever(=
)
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: after shutdown()
dns_hub: before exit()

FAILED (183 failures, 0 errors and 2 unexpected successes in 63 testsuites)

A summary with detailed information can be found in:
  ./st/summary
TOP 10 slowest tests
samba3.smbtorture_s3.plain.readdir-timestamp(clusteredmember) -> 1614431924
ldb.python -> 349
samba4.blackbox.upgradeprovision.release-4-0-0 -> 238
samba4.blackbox.upgradeprovision.alpha13 -> 236
samba3.smb2.maxfid(nt4_dc) -> 178
samba4.blackbox.schemaupgrade -> 173
samba3.smb2.lease(nt4_dc) -> 168
samba3.smb2.maxfid(ad_dc) -> 139
samba3.smbtorture_s3.vfs_aio_fork(fileserver_smb1).RW2(fileserver_smb1) -> =
135
samba4.blackbox.dbcheck.release-4-0-0 -> 124
test: running (/usr/bin/perl /root/dev/samba/selftest/selftest.pl --target=
=3Dsamba --prefix=3D./st --srcdir=3D/root/
dev/samba --exclude=3D/root/dev/samba/selftest/skip --testlist=3D"/usr/bin/=
python3 /root/dev/samba/selftest/tests.
py|" --testlist=3D"/usr/bin/python3 /root/dev/samba/source3/selftest/tests.=
py|" --testlist=3D"/usr/bin/python3 /ro
ot/dev/samba/source4/selftest/tests.py|"  --exclude=3D/root/dev/samba/selft=
est/slow --nss_wrapper_so_path=3D/root/
dev/samba/bin/default/third_party/nss_wrapper/libnss-wrapper.so --resolv_wr=
apper_so_path=3D/root/dev/samba/bin/d
efault/third_party/resolv_wrapper/libresolv-wrapper.so --uid_wrapper_so_pat=
h=3D/root/dev/samba/bin/default/third
_party/uid_wrapper/libuid-wrapper.so --socket_wrapper_so_path=3D/root/dev/s=
amba/bin/default/third_party/socket_w
rapper/libsocket-wrapper.so --socket-wrapper  && touch ./st/st_done) | /usr=
/bin/python3 -u /root/dev/samba/sel
ftest/filter-subunit --expected-failures=3D/root/dev/samba/selftest/knownfa=
il --expected-failures=3D/root/dev/samb
a/selftest/knownfail.d --flapping=3D/root/dev/samba/selftest/flapping --fla=
pping=3D/root/dev/samba/selftest/flappi
ng.d --expected-failures=3D/root/dev/samba/selftest/knownfail_heimdal_kdc |=
 tee ./st/subunit | /usr/bin/python3
-u /root/dev/samba/selftest/format-subunit --prefix=3D./st --immediate
ERROR: test failed with exit code 1
make: *** [Makefile:16: test] Error 1

