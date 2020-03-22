Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E018E760
	for <lists+samba-technical@lfdr.de>; Sun, 22 Mar 2020 08:50:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=51hziHOcis1BIG5PeW10VOJu1NV+PSHyKO0G5KxIV1E=; b=F4dLYceA46ghWhEmnfSJpIeBNa
	ORu5nHtYffxoTu2VRsoGXHWb2MEEKN3touB7RMgSbabUiJBsfzPutiqQtviMt8ogeOsOqeD1kEXfp
	uYBZB5x/Mgn3I/miXGtaW65VNcfedF+0mCYQ/N37jxcB2sk/UZOcKp7Ip/SqF9hT1fSCRvgpWPA4O
	A0MF/1M0McwyF+bY/zq0wb9a6LUJsAZ9+IpUNIV52BVe7A3InBHFRPfUuY159oSCDrXzE8/y45YEV
	uA1k/gSv4RZbRtVA4kGjMJZ2Q7k6BZsIpC5gatOxC/OM1pa4SVn0SpmM5QLu1/jrGLvRANw2Xkw3E
	bQ7417JQ==;
Received: from localhost ([::1]:36112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFvMo-000PIf-Kq; Sun, 22 Mar 2020 07:49:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFvMi-000PIY-LM
 for samba-technical@lists.samba.org; Sun, 22 Mar 2020 07:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=51hziHOcis1BIG5PeW10VOJu1NV+PSHyKO0G5KxIV1E=; b=yBWNXEkIStlJMD4dIIMrXWcAC7
 wTz84iAXSM4bDEytNOLM9piUhOX+hk/7Fks2Za+hNC8ETi2QEghTjsUbup40Ma46Lqxu7a34n26zL
 uZFInokW2BXnrUa1BEXcmYMz0E1iPWNoT+1zpYh7T+ZcKEE2F1IQy5oNS/2kDyTJvbErb9vyyuulv
 eggiYXzfum5ZP8T6E3TpkKP+pt9hGHyl4rhdU+ybBVcobvI70tdSVvrb44arDZYSU5Qe9HqjbvRfv
 2dyfTFBTVZMl8n40T0vNwYb4zPnZBzVyY7OoZJcSSspftbmKwOr0lIsx7a2bML2XYfE0tkV3uej2i
 eZ9m96VGBzwFUV/CRicMLT11BZ5F1VvmFX3TkWW80sGJBhEDZKo8IoiSBewHWObPGcdGhwU0nj2Rh
 EBfVk9GBCRS+tIUGtJXD7VPj27OMZA6hp8RGPUDBoGJU8p8OfSmYLN7I40yaEF+EEdI7q4tSBrrR/
 evN3XeM2ul+70k2ZAP0+1JxL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFvMh-0003xA-9J; Sun, 22 Mar 2020 07:49:47 +0000
Message-ID: <5baa803cac0b5f9b3b71c01e659a4ae06d25af25.camel@samba.org>
Subject: Re: GSoC 2020 introduction and query
To: Rohit Dandamudi <rohitdandamudi.1100@gmail.com>, 
 samba-technical@lists.samba.org
Date: Sun, 22 Mar 2020 20:49:43 +1300
In-Reply-To: <CAKJM6MkeM-qmg71j0cykaRexFC6f4q8XTL9se_Fi8BKfFb4VCQ@mail.gmail.com>
References: <CAKJM6MkeM-qmg71j0cykaRexFC6f4q8XTL9se_Fi8BKfFb4VCQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2020-03-22 at 04:20 +0530, Rohit Dandamudi via samba-technical
wrote:
> Hello all,
> 
> I am currently doing my undergrad in Computer science and Engineering
> at
> CBIT Hyderabad, India.
> 
> I am interested to work on the project idea "Samba binary size
> reduction"
> as part of GSoC 2020. I have prior knowledge of C and Python as well
> as
> contributed to open source organizations like FOSSASIA, Macports
> before.
> Hopefully I am not too late, kindly let me know where to get started,
> and
> what should be done to make a strong proposel.

G'Day,

If you have worked on build systems before then you may well have the
skills you need here. 

What we need is for someone to take the ideas in the page, and the
concepts from the patch and make them a practical solution for Samba.

The primary task may well end up being in Perl, or Python, or C, the
challenge here will not be deep programming but lateral thinking about
how to break up the dependency chains.

Making this more challenging or interesting (depending on your
perspective), the RPC server is being rewritten, but for now the nexus
in source3/rpc_server/rpc_ncacn_np.c and the calls to
ndr_table_by_uuid() remain.

What you and other applicants may wish to do is see if that can be re-
written in such a way that does not require linking in the whole NDR
parser, just to obtain the information actually used. 

Finally, I send this to another student and I think it is worth
repeating publicly:

The challenge is that Samba over-links because some of the dependencies
are not fine grained enough.

A particular spot where we over-link is via the ndr-table subsytem,
which links to most of our (large) generated parsers for every RPC
protocol we know.

Some bits of the code that link to ndr-table only want some metadata,
but they end up linking to each NDR_* subsystem because the metadata is
at the bottom of each parser (the ndr_*.c files).  

The fundemental challenge is likely to be a lot of cases where:

 A depends on B
 C depends on D

But B and C are in the same file, but B does not actually depend on C.

There are likely many other parts of Samba which link to large things
that are not needed.  For example, perhaps we should allow a build
without printing support, or parsing of the printing protocols?

The challenge is is doing this in a way that is clean, and mostly done
in the build system, not by #ifdef in the code.

Skills in determining binary dependencies, as well as the build system
dependencies (to compare with) would be very helpful in this project. 


Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




