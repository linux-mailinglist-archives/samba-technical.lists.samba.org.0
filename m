Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A0CE353
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 15:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bwkjrkfFc3YUp1dW8lOm3nwCDVD56JXKgmM3nl7a0lw=; b=tvPUpBpCU9zUgdlm5ZDW1QTmv0
	XhO/2h2bEcopW+pEPE0gpqt0ckqMnDQNcQJ3FhQAABztBgra1gtcZ08SWB9HLuZYT8aUwONWt/c0p
	h+CIqX67GTfRIMgNloGL2KYx8JrFMzoqjiuqH3Uh82M7btov9XP5yb59s+DJr5zn6I7Gs78PRkWbo
	VaV8rEx0QvmFCNXuH1M1BctoxKMNIZ+/eqRE4k2w6FLAcNWpcAXxVbSq8OFiHWyicNAnbWlKUrkQX
	XZkX8P64Ird8XsiPkmSrbfi/DmY12fqFtQtSvxOrjBb1poyt+JJAW2iKxFC/55F/U04TGx+YYzbmV
	t/TqMLeQ==;
Received: from localhost ([::1]:52920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHSxp-001q8e-DB; Mon, 07 Oct 2019 13:22:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23762) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHSxk-001q8X-8t
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=bwkjrkfFc3YUp1dW8lOm3nwCDVD56JXKgmM3nl7a0lw=; b=f1ef0zGDuRopgKMux0YDg2Be03
 ai5++nWoTZwBodgyCQdDRN/cr8DGa68/Y8CRR3Zf17WyFdC5Z0/lkIA6elVmy5nBdw0c1rb7Dhrzb
 hhIbgnRDWupK98pkFxIgJ0BawLehLCXbrXEvd9cDfkZ/XJhHraD5BdX6bn3ZCkuRvDlo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHSxj-0005ho-6p; Mon, 07 Oct 2019 13:22:07 +0000
Date: Mon, 7 Oct 2019 16:22:04 +0300
To: Denis Cardon <dcardon@tranquil.it>
Subject: Re: samba 4.11 rpmbuild on CentOS7
Message-ID: <20191007132204.GL5765@onega.vda.li>
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
 <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
 <5800371.XWyRSs5115@magrathea>
 <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org,
 Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 07 loka 2019, Denis Cardon via samba-technical wrote:
> Hi Andreas,
> 
> Le 10/07/2019 à 12:56 PM, Andreas Schneider a écrit :
> > On Monday, 7 October 2019 11:32:15 CEST Denis Cardon via samba-technical
> > wrote:
> > > It is built against Heimdal kerberos. The samba.spec is taken from
> > > Fedora (thanks Günter and Andreas for doing all the hard work!) and
> > > modified to switch from MIT to Heimdal. Actually the hard part for
> > > building 4.11 on CentOS7 is the requirement gnutls>=3.4.7.
> > 
> > Hi Denis!
> > 
> > 
> > Samba 3.4.7 is only required for MIT Kerberos. If you build with Heimdal
> > GnuTLS >= 3.2 is just fine. Just change the required version in the spec file.
> > 
> > 
> > With Samba 4.12, GnuTLS >= 3.4.7 will be required!
> > 
> > https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/
> 
> Dear me! I misread the requirements and thought it was necessary from 4.11
> onward, whatever Kerberos implementation was being used...
> 
> I should have taken more time reading thoroughly your blog post! The good
> side is that I learned a few more things on rpm packaging...
> 
> I does make building 4.11 definitely much easier on CentOS7... And by next
> year CentOS8, which ships gnutls 3.6.5, will get traction when the new and
> shiny samba 4.12 will be released!
We worked with Andreas this morning to add CentOS 8 support to Samba CI
systems. We also cleared up a list of required dependencies there. You
can actually look at the dependencies in
bootstrap/*-dists/*/packages.yml for a base list of required packages
for each distribution. Then Dockerfile in that directory also contains
are more specific set of steps to prepare a build.


-- 
/ Alexander Bokovoy

