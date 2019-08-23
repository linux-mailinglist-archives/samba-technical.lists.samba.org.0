Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E68EB9A4FF
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2019 03:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7JXir8bS20ZQ52t63c4eu40HPjcc7NW6dQ3cfjKGubI=; b=I8Up9hPUgDX5DOYlOzM2/erDXj
	mQzx0jWZBKyscbySWKfTJ2aG/TGAntxMez0j9K4E1Lrh43xrSAKRisKaE1Xcp+Nl66nnOcCHQ3lvA
	bxML1q38riNMoDecrKGw4yQtVAIF9fFYNiyPG6Dvl2mSMuVj5JoM2erQKhAal2qeyvKQsU8N2pul4
	aw6QT+Tcc/i9QBbih9cGoCtrOBMwbI9R590Kr11kb2b/Al8eZhfBlaLxmJOI/Ze425eVZjn3qDOeG
	PAsiyFxprElmUwTQKlFtHsqv5KzgpVXiJd93neBXAQdC6zfclpy+i6iJGlU7nP35DewSYTuYOAsoX
	l4+46C1Q==;
Received: from localhost ([::1]:37220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0yWj-007gGL-QZ; Fri, 23 Aug 2019 01:38:05 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:49117 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0yWa-007gGE-R0
 for samba-technical@lists.samba.org; Fri, 23 Aug 2019 01:37:59 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46F3tf6Hm3z9sNk;
 Fri, 23 Aug 2019 11:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1566524267; bh=vUmYoD+Cpk0CC6x6DOX3kGS6AgBlyTZ1AJ5tkUwZvKw=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=O2PDfswk+0vBYpQp4ezRtrj4FCLBiy8wHcrhJMytrsAkOtg7GIaR+I3p0irSwlsCw
 rH5M94X0D23iJGATLh5hXnu+8CopZxdYgdtANA/cUJ3hQ1tTVm9QArfuPRPhvh9AuW
 lDpzG7EVKO3Od5LSnHhcYABG9S7uRWxHJUq720n8RvPnO9VmDP+epWgqQD95DMfDHk
 57Aja5oyRD2cnZ6pIFCgDd46ITKM3atT2WkDfxMunMC1LGcsMndBLXdi4JEnc8i4if
 HcoOlCfkJ73Xub5Hx7EKEL/yvDhWtPDz5XjtTaYunie0nx9+TIkOpdAyaxI/L+T91h
 w3z4JMIoBqfrA==
Date: Fri, 23 Aug 2019 11:37:45 +1000
To: samba-technical@lists.samba.org
Subject: Re: recent flapping tests
Message-ID: <20190823113745.79501e26@martins.ozlabs.org>
In-Reply-To: <20190608200729.759ac6a1@martins.ozlabs.org>
References: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
 <20190608012357.68de8832@martins.ozlabs.org>
 <c58cec86-7177-18ac-ead1-7e5de351f330@catalyst.net.nz>
 <20190608200729.759ac6a1@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 8 Jun 2019 20:07:29 +1000, Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Sat, 8 Jun 2019 08:36:29 +1200, Douglas Bagnall
> <douglas.bagnall@catalyst.net.nz> wrote:
> 
> > > Should be fixed by fixes pushed on 7 May.    
> > 
> > I can confirm all your "shoulds". Also I can confirm the wisdom of
> > hedging with this "may":
> >   
> > >>    4 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh    
> > > 
> > > May be fixed by fixes pushed on 7 May.  :-)    
> > 
> > It happened twice since May 8.  
> 
> Oh, well...  :-(
> 
> We tightened up some things that might have been causing some tests to
> fail, but it doesn't look to have helped this one.
> 
> Some time soon I'll look at a patch so that the daemon logs are dumped
> to stderr when these "simple" tests fail.  It'll be a lot of output but
> at least it might give us a way to debug them when they happen in an
> environment that we don't control.
> 
> I might also try running that one in a loop...

ctdb/tests/simple/69_recovery_resurrect_deleted.sh should now pass
reliably...

peace & happiness,
martin

