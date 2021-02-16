Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528931CB70
	for <lists+samba-technical@lfdr.de>; Tue, 16 Feb 2021 14:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Udr/uppAMHmYikfRcuoFaAlS+xZhJpxbzyBUOtI9wrk=; b=PNMQUM9bYcPBUnmhispjhhyPDW
	wQWnVuIT680pxLahdaboCM+SmVuGb7sDhxlceLGXQ/79Ccs0aVke5yYikpTE4rZ5GQTcgBgK38Sbp
	6CDaS8E9m2UBJns7C6bSQ4Got3b9Fa4MNvhWrTC4o/NYBEqPzSpn6EsW/xFFyYncOLcyVmhb7zraF
	XfHNCF6u9blLlArEBV/xXDUR2ff7eIZxZQ+yLWAiPotB8ZSLnarE3I6NseD2PDaL6q3wzFJbevq/x
	/P+VCs1oHfYEg4DRWEUxH2tD5KXyFvCClVNLpXOxeQ7hzN5Yb5oTGnTyR+E9wt+UwRSL1cvlNwKG3
	MFgmgerw==;
Received: from ip6-localhost ([::1]:34252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lC0lz-0009eq-SQ; Tue, 16 Feb 2021 13:52:15 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:45634) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lC0lt-0009ei-PD
 for samba-technical@lists.samba.org; Tue, 16 Feb 2021 13:52:12 +0000
Received: by mail-io1-xd2b.google.com with SMTP id n201so10152865iod.12
 for <samba-technical@lists.samba.org>; Tue, 16 Feb 2021 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Udr/uppAMHmYikfRcuoFaAlS+xZhJpxbzyBUOtI9wrk=;
 b=Fy/wJSxbB0krgrqyFWMD8WxIG8EB1AfwsYuCEIZVLa3TxfnbcEJqz1X18LzcK1fAt7
 4CjUXknRFAGmXbtUqDlvXj4mcva2R9VVEfehzyPdYx1ptURMNlLn6tXU3Zh4tGPxCCkM
 Z3GWtH4bE09tDcfR+Dqh4iAjhaaC4tP4JzDYEAUzUo4mKGfGRDJ4T0t3fHBlHLOLibdf
 x8Ui48xAxAo1dvBJxeg5+VzjB6qklJ/nBXXed7AWPf859RQvH2YiDKW+YE+u8OOeQY+z
 z2XEQg8j/dveh8MszPz2XYnaeqqf6oMc0RwP9o5RMURB3d+wnWIKepja9kZOCVKp+zGm
 8W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Udr/uppAMHmYikfRcuoFaAlS+xZhJpxbzyBUOtI9wrk=;
 b=hqLuQaFqpzmM6ogC7MsKRX+jrYpblaxkOjJzRQ0yekJdqgpoO9N94iMQs0nrfwyboz
 VaEO97G/PhZmwA6Bi0EiF56ARjjkeEqHRzMpYOouXyrf/DljCWhwHn8R8j/FV629WXtT
 wJsyhP8Ik2+tfAEPnaBR9iqMAIWtelnPl69K/vcPJCBOVKetJ3v5rFKqC5gLFocNMtvV
 QtxthTXpA61MCnlcEEY8qRLLwST6oMjhmxDs16jpwD5dgGmqJK0TB+D06Owp9POejs5a
 OIxw3p4jz1ZDArXC63Fnwo5bOo5fWgzLnacndz0UOoU9cVTxEmFX7S7/dCr0PoP1ud4+
 shgg==
X-Gm-Message-State: AOAM532jGx8GIu8TtjvICLXgaaNbWT+blMY2H8/9HG9bP92bs7W71f9d
 5hF7L1IBLmNcErCpM4CnC+qxNkhWu11/na4i2ag=
X-Google-Smtp-Source: ABdhPJxCRp3/lBHTsRsTI8B3GxGfemBTBTejnJhPDIktXg8Ixbg/0SiVI1SYY7t6Ww8hOj1hz0L786KcAp4lmuPCfGw=
X-Received: by 2002:a02:660b:: with SMTP id k11mr20707151jac.120.1613483527097; 
 Tue, 16 Feb 2021 05:52:07 -0800 (PST)
MIME-Version: 1.0
References: <CAOQ4uxiFGjdvX2-zh5o46pn7RZhvbGHH0wpzLPuPOom91FwWeQ@mail.gmail.com>
 <20210215154317.8590-1-lhenriques@suse.de>
 <CAOQ4uxgjcCrzDkj-0ukhvHRgQ-D+A3zU5EAe0A=s1Gw2dnTJSA@mail.gmail.com>
 <73ab4951f48d69f0183548c7a82f7ae37e286d1c.camel@hammerspace.com>
 <CAOQ4uxgPtqG6eTi2AnAV4jTAaNDbeez+Xi2858mz1KLGMFntfg@mail.gmail.com>
 <92d27397479984b95883197d90318ee76995b42e.camel@hammerspace.com>
 <CAOQ4uxjUf15fDjz11pCzT3GkFmw=2ySXR_6XF-Bf-TfUwpj77Q@mail.gmail.com>
 <87r1lgjm7l.fsf@suse.de>
In-Reply-To: <87r1lgjm7l.fsf@suse.de>
Date: Tue, 16 Feb 2021 15:51:56 +0200
Message-ID: <CAOQ4uxgucdN8hi=wkcvnFhBoZ=L5=ZDc7-6SwKVHYaRODdcFkg@mail.gmail.com>
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

> Ugh.  And I guess overlayfs may have a similar problem.

Not exactly.
Generally speaking, overlayfs should call vfs_copy_file_range()
with the flags it got from layer above, so if called from nfsd it
will allow cross fs copy and when called from syscall it won't.

There are some corner cases where overlayfs could benefit from
COPY_FILE_SPLICE (e.g. copy from lower file to upper file), but
let's leave those for now. Just leave overlayfs code as is.

>
> > This is easy to solve with a flag COPY_FILE_SPLICE (or something) that
> > is internal to kernel users.
> >
> > FWIW, you may want to look at the loop in ovl_copy_up_data()
> > for improvements to nfsd_copy_file_range().
> >
> > We can move the check out to copy_file_range syscall:
> >
> >         if (flags != 0)
> >                 return -EINVAL;
> >
> > Leave the fallback from all filesystems and check for the
> > COPY_FILE_SPLICE flag inside generic_copy_file_range().
>
> Ok, the diff bellow is just to make sure I understood your suggestion.
>
> The patch will also need to:
>
>  - change nfs and overlayfs calls to vfs_copy_file_range() so that they
>    use the new flag.
>
>  - check flags in generic_copy_file_checks() to make sure only valid flags
>    are used (COPY_FILE_SPLICE at the moment).
>
> Also, where should this flag be defined?  include/uapi/linux/fs.h?

Grep for REMAP_FILE_
Same header file, same Documentation rst file.

>
> Cheers,
> --
> Luis
>
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 75f764b43418..341d315d2a96 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -1383,6 +1383,13 @@ ssize_t generic_copy_file_range(struct file *file_in, loff_t pos_in,
>                                 struct file *file_out, loff_t pos_out,
>                                 size_t len, unsigned int flags)
>  {
> +       if (!(flags & COPY_FILE_SPLICE)) {
> +               if (!file_out->f_op->copy_file_range)
> +                       return -EOPNOTSUPP;
> +               else if (file_out->f_op->copy_file_range !=
> +                        file_in->f_op->copy_file_range)
> +                       return -EXDEV;
> +       }

That looks strange, because you are duplicating the logic in
do_copy_file_range(). Maybe better:

if (WARN_ON_ONCE(flags & ~COPY_FILE_SPLICE))
        return -EINVAL;
if (flags & COPY_FILE_SPLICE)
       return do_splice_direct(file_in, &pos_in, file_out, &pos_out,
                                 len > MAX_RW_COUNT ? MAX_RW_COUNT : len, 0);
if (!file_out->f_op->copy_file_range)
        return -EOPNOTSUPP;
return -EXDEV;

>  }
> @@ -1474,9 +1481,6 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
>  {
>         ssize_t ret;
>
> -       if (flags != 0)
> -               return -EINVAL;
> -

This needs to move to the beginning of SYSCALL_DEFINE6(copy_file_range,...

Thanks,
Amir.

