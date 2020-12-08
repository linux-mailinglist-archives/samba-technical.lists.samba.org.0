Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0AC2D2B51
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 13:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=saEd7XgoFTvjAiwErp/DyDRJlk5wWtTlu6mYUu2Gn/o=; b=kPpP2mdRyEp0pDBy223KrQFRro
	/IrUaOnzr0xOl4SDG5+AdlEfkuyk3lD4QaRbz9GpjEoRBkFwJ0lkZwgBaCILevesVkvo8g8e8HZta
	jx9rhbykJAowbEdmPa7O98Ys5cjmcu/A+fDVjBe02gxM8tyVbxusF7YOaY0c2j/L15uVYhF27hREO
	C+WhbGKl1f3qmYsQu0lrGjnRXEC1cXks5uFyqLlV0mUGV+f4oJaLEzdExQl6saV7nZLRdPZdG9wPE
	2+WyShDPhQsIBJeZMM89F8tK1JEZJMCu8VVvTmdXAYQctYPYjIY0S608wki5/QduWAZ7Ayw49p0A6
	hfFTJsFw==;
Received: from ip6-localhost ([::1]:32480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmcM8-000CWF-5d; Tue, 08 Dec 2020 12:44:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62348) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmcLx-000CW6-Cm
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 12:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=saEd7XgoFTvjAiwErp/DyDRJlk5wWtTlu6mYUu2Gn/o=; b=U8BmH/+sU7iufh2+cF4vXJSlgr
 gJT07guNWRsRiqa9yeU3DqUsk/T6QqWR53SzH+QECdUdT0obV8+afjz6gqIZVEmyhAy0DZFBppjFZ
 oTDvu4rx/Si2fh5Ea4/KpICHmHu/MjCUW/6vgpYGk4QLs23MF7Itc9qO77K3MQJJD+xjaHgJxB4AW
 sHpheXoSJbeva1axkz5BPp5wt54xuXCO0JC5y7C5iI6xHkNOmtHnDBqzcmzTToN/1H8a77n2K4eTG
 dqJ7+GS0TXDw3BelPdaF7be7fqfj9cUy3SNYssp+Hr8/rS4e+bkIDJpD/0MSZ+ggk47b29VNv5oKm
 nNx20CIMwvsYKvMj/i4scdF6swAFry1LIsG3m8Crk/cYkXg6692goPQy24c7CYuH7K2cXd1fi4pj+
 T9skqoMcdtNXSN/J+TZeWEYIcqcqy2EXz30ZOGArFb7xg331cR2ZLArkFM+5sAhJNpfRVKVJVPr3w
 B5GEcFDhbXpXPVKhdfPBYXps;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmcLg-00038H-1s; Tue, 08 Dec 2020 12:44:08 +0000
Date: Tue, 8 Dec 2020 14:44:06 +0200
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Samba testing on CentOS 8
Message-ID: <20201208124406.GF5029@pinega.vda.li>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208231746.3c15f5b0@martins.ozlabs.org>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 08 joulu 2020, Martin Schwenke via samba-technical wrote:
> We've been doing our CTDB and Samba testing using autocluster, based on
> the official CentOS-8.2 vagrant image.  This depends on using
> bootstrap/generated-dists/centos8/bootstrap.sh from the Samba source
> tree.
> 
> Until recently this has worked just fine:
> 
> + yum -v repolist all
> ...
> Repo-id            : PowerTools
> Repo-name          : CentOS-8 - PowerTools
> Repo-status        : enabled
> Repo-revision      : 8.2.2004
> Repo-distro-tags      : [cpe:/o:centos:centos:8]:  , 8, C, O, S, e, n, t
> Repo-updated       : Sat 31 Oct 2020 04:58:49 AEDT
> Repo-pkgs          : 2,010
> Repo-available-pkgs: 1,444
> Repo-size          : 1.0 G
> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
> Repo-baseurl       : http://mirror.realcompute.io/centos/8.2.2004/PowerTools/x86_64/os/ (9 more)
> Repo-expire        : 172,800 second(s) (last: Thu 03 Dec 2020 22:30:57 AEDT)
> Repo-filename      : /etc/yum.repos.d/CentOS-PowerTools.repo
> ...
> Repo-id            : Devel
> Repo-name          : CentOS-8 - Devel WARNING! FOR BUILDROOT USE ONLY!
> Repo-status        : disabled
> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
> Repo-expire        : 172,800 second(s) (last: unknown)
> Repo-filename      : /etc/yum.repos.d/CentOS-Devel.repo
> ...
> + yum config-manager --set-enabled PowerTools -y
> + yum config-manager --set-enabled Devel -y
> + yum update -y
> ...
> 
> However, now:
> 
> + yum -v repolist all
> ...
> Repo-id            : devel
> Repo-name          : CentOS Linux 8 - Devel WARNING! FOR BUILDROOT USE ONLY!
> Repo-status        : disabled
> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
> Repo-expire        : 172,800 second(s) (last: unknown)
> Repo-filename      : /etc/yum.repos.d/CentOS-Linux-Devel.repo
> ...
> Repo-id            : powertools
> Repo-name          : CentOS Linux 8 - PowerTools
> Repo-status        : disabled
> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
> Repo-expire        : 172,800 second(s) (last: unknown)
> Repo-filename      : /etc/yum.repos.d/CentOS-Linux-PowerTools.repo
> Total packages: 14,251
> + yum config-manager --set-enabled PowerTools -y
> Error: No matching repo to modify: PowerTools.
> 
> The whole thing falls in a heap because it appears that the Repo-id's
> are case-sensitive and that "PowerTools" and "Devel" have changed to
> lowercase in CentOS-8.3.
> 
> I'm still using the CentOS-8.2 Vagrant image, so I'm a little confused
> about why the repos are now referring to 8.3 (not shown above for
> brevity, but definitely the case).  I'd certainly like to understand
> this... but I doubt that will solve the problem.  :-(

I think CentOS does not have separate supported minor releases anymore,
just the latest one. This, at least visible in your mirror list link --
it has one digit in the 'release=..' parameter, so you are on a rolling
release.

If you want to stick to the previous releases, I don't think mirrorlist
tool supports that, so you would need to use a specific mirror for the
URL and replace 8.3.2011 there with the specific release folder.

> 
> I'm wondering how we fix bootstrap/config.py to copy with this change.
> Does it have to be something horrible like the following patch?
> 
> diff --git a/bootstrap/config.py b/bootstrap/config.py
> index 982ebae1cd1..8383aeb392d 100644
> --- a/bootstrap/config.py
> +++ b/bootstrap/config.py
> @@ -235,8 +235,10 @@ yum install -y dnf-plugins-core
>  yum install -y epel-release
>  
>  yum -v repolist all
> -yum config-manager --set-enabled PowerTools -y
> -yum config-manager --set-enabled Devel -y
> +yum config-manager --set-enabled PowerTools -y || \
> +    yum config-manager --set-enabled powertools -y
> +yum config-manager --set-enabled Devel -y || \
> +    yum config-manager --set-enabled devel -y
>  yum update -y
>  
>  yum install -y \
> 
> 
> Or is there a better way?

If these are the same in all previous versions, then that should be
enough. If not, may be we can make the repository names a part of
per-distribution configuration and run 'yum config-manager' for all of
them?

-- 
/ Alexander Bokovoy

