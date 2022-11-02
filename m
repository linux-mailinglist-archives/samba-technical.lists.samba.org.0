Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FE6170CD
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 23:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Qiff3D2LAiqPSOMdqxvuOjimmFAqGNK/Uy4l+dIsZwg=; b=Khj9tVUkaLxRPQ5OXa/wbQBCgO
	moOWsmJaXlVuigJd0lOg+lI6EhuB9c7teRP/CW+6q6U6XZUJ/GjlAmoyz1ITUGnb+u7+/CgaUy20Y
	tNBPlRPyFm4HQzYV4gkEj10cDnQzIYLcfjIOHH5tcHbZpenBhX//4iorSvZGBM7GVJcQEwbYfjUeS
	WqfOLnaZLFp/n/uaYUBQkirY0tr/sYCnEgH0hSZeo5zBEOhcQAdfyilGNGyLNmaiyNEm8QWlnc1qV
	H4/pbghTdTjAfvxwenxnj7rZMG/j/6fTD4iPyMsOXAnuRbJdlumRrITCg4saQE5vjGqBXBvk8By18
	LrtTdz6Q==;
Received: from ip6-localhost ([::1]:47356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqMUU-00AC8j-1S; Wed, 02 Nov 2022 22:45:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqMUO-00AC8a-RL
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 22:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Qiff3D2LAiqPSOMdqxvuOjimmFAqGNK/Uy4l+dIsZwg=; b=tkRCf65QJ0wXoaTKl7Xa6IO7BO
 UyqzFScn0pIXMllrYPVI70RTdA1EzY1hZMv3zq7Dkex/2r0eea21C1/5l+4xwdRq/juuM3AhdIjJF
 D9zvmxwwaXcuisTv02Alo2yktWW7BKaPg3Swi5e28fvKlaj9rMGlUdU9n5nsSNZv9/smFJQhwpLQz
 X8eM0RiTt5/ISpZdeOglTzAq3pe5RDuHqTe46hAXH0uMdQvaCB8pOmCKoIE9qbyA6DaJKk8ACmp2o
 J8e36osGl4VBCH214PhUvi+yj9ZASkm5vpXl5prFOpjkt9/um4nJ033iQ9rx6VAnldaNI4a8Y5vNr
 nzOutRhAYX0Y/UdWXHBaHozYmAQum++Gbth/FUPJ6QSwN5O7SG/YEI5eCv8ESFAfV2YAKFVHSiWRi
 3NqeO2ku6URg6iRflWC/Q4nBZOmAE0l3t93InZ5dGbM+Dnkr5ZrqLy0dzQRENL37LG8KJIR63jGbO
 N7CQF4oSwzYl3dxetH2mXVdX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqMUJ-006vwR-2S; Wed, 02 Nov 2022 22:45:35 +0000
Date: Wed, 2 Nov 2022 15:45:32 -0700
To: Andrew Bartlett <abartlet@samba.org>, metze@samba.org,
 samba-technical@lists.samba.org
Subject: Re: How to push to a non Samba Team member branch on gitlab ?
Message-ID: <Y2LyRyHfRZMbRQQU@jeremy-acer>
References: <Y2LRam/bPaaRWRjy@jeremy-acer> <Y2LR/7ytNMuNPxDV@jeremy-acer>
 <0939d282f53194402d6615485a7fc97716fc3b7b.camel@samba.org>
 <Y2LxSR6Iv6Qwd0ub@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2LxSR6Iv6Qwd0ub@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 02, 2022 at 03:38:01PM -0700, Jeremy Allison via samba-technical wrote:
>On Thu, Nov 03, 2022 at 09:41:10AM +1300, Andrew Bartlett wrote:
>>
>>  Sadly there isn't a way to change which branch a MR is for, you can
>>  however mention the old MR in the new MR which will trigger a
>>  notification.
>>  This is an unfortunate side-effect of the non-standard way we use GitLab,
>>  as the typical approach is to push back to their branch, as as it is
>>  typical the incantation is learnt earlier in the learning process (I've
>>  given that on the MR).
>>  Andrew Bartlett
>
>On a more humourous note, anyone wanting to learn git
>should *always* start here :-) :-) :-):
>
>https://git-man-page-generator.lokaltog.net/

We need something similar for an smb.conf option
generator :-).

