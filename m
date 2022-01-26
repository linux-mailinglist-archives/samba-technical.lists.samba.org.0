Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C549D318
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 21:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cyfzh3JnjTBJROKnj/XglMfBOQtn7VbZGjSvNZF5J4c=; b=pszH1iopj60QskxDcPa/0/x/bo
	ge6jQeLdFab20uWXpm/e2AyCBJUGfg/PaiT/QW1xFdQuTHfF5CrpGPOUHHNc4X+1bwZIgHXbMRrvd
	kXVfC/Pxhh8HTEZQE1IaCK+5M/k0P/mlYzawFSMvXDy4l/Kq4ckxUNZTcEkE06dbSShxlALA8Iv/r
	htA2b7A9nTldZYxbb7GvI9GrFtZLN1QC7ULsIgBOrftb+Hjx4nS54rAeQuUSnmWDiLrJhC46VWVQI
	3wUyx0srBRwXXyx3a3QC4zSSGOPP8423C29gPTOJlUIAN8ieUADH2Mw/3FG9BWfmcpynSOmY6bET0
	SNKb6Kyw==;
Received: from ip6-localhost ([::1]:33014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCoXp-001FtI-Co; Wed, 26 Jan 2022 20:05:29 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:40653) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCoXg-001Ft8-Bi
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 20:05:25 +0000
Received: by mail-lj1-x22f.google.com with SMTP id q22so1149460ljh.7
 for <samba-technical@lists.samba.org>; Wed, 26 Jan 2022 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cyfzh3JnjTBJROKnj/XglMfBOQtn7VbZGjSvNZF5J4c=;
 b=QFb4iaxMACx/RhLoHqB8wkUFn0HIIvallRkj+zuHy4FgjdzFJJIeQn9HY4UmpEZPSQ
 u9RMibhCSSpoSLNB1SMoTOwOAIX/SUyU9LwznUHwMfzRh305JJkbo/nyjWIThC26+m9s
 3G3OBagkEfrx7lQFJBZCccqOh1ueEZEa9zNmttGLSHoODtyV0WGsMO1/Ttw2qzRfqONp
 r/1Sf0H3ZjEhnklr65CytnnO/gJtgEu8meqPl5WTn7rH57EkzQoLhe8Okyt77vBDHWio
 fLp5xqYGuUvj1+29Ic18inEOk3WPRy2wSIkiSwptlwk81BSRIlMryneps8HFWls/Azh3
 xZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cyfzh3JnjTBJROKnj/XglMfBOQtn7VbZGjSvNZF5J4c=;
 b=I2TetGWm+Fdxq72NUlWK+l/hdK0BCRjm1hPF5I+lDmfvV5a8klEME/vF3RYvmB/Q8w
 tB4F92Cw690il+7IEzmVq9yHbUAUGBWo5bwd5MCqsT/dl9ihn48GDKrNiKm1C+UhdNpD
 6KD35B9oFQXvFdpd/EBEv3LCAConqRpGMlH3Fa5yQIjtTIKmBAEmNRRStsPnesFSvgzO
 SapxPSA8lSA4i4l+cUY4nfrfz/CYCh4woMBBJ1b8n4a4NIgRx2SPNZwUM71IZrlxfnSS
 TLyAEw66XGpV2HIyUkZsx7soe+FSh5kF9b7zFC/ZSSpCfpypOa7MmIZhA2x2jLa2IeBE
 gI/Q==
X-Gm-Message-State: AOAM531jm01U0UwFYhI/h3j3L5qfaBsKUKS34G0s63AtRayTsXPjRomU
 nef6inA16y2FW6e4xVd+3xPFDaKJ7BiauZ9eOntv1E4Rk0s=
X-Google-Smtp-Source: ABdhPJxtoBEc30lr2ZaJ/FSZIPsDjLN8uTwGR61hwJ9jo3OlfLR7Pz6fy407kXfSCaNKH5Q76pKJ1zBbwuWBnLVH9bM=
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr466162lji.229.1643227518658;
 Wed, 26 Jan 2022 12:05:18 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
 <bab38b9741214fdd5b11040caaa0480b58305aaf.camel@samba.org>
In-Reply-To: <bab38b9741214fdd5b11040caaa0480b58305aaf.camel@samba.org>
Date: Wed, 26 Jan 2022 14:05:07 -0600
Message-ID: <CAH2r5mvg80Tr=jQE8H89LA3aPH-G022EAj13S6pn0b4Z_dP=pA@mail.gmail.com>
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

I cloned jra's tree to fresh tree (master-smb2 branch) and get this
error on build:

Checking for python version >= 2.6.0
           : 3.9.7
python-config
           : /usr/bin/python3-config
Asking python-config for pyembed '--cflags --libs --ldflags' flags
           : yes
Testing pyembed configuration
           : Could not build a python embedded interpreter
Testing pyembed configuration
           : Could not build a python embedded interpreter
The configuration failed
(complete log in /home/smfrench/jra/samba/bin/config.log)
PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf build
The project was not configured: run "waf configure" first!

(Running waf configure directly gets a similar error)

Checking for python version >= 2.6.0
           : 3.9.7
python-config
           : /usr/bin/python3-config
Asking python-config for pyembed '--cflags --libs --ldflags' flags
           : yes
Testing pyembed configuration
           : Could not build a python embedded interpreter
Testing pyembed configuration
           : Could not build a python embedded interpreter
The configuration failed
(complete log in /home/smfrench/jra/samba/bin/config.log)

The command being run was:
./configure --without-pam --without-ldap --without-winbind
--without-ads --without-ad-dc

On Wed, Jan 26, 2022 at 11:57 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Wed, 2022-01-26 at 11:40 -0600, Steve French via samba-technical
> wrote:
> > Not having much luck building Jeremy's master-smb2 branch (
> >
> > https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2)
> >
> > on Ubuntu
> >
> >
> >
> > Anyone recognize this Samba build error and how to fix it?
>
> Try with a very clean tree, if you haven't built Samba for a very long
> time.
>
> We had a Samba python file called time.py that could therefore jump in
> front of the system time, but I never saw it cause build errors.  We
> renamed it a long while back, but an old .pyc file could be the issue.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>


-- 
Thanks,

Steve

