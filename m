Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3721F80E
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jul 2020 19:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yehPjOOroWj/IkpeNxhLvlPRE5wygVm0TuK0mOGUVEc=; b=IpiE+Q90DLNvM8sZ3Xv/hyfM5I
	kIu8kxdzmcG6PStmQlBjxNBBFiod4tDcWsQ7hc81VMwG0fVw76YHcR6e241voPG7Txb32BXVLdckk
	mr6BGcdeXKrQzDMwSvv/Y0vgZdVxbZ+9cV/7BcfuWidchNGITmRcbODz61R5jig1MOMuLu1S3+zPD
	F7bQhqX66eXn8N5WCqDZ96CqlxDIQ+8r4MPwCfCyrGzQ4toaN7QWK4Z1kx/J5N88yllchgMC+p97H
	vutNROzxdPlfwI9ZzEGxX5aKWkd4MrNkYLRyblQsxxtqG3t4FLgIbn7ga/hKiHrmPzgiTU4wAxpUI
	QbEVnKyQ==;
Received: from localhost ([::1]:55954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvOaR-007Sms-EY; Tue, 14 Jul 2020 17:19:23 +0000
Received: from mail-bn7nam10on2052.outbound.protection.outlook.com
 ([40.107.92.52]:33185 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jvOaJ-007Smk-Gm
 for samba-technical@lists.samba.org; Tue, 14 Jul 2020 17:19:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2qLptSRI1hiFvhd3jMGKQnpj8jeR2TVm8njBJrVELeEC8oFoApjsfyyXykszAcaklIY0nt/1KR36TkjKH+TLi04uaZBT17NOo7ZgU6V5W6APLEtqpH7T3h4+6cHqJKSWEK5ljhLL3/O3DOjQt+rqb3n64cH2InSv4vT3O21KcjYCBC+lpmozeTY6kQl0qxZqxBwD5h5m5pLnQ56uQuB+KIFC1kJbgn6kqfMjPA5x/SE8b0ZNpjZCKaokdW7ecMSkNuXwxxjKw4cvFGffs2EdPYp6JYSOlpBOpQBRH748ytBLOLTQqMkWnAAMcx8kIjki3cYTCatJ5GOlCAKByGuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kArnw7NsQvYRgUklHd4wPFGl+5MzrkIFUgOkZWnSoSE=;
 b=oOhxenXGVUnoE3vMDSzef6UW7RnMavktbBo1Mc+J5Ji4BXmgG3qX1/yWu90vtJOom9t1VXh7LIf0+0kmfOABLJN1uI621abPspt8+Ux131OYqE2ISF3wEzez6AdGI/2iftGLFFTmjQPdWt2rtDB6giCYboXNlYFiT/j8UiyeIxgaSXRCXnizZzid7YmN4qqwlQF0vBFyaSDaYj8icEo7Nh/ktXcotoXb0JLq9Z5vxC4DwP7xhJkfwa9Ojl64WCFVuH9ftEBF5CaFS5qOD9yVV/o/m7vjJaozetT/REjkoHMFcZ0BQRPz/3TVdwATaXNJdb9r8kaTNqnVfCfCgU8Qew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=komprise.com; dmarc=pass action=none header.from=komprise.com;
 dkim=pass header.d=komprise.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=komprise.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kArnw7NsQvYRgUklHd4wPFGl+5MzrkIFUgOkZWnSoSE=;
 b=NRfMS6euie0quxU0SMwYMzvlJvr2+rdaB7TKzhKHZL5E15m1R85YHOCZj8eEtWbAEr5fDrvpccocyoCw1tazJy4pju14YCJa5D52sgVlCx6wu6COMKxL8r43bokDSffXsLaQMX1yzKHauGUQJWovVHXIyhZWfXylJeVW7gWNGNc=
Received: from BYAPR16MB2615.namprd16.prod.outlook.com (2603:10b6:a03:8f::17)
 by BYAPR16MB2581.namprd16.prod.outlook.com (2603:10b6:a03:85::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Tue, 14 Jul
 2020 17:19:00 +0000
Received: from BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::99d9:a6f:4f4a:4993]) by BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::99d9:a6f:4f4a:4993%3]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 17:19:00 +0000
To: Steve French <sfrench@samba.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: Oops in cifs_match_super() - linux kernel
 4.16.2-1.el7.elrepo.x86_64
Thread-Topic: Oops in cifs_match_super() - linux kernel
 4.16.2-1.el7.elrepo.x86_64
Thread-Index: AQHWSq9edtCo81aaX06K8scfXoPZ86jz61slgBOCXOQ=
Date: Tue, 14 Jul 2020 17:18:59 +0000
Message-ID: <BYAPR16MB261513751DCF34B035660665E2610@BYAPR16MB2615.namprd16.prod.outlook.com>
References: <MW3PR16MB37063A82C9A57CC67EB5BE1F87920@MW3PR16MB3706.namprd16.prod.outlook.com>,
 <BYAPR16MB26152FB66647DB8FCAED346CE26D0@BYAPR16MB2615.namprd16.prod.outlook.com>
In-Reply-To: <BYAPR16MB26152FB66647DB8FCAED346CE26D0@BYAPR16MB2615.namprd16.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=komprise.com;
x-originating-ip: [24.5.193.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e15937b-6678-4597-815a-08d82819ffaa
x-ms-traffictypediagnostic: BYAPR16MB2581:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ciqUnXBet6EVpT0Dso3yob1+iQWgh3gUVgQ4qlL2nAYTxYudImQPwmTYlFS2QPcz94sOqUvrVgyfSMYL4oeJ0IoM62AgWISCh+0zIaxXTKKiSpz46wdwkdaqFlBGtADudeyF1GvoNOIVbzt9QfS4glEjoC+jTGVc/HrGuFWzQVtLFtqZ1ifd1a6sL+WZ4l2DBjX6eGFkzVahTqyrlS6qhf2/Li/SrWESSNazYiAV/vLMdjgQCeR/pB3QpbQVv+57B9sx/SmRUUnsbJrAi8ehczhjPhSseLdz8a1ehaH50c/QBvZAWIsCt+HcOS16GaQNY5cqJPyfETMG9jICTmqHndzKiDfmQDs4S2Ao44PfgKOq1CsmS5Jej6iN4eBgJXy0QML3qviMplB8N7lt2ZJWXQ==
x-ms-exchange-antispam-messagedata: jQcxW3UelKMGiuk85RLa9xF3vIv+SUw/3pklOna2nM3w/qMmvJpCZNPp24Vm78a1c1eyZi8nwK0tJ8CIXq5wJPlpBGX1shqgZkGHOB+oC76xDR+BG2PoqknJYN4fOHvGsjm11ll/U2aBDlM6L6m1+S7zbSChr+NExQmG7P7KFJnmP4DFxZjisG9adTCZtLd+oML949n2rMeC632m0xBkuoKTfRFqsLvzUEUZNuXaZKezLOHz/KRUjcsyHWswZUgTzoLkjU2TcWY6ckdyp7mlMF80D0bZGbdlTNFzB6uRV7GaOOj8s8IKd/2ZC4sKlUvuRxtUl52RbWHR7X2YipO5rMOgUa4Do7HrHNqUQ0xL17mpNQZOmL0sHWWlCOgGsh7R8oNP7dq3wLK1m0xCl0nIbmI8jh8CKCi0FmJhLAUV28FNwT0m2/38+GWu4vU3FBR/r6BbIU9bAna6aj9TitCyki2TGRleVJx9YnXBbLaAnDo=
MIME-Version: 1.0
X-OriginatorOrg: komprise.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR16MB2615.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e15937b-6678-4597-815a-08d82819ffaa
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a5a9d78-0afb-4c20-b729-756d332680db
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zC0Dlo+G7kyyVBZG++vDVU6wNtB3mWLgok6uSxPvUJRtoOwWmvBCGShQMnAo5khp7oBaz2sYpEFRzb98GUX/bQ9BGj20g0QMQOS8e/mNJg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR16MB2581
X-Warn: EHLO/HELO not verified: Remote host 40.107.92.52
 (mail-bn7nam10on2052.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Ameya Usgaonkar <ameya.usgaonkar@komprise.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve et all,

Resending this as a gentle reminder if anyone got a chance to look at the b=
elow mentioned oops kernel panic.



Vidhesh Ramesh

________________________________
From: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Sent: Thursday, July 2, 2020 12:21 AM
To: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org <linux-cif=
s@vger.kernel.org>; samba-technical@lists.samba.org <samba-technical@lists.=
samba.org>
Cc: Ameya Usgaonkar <ameya.usgaonkar@komprise.com>
Subject: Re: Oops in cifs_match_super() - linux kernel 4.16.2-1.el7.elrepo.=
x86_64

Hi Steve et all,

Resending this as a gentle reminder if anyone got a chance to look at the b=
elow mentioned oops kernel panic.


Vidhesh Ramesh


[cid:08c25178-b723-4637-800b-a0be40947864]

[cid:d31a1a2b-2af8-41ba-920f-050e0455b246]


________________________________
From: Ameya Usgaonkar <ameya.usgaonkar@komprise.com>
Sent: Wednesday, June 24, 2020 10:26 PM
To: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org <linux-cif=
s@vger.kernel.org>; samba-technical@lists.samba.org <samba-technical@lists.=
samba.org>
Cc: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Subject: Oops in cifs_match_super() - linux kernel 4.16.2-1.el7.elrepo.x86_=
64

Hi Steve et al,
   My name is Ameya and I work for www.komprise.com<http://www.komprise.com=
>.  The linux kernel with above mentioned version has been panicing, though=
 randomly, but the stack trace appears is consistent.  You can find more de=
tails in the attachments.  Below is the brief description of the problem -


[1.] One line summary of the problem:

oops kernel panic

[2.] Full description of the problem/report:

ESX VM hangs with a kernel panic when cifs shares are mounted. Unable to ss=
h to the VM and the console of the VM is also not responding. With kdump se=
rvice running and core collected the VM restarts successfully.

[3.] Keywords (i.e., modules, networking, kernel):

cifs, kernel, panic, strcmp, mount

[4.] Kernel information

[4.1.] Kernel version (from /proc/version):

Linux version 4.16.2-1.el7.elrepo.x86_64 (mockbuild@Build64R7) (gcc version=
 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC)) #1 SMP Thu Apr 12 09:08:05 EDT 20=
18

[4.2.] Kernel .config file:

Please check the file uploaded

[5.] Most recent kernel version which did not have the bug:

[6.] Output of Oops.. message (if applicable) with symbolic information

     resolved (see Documentation/admin-guide/oops-tracing.rst)

[442282.069937] BUG: unable to handle kernel NULL pointer dereference at 00=
00000000000000

[442282.071474] IP: strcmp+0xe/0x30

[442282.072892] PGD 0 P4D 0

[442282.074196] Oops: 0000 [#1] SMP PTI

[442282.075561] Modules linked in: binfmt_misc fuse cmac rpcsec_gss_krb5 nf=
sv4 arc4 md4 nls_utf8 cifs ccm dns_resolver nfsv3 nfs fscache nf_conntrack_=
netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ipt_REJECT nf_reject_=
ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat e=
btable_broute ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6=
table_mangle ip6table_security ip6table_raw iptable_nat nf_conntrack_ipv4 n=
f_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack iptable_mangle iptable_securi=
ty iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_f=
ilter vmw_vsock_vmci_transport vsock sb_edac crct10dif_pclmul crc32_pclmul =
ghash_clmulni_intel pcbc ppdev aesni_intel vmw_balloon crypto_simd glue_hel=
per cryptd sg intel_rapl_perf input_leds pcspkr joydev shpchp

[442282.090386]  parport_pc parport i2c_piix4 vmw_vmci nfsd nfs_acl lockd a=
uth_rpcgss grace sunrpc ip_tables xfs libcrc32c sr_mod cdrom ata_generic sd=
_mod pata_acpi crc32c_intel serio_raw vmwgfx drm_kms_helper syscopyarea sys=
fillrect sysimgblt fb_sys_fops ttm mptspi scsi_transport_spi ata_piix mptsc=
sih vmxnet3 drm mptbase libata floppy dm_mirror dm_region_hash dm_log dm_mo=
d dax

[442282.095332] CPU: 4 PID: 9273 Comm: mount.cifs Tainted: G        W      =
  4.16.2-1.el7.elrepo.x86_64 #1

[442282.097802] Hardware name: VMware, Inc. VMware Virtual Platform/440BX D=
esktop Reference Platform, BIOS 6.00 04/05/2016

[442282.100363] RIP: 0010:strcmp+0xe/0x30

[442282.101645] RSP: 0018:ffffc9001bff7c88 EFLAGS: 00010202

[442282.102919] RAX: 0000000000000001 RBX: ffff8802ad7c2400 RCX: 0000000001=
240404

[442282.104207] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000=
000001

[442282.105497] RBP: ffffc9001bff7c88 R08: 0000000001240404 R09: 0000000000=
000001

[442282.106765] R10: ffff88017d2c2b40 R11: ffff8801744c0e50 R12: ffff88011f=
793000

[442282.108038] R13: ffff88042b105800 R14: ffffc9001bff7d98 R15: ffff8801b6=
3c0f00

[442282.109318] FS:  00007f3e90ee6780(0000) GS:ffff88043fd00000(0000) knlGS=
:0000000000000000

[442282.110630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033

[442282.111970] CR2: 0000000000000000 CR3: 000000011b2ea000 CR4: 0000000000=
0406e0

[442282.113405] Call Trace:

[442282.114849]  cifs_match_super+0x123/0x210 [cifs]

[442282.116211]  ? cifs_prune_tlinks+0xe0/0xe0 [cifs]

[442282.117541]  sget_userns+0x88/0x4a0

[442282.118877]  ? cifs_kill_sb+0x30/0x30 [cifs]

[442282.120203]  ? cifs_prune_tlinks+0xe0/0xe0 [cifs]

[442282.121502]  sget+0x7d/0xa0

[442282.122781]  ? cifs_kill_sb+0x30/0x30 [cifs]

[442282.124072]  cifs_do_mount+0x168/0x5a0 [cifs]

[442282.125364]  mount_fs+0x3e/0x150

[442282.126627]  vfs_kern_mount+0x67/0x130

[442282.127850]  do_mount+0x1f5/0xca0

[442282.129047]  SyS_mount+0x83/0xd0

[442282.130257]  do_syscall_64+0x79/0x1b0

[442282.131583]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2

[442282.132687] RIP: 0033:0x7f3e907fdfea

[442282.133754] RSP: 002b:00007ffee9139868 EFLAGS: 00000202 ORIG_RAX: 00000=
000000000a5

[442282.134842] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f3e90=
7fdfea

[442282.135909] RDX: 000055d13f5953b2 RSI: 000055d13f5953f9 RDI: 00007ffee9=
13bb51

[442282.136944] RBP: 00007ffee913bb46 R08: 000055d1415e80d0 R09: 0000000000=
001000

[442282.137962] R10: 0000000000000000 R11: 0000000000000202 R12: 00007f3e90=
ef0000

[442282.138957] R13: 000055d1415e80d0 R14: 00007f3e90ef290f R15: 0000000000=
000000

[442282.139918] Code: 80 3a 00 75 f7 48 83 c6 01 0f b6 4e ff 48 83 c2 01 84=
 c9 88 4a ff 75 ed 5d c3 0f 1f 00 55 48 89 e5 eb 04 84 c0 74 18 48 83 c7 01=
 <0f> b6 47 ff 48 83 c6 01 3a 46 ff 74 eb 19 c0 83 c8 01 5d c3 31

[442282.142829] RIP: strcmp+0xe/0x30 RSP: ffffc9001bff7c88

[442282.143759] CR2: 0000000000000000

[7.] A small shell script or example program which triggers the

     problem (if possible)

My colleague Vidhesh (CC'ed) will be glad to share further details on the t=
est scenario and/or in-house reproduction.  Please let us know of workaroun=
ds, if any.

Thanks and Regards,
=3D Ameya


