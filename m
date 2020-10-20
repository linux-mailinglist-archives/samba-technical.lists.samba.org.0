Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECBE29441C
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 22:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pzOooIRDhfuS6lNrhpNktm0M3HmrUJtHwzQeb9GT2Ls=; b=0T6qcuoi7ls+hQSXx6wBw+SPY/
	30s9QCvPUESgXlc0VgJaEqCb1xRp9IyOs79FLln7z81jS7i/svBHTqaAW/9kuqlpyKIzdKO9gLFtG
	B5y36EXpVRXybfHH14VLvSpLVUJLINEvUhfny7V17LiJp9X1HlAUASxJIO9ovQ85lNWE1Veojdeq8
	tp4IsKfW4hE9oZuqnJ0W4dTd3cMkOACxxFM9IjDYLd+oAN75JqwOCpyntkYyIREaNQRi5xCMsgXcB
	XpciaFIWZ2C2++qv9wuT2VOTtPRlW0Ugsb1OzEjLfqZVjAgNjUZyAgzXdemdCNW1vFxWKG6z6C5s7
	y2iyM7FQ==;
Received: from ip6-localhost ([::1]:34740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUyag-00CxxE-S6; Tue, 20 Oct 2020 20:50:43 +0000
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com
 ([40.107.93.88]:19059 helo=NAM10-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kUyaZ-00Cxx7-SD
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 20:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMFq9EeQycxpnOLpwKfW6U5LHM2SD2Ex2d9aX6VPXLahlZ2dyEdh9hVQsboR26rH/sWCz/ybjYhdEHQMXW4yhmLg/QUbDhWkXZv5348K8BwwKKMVjIAvdR89wU5X0Qmtq2wiT8EOBu+Hx2E03w1JLHMgylmz8W7bbWoxboqj/IJydMvHqng85ulShhGpI3EldI2IgdUNtrVHgIYZwhsEeeMofj8HJwR62u7vMYYE1S9mACO+kV80vkU/Fs1em/1s1222gaivCfwSVwtpWZ++wPLlgT8o1mWXrRqDG4jREpExakTA+NUS6bA2aiYLOj/ZpRp2ygf/aByry+TLpqpjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gu0YTNreHGqhBV6DmNZeRjUYEpcLDMULtc6jRF70C0U=;
 b=gff6Fx7C6oS0K56qF+enX8Q6Ixm8FG87Bx25G+mlI92b5wpzx1+GQW8V5VMix02gEo6Jhg092G0g0HjopKPU3WnFddwZMgQcWisSHYBeGMSFSYQpm9vgybxm8pO2y3J+XeyRbQ4pYoffLLHM5A/fXhSdg8R4WTllIGen1o13AVJ1gU4MDnfvubdD2KUXknpd+Kzb4UOS854Ag4Sx+R2tk50rclHMyyLdV1I7xLgySAvTLWBWyiAdJGcJ5LGfqBO+YtttJp0hnDFNm+Y0al2lUfSFGNDrbuoVLJuOCD0r42JNf0HDb/SUBU5xp45NdXwurfB5elwwSajEDqXT2oGkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=komprise.com; dmarc=pass action=none header.from=komprise.com;
 dkim=pass header.d=komprise.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=komprise.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gu0YTNreHGqhBV6DmNZeRjUYEpcLDMULtc6jRF70C0U=;
 b=ROQIvplQ+3fNNlQEZowextjQ79nom7TBR/8rfUhshiXOTVEPw+8S78yiorgV2jZ9GUxXMwYVTdCa5wG8s3EGPqKC8Bme//d6hAfuyNNQL44CgT0T7uG/9M5/PlhFl75heQKcriWBISa8lb5sG+YG/qloudFrl4NQzx7blUunUl0=
Received: from BYAPR16MB2615.namprd16.prod.outlook.com (2603:10b6:a03:8f::17)
 by BY5PR16MB3080.namprd16.prod.outlook.com (2603:10b6:a03:184::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 20 Oct
 2020 20:50:03 +0000
Received: from BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::6da1:ead9:65f5:189e]) by BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::6da1:ead9:65f5:189e%5]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 20:50:03 +0000
To: Steve French <smfrench@gmail.com>
Subject: Re: Oops in _raw_spin_lock_irqsave - linux kernel
 4.16.2-1.el7.elrepo.x86_64
Thread-Topic: Oops in _raw_spin_lock_irqsave - linux kernel
 4.16.2-1.el7.elrepo.x86_64
Thread-Index: AQHWpqQWBoGDFiQvIEihBkAX+8fKfKmg0xcAgAAjznE=
Date: Tue, 20 Oct 2020 20:50:02 +0000
Message-ID: <BYAPR16MB2615EF719B1D7BA80B3AF3E7E21F0@BYAPR16MB2615.namprd16.prod.outlook.com>
References: <BYAPR16MB26151755ED24DE9F506736B8E21F0@BYAPR16MB2615.namprd16.prod.outlook.com>,
 <CAH2r5msFVeJMHR7RbRYKweo7FFdXW6Lk=4oQe57hfzrFu6KQGg@mail.gmail.com>
In-Reply-To: <CAH2r5msFVeJMHR7RbRYKweo7FFdXW6Lk=4oQe57hfzrFu6KQGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=komprise.com;
x-originating-ip: [24.5.2.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1176383-7ef6-4076-64e6-08d87539b7ca
x-ms-traffictypediagnostic: BY5PR16MB3080:
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NNhH1c0/1jCat/Cm8C7XDRQv4qNo59mIBkoUk4NFA9u8gWPF5NVU4Vviq25gXP/nBTiY/vA47U5d1iGBMgkMPQrTNhAaX+pLINLeUUzeCIo3EajdHc1vYUuIHt1yn/EWmi00fJvVJeg8EUQWlMvtNB9e3qtaqeDqFsSGMvSWPEwXVar0c9KqBCDfFG56nY97z6vPTcxmTrpky/d4rGC1oiW1TYCmI4Ri4ZPNTRDHuizFWjFMzBRJo/PIVUpwRNCMxYj3KspbOre+HEjQV//OBEwzlH+nrfbAHFVY+xNGtHe6nBP0xo9DCwgRzhRtx5NuGnLAdrB2dxbZGrAJx8clJ/yF3+bcE7Yyy+v7HckQ36rvdquYGzPnTBIQRTyrIgII5bhD5wzlCmsjz9jc3MJ9Eg==
x-ms-exchange-antispam-messagedata: Gbg1+IxSOh/Z3yZxC3/MFaIMicn4aQy/CP9B59fI6RC4N2H6mFs02QAwH5BpmddRpUaYsRKV6R/tfI4Xs15hb1+WOOyazOdMnjdGRctil4RoRKsga4Q2F89L+pCXBObv5lv8BErOilMlNu8v8qlZ4b98FQzqmHk+aK5iRwUXv2NfpyjwHb4wN36NTwJDvruSQa8g+aH4zzzpJ2aUFvVzW7rzLoEc2QYA+vQVKrO3Ehw48F3dMPeDo5DmiST3OCRIL69gQeormDstjLB26vsRrCbaP26mXSOmpFfpPG3SEOZocJRENjbA8o5eTWd/8/CUQFaXPZbKdxAPNrpOjtXagGbQOrPiJLn0K9peSkoCxUkqj+ofFIXzHcAgdLNdNvn1iOfHu1vnDE0Iz3+YSWKlYuneJmb0K9zX8aasHVqIUpLabpi6Nyxa6ePNhMc1lEjr/QxfxddthFck6l7j/1jNJYSicVXn0Rty+LIhx3kIBemvuZ/G4+cScFro9+ow2nhLI2WcjvRK8HGWfu2xlViz3hSO2QK8sSsjMuGxmbNXuWzYm/nVIOeDaWOryfKZ61qA8K+utfrMG0WWSPurn8JRzVPknF9ZmDIqQKBS8GlYIibtZ3QFt/0+YS9Zs8Js79uLzUoDAakIME2KTAa1mhmt2g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: komprise.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR16MB2615.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1176383-7ef6-4076-64e6-08d87539b7ca
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a5a9d78-0afb-4c20-b729-756d332680db
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+uEW/SqDuLZQRt2ZxUWdB9Qi3lC8W5GoVndiwRu+iJnk6bcQit6qz31xZpNlnOvWWIpBkxs8qw4ugFZR9dkkHozb+DjOTNabfIh06nfEXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR16MB3080
X-Warn: EHLO/HELO not verified: Remote host 40.107.93.88
 (mail-dm6nam10on2088.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-DM6-obe.outbound.protection.outlook.com
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
From: Vidhesh Ramesh via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

Thanks for the quick response.

I haven't tried redhat 8.1 or 8.2, I have tried 4.19 kernel build 134 and I=
 am not seeing the same panic but not sure if it is fixed in kernel 4.19.


Vidhesh Ramesh


[cid:08c25178-b723-4637-800b-a0be40947864]

[cid:d31a1a2b-2af8-41ba-920f-050e0455b246]

________________________________
From: Steve French <smfrench@gmail.com>
Sent: Tuesday, October 20, 2020 11:38 AM
To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org <linux-cif=
s@vger.kernel.org>; samba-technical@lists.samba.org <samba-technical@lists.=
samba.org>
Subject: Re: Oops in _raw_spin_lock_irqsave - linux kernel 4.16.2-1.el7.elr=
epo.x86_64

I don't have a kernel that old and I can't access the Redhat page -
but I would expect that given the date it was posted the fix would be
in the last two Redhat releases 8.1 and 8.2.  Have you tried those?

On Tue, Oct 20, 2020 at 12:49 AM Vidhesh Ramesh
<vidhesh.ramesh@komprise.com> wrote:
>
> [1.] One line summary of the problem:
> oops kernel panic
> [2.] Full description of the problem/report:
> ESX VM hangs with a kernel panic when cifs shares are mounted and accesse=
d. Unable to ssh to the VM and the console of the VM is also not responding=
. With kdump service running and core collected the VM restarts successfull=
y.
> [3.] Keywords (i.e., modules, networking, kernel):
> cifs, kernel, panic, mount
> [4.] Kernel information
> [4.1.] Kernel version (from /proc/version):
> Linux version 4.16.2-1.el7.elrepo.x86_64 (mockbuild@Build64R7) (gcc versi=
on 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC)) #1 SMP Thu Apr 12 09:08:05 EDT =
2018
> [4.2.] Kernel .config file:
> Please check the file uploaded
> [5.] Most recent kernel version which did not have the bug:
> [6.] Output of Oops.. message (if applicable) with symbolic information
>      resolved (see Documentation/admin-guide/oops-tracing.rst)
> [1866796.225242] BUG: unable to handle kernel NULL pointer dereference at=
 0000000000000000
> [1866796.225758] IP: _raw_spin_lock_irqsave+0x22/0x40
> [1866796.226236] PGD 8000000428341067 P4D 8000000428341067 PUD 0
> [1866796.226736] Oops: 0002 [#1] SMP PTI
> [1866796.227202] Modules linked in: nfsv3 nfs fscache arc4 md4 nls_utf8 c=
ifs ccm dns_resolver nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT i=
p6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntr=
ack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat nf_conntrack_i=
pv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_r=
aw iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_connt=
rack iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip=
6table_filter ip6_tables iptable_filter vmw_vsock_vmci_transport vsock ppde=
v sb_edac crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc vmw_balloo=
n aesni_intel crypto_simd glue_helper cryptd intel_rapl_perf joydev input_l=
eds pcspkr sg shpchp i2c_piix4 vmw_vmci parport_pc parport nfsd
> [1866796.232074]  auth_rpcgss nfs_acl lockd grace sunrpc ip_tables xfs li=
bcrc32c sr_mod cdrom ata_generic pata_acpi sd_mod crc32c_intel serio_raw vm=
wgfx drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm ata_p=
iix mptspi scsi_transport_spi vmxnet3 mptscsih drm mptbase libata floppy dm=
_mirror dm_region_hash dm_log dm_mod dax
> [1866796.234432] CPU: 3 PID: 11126 Comm: cifsd Tainted: G        W       =
 4.16.2-1.el7.elrepo.x86_64 #1
> [1866796.235687] Hardware name: VMware, Inc. VMware Virtual Platform/440B=
X Desktop Reference Platform, BIOS 6.00 12/12/2018
> [1866796.237004] RIP: 0010:_raw_spin_lock_irqsave+0x22/0x40
> [1866796.237683] RSP: 0018:ffffc90007a2bc00 EFLAGS: 00010046
> [1866796.238361] RAX: 0000000000000000 RBX: 0000000000000246 RCX: 0000000=
000000002
> [1866796.239049] RDX: 0000000000000001 RSI: ffffc90007a2bc40 RDI: 0000000=
000000000
> [1866796.239757] RBP: ffffc90007a2bc08 R08: 0000000000000242 R09: 0000000=
000000000
> [1866796.240494] R10: 0000000000000000 R11: 00000000000003c9 R12: 0000000=
000000000
> [1866796.241194] R13: ffff88041b26f8c8 R14: ffffc90007a2bcf8 R15: 0000000=
000000000
> [1866796.241915] FS:  0000000000000000(0000) GS:ffff88043fcc0000(0000) kn=
lGS:0000000000000000
> [1866796.242670] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [1866796.243438] CR2: 0000000000000000 CR3: 000000042ab22000 CR4: 0000000=
0000406e0
> [1866796.244293] Call Trace:
> [1866796.245069]  remove_wait_queue+0x19/0x60
> [1866796.245877]  sk_wait_data+0xf6/0x140
> [1866796.246691]  ? prepare_to_wait+0xb0/0xb0
> [1866796.247504]  tcp_recvmsg+0x5f5/0xb40
> [1866796.248560]  ? select_task_rq_fair+0x4d5/0xba0
> [1866796.249420]  inet_recvmsg+0x56/0xd0
> [1866796.250222]  sock_recvmsg+0x43/0x50
> [1866796.251115]  cifs_readv_from_socket+0x76/0x200 [cifs]
> [1866796.251953]  cifs_read_from_socket+0x52/0x70 [cifs]
> [1866796.252969]  cifs_demultiplex_thread+0x11b/0xa90 [cifs]
> [1866796.253740]  kthread+0x105/0x140
> [1866796.254486]  ? cifs_handle_standard+0x190/0x190 [cifs]
> [1866796.255198]  ? kthread_bind+0x20/0x20
> [1866796.255907]  ? do_syscall_64+0x79/0x1b0
> [1866796.256601]  ret_from_fork+0x35/0x40
> [1866796.257251] Code: c3 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 89=
 e5 53 9c 58 0f 1f 44 00 00 48 89 c3 fa 66 0f 1f 44 00 00 31 c0 ba 01 00 00=
 00 <f0> 0f b1 17 85 c0 75 06 48 89 d8 5b 5d c3 89 c6 e8 36 91 8b ff
> [1866796.259312] RIP: _raw_spin_lock_irqsave+0x22/0x40 RSP: ffffc90007a2b=
c00
>
> I see the solution posted in https://access.redhat.com/solutions/4354471 =
but I am unable to access the solution.
>
> Vidhesh Ramesh
> [1866796.260111] CR2: 0000000000000000
> [7.] A small shell script or example program which triggers the
>      problem (if possible)
>
> Vidhesh Ramesh



--
Thanks,

Steve
