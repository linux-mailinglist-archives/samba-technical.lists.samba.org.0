Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0B23CEAE
	for <lists+samba-technical@lfdr.de>; Wed,  5 Aug 2020 20:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Y5oZFCGtRGsKdExn9Fkz8Y+WqTWnVE2VLVoGtGyWRjM=; b=KDawEuDjSPPFsTJGj56it4NzCJ
	EuAHUE6WHsbi38qB/bmFgnaILvBvQGUljElEmOU2OQqmeI1KBMd0amSL60/ZZhMZS8RhNAxJ55uDd
	i4gDilS1cRR4RAXDJvhJG7kDxM6nQZhe9iHhLweaz1jWhazmeqtoJtSsuAxrZYhOiW//l3C5FxzBw
	2o4Of7NCyhIq8WG/La3p1XUYzwAjlCNif7cCkhNa6Jke1CYLXbx1zlq9T1DCY7WcJmXpGP7NotC40
	bRr0oNhPMa6tbRgmfcOK7wZlkkGR3LDkRnknlcY6zvC80FFPEKGiW/txtMFtQrI4DOWyasME9+dv9
	jfN/JC6Q==;
Received: from localhost ([::1]:23820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k3OZW-00CXmy-U4; Wed, 05 Aug 2020 18:55:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k3OZL-00CXmr-1H
 for samba-technical@lists.samba.org; Wed, 05 Aug 2020 18:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Y5oZFCGtRGsKdExn9Fkz8Y+WqTWnVE2VLVoGtGyWRjM=; b=xmIxjUrknlSo5226iQoE6MKJN7
 RWlMmMUH/34pehuOsTxB/QKJ/fY/rFgxpmngJYF/W2l1vy0JAryHQr/85SjLfjuVcEPsogJz45p/C
 9/1/Cb+ZLHB1jZhoEjRddNUoz5ysgDUCGQfEuxq3KQkEHANYjFXxsTemNktRVYd76bFM0g++MDHed
 Rw10evy1Lw42Pyjzg1RDUxOmSIarMU09cflwuJmDHQYQYwXkLpx93/OS08E1YT3+r7ak3/kbGZQDX
 Gmv8OnE8Jp0XCqE//qdrKT2rVNEHxFYqu/84udYztGsyeOnmZ2donmz+p+4lUHNP8FwEzKun+Nuc6
 Lxrkt81uVwq8qM8FYngwGSD/uWbVqlyZPlW7Lm/F6p3j1UZeCDWZYOy7OCQtIajlXabjtnKfblcxC
 1bBXPYrzH/krdsiTx2ewXQLLUiJaVH+DTwKsnLEZhezwqX4lh2sj/96JDAWdZUil+2zjXIk9dEq82
 aVkM6x8j/8hFZk6Hs3wQUOQW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k3OZJ-0006O2-0U; Wed, 05 Aug 2020 18:55:17 +0000
Subject: Re: GSoC Progress update
To: hezekiah maina <hezekiahmaina3@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH72RCW7gZ9sntyTzp9AHSbZG8xzLPHL5R3m7Nk7eUrUk+-QCg@mail.gmail.com>
Message-ID: <9bd1427d-1377-2c93-9546-f5ebae99e2b5@samba.org>
Date: Wed, 5 Aug 2020 19:55:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAH72RCW7gZ9sntyTzp9AHSbZG8xzLPHL5R3m7Nk7eUrUk+-QCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 05/08/2020 09:36, hezekiah maina via samba-technical wrote:
> Over the past two weeks I have been working on the following:
> Packing for various based distributions.
> I have started by first targeting Fedora 32 with more to come later.
> Group Policy Object (GPO) management. Some of the features includes
> creating a GPO, deleting a GPO, listing GPOs, listing containers, deleting
> links to containers, downloading a GPO, backing up a GPO, Setting a GPO
> link, restoring a GPO, Setting inheritance, getting the inheritance and
> showing information for a GPO.
> Flexible Single Master Operations (FSMO) roles Management. Features
> includes seizing roles, transferring roles and listing the roles.
>
> The link to the repo:
> https://gitlab.com/HezekiahM/samba-ad-dc
>
> The link to the Open Build Service:
> https://build.opensuse.org/package/show/home:Hezekiah/samba-ad-dc

Hi Hezekiah, after finally getting cockpit to work on Devuan, it is 
looking good, but (and isn't there always a but :) )

nmp on Devuan (and hence Debian) isn't new enough (this is just for info)

When I ran 'make install', there was an error, it couldn't copy the .xml 
file:

cp org.cockpit-project.cockpit-samba-ad-dc.metainfo.xml /usr/share/metainfo/

This was because in 'Makefile' there was this line:

cp org.cockpit-project.$(PACKAGE_NAME).metainfo.xml 
$(DESTDIR)/usr/share/metainfo/

'$(PACKAGE_NAME)' is set with this line:

PACKAGE_NAME := $(shell awk '/"name":/ {gsub(/[",]/, "", $$2); print 
$$2}' package.json)

and 'package.json' contains this:

"name": "cockpit-samba-ad-dc",

So, it is looking for 
'org.cockpit-project.cockpit-samba-ad-dc.metainfo.xml' but the file 
supplied is actually:

org.cockpit-project.samba-ad-dc.metainfo.xml

Otherwise, good work so far ;-)

Rowland



