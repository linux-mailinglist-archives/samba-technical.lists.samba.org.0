Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFE36C3EF
	for <lists+samba-technical@lfdr.de>; Tue, 27 Apr 2021 12:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vRo/Vz9GQ4NBBk/9Th4+Y02zmfDl56VsFFyNNuKnvTo=; b=ULIwR3piLnfPKTNbbqy8OQGTax
	h/S2FNCQThc3g+d3+Q84/lNgroK+FCGPmw19KhUDstyAoWw0yTe6tGWhbmOOJvnyA52DEhhrLevXt
	xuV8iZ9fTGuXhukjgRO4LRiD3JBCv6KM62p2cSOqEaKlnrb7WJdQS9i6gkjFAIxLy6cLD4B24CXoM
	Yxn3xEAd52ewklYm8HPCb131OO8ZfHi63uaSF8nFTt8y2u50pxH1usWPvf96/Pxs4iE6habur/qsr
	3wlBCJxm6VkAlmxx8I4KuiKu/ShAtAZ7K2hyxoHS5gXwWf2kqLT+V60wQ3fBeTzpc7A5AudVryOpR
	P9MEhuyg==;
Received: from ip6-localhost ([::1]:44512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbL0I-00CbnD-O0; Tue, 27 Apr 2021 10:31:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbL07-00Cbcu-2m
 for samba-technical@lists.samba.org; Tue, 27 Apr 2021 10:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=vRo/Vz9GQ4NBBk/9Th4+Y02zmfDl56VsFFyNNuKnvTo=; b=RBGVwWkeHLiluNImGLUMGMnaWi
 8mJ//mN1MssqI3YEgaQE2/4OU4uch5JBVC/zIdvuOCFaoTQE7SyMK2okLuG3WGroEO0k1yYTn51f4
 /EO/Kxl795jMKsSw1ToRCSLnrs+l0aslvnp9eQ4DQreE/9BuYtEkZaTdBeGSnNF+fKmN/3vxZj379
 mWKi4bmNxGk5VQVKlQYqhnP2SNm9wb9bS3btHB5U7Cpad0hJwru2kSAnOH+U14ZEW4QVbjGovOm8z
 fu7q6Z0C1j93TmxdAl1Bji/77HJHvzsA0nbLEFbPBemZ7S5nDC9GDoXxSaLsTWDANpKq7I/qNYYVR
 xmSdba5Nw3NnOaPsSylto460pPlZUku5bmgVDBSHjdopaj/jAsNJh0biotHoJDC9NtZsU95B2jgV2
 gaQy/hdvVjT4boaW/rdJ2LiCF+ohCoJTf0j+mEOBvO5BbVFG8yZe6MPM/yMobucKZl3GX+FQ0fybW
 YA+9PM0gMKYF6NB1d+DkdQvq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbKzr-0001kH-Kl; Tue, 27 Apr 2021 10:31:16 +0000
Message-ID: <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
Subject: Kerberos raw prototol testing
To: Stefan Metzmacher <metze@samba.org>
Date: Tue, 27 Apr 2021 22:31:11 +1200
In-Reply-To: <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-04-27 at 08:31 +0200, Stefan Metzmacher wrote:
> Hi Andrew,

(brining this bit back to samba-technical)

> Please be aware of the WIP merge request:
> https://gitlab.com/samba-team/samba/-/merge_requests/1896
> 
> python/samba/tests/krb5/as_req_tests.py is the relevant part
> as well as the get_*_creds() helpers in
> python/samba/tests/krb5/raw_testcase.py,
> there _generic_kdc_exchange() and the _test_as_exchange() helpers
> make it easy to also check the encrypted parts of the exchange.
> 
> _test_as_req_enc_timestamp() demonstrates a simple password based
> authentication and checks almost every field in the response (also
> in the encrypted parts and cross checks encrypted and plain fields)
> checking the PAC including the signatures shouldn't be that complex.
> Also extending it to do FAST and regenerate the same packets as
> seen in the windows to windows captures.

Thanks so much for the pointers and the code.  

Thanks for keeping this tree recently rebased, but how do we go from
here?  

Should we just learn from the concepts and implement the narrow case at
hand (FAST testing) and you will integrate it later, or is there a
better way?  How can I/we use your code?

I'm sorry to say that despite having worked with you for something like
two decades, I still don't know how to practically and respectfully
work with your WIP branches.

To date I've generally focussed on picking out and merging the few
patches with a full signed-off-by on them and (say with the Heimdal
trees) trying to keep some of the rebasing current, but otherwise I'm
very lost.

There is clearly a lot of effort and value in between all the 'sq',
'fixup' and reverts, but I don't know how to sift that gold out
properly and refine it into an 'upstream' state.

So, rather than wonder another decade, can I get the quick 'working
with a metze WIP branch' HOWTO?  (I need this for the Heimdal upgrade
branch as well).

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


