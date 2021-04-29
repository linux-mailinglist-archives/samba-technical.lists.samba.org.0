Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C69336EDBC
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 17:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gaKzzHEFPRpRm/B0kggqgHfVzaE+l4e2s9D2h0WyI8M=; b=JofR52yuSN8nqRFYyl5bUfGMr7
	HhqQ+noG0PVS0/KO/mMYkPdm+hop1610ZkihjvqK7xboc+pXMVCJYkFZVMHaXriPyL5g5TnT0C2XX
	yVhzEcJ2wkoIwB9ouXOqLDEOkgRrcyGyCwY49MgTs20bQtlA1H1jwzW61aufGqBRohkH2g6iTyYpU
	URS2K6QMYL21PKRGv9MSfEjFN9hPgf6CcOkXKU2fYNV8wrLVxPpcPcWPHFauQ5RDrjNt3m0ZEg53k
	mal/xAztjLS6ppMMIUXjSCD3C/+e7SqlMisX8/863knFeJA58c6wfZYkez+4jolSHUBF9BRA0yyNe
	cuVfGGSg==;
Received: from ip6-localhost ([::1]:63842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc92o-00DD5N-4G; Thu, 29 Apr 2021 15:57:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc92i-00DD5G-Sf
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 15:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gaKzzHEFPRpRm/B0kggqgHfVzaE+l4e2s9D2h0WyI8M=; b=X3jHn2F8WEJhQweTdHvtMuyv62
 4HNni/So4L2mD/ccCxg0LBVYjbG25IuioMgbK6H0nchAZV/6wLGFcc3dXmCln8/gTfK69i80cpnhi
 zpbONkifssBVo1G81X6lSJ39j2zuT1Vl7XHtzudTciHz+vej1qf8BIuH18qy0ej/J6Cefp3xMtQ8E
 GCRkOBbo3XM6CAgSWd4z9FwJkDwHg1DfeVTIu9d4ydI5SkzgN4vDkDoJAAdEYvUgNrb5A5mJhWNlg
 c81bqLibSB/mZxGByoXFEjUuxfQBV0ZBClkl6Luo8EYIvRRYzn+Czcf9a6VL6RiKxiHAaqrijrJo0
 crieIxVJBdM67lYz1kTY0hVTDvcs1ouvr0+XnyKrOnGgUcYDiz0gKly9wEn93fsOtJIFodQu9aYT3
 MQf9miFSIQJ9dveGhgtP5tSXhF6OFXEcfh5JzW/IYA8FfTzbQfzlZqkuGc+Nu354lx0qhpX1XLPhb
 GjE9sUBGryp4Ib+65mCI7Tsm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc92h-0006aL-UI; Thu, 29 Apr 2021 15:57:32 +0000
Date: Thu, 29 Apr 2021 18:57:28 +0300
To: David Mulder <dmulder@suse.com>
Subject: Re: Ubuntu's ADSys
Message-ID: <YIrXaNVMOKnOCt+3@pinega.vda.li>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <RCZBSQ.RP64LWX1DB4B@suse.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 29 huhti 2021, David Mulder via samba-technical wrote:
> 
> 
> > I was curious why something that had just been released with a big fan
> > fair, didn't work, so I decided to find out why and, seemingly, I have.
> > The problem, from a Samba point of view, is that it depends on sssd, so
> > precludes the use of Samba. If 'adsys' can be forked to use Samba, then
> > that might be an idea.
> > 
> 
> Samba already does group policy via samba-gpupdate, and it happens to work
> with both winbind and sssd. ADsys says they provide "password policies and
> user access control, and Desktop environment settings, such as login screen,
> background and favourite apps". We already provide password policies, and
> user access control is in master. Adding desktop environment will be trivial
> (and much of this is already in the works). We're providing policies for
> smb.conf, ssh settings, sudoers, scripts, and more. Seems to me we already
> have more to offer than this ADsys thing does.

Note that we also have FleetCommander tool[1][2] that allows to define
desktop definitions for Linux clients enrolled into AD and FreeIPA.
FleetCommander exists for quite some time, we presented it at FOSDEM and
other conferences since 2018 or even before that.

ALT Linux folks also have a comprehensive group policies parsing and
applying tool[3] that relies on Samba Python bindings. The tool also
exists for several years and will be present at upcoming SambaXP.

[1] https://fleet-commander.org/
[2] https://wiki.gnome.org/Projects/FleetCommander
[3] https://github.com/altlinux/gpupdate/
> 

-- 
/ Alexander Bokovoy

