Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37213FBD4
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 22:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=084H6rf9md7n5xVNM/cLCnablThV8zHknHPmOwwjN0E=; b=LZq46ooIm6GWXf1lD17p/lzYC0
	+Z5Nif5qEXZHZWjrsLf0wQ+t+AZiKRnmMN5NZHo/eqXJgirpI9holUjjifCfcven1+4M03u+U9sUc
	UjtXy6XNCHGlrxU8PpW7BdEK3mNc1J3uoAsZ7TLMHBhNVGL7qbQYl+nbPwca/PGmUA3HYBKS4SEBh
	RoCeh75ycoWBDMMy3ub2oa5zx4c6HW0NMCc1P66l9bkMBUs61A6gKozndQkvp+eE8iJXze4jt6tCf
	jGZmwGrv696TJkJGv4T5kd5mNKMB0bStj8GihsrfsVBzeMyfsflwnYS1gnJAus8xmBuIviE8WjnDk
	WzRPClDA==;
Received: from localhost ([::1]:54046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isD9T-003gqF-TL; Thu, 16 Jan 2020 21:58:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12834) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isD9P-003gq8-J9
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 21:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=084H6rf9md7n5xVNM/cLCnablThV8zHknHPmOwwjN0E=; b=R8n8RY/35Ac6eoifYMT9zTk7se
 WRe2v239vAz7f2A+jM2ayAKd1z58FCNniRJWqXUlFfE7aGbMnb4HESEJi5qt0AA89FINAxcf8hcc2
 YdRAIrHU+8CEUyEDyqDM7myCJsg1so8rQ5/k3rXhyKBMIHX+jZ4MPh9ZGdrwKOE31KzfO15Juc5dC
 PEUwBmLAD2w6OZHjQozaVvEQjXCO2+8ez67MxmciboGgJ7iHle6awPFAMJ82t6bGNrwG/CT+kS7Mp
 ixT15DuTThTu5UozPvR4naqQiqMKkqeLaAPiYkVfR0lPi0t9PIFrY3EINCVtPXX1dIynovxHns4wG
 KrKp4UyNKvvBRo0Nt/zM+FJbs9/3YfhynYwFwN5u3osTJ/MVc1dxBMDm29gFmHnlD0OQnYp5J2VA8
 U0ZnG+9hdNpy7Scq/PNh4BmMKkrmO9oaKOdotXW6y3cXb1YzGSvDDCH3iJGDXawPRIsApg+cJOWib
 d9ctAN3Dly3eudJ3a0/DLLPI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isD9O-0004Gc-67; Thu, 16 Jan 2020 21:58:02 +0000
Message-ID: <4725118760e5c24f70cf6d9c4751ad565a398792.camel@samba.org>
Subject: Re: fuzzers
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 17 Jan 2020 07:58:00 +1000
In-Reply-To: <2725858.Fi8pKjZunP@magrathea>
References: <2546695.cijFyKqbAK@magrathea> <2725858.Fi8pKjZunP@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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

On Thu, 2020-01-16 at 11:08 +0100, Andreas Schneider via samba-
technical wrote:
> On Thursday, 16 January 2020 10:58:24 CET Andreas Schneider via samba-
> technical wrote:
> > Hello,
> > 
> > thanks to all people who worked on fuzzing Samba. This is a great addition.
> > 
> > However before we add *more* fuzzers, it might be a good idea to first fix
> > the bugs found by the fuzzers ;-)
> 
> Also the build is failing since weeks:
> 
> Step #3: /src/samba/lib/fuzzing/oss-fuzz/build_samba.sh: 42: /src/samba/lib/
> fuzzing/oss-fuzz/build_samba.sh: SANITIZER_ARG: parameter not set
> 
> 
> The attached patch should fix it.

Thanks, I seem to have misunderstood how the coverage build works.  

What is SANITIZER set to in this case?

Does this pass the coverage test in the oss-fuzz repo?

https://google.github.io/oss-fuzz/advanced-topics/code-coverage/

To test, change the projects/samba/Dockerfile to point at your branch
to test:

https://github.com/google/oss-fuzz/blob/master/projects/samba/Dockerfile#L19

The 'infra/helper.py shell' command can be quite helpful debugging this
stuff.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



