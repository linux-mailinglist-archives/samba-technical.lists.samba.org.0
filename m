Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF559DBC
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 16:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ov7nkt03W1Mv4YFTio2j9G0gk6EWjghsZmFl0SuDBiM=; b=lUK7qmThqDtdWaQzIXk/FHjM1R
	Dxc2vmZZMNv5hM/qiZoJJZ62c4eF3qvpBNiTFVYYAhgt0Nk9xrYmntgQLj2bSkTQrTPbGaA1dlHaH
	YnHU/rAkwYHWmT0cNcY5oKSinBxRs5ZuiwlIzgSdB82wQ+C1K4d/215FLPW0mL/fvsvWmxTJ+L/gV
	wvRSF4pOS1iGnP0nmqBLjDsVqF8uZufZ2C+vcOMRndRAf8H3gjCS2ZmtY7a+RKNWj95qIaIsGkWTj
	Tv9CNOLeIhiSFvAu5LSqqp+MAzga0dg/BV5tfmc8xlEtRPMJK1rUCkfgW2vkZDrphlqrokKyvg0Tc
	+xEU4L8w==;
Received: from localhost ([::1]:61854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgrsl-002NxO-45; Fri, 28 Jun 2019 14:29:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgrsg-002NxH-4G
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 14:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=Ov7nkt03W1Mv4YFTio2j9G0gk6EWjghsZmFl0SuDBiM=; b=D1Vcd+HrPm47abegtRV5JqdyTb
 +Bz1CgvGwLlU6xRpox5OGonUAmZZkHX7jozjK/3+dARgy0wWuv7/SofAdZHeC6cs4qrsByFFCK4de
 8QcDtIdV4a2BgaiwXfAAwP/lErBhQtAL+8huAsrXUe5WPwVv9Ig1w21+biTEXRRxTvoo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hgrse-0002LP-Oq; Fri, 28 Jun 2019 14:29:36 +0000
To: "'Martin Schwenke'" <martin@meltin.net>
References: <20190628142946.7537edfd@martins.ozlabs.org>
 <vmime.5d15b434.4582.3bcb7b652c1223e3@ms249-lin-003.rotterdam.bazuin.nl>
 <20190628163954.553b8115@martins.ozlabs.org>
In-Reply-To: <20190628163954.553b8115@martins.ozlabs.org>
Subject: RE: Compiling Samba with system Heimdal?
Date: Fri, 28 Jun 2019 16:29:36 +0200
Message-ID: <A2CE4032F6664799A60902AB16BDC146@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdUtfF3J1DeQsdg1TceqyMQmxTSccwAP3OJg
X-MimeOLE: Produced By Microsoft MimeOLE
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Martin, 

Ok, its done. 

Now, why its not building from source, that i dont know, im really never
build from source. 
And i did not have the time to have a good look at it why it failes. 

But if you want to test/check it against a 4.10.5 packages samba on buster
;-)

Here you go, these are not for production (yet), i only quick tested them. 
As in, the install fine and the basic work, i havent check more. 

Note, only build on/for amd64.

wget -O - http://apt.van-belle.nl/louis-van-belle.gpg-key.asc | apt-key add
-
echo "deb http://apt.van-belle.nl/debian buster-experimental main contrib
non-free" | sudo tee -a /etc/apt/sources.list.d/van-belle.list

What might help you are the build and changes logs. 
Found here : http://downloads.van-belle.nl/samba4/Buildlogs/buster/ 


lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 10 (buster)
Release:        10
Codename:       buster

root@debian10test:~# smbd -V
Version 4.10.5-Debian
root@debian10test:~#


Good weekend guys, 

Greetz, 

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens 
> Martin Schwenke via samba-technical
> Verzonden: vrijdag 28 juni 2019 8:40
> Aan: L.P.H. van Belle
> CC: samba-technical@lists.samba.org
> Onderwerp: Re: Compiling Samba with system Heimdal?
> 
> Hi Louis,
> 
> On Fri, 28 Jun 2019 08:31:16 +0200, "L.P.H. van Belle via
> samba-technical" <samba-technical@lists.samba.org> wrote:
> 
> > > ../../source4/heimdal/lib/vers/print_version.c:39:  
> > > > ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal   
> > > error: roken-common.h: No such file or directory  
> > > >  #include <roken-common.h>
> > > >           ^~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > 
> > > > I don't see -I/usr/include/heimdal in there anywhere.  :-(
> > > > 
> > > > Can someone please tell me what I'm doing wrong?
> 
> > You tried, installing heimdal-multidev ? 
> > 
> https://packages.debian.org/search?suite=buster&arch=any&mode=
> path&searchon=contents&keywords=roken-common.h 
> 
> Yep:
> 
> dpkg -l heimdal-multidev 
> Desired=Unknown/Install/Remove/Purge/Hold
> | 
> Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-a
> Wait/Trig-pend
> |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
> ||/ Name             Version      Architecture Description
> +++-================-============-============-===============
> ====================================
> ii  heimdal-multidev 7.5.0+dfsg-3 amd64        Heimdal 
> Kerberos - Multi-implementation Development
> 
> :-(
> 
> But thanks for trying!  :-D
> 
> peace & happiness,
> martin
> 
> 


