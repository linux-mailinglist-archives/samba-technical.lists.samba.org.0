Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 418879254F7
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2024 09:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Km4vWI5r9KlAtyvGzL6qQO+RO0MWwXWOo+ZMZ4jsLTc=; b=xWlgfsq8I5DpQg4ns0ctn/YDnj
	lVModq3FTisK9Ksjoq39v9hnaQL0++ZosvAzlBsv3bLZHTcRpiWL9rFBFX51YaaCXHa/aFywEOQLs
	vJjbyYbbDVAf3quwBCPTh7Ss1g3O6xZbgc8bNoLiAhj56ErJgwObxDZ1EbMdua/J5lA4Dabbi62WP
	NjDWrunl4g2RUhO19tqhmGGQH7d91dlcVj+wQJKgkQNpBnR/3QwT7Ri37AE2IbeRv/p6t2oQKXuSv
	SBxVCQWhs6N46rwCV0jvaXNGEbKwaVrMmugu6A6T4sAQgLUVW5BrVIjjrfJdsDliagRpKKDjSAch7
	njLCiEqA==;
Received: from ip6-localhost ([::1]:54520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sOurP-00381F-F1; Wed, 03 Jul 2024 07:57:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46684) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOurG-003818-55
 for samba-technical@lists.samba.org; Wed, 03 Jul 2024 07:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Km4vWI5r9KlAtyvGzL6qQO+RO0MWwXWOo+ZMZ4jsLTc=; b=GDpJBjVUTRCV+aOcfrfhb0IP6K
 Nl8WlVz2Bgw0KFeWIeQy4pFci/1opUsgK+uj+T8zMZ7Yck9kDw4cv7m2WgWL6brnApTgBPGiOwag4
 zo4b0o9tgiVmCvU4Dwkw267ss/D6uapPKJHjnUb75bsuGXEFpNLGZrkA8VRs+nf3FYNwnXYlodFS8
 ws+ZZ9Q46naEW8p/hW8MWv0lmnb+okM1aU+s/iVb6wFNP1WVpMH2Pg0WACiLwBu6qbfDmA+my+SrU
 t6S7YZk2PUt42Pg4FooidxE/jZzgnEa+gBYOmMmdah3XQAu9zZ9fSYVWHt6fuv/Bpez0RHzmDr/St
 R6nGOdsTCwb7iHkqdvSwe/Jw0bevnoH1L4Yo8ncYJI6weTxgleeibl9yhtV9S9gGz81E0vIWyHchA
 HzHGkzRXZp1yBEmJAEdUCDhrnwCutCXEldhw/yUqfjb+ANBKHEa7PdW5WCVGMsHNbbpSgnHmrH9St
 DNm6LSmfh4mVm1tQSs7RRiD8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOurC-002CEl-1i; Wed, 03 Jul 2024 07:56:50 +0000
Message-ID: <80566105-c79d-4b5e-85d2-f51ccc9d50a1@samba.org>
Date: Wed, 3 Jul 2024 09:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Announce] Samba 4.19.7 Available for Download
To: Jo Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
References: <efc3606d-23f0-442c-a994-46fb374b7bc3@samba.org>
 <e7c529cf-6b3b-47d5-b438-d4e96eed33ee@samba.org>
 <9171cd49-0955-49a2-842d-2c7ad1585101@tls.msk.ru>
 <5108f6c8-4344-4ef4-97f0-a2d0a4edce74@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <5108f6c8-4344-4ef4-97f0-a2d0a4edce74@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jo,

> See https://gitlab.com/samba-team/samba/-/tree/ldb-2.8.1/lib/ldb/ABI. ‘ldb-2.8.1.sigs’ is there, but ‘pyldb-util-2.8.1.sigs’ is missing.
> 
> See https://gitlab.com/samba-team/devel/samba/-/jobs/7228952270 for a CI job that failed as a result.

I've pushed a fix to the v4-19-test autobuild.

metze


