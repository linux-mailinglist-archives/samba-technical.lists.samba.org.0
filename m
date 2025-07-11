Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78EB02625
	for <lists+samba-technical@lfdr.de>; Fri, 11 Jul 2025 23:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xLDzATH4FKHBUEL/4pNBiM+c+Pl7nhhwFN3kf38HDms=; b=OIQ5AAbaJxl23txfFRQ9+Nqgsy
	NmNRd6SM1Z3hUe7Jo6j4HN03P1YSGiwhX87izRcGzmdRmYVg6MNjfLCm+QtvKUBsaO7bSwH30tPkg
	7QEHlm6oNBk/UsONiTramF6xdNYfI/Vgfh7t2w7YOGZwxqQ2+W7y6VNqCOoiod2VfXglIOstA/ucU
	5UY7qE2caisS2vED2DDQq1PTvHMKUSvK57J4LszXkuRhUzZ+Grs0xFQXMKF1niXzIUaXR8/GOr49x
	9nF0LOof2aUnZXnILOVhvi0P+2mqzgnEp+aMaU/xKlVrBcO7Cj0ioITHIxNkjsB+TlVM7fDJC5LIU
	++KSM2bg==;
Received: from ip6-localhost ([::1]:56142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uaL0q-00B0WM-Od; Fri, 11 Jul 2025 21:10:32 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:56583) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uaL0k-00B0WF-Vf
 for samba-technical@lists.samba.org; Fri, 11 Jul 2025 21:10:30 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6facf4d8e9eso23178696d6.1
 for <samba-technical@lists.samba.org>; Fri, 11 Jul 2025 14:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752268225; x=1752873025; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLDzATH4FKHBUEL/4pNBiM+c+Pl7nhhwFN3kf38HDms=;
 b=neiFHfggBwhGqeQSVRPjNd60oV4eFCumXLFA6QZ8cDHgHMcey3WzE8RCscj2m4kWfj
 EBdUwXESfuWR0TQCkL5kOs3mupoHzXc6qSCvcYhGv3KFpUNeLxbFrzd53eTGmwVhdj6b
 iR6A3dn4uCawraP5QIBN5MXk2DLm7VBNSzhoO20xsO0A4PxplSX2wRmdLftnMEBmRnwe
 YK4cXiYZISP206XEyMHTjEopZFJy9Emdu9v68/U4jmBG4MGkhTG4svIx3OFkT01NJxvC
 Ums6HA2eIVdVnIj80txdn+GJeuPEL7oMpxEd1RRPE1jxT0GbLnwRJYWbfLnWOHLUFn7B
 4nNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752268225; x=1752873025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLDzATH4FKHBUEL/4pNBiM+c+Pl7nhhwFN3kf38HDms=;
 b=LebWTN+mNm/yGtR8nFIxYMowq9T0BuQcMg/88Ng61YuiawgeXGb2LAoCXD7apti155
 qCWqB+AoH+FLtVbmRkMwA80w52Z8QroDdJeUhmq5nby5/9C00B3ONNhk0Z6csduQx7nO
 k4se5PGMhj9TSMLp2zhr79fo1bwuplHkY3kn3XdhXOcF7nJAaRuVj+3v1Q0Tr6UeuS3y
 nlz6beX8LIwwVZXmE0Ea+mnP5xsc82qtcAFyPar4hOBsyyJQ8lMZjotcCuUBRLI0W6oL
 aTpyZOA11gmXqrcBSq6yMaFiMQvIsNEf+AJePJuFwsvI2Z1y8ArHe2ZT+V10XBXnZ4b2
 fRkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQcoOziHKbczp7YmuHaNeLrHj3Qk5Z1JGImvDcomreCP917R76mXXjYbjRtRzaNJzI+56jEfjkI2wiKpbPrDg=@lists.samba.org
X-Gm-Message-State: AOJu0Yxp8YomRn17is48kzCueB0lwQL5X6R0gZXtMlvCSTiQgII57sbJ
 9Sr/JG2K4+HhqAsmVoJzWkq36H81QNPO9bEoen4Aj5iRp9GBbfWs5My25rLAYUTG2Wh4YPl+M1P
 0svsNKEo8cXxtUCHHFMFByx4RRi5oAQY=
X-Gm-Gg: ASbGncvMbK0lkciTiI9uTSCDKTVkKDU8gIjqBOy7HOS98Xj7SAzaffDZ135bDeE8uAv
 ps+2UoYp1tuomrMjHNi78dPSX6OENrx+pC1LtOpn8tcgtZZKliGgjtwRajGuzB91kAnf23PuuCF
 aBY6+Zn65Umg6JlO94S7sWyOP1ZIRzwx0JyKTxMiybgUuuOPGBNVZNGKMcxzEZwBnnWSW6uUfHC
 zqJm6SO1xNjS0oPm1RETgDVCxqck+d8h5QAE0ugLCQcCHpr2A==
X-Google-Smtp-Source: AGHT+IGaCiQ/rNrz/LTBHwnUjiK0A45Q2lEw4u3i7emCz70wt24LnSCWlVSIxry4sdILfJa0MeDniDQMMJEm/jOlAP0=
X-Received: by 2002:a05:6214:2c08:b0:704:9077:e0c8 with SMTP id
 6a1803df08f44-704a4083edemr98468236d6.3.1752268224779; Fri, 11 Jul 2025
 14:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250707010926.31623-1-wangzhaolong@huaweicloud.com>
 <aa4ecd85deb859ad32ba7f649321084b@manguebit.org>
In-Reply-To: <aa4ecd85deb859ad32ba7f649321084b@manguebit.org>
Date: Fri, 11 Jul 2025 16:10:13 -0500
X-Gm-Features: Ac12FXyAPNKfVjaJoQLVk1wqbZqeW-9qtvUVFWqZQkbPbxcmN6B9JWqQFqrRpM8
Message-ID: <CAH2r5mukjH30zhxGTiJmvfRYJEFgsTd-U+CpwmYs=7aUJPS1=g@mail.gmail.com>
Subject: Re: [PATCH V2] smb: client: fix use-after-free in cifs_oplock_break
To: Paulo Alcantara <pc@manguebit.org>
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
Cc: linux-cifs@vger.kernel.org, Wang Zhaolong <wangzhaolong@huaweicloud.com>,
 samba-technical@lists.samba.org, aaptel@suse.com, linux-kernel@vger.kernel.org,
 sfrench@samba.org, pshilov@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch.  I had missed the patch because it was tagged by gmail as 'spam=
'

Merged into cifs-2.6.git for-next


On Fri, Jul 11, 2025 at 9:50=E2=80=AFAM Paulo Alcantara <pc@manguebit.org> =
wrote:
>
> Wang Zhaolong <wangzhaolong@huaweicloud.com> writes:
>
> > A race condition can occur in cifs_oplock_break() leading to a
> > use-after-free of the cinode structure when unmounting:
> >
> >   cifs_oplock_break()
> >     _cifsFileInfo_put(cfile)
> >       cifsFileInfo_put_final()
> >         cifs_sb_deactive()
> >           [last ref, start releasing sb]
> >             kill_sb()
> >               kill_anon_super()
> >                 generic_shutdown_super()
> >                   evict_inodes()
> >                     dispose_list()
> >                       evict()
> >                         destroy_inode()
> >                           call_rcu(&inode->i_rcu, i_callback)
> >     spin_lock(&cinode->open_file_lock)  <- OK
> >                             [later] i_callback()
> >                               cifs_free_inode()
> >                                 kmem_cache_free(cinode)
> >     spin_unlock(&cinode->open_file_lock)  <- UAF
> >     cifs_done_oplock_break(cinode)       <- UAF
> >
> > The issue occurs when umount has already released its reference to the
> > superblock. When _cifsFileInfo_put() calls cifs_sb_deactive(), this
> > releases the last reference, triggering the immediate cleanup of all
> > inodes under RCU. However, cifs_oplock_break() continues to access the
> > cinode after this point, resulting in use-after-free.
> >
> > Fix this by holding an extra reference to the superblock during the
> > entire oplock break operation. This ensures that the superblock and
> > its inodes remain valid until the oplock break completes.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220309
> > Fixes: b98749cac4a6 ("CIFS: keep FileInfo handle live during oplock bre=
ak")
> > Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> > ---
> >  fs/smb/client/file.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
>
> Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>
>


--=20
Thanks,

Steve

