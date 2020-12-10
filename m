Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D88532D5156
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 04:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=U4Qjfmq41zZSDtJQg0/qQ8WjbM+D2P1gaNWlnd2xKZQ=; b=0eB48mWEYx/r+nmuCp83+WDqHi
	OEFsamOyfq+8BcUVQZIi/PYpV7ufNBEtrcVJiP69ubfLfFy1KJv4g4YNyp9XRyCB9XTM0wKArPO/e
	25thfbgok8f3qERM0BRB54usWCHKX42HL7BLaQtT6c5mI+0zLBMrJXkg8qK84ow0l+treS+jypZdn
	7s0dmlf7PyYvuKfdBdmxDahcwMfLdNJEtfELwQkwUMT3gvuYBeXY/Lry0tg6Em7D+CNPz0VlOU3mX
	As1AMKLcaTPSvSupFZ0ZaExPYTiey3dQHhiZR4q1oRkL9Tbybv6fwcPueHybee8m0JX+5y9x4XYdR
	1CdrRiGw==;
Received: from ip6-localhost ([::1]:35662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knCd0-000Nob-GP; Thu, 10 Dec 2020 03:28:26 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:41167 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knCcs-000NoS-E6
 for samba-technical@lists.samba.org; Thu, 10 Dec 2020 03:28:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrzrL4Qkzz9sWK;
 Thu, 10 Dec 2020 14:27:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1607570867; bh=dqXELS5IbaTjDOa0Szy8snpqdbZE3ayQhmJmLS/y7ZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XKT5gdpAoz7d7qtGKqLU6ZvFfzSUDNv0XXCXvF8l/gYFXpAwvg//2WPC2LJJBWj5n
 lOwr6Y9xMLLnk4GXDgg+zvaaUbG82ovvve8PZDdegVbZ5yBpLDjkCCuPgG3ug3pXGd
 s5Qur2dtbYTN3S108YMJRM6+LicdKhZ484E8zbpmBlG38gtON9W2sQ1ibG81rFjOdM
 YaTV+KMiDB2Q+7enMHs5rewiYks0Z+FTM28DCQZx+yHltq5AWZy3XD2nnn0fu8JG57
 kjZiYU7ryJkTd6rk7knTqOPWsb39t9SrGj0bX4hRWeycEaY7b5b5OUBgzk1wI4OWkP
 RZKq0LBh6DffA==
Date: Thu, 10 Dec 2020 14:27:44 +1100
To: Rowland penny <rpenny@samba.org>
Subject: Re: Samba testing on CentOS 8
Message-ID: <20201210142744.398a7e75@martins.ozlabs.org>
In-Reply-To: <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Rowland,

On Wed, 9 Dec 2020 15:42:27 +0000, Rowland penny via samba-technical
<samba-technical@lists.samba.org> wrote:

> Hi, based on what is all over the internet about the future of Centos, 
> should we continue to test anything on Centos 8 ? I mean, we may get to 
> a point where we do not know whether a fault is down to Samba code or 
> code that isn't in RHEL but is in Centos stream. Just a thought and I 
> could be talking out of my hat.

You make sense and I agree.  When CentOS becomes a rolling testing
stream then it will no longer be a stable platform for testing.  Amitay
and I were discussing this yesterday and we didn't come up with a good
answer. One reason why there is no good answer is that we want a stable
testing environment but sometimes Samba moves faster than the stable
distros (e.g. CentOS 7 and GNU TLS) and this might happen again,
possibly with other distros (e.g. Debian stable).

However, right now I have limited time available to make changes to our
testing environment.  So my pre-Xmas goal is to open a bug, "fix" the
CentOS 8 bootstrap script, backport the fix to 4.12/4.13 and have a
working test environment again.

Hopefully in the new year I'll find time to update autocluster to use
something else as a test environment.  Part of this is probably to add
support for the Debian family of distros.  At least then we will have
flexibility if things change.

peace & happiness,
martin

