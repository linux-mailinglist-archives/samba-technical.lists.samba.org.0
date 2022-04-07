Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A44F877F
	for <lists+samba-technical@lfdr.de>; Thu,  7 Apr 2022 20:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cyC2fRa+2HyxVyCKuGk3SPXc/y8sJbLhEGdf6nMigNo=; b=jtT9TjHSarxo6O/PpaUbKZY6hI
	PqzXKQlK74HnpqKUJv/7+Lf3EkkMGzkGKABSNLpHlZtH3BYzXQOjG4drkRxm1r5xh4FpS56N6GWvh
	5NmP6GHXmj/8KU62dvCTBRInjXw28Hoz45x9dzqdAK29FxXuJOaIZfTO3ufe8UnIEbqpaWCK1vIbx
	tjMii3/tr2boSD2ZVYYjURN9qYj+FAau5FjuBTZE6GWLbjX6uOvP+yj2fmTzsfQ9U6X5CQAfgsO9H
	JorEk4lHZIT7HN6km/znCjPcDST/Bz3K4iY3kQ1ciddvdjFYt66hRdT4Oxszik7Tly0TfFwfVqlvo
	aVcaSNbA==;
Received: from ip6-localhost ([::1]:40142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncXI8-00Avyh-W4; Thu, 07 Apr 2022 18:55:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38252) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncXI4-00AvyT-4S; Thu, 07 Apr 2022 18:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=cyC2fRa+2HyxVyCKuGk3SPXc/y8sJbLhEGdf6nMigNo=; b=YXnGXSc3jICILqN7Um5hdjmMjD
 /NW97vjcJTdcHUZdxNelhXV2nsQ8w0tJLpfs9RIa4VyyA+5B4Syh9IuFx4ZuRKfpVYwY9l+TXGyaM
 si+iVvhlMd0kbYhr3Db9FGKFapsfc6Mp42GSQjHPttLJNLJ+qdoXSxG0hMP6kEjz655MWhqHZdJm+
 S4UZ8OQAIoZ6cCCfadEaUa7rNX6AD14NZ7YJVU8IdqBp2gbfYMVwGaMB4SA/F5Qv47pqRl4AOXee/
 WWx1OG71PiPo1kgMej50WNZ4I8BddZfUjHt27GPgC9DWZ2AqXN++ozG0mzl5U/1l/T9vdwZCIqozt
 A4RXwV42BOj3TB0Q9k8vt6ofq6AOI5r/sb24xxFt/Qb9VMqOFDun710+ufLpUvxPeMOgTTEECrh0X
 pjHsOvB6ZSpEGsuFeLFiFVUw8g34cogbb/pVPEs/eANyJHw1wlMUvknHrILy26NiYKB4LFkaeHKQo
 e+Cx3gl5PrS53KxTW+ScldV9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncXI2-005thN-Fc; Thu, 07 Apr 2022 18:55:31 +0000
Date: Thu, 7 Apr 2022 11:55:26 -0700
To: David Mulder <dmulder@samba.org>
Subject: Re: SMB1 can now be removed from the server code !
Message-ID: <Yk8znpNzRv+gLcHM@jeremy-acer>
References: <Yk8w5TWMP7bKmy0z@jeremy-acer>
 <8f1a87e9-fef6-599a-c0f6-1dc4921e355b@samba.org>
 <0d486c94-2570-c79a-a582-a049d908be50@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0d486c94-2570-c79a-a582-a049d908be50@samba.org>
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 07, 2022 at 12:52:25PM -0600, David Mulder via samba-technical wrote:
>On 4/7/22 12:49 PM, David Mulder via samba-technical wrote:
>>On 4/7/22 12:43 PM, Jeremy Allison via samba-technical wrote:
>>>
>>>to David Mulder from SuSE for writing this code, and to Samba
>>>Team members Ralph Boehme from SerNet and Andrew Bartlett from
>>>Catalyst for reviewing and improving the code changes before
>>>merge.
>>>
>>
>>Jeremy failed to mention that he also played a huge role in both 
>>writing code and reviewing. Thank you Jeremy!
>>
>
>Also, thank you Volker Lendec! He also participated in code review.

Damn ! I'm sorry Volker, I forgot you also reviewed :-(.

Volker was the impetus for splitting the patchset up
into the separate files rather than a grab-bag of
"smb1.c", so he also deserves *massive* credit in
this !

I always forget someone, I'm sorry.

Jeremy.

