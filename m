Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D31F4EC2
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 09:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mQkwlRxKhcOJe4lVIa1aTgQK1cNjDOfi/2iHpRHkvi0=; b=uGKVKYuFGIM42TCyxqSrX9jsyt
	OZRFBB9+FU8/XYCAVynstVxHe3B4Ruq5WT8xXmqCtKqN4LTXDjDT/1AxeeerUAbpn2P/R52WbJ+hs
	FwpVTC+/A/0TFrPbQV5HEHKnam0iZRI9iySzyHwoUBOqrCjL3gNzqYJY9RoQ5PH50HynjmXSIvU5x
	rfBE5zPMdDlLHzEHIGlFK8IPaB5Q3fLzW6T9TQkZ1qd+SBBKxeB4EkrJYXZux187r4XTYJ87R59/d
	yA7QH7w8gH3v+i2HtW5OmSey8MIjdB8t8t1fu6emWappkAB9rhEHxha2RHBPlbfALjfQ08XGb4gTk
	8mUJYyJw==;
Received: from localhost ([::1]:21178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiv2o-009i2V-JH; Wed, 10 Jun 2020 07:21:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35720) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiv2i-009i2O-OO
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 07:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=mQkwlRxKhcOJe4lVIa1aTgQK1cNjDOfi/2iHpRHkvi0=; b=GQrsLA9/dhdkF9REFuuyGbUTq7
 9Dk0jrZLFZBSDqFjGODjt6QJXI7e/9leZl0pXAz4d6K6dMp4VwJvfN7dBSkKQhs53t14gkIfrwzlm
 jDky6b60Hqr13BslB76pio6swPY9kHwHzVFo9ZNJfwfSerInmlCd1lfVIkm/ob73IMocH4zpteueT
 bAuOYNrEGwDJDzEyYQh7ptOQZ3h2Wgvgvoetp5yBLK5hbv++IAY+vwwFi3D+7wLCAgpU6VyLNjpAb
 lLfv9CgqMQM6WzejvEjOpXMe87TEgmkQjvJZWWCZg0hA1VzWl57qanId1ShaQak3hu8D7y+LKelf1
 3zp4TRqAFBMUnj9sYD/L4ZOrW5Ve1DNfUgVm6RhtVu+sB9ApzvWVzO8zIzGEof9ieUOiMCRj9bTcM
 VOO3xiMcjPd1XzLnt+9YevmqJ1UMjN3qOtFG7y7kGiRHPX4X2rGTP1wc5iQCNdOrJgqH/NWp/EAx5
 jR4VgnhvEs4XqFHtUvjcd/zZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiv2e-0005RV-39; Wed, 10 Jun 2020 07:20:59 +0000
Message-ID: <25b13c121d4005bb7c2ea0b3666b83c2fc58cb9e.camel@samba.org>
Subject: Re: git signoff+ and review+
To: Uri Simchoni <uri@samba.org>, Andreas Schneider <asn@samba.org>, 
 samba-technical@lists.samba.org
Date: Wed, 10 Jun 2020 19:20:51 +1200
In-Reply-To: <e9fdcbc4-2e49-5c5a-688d-6679e64c6e95@samba.org>
References: <2070261.IvKQ8U6GgO@magrathea> <3376401.t2CYSfcsgO@magrathea>
 <d964391f79cd21db4b1c4118ab62909b6ff9717d.camel@samba.org>
 <2202468.ZbZBhtArCh@magrathea>
 <e9fdcbc4-2e49-5c5a-688d-6679e64c6e95@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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

On Wed, 2020-06-10 at 09:28 +0300, Uri Simchoni wrote:
> On 6/10/20 8:27 AM, Andreas Schneider via samba-technical wrote:
> > 
> > I'm not sure how you exactly want to achieve that. Please educate
> > me and then 
> > I can help you :-)
> > 
> 
> How about adding those scripts to Samba, and adding a "samba-git-
> config"
> script that would set them up (and then the honorable mentions in the
> wiki and/or README.Coding)?

When we run ./configure we already set up the 
.git/hooks/pre-commit for the whitespace check.  What I'm suggesting is
that we get a good agreed set of commands and install them on a per-
repo basis using git config as aliases. 

Then we can document them (of course) but even more helpfully reference
them without major qualification from our wiki, README.Coding, etc,
because they will always be ready to use. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




