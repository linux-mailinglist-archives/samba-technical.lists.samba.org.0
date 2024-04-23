Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 497738AEAD9
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 17:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wpbqJc6ioMPePrps8p9Sb2+ortlSjkNyN2QSHJrJcqI=; b=1nHaLs3zUcxjISdesTY+8k+PK6
	ScruqmfCVMYA1iw2CXaeLybg/gXkthqm7T+DAWeEFR6ptSbcuGIyjrBMAM1dAfRbesBjLYqFJxcT/
	JXF4lCA2Cn4mQvBl2fESVworqNbsa49LcGmHBDxiXI9GnjKA7hMZ9yC9FGpzbUktwwbz5xgyK1XSN
	9FXOT1B/DNGcZiGWKoGQ6Bf7eZriEedBvP6Pjpzq1V9MvjwlNgG0Tbh/rKve4TenGDu4vOMzVdDwf
	XGRzzJ9zK7GBy9H38uyCSBBmqwUQFb/2xDw1CIBJVEJk45rGvRh+e9gpQHoQls+PpvwC61dePWMGk
	B9Pq4OUA==;
Received: from ip6-localhost ([::1]:34736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzHwc-005SaS-TR; Tue, 23 Apr 2024 15:20:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14570) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzHwY-005SaL-AQ
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 15:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=wpbqJc6ioMPePrps8p9Sb2+ortlSjkNyN2QSHJrJcqI=; b=EEsKAVOAS8AtgMJ11Ybz0zVRLD
 foZhAbkkTwCr67aqcnobpKyEZ+udjKono964ccBXQ3Fkjaf5Ywm7kMDwIlZdJ+Xf2gXKCMF+BbaKW
 IVLzMWMsIGZFxqU1woeB5CPslaBikS+CJ5Q5xip8sV3NbT+qlOL9GWcZiApvNyvSlZs1WpGoMEHCn
 aaHBlod+5D/uTrGIONvihws8qgenCZUiE5iZ41inRP4Q30PlMdKr7u3PJiqXVmyybt1DNRQjxMTDl
 0HiBrj8NGPYsdzHbAQS8LFpjrBBd2MJhGgzgVQ6vNt7wp0Q7zXZADkOXzhWGT/YMYcccwzdHMrFGW
 PF++WM178fMg9KLnuIBLKOUUqlixCkQtBi6zoj0ATZLBHolYtzW7Qd1+McVcvzHGfMOJ224P8jOEi
 dFvLXiw/9+ZM8KBp0xzKFhF7KfZMZXeVwi5SpHhtv+TQoc9MHuP2/g1KX/M6cngmLO12Bi9tMMPcb
 Pv8c/XBJedD4iXtPwb0lgsuV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzHwV-007uCy-0f for samba-technical@lists.samba.org;
 Tue, 23 Apr 2024 15:20:23 +0000
Date: Tue, 23 Apr 2024 16:20:21 +0100
To: samba-technical@lists.samba.org
Subject: Re: samba shares across different os's
Message-ID: <20240423162021.0c58005a@devstation.samdom.example.com>
In-Reply-To: <019001da958c$4cb79270$e626b750$@aol.com>
References: <015301da9581$80865ce0$819316a0$.ref@aol.com>
 <015301da9581$80865ce0$819316a0$@aol.com>
 <20240423151917.40726f90@devstation.samdom.example.com>
 <019001da958c$4cb79270$e626b750$@aol.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 23 Apr 2024 10:41:16 -0400
George via samba-technical <samba-technical@lists.samba.org> wrote:

> The Dlink system is version 1.  The WD system is smb3 after the
> latest OS update.  The windows system has smb1 enabled.  I have had
> the Dlink system mounted to the windows system for years and it has
> been working fine.  Not sure how to tell what version of samba the
> shares are mounted.  

If the Dlink only uses SMBv1m then the shares on it will have to use
SMBv1.

> When I mount the Dlink to the Debian system it
> complains and says I need to use vers=1.0. But the WD system when
> mounted on the Debian system does not complain.  The WD device is
> running 4.3.11. 

SMBv3 support was added at 4.3.0, but there have been numerous updates
and CVE's since then, Samba latest is 4.20.0

> I'm not sure how I copied the files I think I used a
> cp -r  but forgot to use the -a option.  

If it is available, then rsync would have probably been better, but if
it isn't then 'cp -a' would have been better than 'cp -r' (see 'man
cp').

> I think the fix for the all
> of the folders being empty was doing a chown -r user *  This seemed
> to allow most folders to display there contents.  

If that worked, then the files had probably been transferred, but then
belonged to another user/group and you were not allowed to see them.

> When I mount the
> WD on the Debian system the owner/group is always root:root.  

That is fairly standard for a mount.

> I'm using the WD because it has been sitting around not used for a few
> years.  I'm not real happy with it because they use a non standard 64k
> pagesize.  Which means you have to compile your own programs that
> ware not on the device rather than just apt install.
> I just thought that I could remove the Dlink and use the WD.  It is a
> low power device that can be left on all the time.  Which allows me
> to access the files from any of my pcs's or laptops or phone or TV's.

If it works for you, then great, but it is still an elderly device and
if I were you, I would be looking on it as a 'stop gap' until I could
replace it with something newer, but it is totally your decision.

> 
> Sorry for posting on this forum.  It is the only one I get email from.

Not a problem really, but the thing is, samba-technical is meant for
discussing the 'internals' of Samba, problems like yours are best
discussed on the samba mailing list, so it might be an idea to register
for that next time ;-)

Rowland


