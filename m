Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 357582535BE
	for <lists+samba-technical@lfdr.de>; Wed, 26 Aug 2020 19:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mil91Dke33E3yn0tM6QWvMPy0O8hh9VOXpn5jExDkCA=; b=4mNwBJuuw5UbrVmPFZnycBNW1O
	DG5Oznbm2ewVqcJYOKdP6yMTUZi5dlH8DpoFOC9EuPEngr3t+krXu+GXdz7E1UsUJ63huXA965qea
	AZSkmSdeU0MQXGLIC+jc0IFhAWTa4HeFSzvV6piud91rnz9cUvhZQcgFQxxmp01woA2P7ZDMiPoel
	78olxD3A1Db00uc6JBDIfUdconsjXGOz6BzhT0Mtfv8psDIeostnZUg3XidTX6fG5yM4yvWfBr9aE
	EV9J3Y2Dx8AsLzwHh8JPlInzmg8m8YfgRUgUF0jGpBjrgTjSha3AjMJ6gmFsvlS0dsPu0W30pCv3g
	7/nNMx0g==;
Received: from localhost ([::1]:42544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAyuc-000lpA-5I; Wed, 26 Aug 2020 17:08:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAyuU-000lp3-Mp
 for samba-technical@lists.samba.org; Wed, 26 Aug 2020 17:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mil91Dke33E3yn0tM6QWvMPy0O8hh9VOXpn5jExDkCA=; b=mdqYwRGDkkfDS6M9Vg+MbIF9oU
 vKgH0dXSPlVkQ4DxnaYuhFtQu1kJB/RH/1j0SzeKVwFFekMMRNeRqNPeohlFMNnQnzSWAtTopjDLz
 VNeURpXldM5NGxJCCoXSw1Qig03mlk03gOyt4jJpDLM2tZf+5uOEkYy5uZih21UNSduHwZYp24fqF
 LjIxXgKm8Da6O/x+OWRWHzDrNTbwpkkKUGkYA6nwT8RuIZUcyMRf4hjpBrTpmW95EjbA+PEPqn6CQ
 gTpIGNqHCsE0OIHTHgXVusMxQc+iOX7AhgxSNX9cfi6ct1ohVDYVBzmwwbU1cRfaghiXeB6LqR7hz
 sOsmi9yxWmf8gdCv8EmWpROSafyCx7w+3ljEa486C8vex384TJINIqpCa4KLgS9DZ7WjmaheUv85t
 L2onKVZ3TeuK9gqONshHS96r+MEFYip4Wnpn2MnPzM4lOP1gKWexEe/38WUbhbTPqzGvj1YajtCYL
 wLCEAesWdnvFXcI+6ACeEzwO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAyuS-0004f8-4J; Wed, 26 Aug 2020 17:08:28 +0000
Date: Wed, 26 Aug 2020 10:08:24 -0700
To: Pavel =?utf-8?Q?B=C5=99ezina?= <pbrezina@redhat.com>
Subject: Re: tevent: fd events do not work correctly for UDP socket?
Message-ID: <20200826170824.GB16382@jeremy-acer>
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
 <20200818163118.GA8897@jeremy-acer>
 <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
 <ab30a78a-c442-d5a4-614c-3be0c32e680c@samba.org>
 <4acc5a8d-97b0-87ce-15ca-545456478b3b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4acc5a8d-97b0-87ce-15ca-545456478b3b@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 26, 2020 at 11:54:07AM +0200, Pavel Březina wrote:

> Thank you for all the hints. It turned out to be a bug in libldap [1] which
> calls recvfrom twice in a row for UDP calls. The first call will consume the
> error (ECONNREFUSED) and the other call will then block because there's
> nothing to receive.
> 
> [1] https://bugs.openldap.org/show_bug.cgi?id=9328

Thanks, that makes a lot of sense now :-).

