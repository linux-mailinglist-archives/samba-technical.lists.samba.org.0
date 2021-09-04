Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9A400B6B
	for <lists+samba-technical@lfdr.de>; Sat,  4 Sep 2021 15:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=igRjmd4jppI+STSS0HTMuWoqDbJOqjxIc0LOJXGNTr0=; b=Hfy5irWleX/EAiQJxOP8Jt3Nkx
	HY40MMm4rtjteO4Pekb+KyrjIXkFNYK0UwQx9GiyX5uF+flvYbvVoCTpwWLecBlvUfE8n5+8dSHBh
	ElhvNRBM/VOvK3ejcvcyzPf2196JraQ4M69xxQO6ptsKET5Dr0eHW5hzCXwRSS/nkHbvC3MS23d0j
	jNUcvIGHfeNued3ZImWoWE1agzzPapTEHHjFiz2ivcupvG0w+TdPaLgQek0ZNl+PuktwBBe8q8YTf
	wqRgTnQ90YsCLdjeF5d7kZi+0OLDuIorXxh0+0JO5alAvv2Zg/HUmEcOUPKBkGnll1FyGpOKDcxXk
	xcrpmVPw==;
Received: from ip6-localhost ([::1]:65176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMVHs-00DJMm-Gu; Sat, 04 Sep 2021 13:00:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMVHk-00DJMd-JK
 for samba-technical@lists.samba.org; Sat, 04 Sep 2021 13:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=igRjmd4jppI+STSS0HTMuWoqDbJOqjxIc0LOJXGNTr0=; b=l9bZ65WviWfBJk60NA4TVt1gj9
 GLbnqMlM9RqhLNbqusu4rh1fqxwlQrbdqwrvw55yV7CzGr6Qyby4bB/BJd9rjS2frRmulkWIrpalt
 Z1ZGgnB+RRcWBh9VQXmaEPvHZwShNtliR6MybqvXfQoU/KI9bW75kQffYW+BEE3T/4Sz2f5xjNewb
 OUJXZhIGyNF6tJxsUSI8x9MaaGoMThbaQOXka3dkuvWQhLDJjCRfJU7C28bG2dz3XsElzi2TrWLMK
 Jya97+IaEeRHkMRcC2ghyrBnMw+D6bGZvOspRfqvS7CIE8kBslDUorUBebswOiQf/c9f006vIapMa
 CEjFzk3FvKWIxfMA2pbA5um9PehjA3wQsVfacGqKINAbJCQK2/xf+G4BVFx90rEuVM0K2ObPyGGKS
 ieoaQjpGIUeCEZ7oqryhzgbxtYTw0aK8QMMTGLMMiW69mxsmb9x4QCEjzxewnB1tUwQeY8qbX0MJP
 +Y6WKpJ7XEJygNulhQz0fW++;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMVHi-004cYe-NO; Sat, 04 Sep 2021 13:00:39 +0000
Message-ID: <8613d4d45133c0ccb41ea3336cf1f1ea7bec7238.camel@samba.org>
Subject: Re: OSS-fuzz needs some love
To: Uri Simchoni <uri@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Sun, 05 Sep 2021 01:00:35 +1200
In-Reply-To: <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
 <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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

On Sat, 2021-09-04 at 13:30 +0300, Uri Simchoni via samba-technical
wrote:
> What I have so far is in 
> https://gitlab.com/samba-team/samba/-/merge_requests/2152
> 
> I'll continue this in a few days hopefully.

Just a quick note to say thanks so much for taking a look at this!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



