Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65F5BB38C
	for <lists+samba-technical@lfdr.de>; Fri, 16 Sep 2022 22:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=rsk6ByWcAnYLKDvQDQwIbv8GNU24x1xbPg96f+tcQwQ=; b=NftvtgHjpEMWB7QA2jx1w0Ofon
	Rpdk895SL1IPoS3Q7ufD934bJ9Rlz2J68bVF56C9SViMAJ3qhRsjHR2bLbW+XQvbiPmI47Zw1L2XL
	6g1+4lJS7DkjzHp1eAVKkmsnsJq2MKDm0NPjYFv4kqBHRQ8beP71lOlBtihy5fQv8RNLXJk8aSjT+
	DqYQ1RtmyNTlJJIQ0ux/4EBvcPI3j9GoTGf6aUJ3UmF09aUlDV2zYpgqE7xoD78hN4siXelgALbC/
	jJzQVcKFKj+4DKxjp0d57TXKDFy+E9ssmtWgbbVXg5jpt8mBtp4zv50feAl23f5U5T71U8ozdoJoK
	Ig4iAW1g==;
Received: from ip6-localhost ([::1]:46118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oZI1o-0014QL-UU; Fri, 16 Sep 2022 20:33:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oZI1k-0014QC-3R
 for samba-technical@lists.samba.org; Fri, 16 Sep 2022 20:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=rsk6ByWcAnYLKDvQDQwIbv8GNU24x1xbPg96f+tcQwQ=; b=2DqG9KfiAcmV0FrZXuOxGzSaAb
 QtdA8UGT+jTRCPfopNz/633YKDy2ZwJ87jMLthK5QG8EOq2djruD1EUAvT4pB/+AltzEl6P1tYOvW
 LTeQ6bonLdVGBny5Z3X2Cqqs70+1Eabhv5F0CGthe0g5mZI1Sf0PXgh853BA7dYCFoP5eqkwAQJtw
 eEOOLziG18w9kR9IraUa8xA7aCw2otIIGfmFAVG4nGETHfPJJDCQjj5PZpMG/uzMIT8JFROgZpKY8
 KuSrG6bXVbwftsHxOX855fqID4SOIVKaVj0ZktCh/UohW7jz6cUf+NjD1hFvud4bGglNfvdql94Ad
 622/UcIksEgOawGyGyozxALlAkbeQgA6YNvzDF6IGLlgI0I359T0m5HSTbGIr/Ul0oB7j19bVU09U
 r8sbFaXU+BQhriVTTdfrVpu+pF9EecnuSoPaosowvG4maEDlpjW5lecEyxDMgm6KWXNPkukYj6yJv
 a8xk47V7o3eVhjyrzE2PT5AI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oZI1j-000ijk-Ea; Fri, 16 Sep 2022 20:33:31 +0000
Date: Fri, 16 Sep 2022 13:33:26 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <YyTdlsd2ExgX8U9r@jeremy-acer>
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
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

On Fri, Sep 16, 2022 at 04:17:46PM -0400, Nathaniel W. Turner via samba-technical wrote:
>Hi folks,
>
>I'm investigating an apparent regression in IPv6 support in the "net"
>command, and I have some questions about commit
>d882add695bbd5ea03961c08ac2c0380fbf2947b.
>
>It looks like it was intended to improve and simplify DNS lookups, but
>unless I'm reading it wrong, it seems to have introduced the assumption
>that if a DC has IPv4 addresses, all clients will too.
>
>If a DC is configured to support both IPv4 and IPv6, and a client in that
>environment is configured IPv6-only (e.g. as part of a transition to
>all-IPv6), it looks like the logic will pick one of the DC's IPv4 addresses
>and ignore it's IPv6 addresses.
>
>Am I missing something?

No that's probably correct. I didn't think I'd
changed the logic here, but it seems I did.

If you'd like to log a bug and send a fix for this
to gitlab, I'm happy to review and get it into
the supported trees.

Thanks !

Jeremy.

