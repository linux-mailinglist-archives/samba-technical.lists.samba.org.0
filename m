Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39111D8BA
	for <lists+samba-technical@lfdr.de>; Thu, 12 Dec 2019 22:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3CJHFENLFBMYS5hF9Ud7bZAsWLrA+8hF7gEusv32R0s=; b=TUdUOPT420za277toP3pTRtP9O
	FFl62SoJSj0Ga8fkDgch90vOcz5/hwya+AgXlZRA/XF4lS+neCIGaaQYSIq1Zv6WiKsZtZQqzk1Rn
	wJrWDncoEW3E/FA32Cn7AwEgVX0+MAc++Xzdj6KUWOq2J/26TMfPcKFRLgsmtifVs2K5gTTMK7uJ1
	weZEkam/iWIs3fDO96ykgSIBx/wGO1OCz+V96qfpyip5mACSAlYlsSe8IZvi9zn7JAEsWyQibPNDd
	rmaADKhipdsOeJwGBqAQiNsmwSifeFiPMkivzPZFhi4SJADJuFHGR2xODX13ba/2x4cOBQampLmOj
	wzlzybaA==;
Received: from localhost ([::1]:27146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifWGG-00758n-H4; Thu, 12 Dec 2019 21:44:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifWGB-00758g-TG
 for samba-technical@lists.samba.org; Thu, 12 Dec 2019 21:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3CJHFENLFBMYS5hF9Ud7bZAsWLrA+8hF7gEusv32R0s=; b=SFMqMfW0wJe/6E/TApYDYnPD2J
 VFVaSy4qnxiTM7CdeekTEKOO0ONIjDISKo+B4SuZp+NED5dPIiBLESGhl7J9c7THkktM7Zl79GHV2
 wD271uHmYGZ2lSkbZmpbxK06FfPaydVw/15Z7BtXCDZCpwM2ym/06V7NwWxCwQCsplV2OXzF0NkZJ
 YUYTUI1OKTwh8VGENczCoQwbNN+y4MWPzCaVm7YKk6cwlc+4s6IbbNTktcL15PWcI1XwwLGDtGTi7
 tRno1M28DWJVE8kB+tycSUzI+tjPx4XALDeudPDs4Xk369d3chCwaAlcVnFGcd6e9vtS4iT6Ni5L+
 s2qyOV+DLDxPdIuEDztWadvMrKjHUbStdkdo3gKrMpsueV7GdLYbg6ogMS7DR1GssiuiIbf1F0aT4
 vzmp4R23Mpy9iQj2zMOgZEVCybUJcs3JMskLsFBVD7MMsf7VDhGbFC4M/M69Zakn5NL/p1xcUJhiJ
 arGeHs9M3WFvKJ8KkbOECPg+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifWGB-00042E-0N; Thu, 12 Dec 2019 21:44:35 +0000
Date: Thu, 12 Dec 2019 13:44:32 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Parse::Yapp::Driver on platforms other than Linux
Message-ID: <20191212214432.GC228793@jra4>
References: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 12, 2019 at 06:43:24PM +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:
> So, my builds broke on AIX with this commit:
> 
> 
> $ git log -n1 --stat 83ffe67
> commit 83ffe6752d589180eac96d7b8e7d1a54e3476bfd
> Author: Andreas Schneider <asn@samba.org>
> Date:   Thu Dec 5 13:48:52 2019 +0100
> 
>     pidl: Remove Parse/Yapp/Driver.pm
> 
>     This file is provided by Parse::Yapp and on install we overwrite the
>     orignal file.
> 
>     Signed-off-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> 
>     Autobuild-User(master): Andrew Bartlett <abartlet@samba.org>
>     Autobuild-Date(master): Tue Dec 10 01:54:02 UTC 2019 on sn-devel-184
> 
>  pidl/lib/Parse/Yapp/Driver.pm | 471 -------------------------------------------------------------------
>  1 file changed, 471 deletions(-)
> 
> Easy enough to fix with a cpan install.   On AIX this is not a default with the freeware perl offering.  I do have to wonder whether this module is in the base packages of other Linux distros?   I use RHEL at work, but I'm not going to check other distros, obviously.

On ubuntu it's in libparse-yapp-perl. I had
to scramble to find it also after this commit :-).

