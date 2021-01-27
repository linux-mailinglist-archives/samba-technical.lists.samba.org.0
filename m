Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 275103067A7
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 00:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rWAxWSWKCDf3ARolITXWp71Ne/Vli8JDIqInwII5HOY=; b=h63wi80b7ztlbTHus+MrjWUaQl
	l9yqQRjqh0myqhqjUrOvjDft6H67Xp1Uix5761ha9mv6612KlR/2aRWLkAq4+U68FamFn3uoqh9ma
	6uy1mUcimXCviYXvCDIb/cZPPZRaGNNpDYN0IDWY/ljZ63lYSoZgIa2k+yj/axmA/jlU6p0xYtV/I
	gmIGQPYfxJYciMsVRYviEx/y6DggBh68PqhVItTJOxL/8IVySvHafntFE+CAku4ZjFsK6E4ZvUAp0
	Avcc2/ZhSr6F6BlymWMCWCaex1e3wQM7hsV6S2WpOXS8I7NS1lkG0/EOnmL3l8JK5psyucs/rZlVB
	6SFWVfuA==;
Received: from ip6-localhost ([::1]:60992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4u51-007Sy4-UY; Wed, 27 Jan 2021 23:18:32 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:42905) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4u4t-007Sxx-3Y
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 23:18:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id c18so4121742ljd.9
 for <samba-technical@lists.samba.org>; Wed, 27 Jan 2021 15:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWAxWSWKCDf3ARolITXWp71Ne/Vli8JDIqInwII5HOY=;
 b=UgOrYD7CXSiIjfOQifNdCdbJsHd2CoS6VOHUNvZ2ZByyqY+qfYp41wsIVZX/D6GKi8
 ItPJZi0Cl1uymjrD01p63QJfnUd45Kk9a5sO8Qc5JKvPLR+ohHNNTcPYZ5wZfWkHRdBE
 jly8kh9bBVVOjNGxj11/CVauRtiqqoNYIF5saxl3VTddPIfmB16kTMRiG/rcTeEtSHYP
 pnHWaQDmoYiw2nXG7maZ+NuHIoSpNQhIm8S1GvGSfBM6SyLg0FmH8NtsNIQvfB0Lhr/V
 +4j81Bv6yoke+1EatUYiUEwbhETfHcCIEraJrzjqK7CczzLVek3OW1CZLoU8msn4pIJF
 QQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWAxWSWKCDf3ARolITXWp71Ne/Vli8JDIqInwII5HOY=;
 b=abUrCLyeq3ZWCGicL60Km5XvH/1NuZkyzfh1aVu9JGHq3DppbxQFKGkIjviEiFKLqf
 YhbWxUq6xSc3t2PmKsmPlda51yH0w0qFjnXtc8yslttlkBYTvfkz0wwEdl6jF8C3n1pv
 pGZm8Flzw+WYhqHE3ZsjAvrXuETItKDMSmkn3MdBbC4VMuLJnlqPcpBu5SmAX7/TpwEg
 4Kh4kmz9OP1xYhbVvBrmhY2Jj/yAUQeIvm7d6iPhXAYpHjhLJXJQH5MISKRhsvrP1ptU
 e8ryv/Ery/AZNDN/G+LMcY9/Lq8lFp6C91NKFZ7rlyXSeW3uPgd9lmlBxX7R8VGvBewn
 xsYA==
X-Gm-Message-State: AOAM533dtQUw10r9XwC1Kl6EvKY6atpGXk+oVUZ/663INxLwY//uns6E
 9w9DJ2NVvZ1QrQEu1fSkb6TqbLRKNY4Zuq6iIwA=
X-Google-Smtp-Source: ABdhPJy6LIYtGsZW3+f3pbnpRMTflDJLSVG/OqHsZnOpUh5R4en0XT0oV28xGBYcQpr1T5oLrYNuz1T3yXftU3z0tAc=
X-Received: by 2002:a2e:9d8e:: with SMTP id c14mr7079964ljj.477.1611789499678; 
 Wed, 27 Jan 2021 15:18:19 -0800 (PST)
MIME-Version: 1.0
References: <CADajX4DzoNehHZGqpd+3Bh0yM2U=B6AwL6bJ2EM6t6hkvr7L4Q@mail.gmail.com>
 <20210127214434.3882-1-adam@adamharvey.name>
In-Reply-To: <20210127214434.3882-1-adam@adamharvey.name>
Date: Wed, 27 Jan 2021 17:18:08 -0600
Message-ID: <CAH2r5ms5FXALbcfvfXo7bR7WXEzCk-jeosoQWk28DdUad++qEA@mail.gmail.com>
Subject: Re: [PATCH] cifs: ignore auto and noauto options if given
To: Adam Harvey <adam@adamharvey.name>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The patch looks harmless, but am curious if other people can repro
this.  I tried it on 5.11-rc4 (cifs-utils version 6.11).  I tried it
with and without the mount helper (mount.cifs).  I couldn't get it to
fail with 'noauto'

Anyone else able to repro the problem?

On Wed, Jan 27, 2021 at 3:44 PM Adam Harvey <adam@adamharvey.name> wrote:
>
> In 24e0a1eff9e2, the noauto and auto options were missed when migrating
> to the new mount API. As a result, users with noauto in their fstab
> mount options are now unable to mount cifs filesystems, as they'll
> receive an "Unknown parameter" error.
>
> This restores the old behaviour of ignoring noauto and auto if they're
> given.
>
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Adam Harvey <adam@adamharvey.name>
> ---
>  fs/cifs/fs_context.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index 076bcadc756a..62818b142e2e 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -175,6 +175,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
>         fsparam_flag_no("exec", Opt_ignore),
>         fsparam_flag_no("dev", Opt_ignore),
>         fsparam_flag_no("mand", Opt_ignore),
> +       fsparam_flag_no("auto", Opt_ignore),
>         fsparam_string("cred", Opt_ignore),
>         fsparam_string("credentials", Opt_ignore),
>         {}
> --
> 2.30.0
>


-- 
Thanks,

Steve

