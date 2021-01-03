Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352C2E897B
	for <lists+samba-technical@lfdr.de>; Sun,  3 Jan 2021 01:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YCRYRrSFJ8U5gMuf3xqA6363ZBdzYrM6npGRKphRBoY=; b=OOqhLaTNDnA8VLhnPlYF3k4xj0
	Fuq68ADLGZ0fiHiJi2zlmIFtV0/iZg5ypIfxmjQ44FeLeKQAOOr7YAXvqQXt6t9DJRn6W4xPOTyiE
	gE3weDnprqms5f7EpPcb/uyrm+tkg6IiruaXup+Y5wWXBq0I+Vdeyb0KXlRdUb9Jibe0HzRMa+Z0P
	lZIqMrvprEEGiHggV4nyDa2hmFz021Cld0LQGpO4Sq8vRF7UMqTLeBC1TrZVWoPRHA7Xe3cwp03d6
	QpVjGVIKCvN/jCZ3YxSEJgsqgdTOIhC3oa+N1uAF8OYHJfT2nf+eo+q+DuRnbBiNQXTKJCGes3WVC
	glCwWyRA==;
Received: from ip6-localhost ([::1]:25658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvr8B-004b3A-WC; Sun, 03 Jan 2021 00:20:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:35459) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvr7z-004b33-Sq
 for samba-technical@lists.samba.org; Sun, 03 Jan 2021 00:20:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id h22so56380234lfu.2
 for <samba-technical@lists.samba.org>; Sat, 02 Jan 2021 16:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCRYRrSFJ8U5gMuf3xqA6363ZBdzYrM6npGRKphRBoY=;
 b=hOhZTDKxz1aX2WvhVi3HQlRw0glv57E7L0yW5vCvhAxQ0URsfE9cM9plld/9hMtOgf
 wwuV8ptdgf84FdmS2Ag5NVC7Efl8m09b7j9FFy3tqroVV7oprlB2b44C1QFahFTVv9H7
 i+w9zmatKwMPZBjTfTBeP8HQV7VENQjOHU5HVms0bLJCGFHwzlabX38BVM1j3sZnqDqZ
 M9tE2tsP6tygBMVmJAE/I1j5DVUmyVMpAQ3erkq6E87TnkceYlWM9Ib6LDrk+ERj+uI8
 CQYUnT2VT+jaUoNL2EkjLNs2LR2TMyfi2H1ExG8mCfgiKO+pYB1NRGRp/iGkuJTi9Azk
 kkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCRYRrSFJ8U5gMuf3xqA6363ZBdzYrM6npGRKphRBoY=;
 b=YSOfbwSOBstg0ZIEocKaYd4R0u4qyGCdMHT3hbayWBEXgc9+0WrhiQiOO90gxKPG+y
 1VdaH+rO2SUBCTXiyWDFNdWC3DN7E4eNng1yeD0PQ0stMTlfsFGrjwsznU/CU8cnM/TO
 86mzzL0mQ+v1owc5GRtp+bXjBUbMZunj+4yDWbyYzjdvNmj2O8K+l77zzyovLgnAAYTt
 ka2BU0WfupfkHHiJyuIeLkGdzoGCoAuvA+ieKE1TOem13IUnQKd/oUwkQCTUkUnz6MyK
 Qm8TDOqAK39eo/CcbZKOzRqhI8x1j0ht/JKxdMuvMu7KtpueBPwQ43D8cphBPCRT3NeK
 a2SQ==
X-Gm-Message-State: AOAM531+xm+2iC8teoLTJxFZEuC1Uif5nfcwNgCXO8y9M39+40SEay+x
 1+uSU5+8t1pK/GCDA+vFmxTtsEhpah4wDNnT+GY=
X-Google-Smtp-Source: ABdhPJzf9A8cqKe1GghbWqMlXWUmc98U3WM9a7OFA2xxDGYT3cUMoWmdYZRpxpngyHaJ+khfVV6BTseuYZNh8t+af1U=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr30681415lfr.175.1609633190966; 
 Sat, 02 Jan 2021 16:19:50 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
 <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
 <20210102052524.GA67422@jeremy-acer>
In-Reply-To: <20210102052524.GA67422@jeremy-acer>
Date: Sat, 2 Jan 2021 18:19:39 -0600
Message-ID: <CAH2r5msZt0UZG5r5Z7=_jQf=-xgNz8zW7fZOnqncqeJHB=mOmA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
To: Jeremy Allison <jra@samba.org>
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
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I agree with the idea of being safe (in the smbclient in this case),
and not returning potentially dangerous file names (even if a very
remote danger to the tool, smbclient in this case), but I am not
convinced that the "user friendly" behavior is to reject the names
with the rather confusing message - especially as it would mean that
inserting a single file with an odd name into a server could make the
whole share unusable for smbclient (e.g. in a backup scenario).  I
agree with rejecting (or perhaps better skipping) it, but ... not sure
any user would understand what SMBecho has to do with a server file
name.

"NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
connection is disconnected now"

On Fri, Jan 1, 2021 at 11:25 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Fri, Jan 01, 2021 at 09:49:06PM -0600, Steve French wrote:
> >I exported the /scratch directory with smb.conf configured as
> >
> >[scratch]
> >   comment = scratch share for testing
> >   browseable = yes
> >   path = /scratch
> >   guest ok = yes
> >   read only = no
> >   ea support = yes
> >   create mask = 0777
> >   directory mask = 0777
> >   vfs objects = acl_xattr
> >   map acl inherit = yes
> >   strict allocate = yes
> >   map acl inherit = yes
> >   mangled names = no
> >
> >Connecting with smbclient and doing a simple ls causes the disconnect:
> >$ smbclient --version
> >Version 4.12.5-Ubuntu
> >$ smbclient //localhost/scratch -U testuser
> >Enter SAMBA\testuser's password:
> >Try "help" to get a list of possible commands.
> >smb: \> ls
> >  .                                   D        0  Fri Jan  1 21:19:52 2021
> >  ..                                  D        0  Thu Dec 31 21:42:28 2020
> >  rsvd-chars                          D        0  Fri Jan  1 09:14:04 2021
> >  file-?-question                     N        0  Fri Jan  1 21:19:42 2021
> >is_bad_finfo_name: bad finfo->name
> >NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
> >smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
> >connection is disconnected now
>
> Well of course it disconnects. You set
>
> "mangled names = no"
>
> So the server returns the bad name. The smbclient
> library notices the server is trying to screw with
> it by sending invalid Windows names and disconnects
> to protect itself.
>
> This is by design. There is a *REASON* mangled names = yes
> is the default. Otherwise you can't see valid server
> filenames that contain : \ etc. etc. from a Windows client.
>
> Even a file names AUX: has to be mangled. "mangled names = no"
> is only useful for a pre-cleaned exported file system which
> you can guarantee contains only Windows-compatible names.
>
> This is not a bug, it's working as designed to protect
> the client code.
>
> There was a CVE where libsmbclient might pass up
> names containing a '/' to the calling code (not
> that they can exist on disk, but a malicious server
> could send them) which might then treat it as a
> path separator.



-- 
Thanks,

Steve

