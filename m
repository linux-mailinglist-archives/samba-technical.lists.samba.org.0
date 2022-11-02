Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11D616F07
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 21:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NQOWspA6GGfvmF/vIUnmdYvoXjoEM0XvcDNd40BHkiY=; b=vHJhNBc9gLMir9KQUTHOz+4Wm5
	Jeuh6pHMRF/atBKGrKAJGrNkkBNRw1bGfzRrgPDWlFTcSmSPUSEpjH6SgcreE21oUO7R0cXsByhlc
	9cpxEvkAm7mx809TNaRPwrjzmfuc8mzPiL+U4Gnp+ChCYriYI5jngF9xq1y3VWDdFgi3OJu9IY7X0
	T8+vLg33HUe6vSZ6lkAi1eT/CQNI9tEJjxowgSlFV00LN5DtwfAW+nBodtKlV68mV84yA242UCTeO
	1vG3ycvtrRjxefO5wiDqHBnGee0/fcoeu8IA9qTpSL1LWEF63XM/D56LjXRFiROvDPbIsuFvQeQs8
	yKqRUgUQ==;
Received: from ip6-localhost ([::1]:26468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqKc8-00ABPR-Db; Wed, 02 Nov 2022 20:45:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqKbz-00ABPI-7S
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 20:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NQOWspA6GGfvmF/vIUnmdYvoXjoEM0XvcDNd40BHkiY=; b=yrADK9wzYn97WUPO/TaUNhXKNt
 oGRzMAY2z/Ct8upcKACPu3xVaLU0+0jy6qhyIKxebwB7dy+bVSYcZJDacPLU0rTtraV1mF8+iHR0v
 BIyOLeMOnXlhAvCsNyhmnAMCWfSLRw6cdu8rZTTCuKNBQHFnWqOfga/fhOYTYI50QS/GGGiOWHXi3
 3cUPB9zoWou23buwlapQ53Zeg8wLx2BBtwqLW9c032Jj+TCTWevefg5ZWrVBdLb4OIVb47dft+Awa
 jJsPaVMUw3H3KH8BQe+YBWnqtMfOPESCwjN+ittoUO8jT6KG8D+chlwlvIdK55LqLg3ykw4SgOgzw
 ljTMF6vkVOHoTGtNFbpgB78U4fYlDSwNHxSBWbyxD6cz0o7EuhTpA6fZLAigp/q7kmyxPKAuD5bmu
 c9agPMnYzBfD9FFpFk/9SENdGtZBnNaPZZ+nWRbXMt3cXQU0K/jvvM1Aof6vE2E+fl32fa666pdRF
 2FkFacsE4bHrp2JpmlENQHgX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqKbu-006vNF-DO; Wed, 02 Nov 2022 20:45:19 +0000
Date: Wed, 2 Nov 2022 13:45:15 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: How to push to a non Samba Team member branch on gitlab ?
Message-ID: <Y2LW2wXTuvwsAw1x@jeremy-acer>
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

On Thu, Nov 03, 2022 at 09:41:10AM +1300, Andrew Bartlett via samba-technical wrote:
>On Wed, 2022-11-02 at 13:24 -0700, Jeremy Allison wrote:
>> On Wed, Nov 02, 2022 at 01:22:02PM -0700, Jeremy Allison wrote:
>> > I'm working with a new contributor here:
>> >
>> > https://gitlab.com/samba-team/samba/-/merge_requests/2741
>> >
>> > and want to push a modified version of their patch
>> > that corrects some things to help them work with
>> > us here on the Team. Pushing to their branch
>> > helps them see what I corrected so is a very
>> > desirable thing to do.
>> >
>> > The gitlab page above shows their branch name as:
>> >
>> > vporpo/samba:master
>> ...
>> > git push gitlab +HEAD:vporpo/samba:master
>> >
>> > fails, as does:
>> >
>> > git push gitlab +HEAD:vporpo:master
>>
>> git push gitlab +HEAD:vporpo/master
>>
>> pushes, but not to MR 2741, so isn't
>> desirable :-(.
>>
>> > I can't see any logic or patterns in this, or am I just
>> > missing something about git (again).
>> >
>> > Jeremy.
>
>Sadly there isn't a way to change which branch a MR is for, you can
>however mention the old MR in the new MR which will trigger a
>notification.
>
>This is an unfortunate side-effect of the non-standard way we use
>GitLab, as the typical approach is to push back to their branch, as as
>it is typical the incantation is learnt earlier in the learning process
>(I've given that on the MR).

Thanks for the help Andrew, it is *much* appreciated.

git and gitlab are not always obvious :-).

