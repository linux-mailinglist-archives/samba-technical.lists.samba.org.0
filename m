Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E918F522483
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 21:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QGN/m/rki9fknIRov76ALaSH1yykOW+vH3Eq5oIRwkA=; b=XDY6+w+E8iATB4AVz9SFHwRACl
	yD4DCfuV+xwS1O699VOrZPiPJe15HtxEE7qyJXVBSCHtnAjenVYO/c9e8CDsBkptWyadxnH3uOgHH
	vHPtaoG9YQT5iYqDTmWK9pH0LIuBw940NvkI18EoQxxamD9H2mH6ByKwv1q/riWPQ4XIZYBmxzf7+
	rdEFJ/lLpD1/RbWdGLp0T381sS+cwPwtCkE1xd9SF295XC4n+mttrBrKqQwbIzsM9fzzwbKJY9Gbu
	lpXNee0PPA4NwEdVwSstzSJE16lejdRDnTMoUo53XRO0YTmLSaCKXbtQcp8oLXaAf+U6AHlPCdvQN
	emd1iwGg==;
Received: from ip6-localhost ([::1]:19772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noVCI-000TG4-0Z; Tue, 10 May 2022 19:07:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noVCD-000TFi-7v
 for samba-technical@lists.samba.org; Tue, 10 May 2022 19:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=QGN/m/rki9fknIRov76ALaSH1yykOW+vH3Eq5oIRwkA=; b=OLRsudJoR+ixryxXPybtbSUOvW
 qjNs1P41Hk53Lj+drxRhSuXXvfYwNzFjYRfyJcS4I312Fbr6yp7V0jws8N0arCuDpDboFGcSwCdyM
 VQF26mxfmYLsAaD/zxzk5/cXIMdQSp5pMhHI/YQF85xNBMtMDUidLUc+tiaeRnDx1kRoXtogzBWnl
 aPeQ5O9Kq8pc5EBfEyNgYaXx4RLlLrG+sf+4v6LLl4H7l8o2DIrC2vIILM2YpkeRYC4LVjBPONHlh
 NfDHeJRUu8L9w1jFmzreAOFo0B93ztqBXWstfiqabeENhDiAvBtzR0iyUPT64BjIy5n1TamFR2Jme
 BHUgOO274mk8I+iL7sBgQbNeI7FfCxDQmr2PvR2emx7yavqqNOqkOx6e3Zm0SjrGZWNu7uSLWMM0Q
 xu1x55ihR8Puo0+r5+TlQn2hbZ02CRjRM74kpJq43RwxHeuJ95f0maaZcLI08gFR4LQchvj6toltX
 51EuMX5nsUc8IjfYwm/UefQg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noVCB-000Dwl-En; Tue, 10 May 2022 19:06:56 +0000
Message-ID: <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
Subject: Re: Can someone try buildar for building our bootstrap CI images?
To: Ralph Boehme <slow@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Wed, 11 May 2022 07:06:49 +1200
In-Reply-To: <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
 <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
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

On Tue, 2022-05-10 at 20:02 +0200, Ralph Boehme wrote:
> On 5/6/22 04:57, Andrew Bartlett via samba-technical wrote:
> > I'm more than happy to answer any questions.
> 
> afait this shouldn't be needed given podman can be used to build 
> containers in rootless mode and gitlab plans to support podman in
> the 
> future as pointed out by Andreas, right?

Well we can't really wait for the future, the need is imminent, unless
we dedicate our entire GitLab.com quota just to image rebuilds
(possible, just costly). 

> Just trying to connect the dots of the various gitlab related
> threads 
> we're spinning...

Yes, I need someone to make that work, to demonstrate (with patches) a
rebuild is possible without the privileged docker, up to and including
the upload of the images to registry.gitlab.com.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


