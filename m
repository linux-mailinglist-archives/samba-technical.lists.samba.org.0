Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D133BE275
	for <lists+samba-technical@lfdr.de>; Wed,  7 Jul 2021 07:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3VlRVIARtp8S1pD0Dli/LEjk2vF1qwDnEZ1mCd+54HQ=; b=apOcEO/mHlHLlYLYp9MCF/oDLr
	Ay1Z4nyjEBu96NoLVlcKleWiZXbKYZx1g71ldQfs1i2K58W99tYY5tZswKPeEp5jgf67xh05J9E6K
	D172OE5MV8ULwrzkKA6x+57PzQYV5NXBpkVolu9Gd+pqIVNj/o6aF0D5QIpl6z7gAkn8aAK32nBij
	4ecxRd0tFyNRBCYkpduwtY2rCVTG3OKZd0Am0hBACjdPAr2aKzfTq0kZD3bDKblIXnQwnubyptEFg
	WOqTnCEBQNQ9Wb7Ov2vS5YRdLcVLKadUvYMLFeAKktsnPBX7DseWKrnoOG8iDkA1j/I6Szee3kl58
	TJXrtEow==;
Received: from ip6-localhost ([::1]:21116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m0zwS-00Cafa-0b; Wed, 07 Jul 2021 05:17:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50832) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0zwK-00CafR-DL
 for samba-technical@lists.samba.org; Wed, 07 Jul 2021 05:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=3VlRVIARtp8S1pD0Dli/LEjk2vF1qwDnEZ1mCd+54HQ=; b=waPlXn2y361mr43EzzL+SN7z4O
 Wl7Aa36L0nUiTRvg2cW+b46pjLIrfjvrq08CS2IqwluZDRGGygxL0ncpIIsn+S6dlyF2ny1yBvWu+
 yLB2s4xaH0HPNSZp7pGBs9fjNDduss2PtVa3MbPnOGW2uKp3qHquPon8u/Ak2Y5bXFkbdsRfmjQwH
 h3qGkWRtcvy7MLiiNVZ1hCUjo4qjCWcM1n8+7GRckePguJzH+7PsOZMZdRJSzecy+wFRsgtB52VUE
 kTFOGkVox7rx0YdDIW0xPgylQAtT1r8YE/OlLdEzS3HpKLLPDfGquvQIGa2CppXnK2U+R6YtfUtRQ
 q8HsqBcsCQJScl6MqZaapN5hS9RZFGQR41RpUxwW4nYDeDoc6c5AZgLnZMl1FkcalyLQ5i/wpmGMt
 432pOt4x9Oc32vN2W+LkT+86BKZHn4+fenWHDxk8B3ZuOvTsNF/FnnTI4PqfSa9Q5nmKYH7Jl6pYv
 mmnu51EUEjQyIbCLZzEdM7wE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0zwI-0002Ch-3x; Wed, 07 Jul 2021 05:17:38 +0000
Message-ID: <51a3669329b66c91d4306b9e6ba6024d08ea59be.camel@samba.org>
Subject: Re: git signoff+ and review+
To: Uri Simchoni <uri@samba.org>, Andreas Schneider <asn@samba.org>, 
 samba-technical@lists.samba.org
Date: Wed, 07 Jul 2021 17:17:31 +1200
In-Reply-To: <25b13c121d4005bb7c2ea0b3666b83c2fc58cb9e.camel@samba.org>
References: <2070261.IvKQ8U6GgO@magrathea> <3376401.t2CYSfcsgO@magrathea>
 <d964391f79cd21db4b1c4118ab62909b6ff9717d.camel@samba.org>
 <2202468.ZbZBhtArCh@magrathea>
 <e9fdcbc4-2e49-5c5a-688d-6679e64c6e95@samba.org>
 <25b13c121d4005bb7c2ea0b3666b83c2fc58cb9e.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-10 at 19:20 +1200, Andrew Bartlett wrote:
> On Wed, 2020-06-10 at 09:28 +0300, Uri Simchoni wrote:
> > On 6/10/20 8:27 AM, Andreas Schneider via samba-technical wrote:
> > > I'm not sure how you exactly want to achieve that. Please educate
> > > me and then 
> > > I can help you :-)
> > > 
> > 
> > How about adding those scripts to Samba, and adding a "samba-git-
> > config"
> > script that would set them up (and then the honorable mentions in
> > the
> > wiki and/or README.Coding)?
> 
> When we run ./configure we already set up the 
> .git/hooks/pre-commit for the whitespace check.  What I'm suggesting
> is
> that we get a good agreed set of commands and install them on a per-
> repo basis using git config as aliases. 
> 
> Then we can document them (of course) but even more helpfully
> reference
> them without major qualification from our wiki, README.Coding, etc,
> because they will always be ready to use. 

Andreas,

You have been doing aweseme work making our repo 'just work' for new
developers with things like the editorconfig file and the
compile_commands.json.  Is there any chance you could look into this? 

We should be able to set these into git with 'git config' of an alias
or three during configure.

Could you see if that might be possible?

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


