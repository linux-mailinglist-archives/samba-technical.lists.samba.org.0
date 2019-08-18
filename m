Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF691600
	for <lists+samba-technical@lfdr.de>; Sun, 18 Aug 2019 11:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2u6mF6x+KPWUVXHYdInWSPkpQe1Mm0jHmhDlr43MKvI=; b=xiDUo2pfJZNlarDTShkWwXQzmd
	d4buJFrT9z1/lwTSQMtgeNaFJC9z4mfam6CqIsccq6wpYc/7/XORD6CW3Qjv+XsN+ayM30hEiR/Ei
	nEL7oY0MqHUC7RaHCcqqDKLBiMvY+dTp02oPsHjnRhrrvceaS9EMP5U9jLIzxZMgoqkKKWlFdaZJU
	LuZ+OqkA5qvE+9SBV74oQde6IpcrPpp+A6yB6bu1WR7BPUG6GcrZOe2BuAFVBREbubUGW73bBUcPZ
	LCLLoCbb51oKr7i13IIVWQaRBdyYHOC41xtKaIsRS6amL6A6h50Xb5MKGcaHh6GHem2UEPD5f6iQC
	OfDKtk5g==;
Received: from localhost ([::1]:31948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hzHq6-006pqA-Sf; Sun, 18 Aug 2019 09:51:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45924) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzHq1-006pq3-JS
 for samba-technical@lists.samba.org; Sun, 18 Aug 2019 09:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=2u6mF6x+KPWUVXHYdInWSPkpQe1Mm0jHmhDlr43MKvI=; b=slMl9GY2HXfpOkU+NfvvHX5XOS
 dUF6+A23yEFFxGcPMOHcSw65xFbAYGlot2rC72fyzyxh+HGDogag97SOhsn+tOo23oRAcCPpKVOIJ
 6Qqf4TWAnF3EQ03aS/GK5tBwZGUaLfHRN7zYrfkS0oV4Z8pFwQLlEckONEYqXPn4aL9o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzHpy-00076B-Og; Sun, 18 Aug 2019 09:50:58 +0000
Date: Sun, 18 Aug 2019 11:50:57 +0200
To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PROPOSAL] Evict zlib
Message-ID: <20190818115057.40babecc@samba.org>
In-Reply-To: <1556868232.2951.47.camel@samba.org>
References: <1556868232.2951.47.camel@samba.org>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 03 May 2019 19:23:52 +1200, Andrew Bartlett via samba-technical wrote:

> With GnuTLS being a requirement now, I think zlib is also a reasonable
> requirement and removing it would also remove some bad and un-used
> crypto from the tree.
> 
> What do folks think?

Thanks a lot for doing this :-)
I've pushed one minor follow-up fix for the waf configure check:
https://gitlab.com/samba-team/samba/merge_requests/731

(caught by the Samba + Ceph build-bot at
https://gitlab.com/ddiss/samba-ci-submod/pipelines)

Cheers, David

