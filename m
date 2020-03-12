Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B40182B96
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 09:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=EVTseirLQZ0+h9koP8JFvtt40lRfr/TKrAAx1hf3enI=; b=BY6svcuJ3QrWO4/chDytDLpbLp
	VEHBFMMgwLJ68YX3bxwv2fr7ba3mOptyfuajrLl4u4hynmd62Ro3P//eFL1q5YiWJwdujzKVZN9qD
	GBa6yEpnJjYwpQILD1PP3g1SNvK4v1XmfYWLKLfzplKQSVM9Rq6PGc2cwy+z4VQtjNjcw9gZVnk22
	J8mpL+DyBphG52XUBocpmbjhKCvI7xLNnT9FNrUpgRhxyYfzrKpfOrdzTzLL4+xS19pn3yCBwI4zG
	I0xWwjzEyLTVAFqt6nQgBI6BGjEoKPWfZIQXf0TubiV/e8e9lMNtn4lvLAMQx6y/uQ8Ft6yg6FQA8
	CdxX6saQ==;
Received: from ip6-localhost ([::1]:38060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCJa8-00Ftul-7o; Thu, 12 Mar 2020 08:52:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62896) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCJa3-00Ftue-CB
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 08:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=EVTseirLQZ0+h9koP8JFvtt40lRfr/TKrAAx1hf3enI=; b=ZVWH2yNKfC1kgUbou8wfoN/mkb
 xzWi/SGB2BYVJ/C8hRXKduc3T2h0vGrNs3KFv01MBocyWMoqi5zIb0/JzUnJvoH585jdbyoB6k7Js
 pdx5QzGx0a7eQ2WE8KV4AtwTYHG+qyOhklgHezM20Z3IPsvK9iJ64dsD/t3e/DEG3tmWFhOVO6EX/
 SwG5yypyTdKetPI6oSdn+kM8/73OU4SW2BaJbwOvXXbfj0gFwQDAHV7V0z1xJfMuaEVujM9bg0whE
 l4+uvIRzo+PSyj5/2E1wzlOKhzTaSVF1cO8cKmlITRhleuanQC7SBIsQXSkWcX77LBlBRZfQbCLCe
 0E4EseviYS8d2m5YKYsd8Kxq/wcgkTeMrxn8HfaBnHAZO7L8hOS3xp227PUOFih9Dj71PrsyoDsCl
 TZxRLjxqyAykQUN1gyblIk/yOJApYXb9+ODbvVWJkCbAf67TnC/fUMfuwEUophUdgxwZe2ZGHh75i
 viJa0bN2LC3XLu013qYZn+7n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCJa2-00044d-2Z; Thu, 12 Mar 2020 08:52:38 +0000
Message-ID: <939198702b7086a3194077b8ef1b6b244a99fcf6.camel@samba.org>
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
To: Alexander Bokovoy <ab@samba.org>, Andreas Schneider <asn@samba.org>
Date: Thu, 12 Mar 2020 21:52:33 +1300
In-Reply-To: <20200312065506.GN2735275@onega.vda.li>
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
 <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
 <38643263.Z8vMgeSRLk@magrathea> <20200312065506.GN2735275@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 William Brown <wbrown@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-03-12 at 08:55 +0200, Alexander Bokovoy wrote:
> On to, 12 maalis 2020, Andreas Schneider wrote:
> > 
> > Yes, we can drop them.
> > 
> > I think we can also just run the latest Fedora version (two versions when a 
> > new release comes out for a few days). We have CentOS which provide old enough 
> > distros to show we still run on that stuff.
> > 
> > 
> > Alexander, what do you think?
> 
> F31 and F32 would be perfect. They differ enough (different gcc,
> different Python versions) to catch bugs.

That makes a lot of sense.  I've got what I proposed up in a MR, but it
would be awesome to build on that and move to F31 and F32, because by
the time master is released, Fedora 30 will also be EOL, so no point
wasting CPU it keep it building.

Can you have a go at it?

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



