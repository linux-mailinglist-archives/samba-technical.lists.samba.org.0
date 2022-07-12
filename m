Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D657117F
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jul 2022 06:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zg71DT+CtPAYRZHwxiYX7QhCy5jOMJpa6qh2mWWf8Xc=; b=rF2pRp1hLx5+qHxWC7E2fY/8si
	lkwOjrRZ7Y6gyk0mdAKr9sG7mDu1Zixd3ATswSQNcgRbWloKtcfn9ZL1eEB47eY4QRKkvcO1gCL9u
	Ik3oOCnesp2wjzktFxiVo0868jewKTD10fL324d++66n8fcrGQ1lHj7To6VqNYTbv89nQPUt0/OIR
	CSY6jGmSPppVPtTiEJA28wwnFtcqloK2oPfoLFzLlS7ox4tmdz5SoC82cYcJJ2lTvi/e1zyDy7n8h
	GjnzZ5DKeZWAgHqoBr9je2d5ZgJ8li+fvnl7WJqKdu+ylzzrd1f31Q7xHc0EAw6zRjJo2ZgUOcSxN
	oTF42hsQ==;
Received: from ip6-localhost ([::1]:29778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oB7dO-00H67i-Ax; Tue, 12 Jul 2022 04:36:30 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:33772) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oB7dI-00H67Z-GC
 for samba-technical@lists.samba.org; Tue, 12 Jul 2022 04:36:27 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id l190so6798151vsc.0
 for <samba-technical@lists.samba.org>; Mon, 11 Jul 2022 21:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zg71DT+CtPAYRZHwxiYX7QhCy5jOMJpa6qh2mWWf8Xc=;
 b=auzCWdpdv1QDYXLr4Nlmeue79WVoX3vZYqZIfdYV3szvgIHNNUsmZhzVMO8EjPzkZS
 Df0i0gOCxZBmnlh90GvIa4+bAtFi+3hwOdIziJyaHcykrOp3FclAQe8RdSBXgSjPVrFJ
 9IkQ7zXCTGnX+oLKdfn+ei7szHIDL41iT5o4H8+5dsYC+SAufS8OFsUj2ZaAKdOnLqib
 2XPFLXoUnDcVxGspaLZGqXYRrbzRvQq4lCPTRPQ85uZ7/hFN49/2IA8ZOhk6QqCeX4yC
 Ctnmjf0ZSl0VV0c1UlJdxYTa5XS9Boe/UUvM5oWkRiYpyA91yjitKF/VOBukmVI7hjSu
 dHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zg71DT+CtPAYRZHwxiYX7QhCy5jOMJpa6qh2mWWf8Xc=;
 b=R1TkzW0PdAsNMw2dzRbstTG0f2+rN7MvVBqZWhDOq0nHGuyTIGV7//LI12rE/2+tqm
 OUY08gkzRtSl/cpdNysoC8vreaJ4Nhkm74JAc5NZr1A4g1Smb3pNU/5L9H2qH7bVGhMO
 dG3ckSl75nirpukIwjJbL67wrLyTiBST/MmtQVwYAkbSKBQJYYJ2zCGi0bCcuxeIqEDA
 EvYoGyI4hxFNtj8m6DhIV/xKklWhR0a7utwkOWyE0JAfmqQeL09TTys2TIp63fWDJWvj
 6rGHPlfXDj6flyZ4zhAOzqYsQsmGXQYtbw0EmEbC75FMhKLaRB0ihcwS+iL1KjoKgAxQ
 sAAw==
X-Gm-Message-State: AJIora/pOqmxpfiVsKd/S1w6j643WIGFleZBgNUWcOJ9snE/em4LAwAe
 3OrS439qJ3QGzCsBNUHwJaoWV2k0rthO+Ae2+ls=
X-Google-Smtp-Source: AGRyM1vORKBLp9BaEtBDWZ5ippGl9FKsKKvUQawvX2NV/CexjaFtLVqOXeKWUyxOTD42ug6tLG6DChW+Q4VHAjoiDcg=
X-Received: by 2002:a67:6d86:0:b0:357:3d99:ec77 with SMTP id
 i128-20020a676d86000000b003573d99ec77mr6852993vsc.6.1657600582202; Mon, 11
 Jul 2022 21:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAARpZ=_WCZhEZ2DzR3jRNLNLx28duH2iSn7WwRVezGKpjX0LDA@mail.gmail.com>
 <CAH2r5mtYzhd9EpzJAFLH+AHvKB0CaUtVBTP+UP4PDgg686-SFA@mail.gmail.com>
In-Reply-To: <CAH2r5mtYzhd9EpzJAFLH+AHvKB0CaUtVBTP+UP4PDgg686-SFA@mail.gmail.com>
Date: Mon, 11 Jul 2022 23:36:11 -0500
Message-ID: <CAH2r5mueC4gXgjq7wN9S+y2-=_vqmGKai_4DWWy7CJ1s4m0J0Q@mail.gmail.com>
Subject: Re: mount.cifs broken after update, advice?
To: Brian Caine <brian.d.caine@gmail.com>
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
Cc: "Stefan \(metze\) Metzmacher" <metze@samba.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Shyam Prasad N <nspmangalore@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was able to reproduce it to older Samba server (4.12.5) and could
workaround the Samba server bug by using mount option "compress" on
the client (which won't do anything different since it is not
supported but  interestingly it avoids the problem by adding another
context at the end).

On Sun, Jul 10, 2022 at 11:08 PM Steve French <smfrench@gmail.com> wrote:
>
> This looks like the Samba server bug pointed out in an earlier email
> thread by Metze (fixed by
> https://git.samba.org/?p=samba.git;a=commitdiff;h=147dd9d58a429695a3b6c6e45c8b0eaafc67908a)
>
> I had trouble reproducing it on my systems but it looks like (based on
> Julian Sikorski's testing) when we fixed the netname context to not be
> null in some multichannel cases, the reordering of the contexts
> (putting netname context after the posix negotiate context) triggered
> this bug in some versions of Samba (which was fixed earlier by the
> Samba server commit above).
>
> On Sun, Jul 10, 2022 at 10:35 PM Brian Caine <brian.d.caine@gmail.com> wrote:
> >
> > Hey all,
> >
> > So I recently updated my kernel and my previously-working CIFS
> > mountpoints are broken. The server hasn't changed.
> >
> > I can successfully access it via smbclient. Only mount.cifs is broken.
> >
> > On the server:
> >
> > % /usr/local/sbin/smbd --version
> > Version 4.12.15
> >
> > On the client:
> >
> > $ mount.cifs --version
> > mount.cifs version: 6.15
> >
> > $ smbclient --version
> > Version 4.16.2
> >
> > $ uname -r
> > 5.18.9-arch1-1
> >
> > (I know it's not a vanilla kernel, so I wanted to ask for advice here
> > before making a bug report.)
> >
> > As mentioned, smbclient still works:
> >
> > $ smbclient -U brian //192.168.1.131/backup -c ls
> > Password for [WORKGROUP\brian]:
> >   .                                   D        0  Sat Apr 24 16:01:23 2021
> >   ..                                  D        0  Tue Dec  1 20:18:28 2020
> >   brian                               D        0  Sat Apr 24 16:09:46 2021
> >
> > 15119769681 blocks of size 1024. 12418540722 blocks available
> >
> > This doesn't though:
> >
> > # mount.cifs --verbose --verbose -o username=brian
> > //192.168.1.131/backup /tmp/foo
> > Password for brian@//192.168.1.131/backup:
> > mount error(22): Invalid argument
> > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and
> > kernel log messages (dmesg)
> >
> > I attached my kernel output. Is there anything there that jumps out at
> > anyone? Any easy fixes or should I look into opening a bug report?
> > Anything else I can provide, just ask.
> >
> > Thanks,
> > Brian
>
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

