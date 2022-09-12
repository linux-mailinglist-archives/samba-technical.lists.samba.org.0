Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB565B63C6
	for <lists+samba-technical@lfdr.de>; Tue, 13 Sep 2022 00:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jhp84qmvwokNCctz+kIxAluvUjxG55JYmQ/i8pTM2Bo=; b=b0fZWP7fvtPiyF8zOA3jNHMIQv
	IARh5x3j/IQqm69yOra+jf1uM0ugeMwbD0cw6kWrQq0nq+iAN8QyHW6jImcdMbE575SWfIPxlobfU
	uwc9ZuDnXUKWd5Q1Da+kTgfDzM+sxMZY3xWj7DxRgEldFIpEmt4h5Z/Ji7oPx5UhBgkH84NoTUW6G
	n83dYodlCQ8El/IPhcwR7OqEtcbemLqz3P+bgmDXjL2Y7zqcBfCzBsYDPnx/HbeAsBmuFzW5A5ZL0
	BgtowPeQaQLCtucbGnBJwivJ1y9uWJ++n0YCoMlNy473BXOyEZdAXQpYLAps8JYEuKjGChaJJZyjV
	rNTVQbTw==;
Received: from ip6-localhost ([::1]:53938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXs0g-000ELG-Q3; Mon, 12 Sep 2022 22:34:34 +0000
Received: from hartley.uberspace.de ([185.26.156.169]:47130) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oXs0a-000EL5-MG
 for samba-technical@lists.samba.org; Mon, 12 Sep 2022 22:34:32 +0000
Received: (qmail 17513 invoked by uid 990); 12 Sep 2022 22:33:17 -0000
Authentication-Results: hartley.uberspace.de;
	auth=pass (plain)
Message-ID: <3b216531-0020-3c19-17cf-70371f32b475@merten.dev>
Date: Tue, 13 Sep 2022 00:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <df7d1e4e-e5ba-4a70-9b5a-b5a1cf138cb7@merten.dev>
 <cd32ea24c187b846e67a3142eae638b24615b9df.camel@samba.org>
Subject: Re: samba-tool dsacl management
In-Reply-To: <cd32ea24c187b846e67a3142eae638b24615b9df.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.198227) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.298227
Received: from unknown (HELO unkown) (::1)
 by hartley.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Tue, 13 Sep 2022 00:33:17 +0200
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
From: Christian Merten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christian Merten <christian@merten.dev>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


> Tested contributions are most welcome.
>
> https://gitlab.com/samba-team/samba/-/merge_requests/285
>
> https://gitlab.com/samba-team/samba/-/merge_requests/284
>
> https://gitlab.com/samba-team/samba/-/merge_requests/283
>
> Was the last attempt in this area, but it was not tested so didn't
> land.
>
> So again, contributions are welcome, but we really do need them to have
> tests.
Thank you, I'll start working on it. Currently I am stuck though with 
running the samba-tool out of the repositories master branch. It always 
fails with

"No module named samba.param"

I tried running it from various places, also as suggested here 
(https://lists.samba.org/archive/samba-technical/2018-December/131538.html), 
I tried python3 ./bin/samba-tool from source4/scripting but still the 
same error. Also I don't see a params.py under python/samba.

Am I missing something? I found the Developer's Guide on samba.org, but 
there does not seem to be any information about samba-tool. Also on 
wiki.samba.org I couldn't find anything.

Best regards
Christian

-- 
Christian Merten
PGP Key: https://keys.openpgp.org/vks/v1/by-fingerprint/904AB78A7046431E4B8E96D2D953D69721B948B3


