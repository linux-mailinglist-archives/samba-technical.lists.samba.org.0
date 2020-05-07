Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 719271C9E9F
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 00:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Q9hHmJ2n1uIK9Wt8BEDdifp4ovUdmpEwQUE/rJQkDZg=; b=LH5a4TsqAvD77Sn/H1Jx6H23pM
	cKVNWG0Ja7pnOy3fE7qVMw8L10S83eKKfYVbsAiT/fdsjcOxVUumCFv8c78w1lP94rGyTGZG1Z/pP
	j5yfwDp5EbV5OYH5+NHShzk6eV7ypxBssS/zCm9Dfmqc4nhcWdfrUOGXIOPn9itVZTcsyw6n1qkRH
	DM8neoc6Ro0PhYbN8xqhRU8yzpxXM7gDoRcP5ROAzA7fLWj79l4ZkImtCOwz4T1Cu2jyCa4eiyT+K
	aKBv6xGhwa1axvObhbVhDqrnanw65TeLeAykePajKV8csR4lWqWRIGCtFIZZ7A7XRYKc7w5Z+Shjn
	AgCE/IEw==;
Received: from localhost ([::1]:49948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWpEy-003Bl9-NB; Thu, 07 May 2020 22:43:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32442) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWpEr-003Bl2-Um
 for samba-technical@lists.samba.org; Thu, 07 May 2020 22:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Q9hHmJ2n1uIK9Wt8BEDdifp4ovUdmpEwQUE/rJQkDZg=; b=Dn9H0y6YztXVTpzayQd+qw28bB
 t+BBQKSVzSbJmpfadnOrihfw85nS7Os1F0ohWdYl699RURWtrEs/5wusUt6JA1Kd0BAz2s9/KVFUt
 z9jC6sRafhFdkrU99bD6KMWEvBMQoVQV5C+FiGftDjA3zG2CP68v9yUjRq9KqP2ImeTnfpwQy1T7j
 6RZV9ipt9elezkYllIVNGX/lLGWfoeexcSkihpGRq3eJTsNQ9IstL+u/9pGvG5bmKKQEI1wKlNogD
 4YhUIjfBhgzVS2NQsfiz7CyAzAW1wcDVU6vmlHDM//Nnj8AWxYWczmPD295NkEsMmk/E0XEgOfyTu
 gkZTEzcYmX0YhtDjE7jTSzZ1EI5WF867C/ZYo6wmSP9NsYy0R3wXqy/w/yQ53rIJf4vjcDFbQg0B9
 rFfZHgkI887QbcZtz5OZcakpqHZJ7xdyALmxMd3doCQUn2Pb3F5WDT2OfeyGg37DMoqJXZomK4qRS
 1ZFaUYqx8qddMlm593htKgTB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWpEp-0005OS-RV; Thu, 07 May 2020 22:43:32 +0000
Message-ID: <9f10bc62317cc9ca891667330e23ce08994962db.camel@samba.org>
Subject: Re: ldb 2.1.2: test_get_size failure on ppc64el
To: Gary <gary@catalyst.net.nz>, samba-technical@lists.samba.org
Date: Fri, 08 May 2020 10:43:27 +1200
In-Reply-To: <0a650511-9ab0-4501-ee3b-c2c564b3b51f@catalyst.net.nz>
References: <CANYNYEHEeDcD+5GL+wCotQG9O1XA1F_i_XmRwcGWbqj15PKxjw@mail.gmail.com>
 <0a650511-9ab0-4501-ee3b-c2c564b3b51f@catalyst.net.nz>
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



On Fri, 2020-05-08 at 10:08 +1200, Gary via samba-technical wrote:
> 
> On 8/05/20 6:16 am, Andreas Hasenack via samba-technical wrote:
> > Hi,
> > 
> > I'm building ldb 2.1.2 on ubuntu groovy 20.10, along with all the
> > other dependencies for samba 4.12.2, and I'm getting this test
> > error
> > on ppc64el only:
> > 
> > [ RUN      ] test_get_size
> > [  ERROR   ] --- 13369 is not within the range 2500-5000
> > [   LINE   ] --- ../../tests/ldb_kv_ops_test.c:1721: error:
> > Failure!
> > [  FAILED  ] test_get_size
> > [==========] 13 test(s) run.
> > [  PASSED  ] 12 test(s).
> > [  FAILED  ] 1 test(s), listed below:
> > [  FAILED  ] test_get_size
> > 
> > That assert use to be
> > 
> > assert_true( size > 2500);
> > 
> > but was changed to
> > 
> > assert_in_range(size, 2500, 5000);
> > 
> > in commit
> > 
> > commit e464e40c977cd6592240763c7dbb9c45ff16470f
> > Author: Andreas Schneider <asn@samba.org>
> > Date:   Thu Dec 5 17:14:31 2019 +0100
> > 
> >     ldb:tests: Use assert_in_range() in test_get_size()
> > 
> >     Signed-off-by: Andreas Schneider <asn@samba.org>
> >     Reviewed-by: Gary Lockyer <gary@samba.org>
> > 
> > 
> > Is that 5000 ceiling limit just a guess, or is this failure
> > indicating
> > a real bug somewhere? The value 13369 I got on ppc64el seems a bit
> 
> It's just a guess. for tdb we estimate the number of records with
> #define RECORD_SIZE 500
> 
> 
> So changing the test to assert_in_range(size, 2500, 20000);
> Should be ok.

PPC64 is probably doing something sensible (as in not optimised for a
1980s home PC) with pages and so consuming more space.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




