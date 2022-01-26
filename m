Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8E49D151
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 19:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bHDJS+Kuz5HO6+xvaLLpkRSOuamZUX2cEyE4WsIHLnM=; b=zeLUsXgboRJ7s5XLe6cmFun9Ys
	FaiodRJp2vd8wc42RQBYPeyUIevzQzEwI7mv6i626ww/DFyT4JvLwXKXDilfhGfDlf9mxn3Txgauy
	B8qWyZD+jhs70GonFDxnlCySuM/pnKwX1im3AcvpodshfW1IU9qbnCZI2vQWBQatzbVF2rmHVjRyh
	WNITjgEdyoHgR91lcjXAnh+tBgWxKE3/cr0+tJmeF9a3eDX8WM81vLC7rkn4RDjr81Uq06VwzoGqE
	v9VzwdPjODMuAWlwoDveQaEjkhJppmd2vo4SVpBWzbnJNA2QYxR2Y4lqkZLu7N0crFaWxHL+CyIvw
	8GhpPuzw==;
Received: from ip6-localhost ([::1]:19528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCmat-001A1w-Tp; Wed, 26 Jan 2022 18:00:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48386) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCmao-001A1i-Dr; Wed, 26 Jan 2022 18:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=bHDJS+Kuz5HO6+xvaLLpkRSOuamZUX2cEyE4WsIHLnM=; b=zi76AWSjipQvNqVNH1HjWgpwEa
 2WL01qnkDDrwhSVmRH0ilJrTbuxbgyk8Af8rd1SgQ7UU0X+PHqLAcGxNxwQEkxK24tgSRG5kQMmgr
 oswhv4xaXohpkuZ4OCjg3W6fPBg4OKwtScX6LK4cdxca6Aymz+C199dEj/J9CzRHlvV97DgXVZBJj
 GlSAKK3ECYhaILtr7CdNBOmUrJJD+84zAB0FbQB8wBZXx3UIgTcNxhW8iwwBQYc800rTu9jospyBC
 Ht7CZEhy0qaQ0ZLkRlPOYnMsOSsJ0D4nPZjrD6Pt9v+cb6cradigokuCQfSlmKQ93JBVe5yLNwqhG
 VRfnM/3EerGtCUBEeo5l7M46dJFF+idqcbsLDaK7pqJrgcwcSluJxWvxeeu1JSrqeNBFNFGfOjTyY
 pSkeEJJSKy3xDwjhmkuWhh1B7xDYVpXs5vQNB3x7c6gLqbw5ocpVRGGFvoXRY5s0jos8I/rT01sYa
 DkeImE330AGDv8pcxeREbDCz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nCmak-000khp-TE; Wed, 26 Jan 2022 18:00:24 +0000
Message-ID: <9df52f1eb4b6dbda5bc6c63718c28793124c7c98.camel@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
To: Jeremy Allison <jra@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>, samba@lists.samba.org
Date: Thu, 27 Jan 2022 07:00:18 +1300
In-Reply-To: <YfF8+OMLV0UkzicQ@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <20220126115058.GA936420@sernet.de> <YfF8+OMLV0UkzicQ@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2022-01-26 at 08:55 -0800, Jeremy Allison via samba wrote:
> On Wed, Jan 26, 2022 at 12:50:58PM +0100, Björn JACKE via samba
> wrote:
> > On 2022-01-26 at 16:50 +1300 Andrew Bartlett via samba sent off:
> > > My feeling is that for the Win9X and OS/2 irrilplacable
> > > industrial
> > > equipment case, that guest authentication would suffice, combined
> > > with
> > > 'force user' and 'hosts allow' for 'security'.
> > > 
> > > What do folks think?
> > 
> > my gut feeling is that many users will be very unhappy with such a
> > change. I
> > know many setups where the clients say that ntlm auth is still
> > required for
> > them and where guest auth would not be an option. Even on AD DCs
> > sometimes. For
> > sure on member servers.
> 
> Correct me if I'm wrong Andrew, but I think Andrew is not
> thinking about removing NTLM, but only the storage of
> LM password hashes.
> 
>  From the "lanman auth" section of the man page:
> 
> This parameter has been deprecated since Samba 4.11 and
> support for LanMan (as distinct from NTLM, NTLMv2 or Kerberos
> authentication) will be removed in a future Samba release.
> 
> Removing the LM password hashes gets a hearty thumbs-up
> from me :-).

That's exactly what I mean.

> But I may be miss-reading the original message. Sorry
> if I'm just adding to the confusion :-).

No, you got my meaning perfectly.  Even for Win9X there is, from
memory, some strange update to make it do 'raw NTLMv2', instead of LM.

I really think we should be able to ditch this, ideally across the
codebase but certainly in the AD DC, in 2022.

Andrew Bartlett

--
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


