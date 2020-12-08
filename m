Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C922D2C0C
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 14:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1Fr8Tp0M/7Ldeg5uSgmAzXVbBjwhIhu5Bj7N/kDvOVI=; b=VcvnUQG6ZnfUol7SFvGx6raevX
	W5T8gHfCr3ONUs8ioR6Kq7kScjbLWytMa3mNEQteHMK2IPJZF6NfLtzEXeK1wYpuHVSfaiMe79aqJ
	manaBWoo5VgyXga92T6imxxVpLsklRO3RQ3huUp4X4pzPNZjapMEYwjnpHr/9kFT48yaZuuFzqdvj
	ndRHt2QGiMWuKIBhEQTmZXdGBqFlzbEFQkKCaO9mNT2xA1eK59zkcgLWV0xL8K2dWx5NEePoxLBkw
	ffdlVHalt2/6I4MwqsPuphSUiZtB/TGU93yDp9Hom01nuLYxHEJ3BtmO1ZYxqFHmcLL1MmNDzQ7tt
	JCp+RWoA==;
Received: from ip6-localhost ([::1]:33200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmd6A-000CgC-7c; Tue, 08 Dec 2020 13:32:10 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:48883) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmd5x-000Cg4-Ui
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 13:32:07 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cr1Ky1n8Nz9sWL;
 Wed,  9 Dec 2020 00:31:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1607434294; bh=H2vVgCzJbYh8NFtS3/gurE/xq+RCP6SgesAVWpfmi44=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WYpLw72wHz5o2Ytt0v+1Dmg3hrEdDOaYFmOTqPntMvZKwvkSTHF4e/UfumJodZ/oq
 IpNRrbH9STmCyirvFjujmN+5TIs48EghS3VezuhV+Pzdqrlak58SRODzwlaycKqpsd
 zp5HyC5lCHYPC+VyvYKuplErfXOANhI4O92657tVnSDF/6GuKau3aAEIpCQXq1aAEl
 wDjwx/a91U3nzi9Qnyxr30evLzobTMyudyHQpGxutvF0mIDiFByie/87u+RWAI0nDz
 +rgVatLSDJMHAf2/fK9FGLUT0nXFvv4JyeiRCv1HhKolha2IXX0UD7La1SZPBmbuQC
 ckLZfSdhm5qew==
Date: Wed, 9 Dec 2020 00:31:32 +1100
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: Samba testing on CentOS 8
Message-ID: <20201209003132.328ca229@martins.ozlabs.org>
In-Reply-To: <20201208124406.GF5029@pinega.vda.li>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Alexander,

Thanks for your reply!

On Tue, 8 Dec 2020 14:44:06 +0200, Alexander
Bokovoy <ab@samba.org> wrote:

> On ti, 08 joulu 2020, Martin Schwenke via samba-technical wrote:
> > We've been doing our CTDB and Samba testing using autocluster, based on
> > the official CentOS-8.2 vagrant image.  This depends on using
> > bootstrap/generated-dists/centos8/bootstrap.sh from the Samba source
> > tree.
> > 
> > Until recently this has worked just fine:
> > 
> > + yum -v repolist all
> > ...
> > Repo-id            : PowerTools
> > Repo-name          : CentOS-8 - PowerTools
> > Repo-status        : enabled
> > Repo-revision      : 8.2.2004
> > Repo-distro-tags      : [cpe:/o:centos:centos:8]:  , 8, C, O, S, e, n, t
> > Repo-updated       : Sat 31 Oct 2020 04:58:49 AEDT
> > Repo-pkgs          : 2,010
> > Repo-available-pkgs: 1,444
> > Repo-size          : 1.0 G
> > Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
> > Repo-baseurl       : http://mirror.realcompute.io/centos/8.2.2004/PowerTools/x86_64/os/ (9 more)
> > Repo-expire        : 172,800 second(s) (last: Thu 03 Dec 2020 22:30:57 AEDT)
> > Repo-filename      : /etc/yum.repos.d/CentOS-PowerTools.repo
> > ...
> > Repo-id            : Devel
> > Repo-name          : CentOS-8 - Devel WARNING! FOR BUILDROOT USE ONLY!
> > Repo-status        : disabled
> > Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
> > Repo-expire        : 172,800 second(s) (last: unknown)
> > Repo-filename      : /etc/yum.repos.d/CentOS-Devel.repo
> > ...
> > + yum config-manager --set-enabled PowerTools -y
> > + yum config-manager --set-enabled Devel -y
> > + yum update -y
> > ...
> > 
> > However, now:
> > 
> > + yum -v repolist all
> > ...
> > Repo-id            : devel
> > Repo-name          : CentOS Linux 8 - Devel WARNING! FOR BUILDROOT USE ONLY!
> > Repo-status        : disabled
> > Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
> > Repo-expire        : 172,800 second(s) (last: unknown)
> > Repo-filename      : /etc/yum.repos.d/CentOS-Linux-Devel.repo
> > ...
> > Repo-id            : powertools
> > Repo-name          : CentOS Linux 8 - PowerTools
> > Repo-status        : disabled
> > Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
> > Repo-expire        : 172,800 second(s) (last: unknown)
> > Repo-filename      : /etc/yum.repos.d/CentOS-Linux-PowerTools.repo
> > Total packages: 14,251
> > + yum config-manager --set-enabled PowerTools -y
> > Error: No matching repo to modify: PowerTools.
> > 
> > The whole thing falls in a heap because it appears that the Repo-id's
> > are case-sensitive and that "PowerTools" and "Devel" have changed to
> > lowercase in CentOS-8.3.
> > 
> > I'm still using the CentOS-8.2 Vagrant image, so I'm a little confused
> > about why the repos are now referring to 8.3 (not shown above for
> > brevity, but definitely the case).  I'd certainly like to understand
> > this... but I doubt that will solve the problem.  :-(
> 
> I think CentOS does not have separate supported minor releases anymore,
> just the latest one. This, at least visible in your mirror list link --
> it has one digit in the 'release=..' parameter, so you are on a rolling
> release.
> 
> If you want to stick to the previous releases, I don't think mirrorlist
> tool supports that, so you would need to use a specific mirror for the
> URL and replace 8.3.2011 there with the specific release folder.

That makes sense.  However, I don't set up any of these repos myself.
I just use the default repos from the Vagrant image.

One possible part of this is a mirror problem.  In the runs that work I
see the initial "yum update -y" actually update over 200 packages.  In
the failures I see:

+ yum update -y
Last metadata expiration check: 0:02:54 ago on Tue 08 Dec 2020 16:55:53 AEDT.
Dependencies resolved.
Nothing to do.
Complete!

So that's a strange difference... but see below...

> > I'm wondering how we fix bootstrap/config.py to copy with this change.
> > Does it have to be something horrible like the following patch?
> > 
> > diff --git a/bootstrap/config.py b/bootstrap/config.py
> > index 982ebae1cd1..8383aeb392d 100644
> > --- a/bootstrap/config.py
> > +++ b/bootstrap/config.py
> > @@ -235,8 +235,10 @@ yum install -y dnf-plugins-core
> >  yum install -y epel-release
> >  
> >  yum -v repolist all
> > -yum config-manager --set-enabled PowerTools -y
> > -yum config-manager --set-enabled Devel -y
> > +yum config-manager --set-enabled PowerTools -y || \
> > +    yum config-manager --set-enabled powertools -y
> > +yum config-manager --set-enabled Devel -y || \
> > +    yum config-manager --set-enabled devel -y
> >  yum update -y
> >  
> >  yum install -y \
> > 
> > 
> > Or is there a better way?
> 
> If these are the same in all previous versions, then that should be
> enough. If not, may be we can make the repository names a part of
> per-distribution configuration and run 'yum config-manager' for all of
> them?

The above is just for CentOS 8, so should cover all versions of that.
I'm trying the above ugly patch (including a run of
bootstrap/template.py --render to regenerate
bootstrap/generated-dists/centos8/bootstrap.sh) and it seems to get through running bootstrap.sh.  Although many packages are updated, I see:

...
+ yum config-manager --set-enabled PowerTools -y
Error: No matching repo to modify: PowerTools.
+ yum config-manager --set-enabled powertools -y
+ yum config-manager --set-enabled Devel -y
Error: No matching repo to modify: Devel.
+ yum config-manager --set-enabled devel -y
+ yum update -y
...

So the change is being exercised and it doesn't seem to be a mirror
problem... although perhaps some mirrors are hopelessly out-of-date.

If it works then I'll open a bug so the fix can be backported to 4.12
and 4.13.

Thanks...

peace & happiness,
martin

