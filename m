Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AEA55E56C
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jun 2022 16:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=EnxshFvsfD1/LKs114VpO3qcUlmNTZcFy6ATFC6EcVw=; b=3hCwUZUU8EkFkoIqoKSXAKifj+
	fNFnnSgBz4XNT+zCzE62UGziHSJeh4GMJWbAdBF+HkUk4mAoVAlPD3h9SkmHseMtaVJQita571oQN
	5KZh0Ins0XCKbJMw8BjvHzCbWcf/6pCjFXPToO03FbDsAoNqw4N8rrUgqMfMUV2v1bed0ePLLfytk
	qt20XGAgtHH0x+1ry/ztY38tzq/TgeJuwBkPfwqo6Nyd5ujtWlBMco7J3NiE6Y8jPBqOnTNW4hYC5
	wYXqnHAHTdKKW2OtJuN63qkFAYptDnHq8VCfvZ/jepQZB19AK4Y5NCRhCigr3pnF6KV3rczOwP9e8
	pvQe7eZA==;
Received: from ip6-localhost ([::1]:40328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o6CSZ-00DD5Z-6q; Tue, 28 Jun 2022 14:44:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o6CSU-00DD5Q-F7
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 14:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=EnxshFvsfD1/LKs114VpO3qcUlmNTZcFy6ATFC6EcVw=; b=yrzXgUOsJTjsxVSuOHDSU5mnAJ
 j37NrBnAQ7oCAaI0TnkisJstWOown/VWFFB8JvPDd0oTQQJM86EHHOJZxTmTvb6cNq8+6EPl3Mw3k
 XW0ibSF8SwH1ta+KAp5uJSrIor2pd8bWgveuAU9/n/yIWdvCw/8Qc2nWnR00OKPu/VL+3moh54g2K
 M0iw35ywE2ohQgVaBPGFPkgbhG95M1NRneBjZHf6BxSh4gkGppefMjSKzbnU7s6AihTxLqAtUztMh
 ViFU1zKJc5NDK7g3JB9kEYUdUdlv1X6Y6bEei8mrcfWr75ck1kko3y9wCYeLD+Wp7nOWOnD3nkU0f
 lizR7YBnH8nye6FA77xB2O2h/ePJP77bvN7C7aGr22HBzq0Xeopm+ai8GMUxchzpPjlapsdSbOCRY
 ptgRLvzqOesgsZR/+1ih27qGDSgEhlYubOsWXqAoCNYPx2vZibFKZyWl/VYDl3baWDgC0wWT6qiD5
 Hp8ZpZciA30J4LYD57w8hVhK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o6CST-0027vS-8r; Tue, 28 Jun 2022 14:44:53 +0000
Message-ID: <3562f4fd008b9a522be532daa60ba1dbc56266f5.camel@samba.org>
Subject: Re: Expand groups with Samba 4.15
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Tue, 28 Jun 2022 15:44:52 +0100
In-Reply-To: <3459742.iIbC2pHGDl@magrathea>
References: <07c7040e-f4be-a6f1-5c50-80db9f39c101@univie.ac.at>
 <002a98fbfe8742f13b5d975e4db80ec37a6bcf3d.camel@samba.org>
 <3459742.iIbC2pHGDl@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-06-28 at 16:24 +0200, Andreas Schneider wrote:
> On Tuesday, June 28, 2022 2:50:10 PM CEST Rowland Penny via samba-
> technical 
> wrote:
> > On Tue, 2022-06-28 at 14:23 +0200, Robert Weilharter via samba-
> > 
> > technical wrote:
> > > We have the following AD-setup:
> > > 
> > > Domain: USERS: Most regular users and groups exist in this domain
> > > Subdomain: SERVER.USERS: samba server is joined in this domain
> > 
> > I take it, that by 'Domain' you mean 'netbios domain'. if so, you
> > shouldn't use a period in one, so your netbios domain should be
> > something like 'SERVERUSERS' or 'SERVER_USERS', a bit late now.
> > 
> > > smb.conf has "winbind expand groups = 1"
> > > 
> > > After upgrade to 4.15 (latest version on RHEL 8) "wbinfo --group-
> > > info
> > > USERS\\somegroup" did not expand groupmembers.
> > > 
> > > Reason is, the default for "winbind scan trusted domains" changed
> > > to
> > > "no".
> > > 
> > > Queries for users in domain USERS with wbinfo still work as
> > > expected.
> > > Most queries regarding
> > > groups do not work at all (group not shown) or give incomplete
> > > results
> > > (no group members expanded).
> > > 
> > > All queries for users and groups in SERVER.USERS work as
> > > expected.
> > > 
> > > After setting "winbind scan trusted domains = yes" everything
> > > works
> > > as
> > > it did with version 4.11.
> > > 
> > > The release notes for 4.15 state "`winbind scan trusted domains`
> > > will
> > > be
> > > deprecated in one of the next releases."
> > > 
> > > In our current setup this parameter is needed.
> > > 
> > > Is this expected behavior, or should we report a bug?
> > 
> > Probably both.
> > I came to the same conclusion yesterday while replying to a post on
> > the
> > samba mailing list, I was awaiting a reply to that, to confirm it
> > one
> > way or another. It looks like I do not have to wait.
> > 
> > Rowland
> 
> You will never get a correct picture with `wbinfo --group-info` this
> worked in 
> NT4 times but not in an AD with forests and different kind of trust.
> 
> We only get a valid picture about a users groups during login. The DC
> is able 
> to collect those information. A domain member with just a machine
> account 
> doesn't have the necessary privileges to get a full picture. If it
> does work 
> for you, then because your domain setup might be simple enough.
> 
> Don't rely on `wbinfo --group-info` to be 100% complete!
> 
> 
> 	Andreas

I never said you could rely on 'wbinfo --group-info', I was commenting
on the fact that two users were having different but connected problems
since the default for 'winbind scan trusted domains' was changed to
'no'. 

Rowland



