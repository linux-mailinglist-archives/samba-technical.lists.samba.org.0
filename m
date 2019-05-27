Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B02B02B
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 10:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4489KDZtj7MPq8HoYV24EvbcTrj4sRfjw00sQMEmLb4=; b=v6jcW20I1U2TVPb5TvWCKyUJSK
	rA725tXumTWNJgwb9g/htEruRKc9XRaevyJXOPx0w5AnzjsN+iQu3A6t4AluPLg4iopeCnfVO51T6
	SnNFvUpFZShqb7LDKbn+0fmMWZnxy3s9m9irTBpsY75N/2rfw4L4miyJHN/J0uprF5JU78rJJwmgu
	BsUrWRZ83EO1tqX4GXqCqWJuOFfNRK1yuHYQPyPponQNQfnuYFAvYaMwpBJmNrTZBKEz/iKZ9R6vM
	/nM5+J0efasO0+q5DsoosgYe3vr0apMWje5aOHfJBN74qnRiGBtF4BhyWSInNDm/VkJB7Ocj5/G/G
	Fkg+GTxA==;
Received: from localhost ([::1]:46552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVAyi-0028Id-RK; Mon, 27 May 2019 08:27:32 +0000
Received: from [2a01:4f8:192:486::147:1] (port=14116 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVAye-0028IW-CE
 for samba-technical@lists.samba.org; Mon, 27 May 2019 08:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=4489KDZtj7MPq8HoYV24EvbcTrj4sRfjw00sQMEmLb4=; b=dnK8YY1z6+p7Ga4i2cSgNNcg7a
 YEvjvxVd+hXobDId/z+aI2myqn59EBULmWBweZ7Bzh4TOZ9UL3J7Y81zPsPjo2B4oaV6UFoclQbKz
 L0QniNz7gG2ijUuh1DUDglEQrXsadOqkEUyQVWKbAAIslWgliOWIEa5V2UtGu8yEHjbE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVAyY-0004RH-AS; Mon, 27 May 2019 08:27:22 +0000
Date: Mon, 27 May 2019 11:27:19 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
Message-ID: <20190527082719.GA4871@onega.vda.li>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
 <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
 <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Julien =?iso-8859-1?Q?Rop=E9?= <jrope@linagora.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 27 touko 2019, Rowland penny via samba-technical wrote:
> On 27/05/2019 02:28, Douglas Bagnall wrote:
> > On 26/05/19 11:22 PM, Rowland penny wrote:
> > 
> > > How do you test for something that works on some computers, but not on
> > > others ?
> > With Gitlab CI.
> > 
> > > Which is correct, it working, or it not working ?
> > Well, when I go
> > 
> > PYTHONPATH=bin/python python3 -c 'import samba; samba.drs_utils.drsException'
> > 
> > I get "module 'samba' has no attribute 'drs_utils'".
> > 
> > Maybe Python 2 was different.
> > 
> > > If you have a problem with the test, take it up with Andrew, I initially
> > > created the script following his advice, he later 'improved' it, obviously
> > > not enough ;-)
> > Yes. It only tests 'samba-tool fsmo show', not 'seize' and 'transfer'.
> That is what Andrew wanted at the time, feel free to extend the test.
> > 
> > > Anyway, NACK to your patch, but only because you haven't remove the
> > > 'import samba' line.
> > OK, though I don't it would work with the line removed.
> > For example, it would break
> > 
> >          forest_dn = samba.dn_from_dns_name(samdb.forest_dns_name())
> > 
> > and it *might* break other things too because, as discussed, Python
> > imports can be a bit weird with unexpected side-effects.
> > 
> > cheers,
> > Douglas
> 
> So how do you propose to test for this ? When having just 'import samba'
> fails for 'samba.drs_utils' but works for 'samba.dn_from_dns_name' ? To me,
> this looks like a bug in python.
https://docs.python.org/3/reference/import.html is the canonical
documentation on how module import works. When you do 'import samba',
you are importing samba/__init__.py implicitly. That file defines what
is in the 'samba' namespace as imported. It has no references to
'drs_utils' so the only ways to get 'samba.drs_utils' is to do 'from
samba import drs_utils' or 'import samba.drs_utils' explicitly -- in the
former case we'll get drs_utils directly, in the latter --
samba.drs_utils.

-- 
/ Alexander Bokovoy

