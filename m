Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F551855D0
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 15:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Cq8gDUPhvv61y68bFRdFfIB4PIskwlZ9eMKNZ1ECDLM=; b=qHhVnRXYnNQRGDw/o4o4klYAeJ
	bQW+5vWfCGJYwM8qMQJSARw7usKNlWmk4fBiYnILBiS2+EgcY3yvpfNKLtO54WDYTMlf6zoqGlYTZ
	ud9UGQki7j5d08gVPjcoGMYTirMxWOwISC6LgkTvW2ePsfRR0yKTuQJoz1fbVIHGx/E5VGgzrt42+
	xMV6rMh4MNPpN5nvds10+wDSx8f/DuVItFxGRF08NA0/2hfkc/9k250C6SXy+kx3iVfWeISMucQPp
	b4co/C1GdWB++Hi072LxHsdWS9zl6d8834NlQsvl2V5AfxSLw0UoWf/qKIUq760CIxwGw3K40VCJe
	vAct+T3w==;
Received: from ip6-localhost ([::1]:39478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD7N9-00G4Bh-IX; Sat, 14 Mar 2020 14:02:39 +0000
Received: from [80.20.169.36] (port=53273 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1jD7N4-00G4Ba-2v
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 14:02:36 +0000
Received: (qmail 30736 invoked by uid 121); 14 Mar 2020 15:02:30 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25750. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.204513 secs); 14 Mar 2020 14:02:30 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 14 Mar 2020 15:02:29 +0100
Message-ID: <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Sat, 14 Mar 2020 15:02:28 +0100
In-Reply-To: <20200309100715.GK2735275@onega.vda.li>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
Organization: Solinos
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno lun, 09/03/2020 alle 12.07 +0200, Alexander Bokovoy via
samba-technical ha scritto:
> I think it is a missing feature in samba_dlz

Someone can confirm or deny this affirmation ?

I'm looking for the reason why, when I join a new PC to domain, the PC
name is insert only into Computers session, and not into DNS zone
managed from samba AD.

This happened for my wrong configuration (if yes, i can post all my
configurations)?

Or it's a not implemented yet feature, like Alexander Bokovoy say

> Il giorno lun, 09/03/2020 alle 17.44 +0200, Alexander Bokovoy ha
> scritto:
> 
> I tried to create a configuration where named.conf is used to supply
> an update ACL to a zone hosted by Samba DLZ module and it didn't work
> because for a master zone specified explicitly in named.conf Bind
> expects a full definition, including 'file ..' statemenet. Since the
> zone is stored in DLZ database plugin, it directly overlaps with
> that.
> 
> As result, it looks like it is impossible to specify ACL to DLZ-
> provided DNS zone other than through DLZ itself.

Let me know

Many thanks for the clarifications

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)


