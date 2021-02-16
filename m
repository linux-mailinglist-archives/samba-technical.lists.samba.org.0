Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FD31D0DF
	for <lists+samba-technical@lfdr.de>; Tue, 16 Feb 2021 20:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=F/UAe+Q5KrxzGPRrDpk+yw/nVFEpqh6cyKfpX+3V5cA=; b=lyeN7ngpk1f7BH9jc1GOS8v375
	7XIAXVJkQr+d2KY1DeJzdDS6dTWFPiSDL6jjUN/R5iohClunItN0X2UyP3RzyY2VOjhmrxKfk0xHO
	/rNO/3Ne2LzQNoTBN+bB0sCuER02eq+IZzLOvIuGVUTKOu8yYzbCV396f+RI+RV2KuW+SFdZWftNd
	lilymhIj5DaZ3Nha6vtu4fSklx8Yj9SxvGsssO0TgS6nj2C7FI+n1C4aDu5hySXgVlxfEL4ZB6aFJ
	Yxux+TYFjPX9dQ0s9mMUsGwgqBhUxyDK94NjRHIdqqKwVhwn+JD8Q/pVScTZU1Hl3clP4027ZRsIJ
	McRgC3og==;
Received: from ip6-localhost ([::1]:62586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lC5u3-000EP7-1w; Tue, 16 Feb 2021 19:20:55 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lC5tx-000EOV-NX
 for samba-technical@lists.samba.org; Tue, 16 Feb 2021 19:20:52 +0000
Received: by mail-io1-xd2c.google.com with SMTP id f20so11290117ioo.10
 for <samba-technical@lists.samba.org>; Tue, 16 Feb 2021 11:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F/UAe+Q5KrxzGPRrDpk+yw/nVFEpqh6cyKfpX+3V5cA=;
 b=qgO4DGEKgZcSWPj1Fh7eGlI4HjLMaqKqxTNGmtldCwGKBeQ2fZV174A3XcB4FIX8Uy
 /cHVelRqlb7p9w+r0IXnqDbDKworj4TpzTCbwPImx0nQZ8n8yiWox7tlO8pxnt5bIO96
 tGm1wHzSpI3J2q5kU4lUVPIAu/OB374dtzomNA1aIjJvezs+G64YECTq/8RSiDBpU8CR
 /qqhpQqE+sXuRnYgShPDwlohoGAErXQe32s6mS/hUmnIT+35erQdHiZmzBEqKV8bQEXk
 7ay6yJgmtm4S57cURF1KYVSYy8Nl1b6M3bVBU3KvC0I1Op/QqW9CB6Bcsxl+rNbYoGpu
 zdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F/UAe+Q5KrxzGPRrDpk+yw/nVFEpqh6cyKfpX+3V5cA=;
 b=tr2yxlBSr9NMR68ykUTNd1uotI9D7aS/sWoj2iVl91p7zR5kCZ+4LA4YuV0B5TwW+H
 DuVwPrNylYbwluNdJPsu5A2pplq35huIDM1A309UkXr/nhzrAwKoh91E16pG2PgT9zSg
 TYfMdusoI0Z3D3zH8INUi1XWoksUlKrV0kobllPgo1N+RoTOZGf+JgLUmUOi5yeLS7oY
 hBp758m2y1Ixg/c87qTKa0PXxxgRiuXvi0moEv72HLnNy242iL4rce+n4f5iFpwj4MJC
 ZvE14ek6BudI12sSS82atMGwE0J9K1Hy9VwVTYi36Y7hr4g9J0Pj2za9lokzCYKYu33K
 5zVQ==
X-Gm-Message-State: AOAM5308+qVor61dfXlugyvP8pxHkvPk8skwKPbZRvEbyV+n1hnFToBX
 9KZCvICuP+GocCCsPoZC0S7SRtfy2oLdWQvO6pE=
X-Google-Smtp-Source: ABdhPJwMgS2ZAXa7W9UbiGTOJMhoCZLGKOaVP/ohGF3JA0SDmA6qVLPiq4VDSYWupNqSQ7BNcZIeCpP6XHyBW4Mtdik=
X-Received: by 2002:a05:6638:3491:: with SMTP id
 t17mr21518938jal.81.1613503247661; 
 Tue, 16 Feb 2021 11:20:47 -0800 (PST)
MIME-Version: 1.0
References: <CAOQ4uxiFGjdvX2-zh5o46pn7RZhvbGHH0wpzLPuPOom91FwWeQ@mail.gmail.com>
 <20210215154317.8590-1-lhenriques@suse.de>
 <CAOQ4uxgjcCrzDkj-0ukhvHRgQ-D+A3zU5EAe0A=s1Gw2dnTJSA@mail.gmail.com>
 <73ab4951f48d69f0183548c7a82f7ae37e286d1c.camel@hammerspace.com>
 <CAOQ4uxgPtqG6eTi2AnAV4jTAaNDbeez+Xi2858mz1KLGMFntfg@mail.gmail.com>
 <92d27397479984b95883197d90318ee76995b42e.camel@hammerspace.com>
 <CAOQ4uxjUf15fDjz11pCzT3GkFmw=2ySXR_6XF-Bf-TfUwpj77Q@mail.gmail.com>
 <87r1lgjm7l.fsf@suse.de>
 <CAOQ4uxgucdN8hi=wkcvnFhBoZ=L5=ZDc7-6SwKVHYaRODdcFkg@mail.gmail.com>
 <87blckj75z.fsf@suse.de>
 <CAOQ4uxiiy_Jdi3V1ait56=zfDQRBu_5gb+UsCo8GjMZ6XRhozw@mail.gmail.com>
 <874kibkflh.fsf@suse.de>
In-Reply-To: <874kibkflh.fsf@suse.de>
Date: Tue, 16 Feb 2021 21:20:36 +0200
Message-ID: <CAOQ4uxgRK3vXH8uAJKy8cFLL8siKnMMN8h6hx4yZeA5Fe0ZZYA@mail.gmail.com>
Subject: Re: [PATCH v2] vfs: prevent copy_file_range to copy across devices
To: Luis Henriques <lhenriques@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "darrick.wong@oracle.com" <darrick.wong@oracle.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>, "iant@google.com" <iant@google.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sfrench@samba.org" <sfrench@samba.org>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "dchinner@redhat.com" <dchinner@redhat.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "llozano@chromium.org" <llozano@chromium.org>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 16, 2021 at 8:54 PM Luis Henriques <lhenriques@suse.de> wrote:
>
> Amir Goldstein <amir73il@gmail.com> writes:
>
> > On Tue, Feb 16, 2021 at 6:41 PM Luis Henriques <lhenriques@suse.de> wrote:
> >>
> >> Amir Goldstein <amir73il@gmail.com> writes:
> >>
> >> >> Ugh.  And I guess overlayfs may have a similar problem.
> >> >
> >> > Not exactly.
> >> > Generally speaking, overlayfs should call vfs_copy_file_range()
> >> > with the flags it got from layer above, so if called from nfsd it
> >> > will allow cross fs copy and when called from syscall it won't.
> >> >
> >> > There are some corner cases where overlayfs could benefit from
> >> > COPY_FILE_SPLICE (e.g. copy from lower file to upper file), but
> >> > let's leave those for now. Just leave overlayfs code as is.
> >>
> >> Got it, thanks for clarifying.
> >>
> >> >> > This is easy to solve with a flag COPY_FILE_SPLICE (or something) that
> >> >> > is internal to kernel users.
> >> >> >
> >> >> > FWIW, you may want to look at the loop in ovl_copy_up_data()
> >> >> > for improvements to nfsd_copy_file_range().
> >> >> >
> >> >> > We can move the check out to copy_file_range syscall:
> >> >> >
> >> >> >         if (flags != 0)
> >> >> >                 return -EINVAL;
> >> >> >
> >> >> > Leave the fallback from all filesystems and check for the
> >> >> > COPY_FILE_SPLICE flag inside generic_copy_file_range().
> >> >>
> >> >> Ok, the diff bellow is just to make sure I understood your suggestion.
> >> >>
> >> >> The patch will also need to:
> >> >>
> >> >>  - change nfs and overlayfs calls to vfs_copy_file_range() so that they
> >> >>    use the new flag.
> >> >>
> >> >>  - check flags in generic_copy_file_checks() to make sure only valid flags
> >> >>    are used (COPY_FILE_SPLICE at the moment).
> >> >>
> >> >> Also, where should this flag be defined?  include/uapi/linux/fs.h?
> >> >
> >> > Grep for REMAP_FILE_
> >> > Same header file, same Documentation rst file.
> >> >
> >> >>
> >> >> Cheers,
> >> >> --
> >> >> Luis
> >> >>
> >> >> diff --git a/fs/read_write.c b/fs/read_write.c
> >> >> index 75f764b43418..341d315d2a96 100644
> >> >> --- a/fs/read_write.c
> >> >> +++ b/fs/read_write.c
> >> >> @@ -1383,6 +1383,13 @@ ssize_t generic_copy_file_range(struct file *file_in, loff_t pos_in,
> >> >>                                 struct file *file_out, loff_t pos_out,
> >> >>                                 size_t len, unsigned int flags)
> >> >>  {
> >> >> +       if (!(flags & COPY_FILE_SPLICE)) {
> >> >> +               if (!file_out->f_op->copy_file_range)
> >> >> +                       return -EOPNOTSUPP;
> >> >> +               else if (file_out->f_op->copy_file_range !=
> >> >> +                        file_in->f_op->copy_file_range)
> >> >> +                       return -EXDEV;
> >> >> +       }
> >> >
> >> > That looks strange, because you are duplicating the logic in
> >> > do_copy_file_range(). Maybe better:
> >> >
> >> > if (WARN_ON_ONCE(flags & ~COPY_FILE_SPLICE))
> >> >         return -EINVAL;
> >> > if (flags & COPY_FILE_SPLICE)
> >> >        return do_splice_direct(file_in, &pos_in, file_out, &pos_out,
> >> >                                  len > MAX_RW_COUNT ? MAX_RW_COUNT : len, 0);
> >>
> >> My initial reasoning for duplicating the logic in do_copy_file_range() was
> >> to allow the generic_copy_file_range() callers to be left unmodified and
> >> allow the filesystems to default to this implementation.
> >>
> >> With this change, I guess that the calls to generic_copy_file_range() from
> >> the different filesystems can be dropped, as in my initial patch, as they
> >> will always get -EINVAL.  The other option would be to set the
> >> COPY_FILE_SPLICE flag in those calls, but that would get us back to the
> >> problem we're trying to solve.
> >
> > I don't understand the problem.
> >
> > What exactly is wrong with the code I suggested?
> > Why should any filesystem be changed?
> >
> > Maybe I am missing something.
>
> Ok, I have to do a full brain reboot and start all over.
>
> Before that, I picked the code you suggested and tested it.  I've mounted
> a cephfs filesystem and used xfs_io to execute a 'copy_range' command
> using /sys/kernel/debug/sched_features as source.  The result was a
> 0-sized file in cephfs.  And the reason is thevfs_copy_file_range()
> early exit in:
>
>         if (len == 0)
>                 return 0;
>
> 'len' is set in generic_copy_file_checks().

Good point.. I guess we will need to do all the checks earlier in
generic_copy_file_checks() including the logic of:

        if (file_in->f_op->remap_file_range &&
            file_inode(file_in)->i_sb == file_inode(file_out)->i_sb)


>
> This means that we're not solving the original problem anymore (probably
> since v1 of this patch, haven't checked).
>
> Also, re-reading Trond's emails, I read: "... also disallowing the copy
> from, say, an XFS formatted partition to an ext4 partition".  Isn't that
> *exactly* what we're trying to do here?  I.e. _prevent_ these copies from
> happening so that tracefs files can't be CFR'ed?
>

We want to address the report which means calls coming from
copy_file_range() syscall.

Trond's use case is vfs_copy_file_range() coming from nfsd.
When he writes about copy from XFS to ext4, he means an
NFS client is issuing server side copy (on same or different NFS mounts)
and the NFS server is executing nfsd_copy_file_range() on a source
file that happens to be on XFS and destination happens to be on ext4.

We can undo the copy_file_range() syscall change of behavior from
v5.3 without regressing the NFS use case.

We just need to be careful and look at all the affected code paths.

Thanks,
Amir.

