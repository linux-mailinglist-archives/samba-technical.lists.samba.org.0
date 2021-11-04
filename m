Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D344516D
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 11:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YQjE6PLsxalewzKXUgJzKSRMZRasfzars/1YjiLr3vM=; b=iV9aZO3CKJsxYyO7G5RTAGBCMW
	+DzSL+2nyDsCAgk4WYR76TB5DAb2qY+4+Ce25If5uFR6gKr0dOe9UxxrWgzC3mZn6VKwddcF1Xgpu
	Om4lDkmy0027eInk/1cyv3FZpnwNe78IQkDpDzBHk18n9UHpanzBeSx2prmE2toHgvntFB9I8QAL8
	yj2orrpgPcg2QY1t8FpOQHGOeXqcPzRhWPRoQyUSqcUpmuR0uMPRMF9EC4HOBW92nl71YeP4HYava
	v59opAPzR0iiJFhbf0d34ZtWwfV99ilCnjwfmh9ndTIE+xIV3IeNBnadnJa0hSYdQHn4r/Mi3RXDy
	1Rq3ogAg==;
Received: from ip6-localhost ([::1]:64754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1miZgx-00704a-TJ; Thu, 04 Nov 2021 10:09:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1miZgo-007040-LI; Thu, 04 Nov 2021 10:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=YQjE6PLsxalewzKXUgJzKSRMZRasfzars/1YjiLr3vM=; b=Kc25eCZ/xGH+/wC39GrWqvzS62
 F0iaqB0teHcaGKN1+E2v0bCFdGUGcJ2ydcff5qwt80iBMwFJt/wl4SPiannwgM1I4Ub50RyV1JGty
 MhccxfBX8hQxtO/V2xU7hCoukVoFyZZcPvVXhgy+GEqO2k9cQ1JC/TXBLiJHMyD+n2p3A6sbggQAS
 n6XD9TrShUe848/ga3se4XYl3skYJwal1afWxZ7TvFi9lx/dNgf6UPCDkvZrsvrVV/A7Turps4P/y
 ndRDJU3h/hkswuN6u9THTI9+bAvJm39sM3XeN3RDVIWlr+p9LdnHn3yAbTz1lSbJSTnQKQ76YawdE
 bvQtJ39qrLyQmPnn+xsA2SRFeuC7h5/OO/PE8W20gf5kMATxo1/ltV+JRve0+Tjr5GR6oT+8GXFqs
 bGWgLb6RO85tF3J4nGhEmoGfGMSjpmFwIAwKwK5rzcpwu48GLrfJsRUKlPx7Z57GAZLfcXaEDGZor
 Cv5/Nvn4xhTcEM5tgZeIu4Fx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1miZgm-0057NG-RH; Thu, 04 Nov 2021 10:09:44 +0000
Message-ID: <4679d6b786dabcead76bbd17df4c44590bb027ab.camel@samba.org>
Subject: Re: [Samba] Upcoming Samba security release
To: Andrew Bartlett <abartlet@samba.org>
Date: Thu, 04 Nov 2021 10:09:44 +0000
In-Reply-To: <4a84d9609ae918b8d2a2c128cf378d34a76bd11e.camel@samba.org>
References: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
 <354ffafda30af28036a6cf4f16059086e3051b68.camel@samba.org>
 <4a84d9609ae918b8d2a2c128cf378d34a76bd11e.camel@samba.org>
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
Reply-To: Rowland Penny <rpenny@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-11-04 at 23:04 +1300, Andrew Bartlett wrote:
> On Thu, 2021-11-04 at 10:02 +0000, Rowland Penny wrote:
> > On Thu, 2021-11-04 at 22:55 +1300, Andrew Bartlett via samba wrote:
> > > Hi,
> > > 
> > > this is a heads-up that there will be Samba security updates
> > > on Tuesday, November 9. Please make sure that your Samba servers
> > > will be updated immediately after the release!
> > > 
> > > Impacted components:
> > > 
> > > * AD DC (CVSS 8.8, high)
> > > * AD Domain member (CVSS 8.1, high)
> > > * File server (CVSS 4.8 medium)
> > 
> > Is an AD Domain member what I call a Unix domain member ? Which can
> > be
> > used as a fileserver ? If so, what is a 'File server' ?
> 
> Any file server use case, eg running smbd, but given the higher
> scores
> for AD DC and AD Domain member, we mean a standalone file server.

Sorry for being a pain, but we should be precise, if you mean a
standalone server, say so. The same goes for 'AD Domain member',
Windows 10 can be an 'AD Domain member'.

Rowland

> 
> Andrew Bartlett
> 


