Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1A5262A61
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 10:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yDm/B84Y5P8mWDnw38j5K3mdcHxB4rmu4edAT0pt2VM=; b=E7T6djmJm2FczWeL7ptnc1W4US
	dqdIyDf+t7z8V0+N3VlDnIM3Z4YzNK4eAnlH9/KlMI2iPNzKjykSPNoyGwrUnQH4sZcYCFJ5K4GV+
	WJNIg2LB+GFMEmija168jo3E2Mouj+X/xp9umd9I1gkZuopKJ0lG38lkHZxSngkvRmJbOrk121Or6
	sWozfjXujDMgD+oxUN193HRkwWghePjg8XFpwJkcM3n+wTNM/XTbmBbr65emgw8SIwbqe0WNSvXLT
	6NzvTKQmuTmhWix0qBF1XPh7aXPAswJXnM+BiGbUoOvbeBdKKxLASDAz72lKObjV161fR8N/dCAp7
	D2630iJQ==;
Received: from localhost ([::1]:20962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFvXJ-004kmE-2D; Wed, 09 Sep 2020 08:33:01 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:39745) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFvXD-004km7-7x
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 08:32:58 +0000
Received: by mail-ej1-x643.google.com with SMTP id p9so2324003ejf.6
 for <samba-technical@lists.samba.org>; Wed, 09 Sep 2020 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zJMBLsYRez+iC2MEdPfwDP4b1bqezxNHeziFVePhK7E=;
 b=j3xBTm53q4fPsedAFefMbybGhmcI+rjWlE+9DJYHLe5mZupKZnycJd08gMht6Us2uj
 pGiY0gitvPik37nUTcHkDHx0fncZk/K9nPsWhSybCjQ/IkpxeWOrW83KS7btItVQBmLR
 wRPzKB+5j6icXcSMyus0v8GITxqDZhxIwekIcevUIn4vpFq6H63XnZZODGK8fL9tZEK5
 E5aFX9RyXiiyVoTm8VVMW1IBlT55PdkYdlaSPMd0H38SROH98Yfncd+WwatK/MedQzBp
 V688GFbrESOJvreIOohE4nUmMA/AtnYOcEJWrMNOO2aO7quE3zrnumAzONMtURYYJDyH
 z87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zJMBLsYRez+iC2MEdPfwDP4b1bqezxNHeziFVePhK7E=;
 b=cJ3aZLAbdCKcapwlPNfJHRHegMEcO4z3BbsgbQpXcUZ2kevfhx+NYKGLFNVFwV4vsa
 IzXTsI1H754JYYtEwMG5zB0CUstv2bUFpc2Reua2GjAi0uvUSW5tDQVQD35a9h0IenaJ
 kXvKORPtXd2wxg6PO4Gw/PAzJiRZkb4RAuFEov9pE81J1e/mYNDp5pAZShxD59ps5016
 RDeyNYS08ryuuH6tktgHuvctBq616cW6MTtZ7PKIePv1tPjMF1672THB1bI4rCSTKDQE
 edS5bGgr8FsUj2tdqHhzUX6YFYaNGG57DYx6gcl7KWcT+j+qil8DZRjGMGWJmNU2FurZ
 L/2w==
X-Gm-Message-State: AOAM530PYRiOT8VDR2w9AsueBYb/xCbKebIYc4EUKfb0y8YCA0Z8fuA/
 eNsm+zMbYfgqgIN3/m7fKItFXGve1zCRT9IJeMYyVm+CRJUe4Q==
X-Google-Smtp-Source: ABdhPJwFdnzu1mpOg9o3YXNKLy/g1x1xkvAzhWeKeDBb8YA99V7bPGD4gfTF+4GBv66vuzV3GiWskWsjG99EUUGc5R8=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr2548144ejk.94.1599640368425; 
 Wed, 09 Sep 2020 01:32:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 Sep 2020 11:32:37 +0300
Message-ID: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
Subject: GSoC 2020 Samba Experience
To: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>, 
 "abartlet@samba.org" <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone,

I finally came to the end of Google Summer of Code 2020 program. I'm glad
to have passed the program.
I learned a lot of things which before the program I didn't have much
knowledge about. I will outline some of those new things that I learned and
give some feedback on areas I think could be improved to make Samba
even better.
One of the things that I learned in the program was using Samba Active
Directory Domain Controller. I didn't know much about working with an AD
DC. From having to set a server as an AD DC to having one that is
functioning well was a great learning experience. Making mistakes is vital
to learning how to work with something and I did a whole lot of them. DNS
configuration and setting up Kerberos admin server was particularly hard
for me but with time I have figured how to work with them. I'm glad to have
had great mentors who led me through every step of the learning process.

Another thing I learned was to develop Cockpit plugins.Cockpit (
https://cockpit-project.org/) gives linux server administrators a visual
interface to interact with a server using a web browser. One of the most
important features of Cockpit is that it provides an API for developing
plugins to extend its capabilities. I was working on developing one of
these plugins for samba-tool command line utility. Samba-tool helps
administrators manage their Samba Active Directory Controller. So, which
problem were we trying to solve? Using a command line tool is mostly prone
to making spelling mistakes and a lot of repetitive typing to achieve some
functionality. Having a visual interface reduces the mistakes users can
make, improves the user's productivity and is a much more appealing way to
onboard new users. You can find documentation about the plugin and how to
install it for your operating system here:
https://wiki.samba.org/index.php/GSOC_cockpit_samba_ad_dc.

I primarily used React and Javascript to develop the plugin. There are many
other tools that are provided by the team at Cockpit for starting a new
project including a starter kit with most of the files for the project
already included. (https://github.com/cockpit-project/starter-kit)

Another Open Source tool that I learned to work with was Open Build Service
(https://openbuildservice.org/). Through OBS I was able to write some
config files which when pushed to build.opensuse.org builds packages for
the different distributions and makes a package available for the end
users. Leveraging the OBS, I was able to develop the plugin for users of
Fedora 32, Debian 10 and Ubuntu 20.04 (
https://build.opensuse.org/package/show/home:Hezekiah/samba-ad-dc)

One of the areas I found to be really hard was installing provisioning a
Samba Active Directory Domain Controller. The Samba documentation for
installing and working with an AD DC is pretty comprehensive but not really
that straight forward for new users. Some of the concepts in the
documentation require some prior knowledge of working in an AD DC
environment and I think it is an area that could be improved to easily
onboard new users coming to Samba. As outlined earlier some of these
concepts include setting up Kerberos admin server and DNS configuration
though the Samba documentation on troubleshooting DNS problems is truly
priceless.

Another area that I also found to be really difficult was packaging for the
various operating systems distributions. This might not be part of what
Samba does but I hope it could be improved. There wasn't any comprehensive
documentation I could find to help with the packaging of the plugin and had
to depend on my mentors for guidance most of the time. Through trial and
error I was able to understand how to package for the 3 linux distributions
but I really hope this could be made easier for new developers.

Lastly I found the Samba codebase on GitLab really scarely :). Having the
entire codebase in one repository is really hard to figure out which part
does what. I'm not sure if it could be subdivided into various projects but
if this is not possible a little bit of code commenting and maybe readmes
could be used to help new developers understand how the various pieces fit
together.

I'm really thankful to the entire Samba community for having me as part of
the GSoC 2020 program. I'm particularly thankful to Alexander Bokovoy and
Andrew Bartlet. They both were my mentors for the program and were glad to
help me resolve problems I encountered along the way. I'm also thankful to
members who used the plugin, discovered bugs and informed me and my mentors
about them and to all those that answered and clarified my questions on
samba-technical.

Samba has really been instrumental to my start of the journey of
contributing to Open Source Software and will continue being part of this
amazing community.
I will continue contributing to the organization and improve the plugin. It
has been a really good learning experience and will continue to learn more
about Samba and the various OSS projects the community develops.

Thank you all and have a great day!
