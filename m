Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974E28FB05
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 00:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=T7ahrXrYTtcdJwG9OI+d5cIqObNcG92msS+cw2XOzq4=; b=IF55TYXs4iQ5ZyO/a26BsTTvmv
	50abwBbstJJLMZLsPzjaBUMOo5iplyz+pL/qFXwvFqfCfYY+z7ER+4oqdd0qI5R3UzKAZXzRgw3Ym
	x3/ViHEWeiuZA2Wpptlzmy7jR1IgxEEXaq+iCttIasdrvVqvcEvbIHRaxResMGWQMjGcfZbNmBSLx
	dBZrxcrOOeuD/Y1bisUghNlSk83r0wbIaYruVvmyymFALlaEMu+EKdqiElD3YbanpnklebX+54ioX
	Dqdhe5Fr7A3Xg44Xn7FojyZme5r9eTSfMuXzqo5xatSuBKp0WSuhVh8ZPVnLDwV01bVrf6vPMQR/4
	WS5jtX4Q==;
Received: from ip6-localhost ([::1]:26014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTBNF-00CLHN-FK; Thu, 15 Oct 2020 22:05:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42788) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTBNA-00CLHG-Vq
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 22:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=T7ahrXrYTtcdJwG9OI+d5cIqObNcG92msS+cw2XOzq4=; b=PzmVQIvRHZeF/2LeWlHug/47fQ
 WNr75JjrsJ/7sMDwXughWNozSQ4APBKo/rDDbrCpOuNDdY8BUy9noWPUbYL2M4q96wNKLVdR6k/sv
 zttnDQXIYJ/D7+IJWZkzKAtUMyHgljjECW3HvIt6cI1UJjXoj7j6//ynatc1+AaZBlKOEC3XICCsN
 RN4xssfARTIjmnOAsMuK4U/ANGskccykSQC9WmwAjQgSopnr4il+H1fjIVxNQivc+p5EUdDuJlBSM
 TqULyijJarhMuuSLGwNXW+KvvF/IgZM17xBwP5UBttORhX2NCpnfnluDUQm7E/7k7xnGIN61spfbK
 xKfhVePATX5t05tLYfKKXldTqN4rTuwPD7JNYJUaaWu4XB97HcMG854Wo35ccbV3GHE3IYWSTekHh
 mBUH7GMcxOsQgTS/oaxFLLGcHgzzHvIpH4VIcXShILwK5gqQZRB+rdDlZGmf5f/CMzKmiV/Borh+g
 AjKjUM2/1RsjV7og0/uwR++G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTBN6-00051J-5x; Thu, 15 Oct 2020 22:05:17 +0000
Date: Thu, 15 Oct 2020 15:05:13 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015220513.GC3852671@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
 <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
 <20201015193751.GJ3840862@jeremy-acer>
 <d6681d5c508524dd97b093f332e8cea818cf1a3c.camel@samba.org>
 <20201015195534.GM3840862@jeremy-acer>
 <96555a46-20a8-48ba-652a-5bbbaad67f80@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96555a46-20a8-48ba-652a-5bbbaad67f80@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 15, 2020 at 09:07:26PM +0100, Rowland penny via samba-technical wrote:
> On 15/10/2020 20:55, Jeremy Allison via samba-technical wrote:
> > On Thu, Oct 15, 2020 at 03:45:22PM -0400, Simo Sorce via samba-technical wrote:
> > > > Personally I think we should just add the CC-By-SA
> > > > attribution and be done with it.
> > > I'll let you argue with our counsel on that :-)
> > Fair enough - we should always do "What The Lawyers Say" (tm) :-).
> > 
> > I don't want to change the text though, just the name
> > if we have to.
> > 
> > How about:
> > 
> > Samba Developer's Declaration of Origin
> > 
> > "Declaration of Origin" is IMHO more descriptive
> > of what the person is doing, as they're just
> > providing a declaration here.
> > 
> > Thoughts ?
> > 
> If we must change, then that is as good as anything, but how about dropping
> 'of Origin' from the end ? This will stop Simo from wondering about *I* ;-)
> and it says what it is, A developers declaration.

That a great idea I think !

Samba Developer's Declaration (SDD).

is short and very different from DCO.

