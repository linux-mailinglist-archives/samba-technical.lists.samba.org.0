Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9533067C9
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 00:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=S8lsbIj/lUXv/MGJZmQD2R/A8KLMNWjXXFTNHbGX/ug=; b=EGKVEDNmreI616WAGZ7VrtK/3t
	ivrYnxezroLQca0ycZkxvY5M2Of8Arcw6KEV6pTzNz8uDYSVpvjL7jOIfbb18mLX0UaO2PG/hVi+p
	x5vG+CHXPCAMk5MhS5kbzOQwcHRInAhT043GWEbV0vBCOZ6hIDAdKUp7QX4c54OR5l1/1ARB/pdjz
	PFxe6BJjQ7EmGeVsbI66Y+c8T6cL6hTe0tPLjZbzCymowBx/RmsD5dcDtfpcjVvW+A3SUShdYsIvU
	RvJghrmdHCh4uaUDfHzJIbHuv6CsW0UvM705dlk1JPyuGIcp0Wf6c3CR5f1wJFnJa27Rkx2WrjxzO
	WYdk+jHg==;
Received: from ip6-localhost ([::1]:61704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4uBw-007T4y-Rk; Wed, 27 Jan 2021 23:25:40 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:35440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4uBr-007T4r-JV
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 23:25:38 +0000
Received: by mail-il1-x12a.google.com with SMTP id g7so2452459iln.2
 for <samba-technical@lists.samba.org>; Wed, 27 Jan 2021 15:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8lsbIj/lUXv/MGJZmQD2R/A8KLMNWjXXFTNHbGX/ug=;
 b=iGgURttVEm/FMvfBLLB3brxRSlewQVkWoiQSRTeblqIjhZw0zyYJhlgzYfypS3KGRc
 gwc0xb5rh7SSY4EuNls8dgJ5ADT93E/ozVPAbmIZphD2/rqi1iRq1aYQlOqF3FFLIS1L
 hnMXz0b0Orl64twzKcJhglTq0ZH8CNn1S1fKw5RyMzHODowxrxlj4o+eCw8qQctt3/qJ
 ut0lGSNQK7UEy3yEJxdCbYpIzaAJbr2K6LhmR3OeyyQW5dxIfoH+je9pPuR7P8uWuVoJ
 5i5vpAyxCWnNVE+fapYJG3fH9K6JGlQxWdKwV42791M2QqzG5wSdJ+Z+Vl57rx7yMjoW
 z2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8lsbIj/lUXv/MGJZmQD2R/A8KLMNWjXXFTNHbGX/ug=;
 b=FDcNGZRsFwMxJf3wV+s9cjDCAPY+2w3ZfGDBIMf6aMQDiMg/7EEHY9IG2kjUdRdBtC
 /Zl9eC6qofg8n5f1iqT4IaOolh9yc0285Angp8PLH1nCnOqR21ysp2F3SSE8L7sCj/3i
 l3j86fS/+olJw5aCc0o9f8+rQDqDBJILB83Hr+Q0aKXkRFGYuYokhDX9wWBlWqXbvLpI
 H//8C5p0E6A/Sdml3GMlT5se1ze0QwJVMV0F817ymldmFv5BCvfpTN1wFWPWSEbzMenO
 Is/Vw8lloVgS++z/rE5/+03z9EXSSwRJj9D7bFocW8/0EqsQb5FKlTNn6Xjl5PpXeKDW
 S44Q==
X-Gm-Message-State: AOAM5332RUdDq1OM5/M+OdgzC2GkdHo79kyTkmzAe28l5kPiUIeO+lwE
 Fz+bUxIfERH0GTJJ5ZBccUYR5/B4mbB8NBRBqew=
X-Google-Smtp-Source: ABdhPJw6lO7Xt2EzwY3JicNkjFLcTG9gnM5ryiGfbBiwp/zub2iHP/eYkOSpx4h7e20k/x3eK3HutkufmmQQeaIMVJc=
X-Received: by 2002:a05:6e02:ca9:: with SMTP id
 9mr10835503ilg.159.1611789932800; 
 Wed, 27 Jan 2021 15:25:32 -0800 (PST)
MIME-Version: 1.0
References: <CADajX4DzoNehHZGqpd+3Bh0yM2U=B6AwL6bJ2EM6t6hkvr7L4Q@mail.gmail.com>
 <20210127214434.3882-1-adam@adamharvey.name>
 <CAH2r5ms5FXALbcfvfXo7bR7WXEzCk-jeosoQWk28DdUad++qEA@mail.gmail.com>
In-Reply-To: <CAH2r5ms5FXALbcfvfXo7bR7WXEzCk-jeosoQWk28DdUad++qEA@mail.gmail.com>
Date: Thu, 28 Jan 2021 09:25:21 +1000
Message-ID: <CAN05THRXHYkXCe79n3caKjRt+ojZ+-LONvfDH=2aQ7RVDRVnZQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: ignore auto and noauto options if given
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Adam Harvey <adam@adamharvey.name>, Steve French <sfrench@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jan 28, 2021 at 9:19 AM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The patch looks harmless, but am curious if other people can repro
> this.  I tried it on 5.11-rc4 (cifs-utils version 6.11).  I tried it
> with and without the mount helper (mount.cifs).  I couldn't get it to
> fail with 'noauto'
>
> Anyone else able to repro the problem?
>
> On Wed, Jan 27, 2021 at 3:44 PM Adam Harvey <adam@adamharvey.name> wrote:
> >
> > In 24e0a1eff9e2, the noauto and auto options were missed when migrating
> > to the new mount API. As a result, users with noauto in their fstab
> > mount options are now unable to mount cifs filesystems, as they'll
> > receive an "Unknown parameter" error.
> >
> > This restores the old behaviour of ignoring noauto and auto if they're
> > given.
> >
> > Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> > Signed-off-by: Adam Harvey <adam@adamharvey.name>
> > ---
> >  fs/cifs/fs_context.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> > index 076bcadc756a..62818b142e2e 100644
> > --- a/fs/cifs/fs_context.c
> > +++ b/fs/cifs/fs_context.c
> > @@ -175,6 +175,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
> >         fsparam_flag_no("exec", Opt_ignore),
> >         fsparam_flag_no("dev", Opt_ignore),
> >         fsparam_flag_no("mand", Opt_ignore),
> > +       fsparam_flag_no("auto", Opt_ignore),
> >         fsparam_string("cred", Opt_ignore),
> >         fsparam_string("credentials", Opt_ignore),
> >         {}

We probably also want to add
fsparam_string("prefixpath", Opt_ignore),

> > --
> > 2.30.0
> >
>
>
> --
> Thanks,
>
> Steve
>

