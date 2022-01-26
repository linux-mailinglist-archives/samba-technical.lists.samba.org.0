Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48949D31A
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 21:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G2pyPL6C7lSxZw/zcBMKa2uMrlhKLJ5EGtyg1plaoYw=; b=5WwTsDsqBhfowmXNtL68rRu15W
	kQP7ZSknsWltNxhIY+Z7z0rvsSfelJmnntHAsHV3X32IqwOfFR4lPD3Ql7i0K9O5C9fs0tb8qG2VV
	tLer9vB+Ix5nYMKTdzDZvUqoRxROHqx0gWhw0BbuMbZDUSN8LcuTrmnbvuwggB0pGhdl8p5NGxBab
	baA+e68QMY9aO6xX4QtFjj3ICJj/Q72raCmEw5qgKamHjlh4CTBf1HzzFrXaK1kO+L1TK5gpvTpN0
	OvjBdjrgGWwoCpGc5UADLEwQx8bHGeVuJV6XN0z0Qil9Ljju4+o3r1aTQhMb8+CZBuLIa5R8OX3IX
	ZDqJ2ElQ==;
Received: from ip6-localhost ([::1]:33688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCoZ7-001GBM-KZ; Wed, 26 Jan 2022 20:06:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:39791) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCoYz-001GBD-5V
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 20:06:46 +0000
Received: by mail-lj1-x22b.google.com with SMTP id z20so1159821ljo.6
 for <samba-technical@lists.samba.org>; Wed, 26 Jan 2022 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2pyPL6C7lSxZw/zcBMKa2uMrlhKLJ5EGtyg1plaoYw=;
 b=DL8dBEABBLV+43c7SSawNlaH0GxKMt6s7yc6/rI3ZVC6O3ubYTzCLnYk0OlQBhcNxu
 fmHugPXa/q/pe/L+hPJI7jqofCAtR4Xe+6LdHUTHq4zH7hUFTNyicd86I4VKLH106/Y0
 eQJvU11fez8F+qru6TIJNp6q4kmvIzbiH2ByVVeXYONFXLNXV87cpn1fzKj7wsZamZRP
 B7zRTEKqod181zxbSVPh31McZ4r7KbQMBOnvz/yvWa0EGGWwAnbWcUDvwX6A9EHy9Xs4
 SzN/m60ALScGaOjtB4ZKfd3RSXPUgoUAeP/y0fIdDaoHJMyA8KcVmoEofHa4kEJzkP/D
 kl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2pyPL6C7lSxZw/zcBMKa2uMrlhKLJ5EGtyg1plaoYw=;
 b=zR/ZexwID2hG1fK6oHALCLH2RqVOlOi0ocTNFVc2kj+oV8nfbc5iaSqknsOtAnQh2v
 /y6+WPmDxQRtJBFgCboyM/aRUyqTU+maw36KzePqus2CArUlOAjyON1UsjRrtP703kpz
 tX8UvwSwtjwZ1KaQ+zV1rolCXt7liCNWHODGjEoNAdwnzL0+gdUWI85lNlzqatT3Z+6c
 brmq5bo7GIGoQtR/h8Piq9K7ABvYHTnmKOOkCm6/Wt7KlK95GsPqAD0nco04w+D6modS
 wxyEfKsEc7XQhFF7EtqIpz3E2ShIwvXgO5jp3+/2cun1Ft5j4LLnezv1vjLtFWynIRzm
 3pFA==
X-Gm-Message-State: AOAM532gleVz7hpJmB2IhkPCjS+41tV66/JkJNBREIiEzSGenf3WSDr0
 ZxJNxIEeiQBYjvc4y/4rxvJO1IHLHCj3OjjjDg71vN6Y
X-Google-Smtp-Source: ABdhPJz5bWWqqHAb40AkdSdypCLQbqgX7LF03TsJtfIWvMRoqrbRTrrjiqJeDGOCDKsoa8TFl1SbdP7qWuyJSc9jwrg=
X-Received: by 2002:a05:651c:1315:: with SMTP id
 u21mr500383lja.398.1643227599856; 
 Wed, 26 Jan 2022 12:06:39 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
 <bab38b9741214fdd5b11040caaa0480b58305aaf.camel@samba.org>
 <CAH2r5mvg80Tr=jQE8H89LA3aPH-G022EAj13S6pn0b4Z_dP=pA@mail.gmail.com>
In-Reply-To: <CAH2r5mvg80Tr=jQE8H89LA3aPH-G022EAj13S6pn0b4Z_dP=pA@mail.gmail.com>
Date: Wed, 26 Jan 2022 14:06:28 -0600
Message-ID: <CAH2r5mvF6W1V2803C7fRX4OdwkbWNkfsjrV3YNr5nt3XaGbWzg@mail.gmail.com>
Subject: Re: Samba build error: module 'time' has no attribute 'clock'
To: Andrew Bartlett <abartlet@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

And same error with default "./configure"

On Wed, Jan 26, 2022 at 2:05 PM Steve French <smfrench@gmail.com> wrote:
>
> I cloned jra's tree to fresh tree (master-smb2 branch) and get this
> error on build:
>
> Checking for python version >= 2.6.0
>            : 3.9.7
> python-config
>            : /usr/bin/python3-config
> Asking python-config for pyembed '--cflags --libs --ldflags' flags
>            : yes
> Testing pyembed configuration
>            : Could not build a python embedded interpreter
> Testing pyembed configuration
>            : Could not build a python embedded interpreter
> The configuration failed
> (complete log in /home/smfrench/jra/samba/bin/config.log)
> PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf build
> The project was not configured: run "waf configure" first!
>
> (Running waf configure directly gets a similar error)
>
> Checking for python version >= 2.6.0
>            : 3.9.7
> python-config
>            : /usr/bin/python3-config
> Asking python-config for pyembed '--cflags --libs --ldflags' flags
>            : yes
> Testing pyembed configuration
>            : Could not build a python embedded interpreter
> Testing pyembed configuration
>            : Could not build a python embedded interpreter
> The configuration failed
> (complete log in /home/smfrench/jra/samba/bin/config.log)
>
> The command being run was:
> ./configure --without-pam --without-ldap --without-winbind
> --without-ads --without-ad-dc
>
> On Wed, Jan 26, 2022 at 11:57 AM Andrew Bartlett <abartlet@samba.org> wrote:
> >
> > On Wed, 2022-01-26 at 11:40 -0600, Steve French via samba-technical
> > wrote:
> > > Not having much luck building Jeremy's master-smb2 branch (
> > >
> > > https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2)
> > >
> > > on Ubuntu
> > >
> > >
> > >
> > > Anyone recognize this Samba build error and how to fix it?
> >
> > Try with a very clean tree, if you haven't built Samba for a very long
> > time.
> >
> > We had a Samba python file called time.py that could therefore jump in
> > front of the system time, but I never saw it cause build errors.  We
> > renamed it a long while back, but an old .pyc file could be the issue.
> >
> > Andrew Bartlett
> >
> > --
> > Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> > Samba Team Member (since 2001) https://samba.org
> > Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
> >
> > Samba Development and Support, Catalyst IT - Expert Open Source
> > Solutions
> >
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

