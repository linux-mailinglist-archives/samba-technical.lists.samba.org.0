Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F317BC1D
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 12:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PTTaKn6y1lh+x6C22IF/Pvk3KBoTvbykCUKsNsHE6w0=; b=1Y1C4CP7M7Ixjycux/n1v3vXF1
	7ZYufa87qwqiEyzS7k+GENGGLnUSWhTJcYhVuwYOSnlETvUNUU4P3vVjO18vRNQB6gYgR4XgpQJx+
	ly0UYTsigV5R2LsZyXYJqmJ/r2desJbrdOc3zqqTjd58naProivxXGT+j6G81cWmWn5wzWmWOucE1
	KIBVEbYwaKog7kESgDnbBv4nF8ac1ikm+pDumIlXYqFJ8EQf3WqwGqbWKaLDewSu7AZ581ZqRl1RH
	8mqf6ZCK1ndAl/N7QEQ9PHUJF7LyJ6aTxSLuYl9adkWgrHQFaICF6/ELQKkX2xit+C8h9KNItrgwY
	QfOTnNhQ==;
Received: from localhost ([::1]:22450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jABTM-00FHob-6J; Fri, 06 Mar 2020 11:48:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:43247) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jABTG-00FHoU-AL
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 11:48:52 +0000
Received: by mail-lj1-x229.google.com with SMTP id r7so1881378ljp.10
 for <samba-technical@lists.samba.org>; Fri, 06 Mar 2020 03:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTTaKn6y1lh+x6C22IF/Pvk3KBoTvbykCUKsNsHE6w0=;
 b=L66uBPwLzviml2W68wvHEnqheygd+Rbef/x2EoyGrsHiCKzqAm2hX1RpvjdbOyIi0H
 evINaG3ZIzBdNvthMq2H7XmlDBfLObXE9iVG5LrqZeWPnWervXQXI1wMkYHzMEUoxBCt
 vR+7oP+0BfaBRXMDhRQ2IBM10NJCGaKwmK3jlKOf7QZCZLgBLsmN1r4xdZTAhIL5zFtD
 y4J2nErrV00XBt3CxtuEDKdTuYYZxUWR60DUbZdn+LqcjzF+HkV/Jg9UpRnGGkz9S657
 MFgXWaruww+9orpOjDYPD70Og7gvfMOmNWoPlX9ePlQth8g2U6OwGHlHtnZTr2MOCPTQ
 ySBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTTaKn6y1lh+x6C22IF/Pvk3KBoTvbykCUKsNsHE6w0=;
 b=qRW8XdWtEIkOTUiyOw4lNq9r+sC9Ylq3EtQIHbAna7wLvkd05NrwOnwCdSQ0zkbuxU
 F+3+q0LoWXAbm3IA7OEGrkZAIYCJuFt6s1cpA4qO4tZubmJ3wYvFXmWBWVqn0UhkR/MB
 sYLATOG6pLl4VOr/PNt3igZblG53XFBH9tuUGb/04vMQYehL1BK6xrKesoHACHtuYszj
 P8d8Tsf9Dwp54ALACq9AtKtW4GFMVI6L69Af4iZH646eOkDaz1Imr6RkokiktkSN747n
 6R4DlFtvcDr5VFG38tqZfWJRbXxNc4ufqzSK8WVMYQ+dd8cEsM5mwKRvH97d6VEBGBPx
 GT2g==
X-Gm-Message-State: ANhLgQ2BkIGHuIYmQIg8JxkLV3r9NlFtgD0V5KHR1YIM/Kwv1vpZOF3N
 oHlXjiMVDbiLupJTctnfi5sEo8vzvClBX5jHipNWWt6h
X-Google-Smtp-Source: ADFU+vvvNfz+YIQunRE4pSZm032D9Ppx1/dFjZBzYbZMhxEL9Qz+IkR2qxZobUtkyrZXmTzw+Y+2Oa5fhWoQLD24lvk=
X-Received: by 2002:a2e:7806:: with SMTP id t6mr1881934ljc.145.1583495328837; 
 Fri, 06 Mar 2020 03:48:48 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
 <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
 <5b8bae24-553b-25cf-b942-6d6b2404d8c0@samba.org>
In-Reply-To: <5b8bae24-553b-25cf-b942-6d6b2404d8c0@samba.org>
Date: Fri, 6 Mar 2020 12:48:37 +0100
Message-ID: <CAC-fF8R8hsBuCeGQX99ZVY=C7vuEuCf2L+KNbdGARJorSEzoAA@mail.gmail.com>
Subject: Re: Using vfs_fruit alongside vfs_recycle
To: Ralph Boehme <slow@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

On Fri, Mar 6, 2020 at 12:25 PM Ralph Boehme <slow@samba.org> wrote:
>
> Am 3/6/20 um 12:16 PM schrieb Ralph Boehme via samba-technical:
> > Am 3/6/20 um 12:02 PM schrieb Isaac Boukris via samba-technical:
> >> Hi,
> >>
> >> The manpage of vfs_fruit states that "This module is not stackable
> >> other than described in this manpage.", is this still correct?
> >
> > well, everything is is simply not tested systematically. Many
> > combinations may work, with some you may run into issues...
> >
> >> I'm looking into a bug report which I can reproduce on master, where
> >> usage of vfs_fruit alongside vfs_recycle causes an error log at level
> >> 0 upon deleting a file, failing to find "._filename". So I wonder if
> >> this configuration is unsupported or is there a logical bug here.
> >
> > Iirc I've never worked with systems where vfs_recycle was configured
> > with fruit, so I haven't seen this before.
> >
> >> [2020/03/06 12:28:48.627691,  0]
> >> ../../source3/modules/vfs_recycle.c:239(recycle_get_file_size)
> >>   recycle: stat for ./._test.txt returned No such file or directory
> >
> > Hm, maybe just a too high log level in vfs_recycle?
>
> Yeah, looking at the codepath in vfs_recycle that leads up to this
> message it is going via unlink -> recycle_get_file_size. vfs_recycle is
> assuming that any path passed to unlink must exist, otherwise it logs
> the error.

You can see debug level 10, in the redhat bug i linked above (comment
13). Couldn't follow where the "._" prefix comes from.

> Attached patch should fix it. Can you file a bugreport?

https://bugzilla.samba.org/show_bug.cgi?id=14316

Thanks!

