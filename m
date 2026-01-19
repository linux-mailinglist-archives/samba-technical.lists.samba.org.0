Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF8ED3C182
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 09:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=; b=2CX2ARJkNBH+6t7hTGFtgF0Gqt
	4eGFA4zfxYSEC95KRNoRa1UjYxSvZM24Pu+Pj8ppgFzOpCT6icELmurB9gNq1m8aoRpA3l+ObLOiN
	TmzC6LUw3AJpIv2L/DqmmDLBAtayRGq+4npwkHs6RbJnP+atKqUPbJvRqq9rREXIT3vHf0stK9NhX
	FtlmSnFUpa5oY6f9KQUK6ScGxH4BwpAduDjzbfH9xEiVdKULtuc+3DuE8d4LKdpDTjm3v9gq3CVi1
	2LFXPFnJrYtZpJZf26Ob9lfLm4EqmfDUxXkkT+6V9bqzkdlA1wZB/uFiF82a/L49t1obVssOqgrzs
	L3m1aeEQ==;
Received: from ip6-localhost ([::1]:35170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vi6qP-000hzn-VR; Tue, 20 Jan 2026 08:12:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:59733) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhsJm-000eYf-N5
 for samba-technical@lists.samba.org; Mon, 19 Jan 2026 16:41:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so7728202a12.3
 for <samba-technical@lists.samba.org>; Mon, 19 Jan 2026 08:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768840890; cv=none;
 d=google.com; s=arc-20240605;
 b=ZHYTcRRJsw3aWe8LJNvHTNTKnYr+h1OTzv/5+x4lTSwm10gjr2/phDA0hkGULUZGPd
 13j/H0FNwPxnyIJnhDa0WcREiJenuHTjnHpEfWm5+c8/56Ro+guex30KShNmVddp12ns
 WYbIEYhfIE6JAkdlKrksyfa+XGRMXyblRVkKDIJPHEf+TDKqrB5EHOef4v0yj7U8KAJt
 OPF+BlBIhxRfDlrUw53yDkekjIyfgt8tD2BAx/irVlcok8Kj0Y6STcF5nTSpY4XKUt7e
 Ez0wD3SUcd8l4zAnSbw4wDLefGb1FtzWuFjxnJQc1t3Xae4gPPifpbJm4AJM/QPAIZQT
 sRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
 fh=NP9qdR/15VaQ1BBv+0qyHg70Y4X4+FliRHXDNLKXSYc=;
 b=OV1a1Vb+A5T9nAswOQfGfSXwmPIJkWV4Uwl3Zq+a1MzYON8x7Y+T52EPzfrLgAlrxk
 PO+Ey4ub6Bi+jgCrnsdTzk8CmZochjffzijZWkhsMrbmSWnwTJ789leDzh2pN1bEXD5+
 ydvNG97FgC8APX0xqxY2kTio4chJrdStYkEkMWU+wEy9n8dlvXvRMG9bG+OHjtvnSDhg
 W8Qo/DnicXpVwB08A1VBoXCF63giy0b5YE/OppNJU/x6OEyJcNH34734RXnZT1WxjmRK
 3Mb2ttdmY2FYNPIFsuK/jq/Pp24KD2aJK72aDjLRtfNe4Xal5OtB1vZ6nWvYFUMNwzTu
 VSxA==; darn=lists.samba.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768840890; x=1769445690; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
 b=bWYcn+NZx+XTLOfayaTSCddnyYNbdrNxvEl9M/EkEHT+NrOSh8dNQ5Yc2dNGf6RmM+
 Uh/wsiMdybHce4NTwxYzJZ4vtYQsB4wJNgJAiG9GC/JHtvAx2kZD+31Gy8q+gXyP37/h
 +T62v/rycRcPTJ6rBiV9Iu7OoiVpeCSE64uhQuKHIME+OTbtVFHvLY209NqH+ZY70kZe
 bWdFhjGphhTOj41kIzJ5V0TdRthHWOLQNt+cKoQVRzvPjnQvTEqjEUYsvLzh7rbVpLEs
 6uILUgEg0YUdXatvICE5uzi7WxGhvtxJtAJTOdk9DR9r/ZCqTcXKUfRnBW89q97fMpGD
 kCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840890; x=1769445690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
 b=kEKkLvBdEV12GNyzpnD40xw/jmc5l3QAeg9SXnDUb+5x89yGyhX5H/RTHzTTHoF3Hx
 pPqDBJEq1ZoDKZHPKQcDeOLA0ITBXeXDT79mKgsbO2oIz0WSDgTMO3Gpk4fPELXnzTqK
 Sd/+jMTzKiuJXXISMPYc3DzfFoT7vyVFqedZQ4fAC+eqH+I3w5GfFr9r04VUpV3l/1Sc
 6n6IhqLs4ndE5/iDgu+ljK7mUa9jyWiQXreUzdtbDNdbpOrknqUwJCPBRKRMWvqMkj4z
 NDkCDQ91bjl8E8t9UCB7BrVV0J/e5ME7Vez3QDz/TBe8Lo7H9H5vCDQ0XLcqffqQSEsX
 tS3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBANJMSBZ9g1+oQBNeecBltInGoUpjq64RSHbUul+ALoiS7rpfNuKaRQPsmve75n52O29X0QkKo2E+SIXjTF4=@lists.samba.org
X-Gm-Message-State: AOJu0Yw+iHj39Jd2KVW23bByj2x201vUYQ6oY5CrM1+wkb+lz373hvAh
 kZXA4XtmLjebZ68FhwmqEO4mQQC70kTwMekRbgjH1C6OHNTN2QvenVLP1i0WNWNq9Va5kdGk2xG
 05AIastJqVkX8hpKxjHESy9K419QC88k=
X-Gm-Gg: AZuq6aLeiW9DtxIKegG56elLf3VF4ae4+VVxZnjtLXlkYQB8X3UX7I1GFDQXRkr+Wr8
 fnldtkp1EKwI98Fk2mMQuVaHn7tqoHYTFknH4obWPvu/+tVwk08U211kEudqOIrIkf5T+JzslZA
 yTUJnlCUKsfwJU8OwNH8VLEZxtNdJUI4Vg1g/gvLirKI7/7TekzoDoXVFAoliC0vmjZ0QtB9L0H
 xAUdE67LL2M0HvNd5Yi2mAcQxTbR9KGoCs6N5scn5KAGDr86KntGLpFbxxH7wSv2OylhAkxsFAI
 APn9z9NuiZ8Xena+iaItIeW1VngfBg==
X-Received: by 2002:a05:6402:518b:b0:64e:f6e1:e517 with SMTP id
 4fb4d7f45d1cf-65452cd98e9mr9387079a12.32.1768840889299; Mon, 19 Jan 2026
 08:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
Date: Mon, 19 Jan 2026 17:41:16 +0100
X-Gm-Features: AZwV_QgHvJ6NvIXON-eIYvnT5PkMvN0FHfW-0LujoZ3K-fhpCrZ1N6375iX4_4Y
Message-ID: <CAOQ4uxjX8EcG5XssJ91u8Kn0gY9Rb0qCwnte_7j6Q6knvZ1shw@mail.gmail.com>
Subject: Re: [PATCH v2 02/31] exportfs: add new EXPORT_OP_STABLE_HANDLES flag
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Jan 2026 08:12:07 +0000
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-doc@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>,
 David Laight <david.laight.linux@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 19, 2026 at 5:27=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> At one time, nfsd could take the presence of struct export_operations to
> be an indicator that a filesystem was exportable via NFS. Since then, a
> lot of filesystems have grown export operations in order to provide
> filehandle support. Some of those (e.g. kernfs, pidfs, and nsfs) are not
> suitable for export via NFS since they lack filehandles that are
> stable across reboot.
>
> Add a new EXPORT_OP_STABLE_HANDLES flag that indicates that the
> filesystem supports perisistent filehandles,

persistent still here?
"...are stable across the lifetime of a file"?

> a requirement for nfs
> export. While in there, switch to the BIT() macro for defining these
> flags.

Maybe you want to move that cleanup to patch 1 along with the
export.rst sync? not a must.

>
> For now, the flag is not checked anywhere. That will come later after
> we've added it to the existing filesystems that need to remain
> exportable.
>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  Documentation/filesystems/nfs/exporting.rst |  7 +++++++
>  include/linux/exportfs.h                    | 16 +++++++++-------
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/filesystems/nfs/exporting.rst b/Documentation/=
filesystems/nfs/exporting.rst
> index 0583a0516b1e3a3e6a10af95ff88506cf02f7df4..0c29ee44e3484cef84d2d3d47=
819acf172d275a3 100644
> --- a/Documentation/filesystems/nfs/exporting.rst
> +++ b/Documentation/filesystems/nfs/exporting.rst
> @@ -244,3 +244,10 @@ following flags are defined:
>      nfsd. A case in point is reexport of NFS itself, which can't be done
>      safely without coordinating the grace period handling. Other cluster=
ed
>      and networked filesystems can be problematic here as well.
> +
> +  EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that a=
re
> +    stable across the lifetime of a file. This is a hard requirement for=
 export
> +    via nfsd. Any filesystem that is eligible to be exported via nfsd mu=
st
> +    indicate this guarantee by setting this flag. Most disk-based filesy=
stems
> +    can do this naturally. Pseudofilesystems that are for local reportin=
g and
> +    control (e.g. kernfs, pidfs, nsfs) usually can't support this.
> diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
> index f0cf2714ec52dd942b8f1c455a25702bd7e412b3..c4e0f083290e7e341342cf0b4=
5b58fddda3af65e 100644
> --- a/include/linux/exportfs.h
> +++ b/include/linux/exportfs.h
> @@ -3,6 +3,7 @@
>  #define LINUX_EXPORTFS_H 1
>
>  #include <linux/types.h>
> +#include <linux/bits.h>
>  #include <linux/path.h>
>
>  struct dentry;
> @@ -277,15 +278,16 @@ struct export_operations {
>                              int nr_iomaps, struct iattr *iattr);
>         int (*permission)(struct handle_to_path_ctx *ctx, unsigned int of=
lags);
>         struct file * (*open)(const struct path *path, unsigned int oflag=
s);
> -#define        EXPORT_OP_NOWCC                 (0x1) /* don't collect v3=
 wcc data */
> -#define        EXPORT_OP_NOSUBTREECHK          (0x2) /* no subtree check=
ing */
> -#define        EXPORT_OP_CLOSE_BEFORE_UNLINK   (0x4) /* close files befo=
re unlink */
> -#define EXPORT_OP_REMOTE_FS            (0x8) /* Filesystem is remote */
> -#define EXPORT_OP_NOATOMIC_ATTR                (0x10) /* Filesystem cann=
ot supply
> +#define EXPORT_OP_NOWCC                        BIT(0) /* don't collect v=
3 wcc data */
> +#define EXPORT_OP_NOSUBTREECHK         BIT(1) /* no subtree checking */
> +#define EXPORT_OP_CLOSE_BEFORE_UNLINK  BIT(2) /* close files before unli=
nk */
> +#define EXPORT_OP_REMOTE_FS            BIT(3) /* Filesystem is remote */
> +#define EXPORT_OP_NOATOMIC_ATTR                BIT(4) /* Filesystem cann=
ot supply
>                                                   atomic attribute update=
s
>                                                 */
> -#define EXPORT_OP_FLUSH_ON_CLOSE       (0x20) /* fs flushes file data on=
 close */
> -#define EXPORT_OP_NOLOCKS              (0x40) /* no file locking support=
 */
> +#define EXPORT_OP_FLUSH_ON_CLOSE       BIT(5) /* fs flushes file data on=
 close */
> +#define EXPORT_OP_NOLOCKS              BIT(6) /* no file locking support=
 */
> +#define EXPORT_OP_STABLE_HANDLES       BIT(7) /* fhs are stable across r=
eboot */
>         unsigned long   flags;
>  };
>
>
> --
> 2.52.0
>

