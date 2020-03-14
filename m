Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11759185607
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 17:46:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=FQXenuDuCHBeaBTYT978xVGP+keL16eOQEX/mFZubMM=; b=auuV0t9MiqC5HcXB3vk1PtumV2
	GpyUxQ+O2hw4+iHGPuzQ+4ONrSgp0SOo536zxLFe5VEwB5VLVXrq1zz8Ll+qSBw8JeJ2MO87UsjpV
	HcOxa+zpGjqxuiZlQq/0hZKRAqbtPVHPV+HHtwbYIMgGIsipyAoz3sr5c62xmqRv+pmif4vfbfCUq
	Ctc/1pIx51QnwsYlhagsf2SMq8JsgvbwHxnAPzt5U3MXDZMiQ0Axt/42v9ZFzAlJi9yljT1vSI54z
	oZygq3fKwvfyMdBB4aaNCUaZY85lfnrfChF4Xv9vHgSmbOrFC+LRB2y2Nmncp+N26ED9yMKKncqzw
	fF0G4Hdg==;
Received: from ip6-localhost ([::1]:54314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD9vE-00G6LR-BX; Sat, 14 Mar 2020 16:46:00 +0000
Received: from [80.20.169.36] (port=36119 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1jD9v9-00G6LK-1r
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 16:45:56 +0000
Received: (qmail 9761 invoked by uid 121); 14 Mar 2020 17:45:51 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25750. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.162293 secs); 14 Mar 2020 16:45:51 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 14 Mar 2020 17:45:51 +0100
Message-ID: <0d5fc070b38d2ca948588126848613835255cc6d.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Sat, 14 Mar 2020 17:45:50 +0100
In-Reply-To: <1e12e848-3540-7651-8712-752600680296@samba.org>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
 <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
 <1e12e848-3540-7651-8712-752600680296@samba.org>
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

Il giorno sab, 14/03/2020 alle 15.45 +0000, Rowland penny via samba-
technical ha scritto:
> Both ;-), the record should be added when you join a Samba DC, 
What you means exactly with "when you join a Samba DC"?
"join a PC to a Samba DC" or "join a Samba DC to a ..."?
I think the first is right

> Ahh, a Windows DC will not have samba_dnsupdate, 
Yes, it not have. But here I do not use a Windows DC, it's a Samba DC.
The Windows are the client.
Why you say "a Windows DC" ? what does it mean?

> you will probably have 
> to create the records manually with samba-tool or ADUC
Yes I have do that initially.
But now the record it's gone, I have remove it and I have un-join and
re-join the win10a pc and join the new win10b

> You are using the Fedora packages to provision a DC, 
Yes I use the Fedora packages for test it. 

> it looks like you might just have found another reason not use them
> for a DC ;-)
No eventually, if so, I have found another reason to fill a bug on
RedHat Bugzilla.

Since you tell me it should do it, this is a bug

> > Many thanks for you patient.
> 
> Couple of answers to that ;-)
> 
> Either: 'yes doctor'
> 
> Or: I think you mean 'patience'

Yes, I mean "patience", a lot of patience for my bad English !

Thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)


