Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0807820C0
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 01:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6ShT9yJVoBlEQUjanj/aN0qI6sWt+4usyA98MJYsrY0=; b=FyNUdi6UcZiDlb/XXCIaXYascO
	7dxsAz4FaljBn9ZqQGcoETrkzNw/6NNAt/IwwMKkEskaYgF9PgJ5k6u8ksMnnRpwDtDtvXN7X1kVX
	TwmJza7BbAGh9XycQKN7c3jxx5ZBS79FieA/dH8OoY9ajt0/4EgSHSGopZFwvQTCCrPaFJtumRFpf
	dfSSttOhpB1riNAcLqVO2wkWCwWFoAMWLddXuUB7ZOqZtdMX6nfrB3JCNulzrE0jSa7n4lmNDKgCL
	m8CtvhpLMrZOXYaM5q15KocjVYgynK12yjrSxKvY1oQZBuDmF/nmgTMFTvpgvMmqPjFmIG96nUEYc
	QG8SI+KA==;
Received: from ip6-localhost ([::1]:47934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXsDc-00DV5k-Db; Sun, 20 Aug 2023 23:52:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26652) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXsDU-00DV5b-KF
 for samba-technical@lists.samba.org; Sun, 20 Aug 2023 23:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=6ShT9yJVoBlEQUjanj/aN0qI6sWt+4usyA98MJYsrY0=; b=xKA39e/OtNGoWEEswuwmaXPD9M
 6gbWaUibBktjbe8AJpSaYVstR1DbdfmP9n/48w9EVSpdZfjo08NRcCT2YHdtiqZGYbUP4EQpSsOZb
 BuRXgI0ZDb7M6wbplNF+VGFxuEmtHG4Fnzc/RdBFefhgEwUQuWoe24adVP2ZueCC2RmJ8uE1ElV0M
 ixZcGbPL5u08kpQ+VxQcVYa68o8d2aZlTmEHhWGk1BBbZbKAxfOGf+3IdJ7z54G4D2wIOhKDqbIWQ
 PFIHq7fxg27KHT2XKqCU9W6ndIu6THblpHkcpyRLmovZF2ojyvJe5yHBXZ5fU1MH1vW64woWOsfcm
 +TD3ZQdRu5DhA+N5DDmQOiz/E3i6E1L77FsZFXnXUg0QjIbMTLpUflCdwV+FB6ohMfBBhQ02GH8ti
 SAsDcW3bcUMZOquspleJ7cOdeLdVEJKxmzdElN7IxAlRGfc0rINx+ZsL1IkJLxHMsNhquhVJ9vogJ
 xrUgeMVmFqDyowXQd2uRV9C9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qXsDS-0094uJ-0M; Sun, 20 Aug 2023 23:52:18 +0000
Message-ID: <8373bd2101510ccf1af3b2fc005c6fe9673504af.camel@samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Andreas Schneider <asn@samba.org>, Douglas Bagnall
 <douglas.bagnall@catalyst.net.nz>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Mon, 21 Aug 2023 11:52:11 +1200
In-Reply-To: <14854277.O9o76ZdvQC@krikkit>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <14854277.O9o76ZdvQC@krikkit>
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

On Sat, 2023-08-19 at 20:06 +0200, Andreas Schneider wrote:
> On Friday, 18 August 2023 02:08:00 CEST Andrew Bartlett via samba-
> technical 
> wrote:
> > I would note that times when we didn't line up the CI version and
> > Python 'supported' version, it kept breaking.
> > I note that RHEL7 ends 'maintenance' in June 2024, just after the
> > 4.20
> > release March 2024
> > https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-al
> > 
> > most-here Those dates I think give good cause to drop CentOS 7, but
> > other
> > views still welcome.
> 
> I'm fine with dropping Python 3.6 support for Samba 4.20.

Thanks.  

So far we seem to be missing the markdown and dns packages for Python
3.8 on Centos8 Stream.  Do you know where I might find these packages,
or how we might get them to become packaged?

The other important but not totally vital packages I couldn't find for
Python 3.8 was setproctitle and gpg.

https://gitlab.com/samba-team/samba/-/merge_requests/3231

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


