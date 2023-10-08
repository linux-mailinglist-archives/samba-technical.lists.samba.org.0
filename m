Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D667BD0F6
	for <lists+samba-technical@lfdr.de>; Mon,  9 Oct 2023 00:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=wsEt4JlV5ZSopNUnaALBQj5vyGo+/8Tl6xrKjPlhRAM=; b=Du+O0yGdGDALlDgTl9/AC0YPKS
	1Q3MwVhvu0CXaARPCxpGYRQU90VPxW3ftqvRqxnKgadpekAYvtrI7U+oWSTlJoce+Y0vE9klWtxtY
	IKyhkxHNZ4/TIXDrKOfluHLEwC7Vm+c22VpNJATAemQqZuRmdigDl1Apg5FpQ4b/VsSYQu0RgRZGS
	KDu1ATHYUPfJTFiw8JqlUJaZ+rBBb7bhUnUvQVHi9ME2M+042KCcfnh6tsrAhu686ssn0A1JkJEJt
	Bet/dbPtIdOv6jQkrBpppdx3q5Nu2dKME0gTUYGXQorvFQsf0KBZwld7/TB0TG6SZHdgSWbWqlZUC
	jGQw28Yw==;
Received: from ip6-localhost ([::1]:54436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qpcPt-000cOv-QA; Sun, 08 Oct 2023 22:38:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58650) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qpcPp-000cOn-Di
 for samba-technical@lists.samba.org; Sun, 08 Oct 2023 22:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=wsEt4JlV5ZSopNUnaALBQj5vyGo+/8Tl6xrKjPlhRAM=; b=D4nw1roS39VIj/zOb2hX0h2712
 pCo8/U8ScoP3dh4ySxE/VrCeyj4K2Y3o/XOA2zE4rUsbim3vV9R3BZda+I74/zOMpZXQnHtfXLmAx
 QxQFuAsSidAZ3mOEtAd/XmcX1gVLvlqQ+ZACjhuBuTlxh7Bw/J2oNsNs8I5T5eGuPoaWYrn8RqeA5
 M5jVkU2Wz2tf+WLmF4JRXfI2C3aC+jo2hubJFHm9d+VdTZQr3JoOcIP3o9DbBRqC/Dot4JjM94mR9
 QqBrITa58pkmdAhCW42K3SOXQm5QESO1JHQnyM8uagAjeKlPv/f4H+alOYyPTZblufs+0SV3kR/zQ
 PUtGZ7eOtFBX5zMihReNjVrU8fZx+tUAd/AI2NAlloV7YpOEyH3AMon0So0t5EcIE8lzfb8NZQrwz
 5xv/N6vKvLnho3O4UHMkdgJONTtotnYaKPWNr9Qzo8ycL/984dth8/KllLPMwG0FY38EGu6VhlMsM
 BUICX+ldQ58Jg+bPWS2n8P+A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qpcPn-00HMPi-0G; Sun, 08 Oct 2023 22:38:23 +0000
Message-ID: <e6dbd15651f0948d77befd3260ba3347bcf016bf.camel@samba.org>
Subject: Re: Authentication Policies and Silos
To: Mikhail Kupchuk <mkupchuk@inno.tech>, samba-technical@lists.samba.org
Date: Mon, 09 Oct 2023 11:38:20 +1300
In-Reply-To: <8d501af6-e10a-474e-80c9-ff9682a30013@inno.tech>
References: <8d501af6-e10a-474e-80c9-ff9682a30013@inno.tech>
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

On Sun, 2023-10-08 at 22:25 +0300, Mikhail Kupchuk via samba-technical
wrote:
> Hello, Samba developers!
> 
> Our team and our client are intrested in implementation of
> Authentication Policies, Authentication Silos and the rest of "using
> claims for access control decisions".
> In 4.19 release notes you wrote "we continue to develop these
> features" and I see more and more new commits related to this
> functionality. Therefore, I conclude that these features are in quite
> active ongoing development.
> 
> 1) Do you have some time-plans for releasing them?

Development of this feature continues apace, and they should be in
'Samba master' before the end of this year, hopefully in November.

> 2) We have a development team and could take part in development of
> these features. Maybe we could sync and cooperate somehow in
> implementing to release it faster?

All Samba users are encouraged to, in testing enviornments, take our
'git master' and later our pre-releases to test out new features.  Real-world feedback is always a useful thing, and any issues found or just poor ergonomics can be discussed here and logged in our bugzilla.

That would be the best thing that can be done for these features at
this time.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




