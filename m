Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2926D0CCC
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2019 12:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sw7sLktxoYHtHSSxTOeuhJJ1g5scRNRGMP4Z2I9ske8=; b=gWOpmlJEg0I7jMdkod0MnGdSSM
	ZQD+HCaGkAdPXke96Rm/DYkRfWX0wBzvsMSFut4/4AjzaSO9RcvYQv7PkZUUeF8tE5GVREyNLpvjv
	xy5gFFSqm1PejAQnABcLEhmbqMCLdUYMThq/7/+mDTBX6uuuJRg5RMpUlwx/AaN+XfJoUjSFfLIwE
	nHAbiYBBLU/uSwyR25r7SZHUCwu2XtpTm11z5yRYE5bCeBG3ZKfHxtpjyMsv6fWTsqz6KXbFGZFvN
	yYb8gI8yS2Ymj7FMGOYUlcJdSQZwW/Knt5QlfXoFCEeP9aRZc9WPdhmZcum0HoPkzRM2UX/oRYtvY
	H/Vmn+WQ==;
Received: from localhost ([::1]:64212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iI9C8-002MgZ-Lk; Wed, 09 Oct 2019 10:27:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iI9C2-002MgS-3f
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 10:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=sw7sLktxoYHtHSSxTOeuhJJ1g5scRNRGMP4Z2I9ske8=; b=apsPz5ANk3Xm8CBcNKblRONPHS
 BPHh9ojbOlAxMcbeMPsDUPZrXLI+f8HoCpbaAA78DeWjMb5z8ovLiauWVcX9VdThB+LOOsxV8IpYG
 pdMu1JrOqpM6VoS51aPdqHUYCyzaSGQE9MeI12jOl0GmLpYhv0RlDBdW0dtR+58Qzpn4XTsK700oB
 kDi6uLp92rQUu2Gfn5uxmEROOOac013a7ScvxPVtA9e7AbYBdptOwGTMOqL/Ms3wYTYvuncBs9wyi
 QWTXVn6NAw4BFDdmUoMECpGRotYarVrjGrJDRL9qVrAc3n9q0DfUgiHLHgJ/wgYCPFVe6REKfbVw7
 vC7qphzM1fkPQxj9dphPWFkQugdsgLxnPy1n7mKFUiaQe2XSw+I7JXHnlWBH8yb4zwzZHVGTgbpJ4
 vYypy+MWUVbMMouZVG8KWCh7VGBAxiXkUGFhOA5pCVVSiN78Q7Btj3b+56CH3gKO7tlIIBOY8KMd3
 UusRuqml34GkMXOUxC6eeGns;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iI9By-00076N-Mz; Wed, 09 Oct 2019 10:27:39 +0000
Date: Wed, 9 Oct 2019 12:27:34 +0200
To: Jim McDonough <jmcd@samba.org>
Subject: Re: About adding a new 'winbind:allow domains' parameter
Message-ID: <20191009102734.4xma3n47avn2kaii@aneto>
References: <20191002154202.upjxr3pqii47wt3a@aneto>
 <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
 <20191003163758.xsetow666fudtkxc@aneto>
 <5313918.ZBD0rEVcan@magrathea>
 <7c88bab4-a1e9-e9d6-e720-083d23b4b326@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c88bab4-a1e9-e9d6-e720-083d23b4b326@samba.org>
User-Agent: NeoMutt/20180716
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
From: Samuel Cabrero via samba-technical <samba-technical@lists.samba.org>
Reply-To: Samuel Cabrero <scabrero@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org, Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 04, 2019 at 07:08:26AM -0400, Jim McDonough via samba-technical wrote:
> On 10/4/19 5:50 AM, Andreas Schneider via samba-technical wrote:
> >> On Wed, Oct 02, 2019 at 05:57:52PM +0200, Stefan Metzmacher via
> >> samba-technical wrote:
> >>> I'd actually like to get rid of all this hacks and just trust our dc.
> > 
> > In the past we tried to communicate with the DC direclty. We had a child 
> > running for each domain member. The assumptions we had date back to NT4 style 
> > domain controllers. In the meantime we know we can only talk to our primary 
> > trust to authenticate users and the DC will route the request for us.
> Actually, even with the NT domain controllers, this was technically the
> wrong thing to do.  It just happens to work if you have two-way trusts.
>  So really this was before we had protocol information and were
> investigating it ourselves.

Thanks a lot for your responses, definitely adding it is not the way to
go.

-- 
Samuel Cabrero                       scabrero@samba.org
Samba Team                                www.samba.org
GPG:  D7D6 E259 F91C F0B3 2E61 1239 3655 6EC9 7051 0856

