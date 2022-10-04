Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C585F3B6E
	for <lists+samba-technical@lfdr.de>; Tue,  4 Oct 2022 04:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZTCv6QtprZ8mr6PzWuxLTL9ff6huqUYE8IQi5iTW2Nk=; b=dk9LqD+jHelJAtNPTd9BvkvPCh
	MwJ0XAjqfYC5RWYuWsG1gCiSDywH1f68zmQFJDTfIzWUoxb7SPgcnyDr+AKJlfOPk3ZXYK0Mvtt3d
	xZ7ATCI5Ji1dOBEFqvXgMm//o0VDMF16rqGQViuaN08DkzZqjhKqav++a7aoSIX7Gfhvzespka91l
	dn0zjMc/V9KXOO1neJSel7BM26UEInDz9lFhvvYQlfRSWkTbau0IJ2pNz/OJGaQszJUpRHSS5zoiD
	CpTraZ2ZhI6wSmNIjwJgJ/xNGEK1Tt9m8WryHWUiO9VFWQ3DKx/Z6GJ8KsqVzpcsuWHL+yH0Dx95D
	raxM23aA==;
Received: from ip6-localhost ([::1]:24868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofXmu-007nC9-HC; Tue, 04 Oct 2022 02:36:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofXmp-007nBz-8t
 for samba-technical@lists.samba.org; Tue, 04 Oct 2022 02:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ZTCv6QtprZ8mr6PzWuxLTL9ff6huqUYE8IQi5iTW2Nk=; b=lWMmYNHjHAiKysjBLHi5SJY2Cp
 2h/YOqX/Uo6YvY/0TyMtdAxbYfAdkzcKaE9Jvg15oy7BpeCQZOty6pyH3Sjah1ZPRkamtvoAodPoq
 LuO7gw1ElP2VO9wf2U2jJAfsEIG8hgkL07D9W6hoDczOfLhE5HSRchHGEj9oGfeXmKd2WI3W2osKi
 wzgOayLM7Anbtq44qdzCAlBrMHWN/TVd4W0B3xrPXtBieWh7G8Z8r8Dhu3pKbi51AaqepCGXxaa51
 SfttCEEoOAQ0ouM2cx4urNsUTSg23aAfes5koJ1aIFztgLeDhQd71sEVQKxSEqy7QYLTRfcFKzwtH
 2XwvhoinC0fW+ijY5cPWARv8GH+2ymI1srfydvjNWbn0UqS1BWQ+/FgTeub5pl6qR30xteADYSUvV
 23mFja/nDfUvd8YkaHAEi6KEG5PHEKAF5tn8NUFVb7QXmpnybBnd+ZkEpyMv6UgVRvdzLpcsvD3xL
 TGWJpSXW645vKW77rcWWdumZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ofXmn-002uBk-2y; Tue, 04 Oct 2022 02:35:57 +0000
Message-ID: <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
Subject: Re: How to detect a client-closed connection during a write from
 our LDAP server?
To: Stefan Metzmacher <metze@samba.org>, ronnie sahlberg
 <ronniesahlberg@gmail.com>, Isaac Boukris <iboukris@samba.org>
Date: Tue, 04 Oct 2022 15:35:52 +1300
In-Reply-To: <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
 <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-09-30 at 14:18 +0200, Stefan Metzmacher via samba-
technical wrote:
> Am 30.09.22 um 14:05 schrieb Stefan Metzmacher via samba-technical:
> > 
> > Is this plain tcp or via tls?

This is not TLS as far as I can see in the backtrace I was given
privately.  No TLS functions in the stack at least and port 389 as far
as I read it the netstat I was also given.

> Ah, we register tstream_bsd_fde_handler() with
> TEVENT_FD_READ|TEVENT_FD_WRITE
> and have this logic:
> 
> static void tstream_bsd_fde_handler(struct tevent_context *ev,
>                                      struct tevent_fd *fde,
>                                      uint16_t flags,
>                                      void *private_data)
> {
>          struct tstream_bsd *bsds =
> talloc_get_type_abort(private_data,
>                                     struct tstream_bsd);
> 
>          if (flags & TEVENT_FD_WRITE) {
>                  bsds->writeable_handler(bsds->writeable_private);
>                  return;
>          }
>          if (flags & TEVENT_FD_READ) {
>                  if (!bsds->readable_handler) {
>                          if (bsds->writeable_handler) {
> 
> =============> here we have the loop
> 

Awesome debugging!

>                                  bsds->writeable_handler(bsds-
> >writeable_private);
>                                  return;
>                          }
>                          TEVENT_FD_NOT_READABLE(bsds->fde);
>                          return;
>                  }
>                  bsds->readable_handler(bsds->readable_private);
>                  return;
>          }
> }
> 
> We call the writeable handler (which is non-blocking) when we get
> TEVENT_FD_READ
> because we assume it will get an error if TEVENT_FD_READ was
> generated by
> EPOLLERR. I think moving TEVENT_FD_NOT_READABLE(bsds->fde); before
> if (bsds->writeable_handler) would make sure we only try that path
> once
> and not many times in a busy loop.

How would we then, in this case, detect that the socket is closed?

While we would start processing other connections, wouldn't we change
to a not-busy wait never closing the socket as there is still data to
send but never getting to read the EOF?

How can we proceed to closing the socket?

> And in ldapsrv_call_writev_start() we may want to use
> tevent_req_set_endtime() on
> the subreq of tstream_writev_queue_send(), so that
> ldapsrv_call_writev_done()
> will get ETIMEDOUT from tstream_writev_queue_recv() and call
> ldapsrv_terminate_connection().

Do we have a good precedent for what the send timeout should be?

I can't see any good examples elsewhere in the code sadly.

One option is to reuse the search timeout, so that a query could at
most take 240sec, eg 2x 120sec, once for the search itself and once to
send over the network.  This would give only one knob to change (which
is good and bad). 

In the meantime I'm going to try and mock this up in a self-contained
cmocka test.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


