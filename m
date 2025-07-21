Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CCB0B983
	for <lists+samba-technical@lfdr.de>; Mon, 21 Jul 2025 02:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=h4uxtFN/g02OUd8QS+EKIJNHOPRScDGOSxVQctcJt7M=; b=mooD3n693XalPXwMXeMt2gKTi7
	BbZa0UxyL5IzURnPParmSvXNzL/zDVnZtbSf+l8y99Nz7YphMwd1z45qRvyb3WF8K2j5ea9sBjuyQ
	ogCtgkFVXmDZzlRPPMDKJMDZaM//ACD6lOYF/6KmHnN7uO9bQgZnD5JNryv3j8U+BCgdRNH2Q8JO0
	5i1GCoPCd19v491YtqTxkemSmJHEQql17cLnQgyLqjM4MaQjmVn1q4jyZEp7aUPAdP8fjck9XJaqF
	2NGicv0p4od5H2ls0Jg8ej5lndx6ERaCwvaERM4/5MVjgTjfALgNygM0EGnxPTCbX+1UHgDdx1gIl
	OGQK6k3g==;
Received: from ip6-localhost ([::1]:31692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1udeGL-00BYEA-QZ; Mon, 21 Jul 2025 00:20:13 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:48178) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1udeGE-00BYE2-MN
 for samba-technical@lists.samba.org; Mon, 21 Jul 2025 00:20:11 +0000
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7e346ab53d8so345437185a.0
 for <samba-technical@lists.samba.org>; Sun, 20 Jul 2025 17:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753057204; x=1753662004; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4uxtFN/g02OUd8QS+EKIJNHOPRScDGOSxVQctcJt7M=;
 b=HI3vCshh9nJMMqYMQb7Aoe+JjYpDKcUjghIH6fxa3q4hNOXlQtPdISkpML+4Y+Ryx8
 BQKcs4VWqzTXSjBV9NeoTdvOwocliAqCyJqzMnGm5H6sAJIVYjD65h5kR5FpxRyKAjlY
 n03aWZn1Xd+4l1pYo0BKaeM+d/B+z42OO6zgJdbvCrBEK1aGs+w/kCJb/DKVepAhEGlW
 2sNB1NfjBKxPi+6AezNndLKnR9WMEXJc3spyQ7wcKOTQA5wYS7ASLEg58bt70SThsN24
 Hoz8+CLIkwPcFfapTVAV0NFJbNm5DE8vyN3YvR+IX3VEdtA7ta0CIzThXheLJEKePAKb
 rxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753057204; x=1753662004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4uxtFN/g02OUd8QS+EKIJNHOPRScDGOSxVQctcJt7M=;
 b=vz6A/e3M7vQqBS3OFAp7l6M7POeOZ4Yk6ESoyf6UcxIeOXgN/d+2GCI7vaGgZFAKdP
 acAaG8KbpVRSmiK35DPbcQ6tzhHlDrul2eIDzo/CwAaODhX+jGWVjUKLT0MP+4lnR5Ec
 Snt4PXT+cOCYnO/OYu7i099j5C8WzcZmbzfuK+HCfKBYVPu63tkK0H0WHFwMn9KWo5JH
 eiFVCCRujQPEpnoVGWShLNuarkW5nlmmO4PBv+UPOSa+Y1Mo/vrmQ9/imdsAS5VezTGx
 UmL+Y7U94UeXMWkGzPXo+cmbOM4m8HlLEZBy39ySvVoiOM5lo/Yt0raOwc4OJB5XJhr9
 8+mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdm1pEVmxOhbA1fTBdV7Fd4lFx9GojI4zwL1pho9r7Hw56utdJhaJfj7rVZ2RkuI3V+6ZKJNigR6QnhDZmFaM=@lists.samba.org
X-Gm-Message-State: AOJu0Yyo45i2gk+3caIiEAWHbBNWlt6RwjClK1xxrlmMX4JvAj/UoEdq
 c4HWzQf+CCuyqK27wS8OylMt64wzr77kVpMjl4SK/oEmd/SXhJ8PSxLljSUwj3Hz+TKl9UqvktK
 XbknhwHSes3Xu4PJgxEk7wiurGVhwIAk=
X-Gm-Gg: ASbGncu6nQzy7L2/S1WHawF36MNMhfrQWwO62ISNTl+1uHGg5BVumZ/CVED3ko+Tuoi
 jlc2THn/3+d9XOFmieVORJ1mcqQb2FzaUsICNX2C32jO/6ZW5zOIIDtijytv0wQNKJJPc8zDQbz
 hjyX4yLLECIJkeQuKT94Hhg5c6JqXIJh/S6tsz+wFHovhwjvscaaMMTo8m8xiVLMuCoyDTnAn1g
 tRNhA==
X-Google-Smtp-Source: AGHT+IFn9uzqm/marhuf9II1iNT1qdWq1pOhL/1LHYsteK69aMBRNzBkMlDRf31MHjqdlS2Tem+7Zm4f63g8nJ9XP/c=
X-Received: by 2002:a05:6214:ca2:b0:6fa:c31a:af20 with SMTP id
 6a1803df08f44-705071c1e69mr250739726d6.5.1753057204481; Sun, 20 Jul 2025
 17:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250717132926.901902-1-wangzhaolong@huaweicloud.com>
In-Reply-To: <20250717132926.901902-1-wangzhaolong@huaweicloud.com>
Date: Sun, 20 Jul 2025 19:19:52 -0500
X-Gm-Features: Ac12FXwse2Ja5ZRLqiunqBUQbV3uP5osiXrdrdg89bhJZUqCkYPAqjEruuoVs_0
Message-ID: <CAH2r5mv02iZ3OWk9ZhQdFFH89rbEAuLF_yek6+v_yvyMPHugxw@mail.gmail.com>
Subject: Re: [PATCH V2] smb: client: fix netns refcount leak after net_passive
 changes
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
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
Cc: linux-cifs@vger.kernel.org, kuniyu@google.com, yi.zhang@huawei.com,
 yangerkun@huawei.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending more review and testing

On Thu, Jul 17, 2025 at 8:35=E2=80=AFAM Wang Zhaolong
<wangzhaolong@huaweicloud.com> wrote:
>
> After commit 5c70eb5c593d ("net: better track kernel sockets lifetime"),
> kernel sockets now use net_passive reference counting. However, commit
> 95d2b9f693ff ("Revert "smb: client: fix TCP timers deadlock after rmmod""=
)
> restored the manual socket refcount manipulation without adapting to this
> new mechanism, causing a memory leak.
>
> The issue can be reproduced by[1]:
> 1. Creating a network namespace
> 2. Mounting and Unmounting CIFS within the namespace
> 3. Deleting the namespace
>
> Some memory leaks may appear after a period of time following step 3.
>
> unreferenced object 0xffff9951419f6b00 (size 256):
>   comm "ip", pid 447, jiffies 4294692389 (age 14.730s)
>   hex dump (first 32 bytes):
>     1b 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 80 77 c2 44 51 99 ff ff  .........w.DQ...
>   backtrace:
>     __kmem_cache_alloc_node+0x30e/0x3d0
>     __kmalloc+0x52/0x120
>     net_alloc_generic+0x1d/0x30
>     copy_net_ns+0x86/0x200
>     create_new_namespaces+0x117/0x300
>     unshare_nsproxy_namespaces+0x60/0xa0
>     ksys_unshare+0x148/0x360
>     __x64_sys_unshare+0x12/0x20
>     do_syscall_64+0x59/0x110
>     entry_SYSCALL_64_after_hwframe+0x78/0xe2
> ...
> unreferenced object 0xffff9951442e7500 (size 32):
>   comm "mount.cifs", pid 475, jiffies 4294693782 (age 13.343s)
>   hex dump (first 32 bytes):
>     40 c5 38 46 51 99 ff ff 18 01 96 42 51 99 ff ff  @.8FQ......BQ...
>     01 00 00 00 6f 00 c5 07 6f 00 d8 07 00 00 00 00  ....o...o.......
>   backtrace:
>     __kmem_cache_alloc_node+0x30e/0x3d0
>     kmalloc_trace+0x2a/0x90
>     ref_tracker_alloc+0x8e/0x1d0
>     sk_alloc+0x18c/0x1c0
>     inet_create+0xf1/0x370
>     __sock_create+0xd7/0x1e0
>     generic_ip_connect+0x1d4/0x5a0 [cifs]
>     cifs_get_tcp_session+0x5d0/0x8a0 [cifs]
>     cifs_mount_get_session+0x47/0x1b0 [cifs]
>     dfs_mount_share+0xfa/0xa10 [cifs]
>     cifs_mount+0x68/0x2b0 [cifs]
>     cifs_smb3_do_mount+0x10b/0x760 [cifs]
>     smb3_get_tree+0x112/0x2e0 [cifs]
>     vfs_get_tree+0x29/0xf0
>     path_mount+0x2d4/0xa00
>     __se_sys_mount+0x165/0x1d0
>
> Root cause:
> When creating kernel sockets, sk_alloc() calls net_passive_inc() for
> sockets with sk_net_refcnt=3D0. The CIFS code manually converts kernel
> sockets to user sockets by setting sk_net_refcnt=3D1, but doesn't call
> the corresponding net_passive_dec(). This creates an imbalance in the
> net_passive counter, which prevents the network namespace from being
> destroyed when its last user reference is dropped. As a result, the
> entire namespace and all its associated resources remain allocated.
>
> Timeline of patches leading to this issue:
> - commit ef7134c7fc48 ("smb: client: Fix use-after-free of network
>   namespace.") in v6.12 fixed the original netns UAF by manually
>   managing socket refcounts
> - commit e9f2517a3e18 ("smb: client: fix TCP timers deadlock after
>   rmmod") in v6.13 attempted to use kernel sockets but introduced
>   TCP timer issues
> - commit 5c70eb5c593d ("net: better track kernel sockets lifetime")
>   in v6.14-rc5 introduced the net_passive mechanism with
>   sk_net_refcnt_upgrade() for proper socket conversion
> - commit 95d2b9f693ff ("Revert "smb: client: fix TCP timers deadlock
>   after rmmod"") in v6.15-rc3 reverted to manual refcount management
>   without adapting to the new net_passive changes
>
> Fix this by using sk_net_refcnt_upgrade() which properly handles the
> net_passive counter when converting kernel sockets to user sockets.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220343 [1]
> Fixes: 95d2b9f693ff ("Revert "smb: client: fix TCP timers deadlock after =
rmmod"")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> ---
>  fs/smb/client/connect.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> V1 -> V2:
> - Add a simplified description of the reproduction steps in the
>   commit message.
>
> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> index 205f547ca49e..5eec8957f2a9 100644
> --- a/fs/smb/client/connect.c
> +++ b/fs/smb/client/connect.c
> @@ -3360,22 +3360,19 @@ generic_ip_connect(struct TCP_Server_Info *server=
)
>                 socket =3D server->ssocket;
>         } else {
>                 struct net *net =3D cifs_net_ns(server);
>                 struct sock *sk;
>
> -               rc =3D __sock_create(net, sfamily, SOCK_STREAM,
> -                                  IPPROTO_TCP, &server->ssocket, 1);
> +               rc =3D sock_create_kern(net, sfamily, SOCK_STREAM,
> +                                     IPPROTO_TCP, &server->ssocket);
>                 if (rc < 0) {
>                         cifs_server_dbg(VFS, "Error %d creating socket\n"=
, rc);
>                         return rc;
>                 }
>
>                 sk =3D server->ssocket->sk;
> -               __netns_tracker_free(net, &sk->ns_tracker, false);
> -               sk->sk_net_refcnt =3D 1;
> -               get_net_track(net, &sk->ns_tracker, GFP_KERNEL);
> -               sock_inuse_add(net, 1);
> +               sk_net_refcnt_upgrade(sk);
>
>                 /* BB other socket options to set KEEPALIVE, NODELAY? */
>                 cifs_dbg(FYI, "Socket created\n");
>                 socket =3D server->ssocket;
>                 socket->sk->sk_allocation =3D GFP_NOFS;
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

