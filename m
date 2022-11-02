Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81C6170CB
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 23:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kZ713GlUN5O1TmUdT1JqZrhEYtUG9/lMSxYeYsey8wo=; b=LrWE4OFpSiGsQexRb8k1Cs3j/T
	q8O7ZZHe4j4CM1JxEk93C90O2Qz4M8VrFTfQypPiklXycE+GseRUGuNjxmgLPqhBuYlILM72jMNdB
	fJVpfA/L2YspyczK59BtqLJqIpmRy8HSaaoNFG/Cn06GRmW2+15rHqUz5JaqzRB87mwckP4txLZIv
	CB78inSLrogXD16KCkh9ZEEQds/11ZWKFBLl2LX14EDKR1RGoVdo9kxGI3l1loOeyEOfSc0T/+2NC
	SGWVlRbUPSHYfaXNJEkbzVT6JYtWpHTgbhIXkGrqjtsEtGHfozK1Sm+dsABiovh57YkJuZmmljh/P
	KYZ/UrzA==;
Received: from ip6-localhost ([::1]:59612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqMNN-00ABp6-2w; Wed, 02 Nov 2022 22:38:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqMNG-00ABow-Co
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 22:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kZ713GlUN5O1TmUdT1JqZrhEYtUG9/lMSxYeYsey8wo=; b=290ysgIpSnn0ZnOSqKUoMepLXq
 2pioD+S5nzlp8SfkbAYwOeneAUu9/hQNnNdmE4WwVbPS0Zeu2e3x0N+J6tnhUo2+0huJBecJ3sNHR
 lIxH2p3FBpDTVYHdIbIYUqdfAAHMvPgZ10bY8nMovmnoZydPWlUUo2Uj8nWVyhFxQ0NYqV1DHku3j
 TJx9hfyomHR6Dmh+Bfsyh6vfqS9lXJDZHYpF3Qumh0slqa+Y6ZMllXZC/Na8LeoruxdlH1Fo9oKcd
 VllsVWfsAy/1LbTDJTTreHG8251JVchWgafOL+r7Q7IRY9bX/SLTT1KMo6bm+67KTrbDJPsMMV5Cy
 z5umlsgyJfReGanhPUtAmj8B4THL+MWDAc869rELurq4xKG1RSWK0naL/bdB6/dOBtijs2jGzw/xf
 cqMwU35E5pKXlI1612JeuEuRslf+91vlz4rBPhifDpqLQ12oN4dfJ7x+z819vK1O6/X8h6wvGr9vB
 4tg4vYwN7NVB0UVL/6Necr9k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqMN6-006vsX-Dg; Wed, 02 Nov 2022 22:38:08 +0000
Date: Wed, 2 Nov 2022 15:38:01 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: How to push to a non Samba Team member branch on gitlab ?
Message-ID: <Y2LxSR6Iv6Qwd0ub@jeremy-acer>
References: <Y2LRam/bPaaRWRjy@jeremy-acer> <Y2LR/7ytNMuNPxDV@jeremy-acer>
 <0939d282f53194402d6615485a7fc97716fc3b7b.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0939d282f53194402d6615485a7fc97716fc3b7b.camel@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: metze@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 03, 2022 at 09:41:10AM +1300, Andrew Bartlett wrote:
>
>   Sadly there isn't a way to change which branch a MR is for, you can
>   however mention the old MR in the new MR which will trigger a
>   notification.
>   This is an unfortunate side-effect of the non-standard way we use GitLab,
>   as the typical approach is to push back to their branch, as as it is
>   typical the incantation is learnt earlier in the learning process (I've
>   given that on the MR).
>   Andrew Bartlett

On a more humourous note, anyone wanting to learn git
should *always* start here :-) :-) :-):

https://git-man-page-generator.lokaltog.net/

