Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37823783728
	for <lists+samba-technical@lfdr.de>; Tue, 22 Aug 2023 02:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=zVlR+QHseCj7KHZZEG/DJIyWADL56cwAPSseq7XIXjw=; b=z5iJDKnOMNBaOOYHqbJRmKc72B
	qtaVYDXZ59GuSvLjTwCgJzTuri+/JzKP0Y6G9zrY3YO/mgGNFQnS/SJVrx9zYnM7m6x1aF7rZVaZQ
	Icch50fEez0wyCvMo1tCgmKR5JhjQ7V6NjWxj3aUjqJPcDGdcYTSdIPaHSY0sbWl9/Y9gm4iVNuLX
	pql1q6zk5tjbTBUFc6aODO/pvoTyikDXAzhLRGrhPlB0bmJch5JEwvOZ2gpmjQoag0a7fwygQmPVf
	S+t/1HOam08N4RKLxSBwk5UAq0caWRrUylRrWnF+iJ6ss1kpfWAbtDPAcVPww0lP3zXBc8JDHLqFh
	C1TdLs0g==;
Received: from ip6-localhost ([::1]:62222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qYFj3-00Dq8m-IU; Tue, 22 Aug 2023 00:58:29 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:59932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qYFit-00Dq8d-UW
 for samba-technical@lists.samba.org; Tue, 22 Aug 2023 00:58:25 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id B000F819A2
 for <samba-technical@lists.samba.org>; Tue, 22 Aug 2023 12:58:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1692665890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zVlR+QHseCj7KHZZEG/DJIyWADL56cwAPSseq7XIXjw=;
 b=Za2AQyPnxOhu5ZZQZ9Dx8l2wXK+fkWAUYmnoBvfQJ1VkQhAeKGQElP3phohbQvBBjZi1/S
 vkmON95Fsmxv/yy5qd1Wl1w6kv2JufHwGThXDRYAOrhW3XsBTKQsWvdezEGsdBJ2B6IOZf
 cFsQsUmEjuxd1XzN32AT9n415qwee8KSNe07JSm8mFkvfJlXr/H38hLadIg2/ZPZLkzNGc
 3XRlKPDe8tUx5eWsUUXYZKH3AnRk/daingjrYU0nz9Phu2H0gkoEWf60MtSArJEbzyIrRS
 /EIxL9P33E/7DngqyA8UNKhAT+3/8NGXSnU/69vQ5hglMp/lLcrg00sMJI3jQA==
Message-ID: <9a667dfb-0f7f-71e9-c5b8-885bc7570d8f@catalyst.net.nz>
Date: Tue, 22 Aug 2023 12:58:08 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: codespell mysteries explained
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was trying to run

  codespell $(git diff origin/master --name-only)

to catch my typos before CI does, but they seem to find completely 
disjoint sets of complaints. That is, *none* of the local codespell 
issues were raised by CI, and vice versa.

Locally I have "codespell 2.1.0" on Ubuntu 22.04. It doesn't care when I 
write "secuirty" in a C comment, while CI does. And it does say a lot of

  python/samba/tests/sddl.py:193: BA ==> BY, BE

which CI doesn't mention.

Adding "ba" to .codespellignore makes the "BA" complaints disappear. I 
would prefer to just ignore uppercase "BA", but when the manpage says

   Words are case sensitive based on how they are written in
   the dictionary file

it is saying you *can't* ignore uppercase only if the codespell 
dictionary[1] doesn't contain a "BA->..." line. It doesn't.

[1]/usr/lib/python3/dist-packages/codespell_lib/data/dictionary.txt

The local dictionary also doesn't contain "secuirty". The upstream 
version does, and it doesn't have the "ba". So that explains everything.

When I started this email, it was going to be along the lines of "WTF am 
I missing", but it turns out to be quite simple. If you have an ancient 
OS (from, say, last year) don't expect to be able to replicate codespell 
CI locally.

Douglas

