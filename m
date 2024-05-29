Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D38D3F71
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2024 22:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=f3PIUDQgvq0+WtlAoSBPR0cwWlMqEnY7fCxgcHUSfCg=; b=Thz/gZDQPVy2pzw0FFYijWvgQD
	an1wHQcCSWPxJxbr7LkoXDgvZTkm3N1gJtjausoWZhV0tUPLSrbUMTzG0LL6bwbE5xXCdZNk0I0fl
	5vPfKEYcK6TKE8I7o1RExf8W6q6e8+0Sn6Hewelh8F8nKtgRkEVN7agVN3CSnxBIzC+BXVVPMCUBO
	51D9vH1o4IYobfDgWf7L3wngIN5dxT2JShWRVHjjuDzeEni13Eamrd/vMP2v1EoGe+J9tqT0n03na
	PDRJkKM5XF/iZ7YlDwznMwRIH7mX6ObrUyaSeQ65yTWlXlKeZK1RZ1nMVGZ+gqeuCAFTTj6dM5ryl
	Mp0UH52Q==;
Received: from ip6-localhost ([::1]:36892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sCPi5-00AFat-8R; Wed, 29 May 2024 20:15:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51248) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sCPi0-00AFam-Q4
 for samba-technical@lists.samba.org; Wed, 29 May 2024 20:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=e5smYACJQQ2jCq20dn1ziGu5TU/Vb+ZeK/+n+CEO6sU=; b=ENEWVaqXhHgCPNPct7dcqlZGPG
 3br/iN1NMM94k3mgzu6k+qAZaOjHjb5xWKZZXPjVESbpMk/TFSUG7GhQ44AWjYcXcxmm6TF92pwGm
 WRBN39d4nNKR6mIWDkI3quvBvTMsehW2ox5VjrhnfQ4HgdC557XeZlnRIZUx8DTOpAIq4QOmzMeEM
 17qgTq+MPKcJ6VsTxKGo6GK6DrTctyQj+2ix/+4UGJtI/OzxQDEkdPzGWFaPVFgVcKz1iCts4fFdw
 LJ6HpuZlRbBiDs8wbq27sczyzI6y7WVJlbi9CjaGUAd9MtCOTvuag8PySLjrRovmDaHWqoA39V4MV
 L2aSSTem2Ue/ZaYtgIpKHj0TQsGiV1JsoIP1YdgaaviVCp4aiP9y54T6exhD4xVkucTtGjZobbxPS
 M5X1E6ixx1IAFC4hJepJlPCGOvYSxez2WNC2BB06bIVRF7AgSlRWvGET0HBWtEK6U+Onbl3xO87JE
 rZwBSOIxUUpOLdgrGdqBqdCc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sCPhz-00Du9L-1e; Wed, 29 May 2024 20:15:40 +0000
Message-ID: <334c05e76191020d5d1efbca0575822dd16bb2fb.camel@samba.org>
Subject: Re: SAMBA_VERSION_VENDOR_SUFFIX in VERSION
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 30 May 2024 08:15:34 +1200
In-Reply-To: <5dc54a9b-9a65-4dad-afa0-fa25d684c205@tls.msk.ru>
References: <61470965da3082bca8589558676204b96164dfaa.camel@samba.org>
 <5dc54a9b-9a65-4dad-afa0-fa25d684c205@tls.msk.ru>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Wed, 2024-05-29 at 08:42 +0300, Michael Tokarev via samba-technical
wrote:
> 29.05.2024 00:42, Andrew Bartlett via samba-technical wrote:
> > Kia Ora Samba packagers,
> > I just wanted to ask nicely if you could fillin
> > SAMBA_VERSION_VENDOR_SUFFIX in the VERSION file when you
> > buildSamba?
> > Debian does it like this:
> > https://salsa.debian.org/samba-team/samba/-/blob/master/debian/rules?ref_type=heads#L163
> 
> That's an ugly hack really.. :)
> It'd be much better if samba had supported a way to specify
> versionsuffix at configure time on command line, like, for example,
>   ./configure --local-version-suffix="FooBar-432" ...
> or something, like many other software packages does.  Or at the
> veryleast, by specifying it in an *optional*, not included in the
> upstreamsource, file.  Changing an upstream source like this is the
> ugliesthack debian samba package now has, I'd say.

I'll see what I can do.
Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
