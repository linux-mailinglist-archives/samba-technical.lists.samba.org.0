Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCB2D81C
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 10:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=BiWjw9LFv8Cw7Db1wnOKbeK3Ng3qqzEwhSvZ5spf+O0=; b=K/eYgywSDClp0N8idBR/pXvq/d
	QrXaXspcjAx2CwcUUSchTlbHkXg0ZKRRIaqVV79/c3PQjOTcmcDyXLsWry4/czmblVO33wJ6ikRuz
	k+jZ3YMsdlLUlri+c43tDfilsu9awaC/YS6530/h4MZxdqOXZqWJg/1ZtyA358GByTyfv9JOqjog7
	ODxo6m6j0gc7waxvJzIFuKUCQ1PesS3NQCw412nRPoMxBafyRJU3OC9yZhT0clUQ/PQ65UVJhHac+
	NCpeZZDw6/4USEkaj7QoEHjzXxMLCQuSDlplOpkDNV077vrLrZGHp1D0UhavkFXNYcjBKIREc4kAv
	IU4zdMPA==;
Received: from localhost ([::1]:23980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVuCf-002SuC-3i; Wed, 29 May 2019 08:44:57 +0000
Received: from [2a01:4f8:192:486::147:1] (port=11866 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVuCa-002Su5-Hv
 for samba-technical@lists.samba.org; Wed, 29 May 2019 08:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=BiWjw9LFv8Cw7Db1wnOKbeK3Ng3qqzEwhSvZ5spf+O0=; b=KYycKnrGDLOlnO+24e9oK6gfWP
 jgT3EkwAE0le7RERgICoPW0BbMHo24onoL5b2d0CiLGKErTK5dRRrjK/mATfl8lItQcec8n21QJsT
 I5cKRW+ihi3C6b+6HDPH5vPTbuvQGwiVCLIzENLCCqmp/z9KAJ2mISExOTV6vXnzGFnE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVuCU-0008Rl-Vw
 for samba-technical@lists.samba.org; Wed, 29 May 2019 08:44:47 +0000
Date: Wed, 29 May 2019 10:44:45 +0200
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
Message-ID: <20190529084444.gcd6k2kgskv4jnhz@inti>
References: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
 <20190529075805.zc4qabjyb7plsajg@inti>
 <20190529082426.GD4871@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20190529082426.GD4871@onega.vda.li>
User-Agent: NeoMutt/20180716
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 29, 2019 at 11:24:26AM +0300, Alexander Bokovoy wrote:
>See my separate email -- there is a typo in the commit message
>(undecalred). With that fixed, RB+, please push.

fixed and pushed. Thanks!

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

