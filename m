Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73929423C
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VoqU6CJ6YO09xfu/Zv1UblvBxzl147x/GcWPads5U+c=; b=NbrCLhxhQwx3w9CuwGPQBzvE/W
	GKG0gE2HGChShcsS4/3j/JBBbsgyoT9l0ell9/3knDZlQ3+XmbyAi4tZs/nQzZbU4FBtosnkERqGg
	H3yZBof5cAN4BWCOZYSGSbhEsrY2pkJux0sjt/QAtmfZIaMe6WNj/UViYMvhQ7C3AZbUFfx1mf7IS
	bKSDAJcD7koSx34WE6Og1lZEMFVnTRm7wau7h1O7qvln61p3l2KuqnMusZDlsMlIhgfZMXxPFdQur
	AyjFU+7G6eEgN/H+p6jOwuxSj7W1S3EYGIrDQJ53/Rs96Ay0GFtfyIKE+1KP2StRNbKTsG1WdH4R+
	LcL2FZ2A==;
Received: from ip6-localhost ([::1]:19240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwWu-00Cvi2-6r; Tue, 20 Oct 2020 18:38:40 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40959) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwWo-00Cvhv-Bl
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:38:37 +0000
Received: by mail-lj1-x241.google.com with SMTP id 23so3107215ljv.7
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VoqU6CJ6YO09xfu/Zv1UblvBxzl147x/GcWPads5U+c=;
 b=lieo7zRju2JNhvzuxKDTp3BLlKTIPUj3AbH95rFmaFlJQPh2Q+ysregqOb8k+mUd9K
 cct8haulUznDk3cE+Q0eksIWKXL1LFLCs77Pm6ZPLNHC4cU82xFys5LYtbZokcDFAbqI
 PFaVcRHX0pmMXXncFUxpbKtcJpriImd+1DULfrwIks+4Sotgqp1UVCqjuHzBbAycisxC
 Ta2LywH6bz3Z7vWLtQXMq+U65dXIyl+BKI3NQNRoYueMn3i9cHiUBDDpqSAj9RwBQnr8
 vNL+FnmDkvuEJ5nuVCNWsTKE9G3fTlbS3hFbOSKI/7JuCaMNpZC0R7y+UN/WvY3t9Cix
 V4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VoqU6CJ6YO09xfu/Zv1UblvBxzl147x/GcWPads5U+c=;
 b=hzfcOADpG6zDa1w6niLeFkSZDDPLT8NwxIb/eqZJYE0u2mJ1JmrbN4ytfu/T2jZ+iN
 myRHTajhnzCOMvA+aldnj9VXMhgi+sMlcAw0r8/VgNHHCiYtRF0TaXo2UhgGSjZo+kjj
 cGKzfzmapNWlMG5V9ybptOM6epjO/iP24SR0wcFKCXO+wnF7oFmMQeBMg13mbOsSnC8a
 cVm4ISTJlBm8yoE5ohFPlXWaIz8/yRWgr5GA/LzPlHcG8s6gZOFSn4Oal0tz0bqQmVYd
 5BOV1oJSQwQzZNskVS6gOsT6t9wd5eerDAmutsOFe0temN+QJM4J6DkFbVd24MV7Fzsa
 ctLg==
X-Gm-Message-State: AOAM533QWhv82p4UkC0grkW39D94CQuPUD+w0QsL697HwH1wDX8f19RU
 Fsk4MhFwNTOyxofPNHBthb+ievBAiMUwyq+fTq6ixxsNt1E=
X-Google-Smtp-Source: ABdhPJwlSsq4swuGxZ08dJUJTvanWFH1/FTurTqh98L0LcFDLiVB6jPcqpe+Ph1jDKTxabUJS9xBdsuJkB5EnpwnYsM=
X-Received: by 2002:a05:651c:505:: with SMTP id
 o5mr1603319ljp.374.1603219113161; 
 Tue, 20 Oct 2020 11:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR16MB26151755ED24DE9F506736B8E21F0@BYAPR16MB2615.namprd16.prod.outlook.com>
In-Reply-To: <BYAPR16MB26151755ED24DE9F506736B8E21F0@BYAPR16MB2615.namprd16.prod.outlook.com>
Date: Tue, 20 Oct 2020 13:38:22 -0500
Message-ID: <CAH2r5msFVeJMHR7RbRYKweo7FFdXW6Lk=4oQe57hfzrFu6KQGg@mail.gmail.com>
Subject: Re: Oops in _raw_spin_lock_irqsave - linux kernel
 4.16.2-1.el7.elrepo.x86_64
To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

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



--=20
Thanks,

Steve

