Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6FAD959
	for <lists+samba-technical@lfdr.de>; Mon,  9 Sep 2019 14:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Aqz2UCkkJvpu/BdEbJb6cBMFpaHCJcN7GmoGliA1KHI=; b=Nnp7MtM/YPaLBPFAg9xnq6Jop/
	ZauaenvR9r8Tt7ufmrRQO/KPWWa1rUp+4Mu7R8wA5ekvWp6JaKAadd0JB0oy6FgcYjLvsp8MZbhKC
	YI+t784M0tR5yeHn/SKf3f7/fbGb+xk1lqvv9BVGObRioE54x70sKDuVrKrzkSmHJ9pBYLHfDkEcY
	xJU2/iAUyfDS0pmZSvE52RhvCfCqOTSjH71Zl3nxeQmHYD6DxAyS/XiS3IJOLqT9MAlJH4nKiXOPQ
	fOIIzjq5hq02EFGCSr//aJOwSSpeM09Ijb4rDUn0N9k0erNQYkje5obD/1bo7PlpRY5VRReU97tY+
	gMUVn1DA==;
Received: from localhost ([::1]:35276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7J4d-004Qso-So; Mon, 09 Sep 2019 12:47:16 +0000
Received: from mx2.suse.de ([195.135.220.15]:33854 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i7J4N-004Qsh-9i
 for samba-technical@lists.samba.org; Mon, 09 Sep 2019 12:47:10 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 645ADAEB3;
 Mon,  9 Sep 2019 12:46:51 +0000 (UTC)
To: "Paulo Alcantara \(SUSE\)" <paulo@paulo.ac>, piastryyy@gmail.com,
 samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
Subject: Re: [PATCH] mount.cifs: Fix double-free issue when mounting with
 setuid root
In-Reply-To: <20190905184935.30694-1-paulo@paulo.ac>
References: <20190905184935.30694-1-paulo@paulo.ac>
Date: Mon, 09 Sep 2019 14:46:50 +0200
Message-ID: <87k1ahiqmd.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

" Paulo Alcantara (SUSE) " <paulo@paulo.ac> writes:
> It can be easily reproduced with the following:
>
>   # chmod +s `which mount.cifs`
>   # echo "//localhost/share /mnt cifs \
>     users,username=3Dfoo,password=3DXXXX" >> /etc/fstab
>   # su - foo
>   $ mount /mnt
>   free(): double free detected in tcache 2
>   Child process terminated abnormally.
>
> The problem was that check_fstab() already freed orgoptions pointer
> and then we freed it again in main() function.
>
> Fixes: bf7f48f4c7dc ("mount.cifs.c: fix memory leaks in main func")
> Signed-off-by: Paulo Alcantara (SUSE) <paulo@paulo.ac>

Reviewed-by: Aurelien Aptel <aaptel@suse.com>

I've compiled next branch with ASAN and can confirm the double-free and
the fix works

Compiling with ASAN
-------------------

$ CFLAGS=3D-fsanitize=3Daddress \
  LDFLAGS=3D-fsanitize=3Daddress \
  ac_cv_func_malloc_0_nonnull=3Dyes \
  ./configure
$ make clean && make -j4=20=20

Next branch
-----------

$ mount /mnt; echo $?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D29883=3D=3DERROR: AddressSanitizer: attempting double-free on 0x60700=
0000020 in thread T0:
    #0 0x7f69d480a1b8 in __interceptor_free (/usr/lib64/libasan.so.4+0xdc1b=
8)
    #1 0x559381795f33 in main (/sbin/mount.cifs+0xef33)
    #2 0x7f69d4394f89 in __libc_start_main (/lib64/libc.so.6+0x20f89)
    #3 0x55938178e079 in _start (/sbin/mount.cifs+0x7079)

0x607000000020 is located 0 bytes inside of 68-byte region [0x607000000020,=
0x607000000064)
freed by thread T0 here:
    #0 0x7f69d480a1b8 in __interceptor_free (/usr/lib64/libasan.so.4+0xdc1b=
8)
    #1 0x55938178e372 in check_fstab (/sbin/mount.cifs+0x7372)
    #2 0x559381794661 in assemble_mountinfo (/sbin/mount.cifs+0xd661)
    #3 0x559381795eef in main (/sbin/mount.cifs+0xeeef)
    #4 0x7f69d4394f89 in __libc_start_main (/lib64/libc.so.6+0x20f89)

previously allocated by thread T0 here:
    #0 0x7f69d480a510 in malloc (/usr/lib64/libasan.so.4+0xdc510)
    #1 0x7f69d43fc2a9 in __GI___strndup (/lib64/libc.so.6+0x882a9)

SUMMARY: AddressSanitizer: double-free (/usr/lib64/libasan.so.4+0xdc1b8) in=
 __interceptor_free
=3D=3D29883=3D=3DABORTING
1

With fix
--------

$ mount /mnt; echo $?
0

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

