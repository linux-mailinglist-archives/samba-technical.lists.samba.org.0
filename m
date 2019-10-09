Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77AD1393
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2019 18:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=lPJ5SVDu3XqGLmzkduZOfsR1nbz1E3O7SYynmOgsfJQ=; b=XG89nIVlrvVB8r6pi5pwefIdaT
	ncAtgfPYYRBv0t/Irr7Ao2AQpQMGlUtGoeIBGrG68eRiACBjZULjfBYtT+J9cxvT7MHvQuoV8+PqV
	TuQY0j4xvHIQIc9PWoiZ1P9twqKVJbfuZn47DNhytWJ6H7DXtXl7xJcncDTOO3CTfgPSQ8Qp6fc3m
	npoy5xYtUV5/ktNeWn5Xy3qSLHGHoFuZMeGD+u2us/bKnPQRjcjEcxXNJ3nUu4UqxRu5TQmi5LGGV
	D2Yxzcx+QrMdKr5kwuNy4IjnuhWBsPrWZqMScFoPjxrhwW02rFh/slN1j6nX+jwyh31rbLeycWzAg
	26LWqbvw==;
Received: from localhost ([::1]:29904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIEUU-002QR5-LY; Wed, 09 Oct 2019 16:07:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIEUQ-002QQy-HL
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 16:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=lPJ5SVDu3XqGLmzkduZOfsR1nbz1E3O7SYynmOgsfJQ=; b=SOTSX/NDJZIEspjnmJXIv8QEz8
 4HJIGz6DLxEBrw4lqYxkIwQG/Ua9dS7Dhr2BLn4QZES7uqW8UOSymYxBOMvcX4KTWRS5aKxZgyPhY
 /tzX9GVmLRZWj1vP9XkkpidyC2ELXokmSFLg9pgNt5aRpaqXI5JKB8EAJylag1wjYMDrrScg9sJpQ
 brXx+V1HO1Zpn0hZ/79/qZsxqqrhteZ/bUWOENWczBmNOYxngXNELqIGNPaZvQjLybWcGiBEAQsKv
 PZn7TDxaDQ5cWpTBcdGmSr65lMeXmQQkcA/FxtYY3zeXCLqIQilLJESsctllb88G877gkY9gbt8t3
 i0eb4i2oFw0aFTbuQpLRPbwjklrZMePkYe/vbNkmNppYUiB88uove37qT0MauTXkOEKrtkIJkT7qA
 vhoQFlhSju29jqEOIlzFCSKzjM81h+FyIqEdC/sG4tGoioTkqDYd0vWMwB3tYeIXb9ZmabmuiA5qc
 MA0qwvAwTb3O/dYaUjIG86s9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIEUP-00017u-Ma; Wed, 09 Oct 2019 16:07:01 +0000
Subject: Re: Samba and legacy Windows support
To: Jeremy Allison <jra@samba.org>
References: <5849953.E8HlOTvGIY@magrathea> <20191008182451.GA1583@jra4>
 <288345e4-890f-bf07-7f3d-e170f1266d46@samba.org>
 <20191009155140.GA144847@jra4>
Message-ID: <5d477bb2-13e9-e23a-2b15-0c9774bba2cf@samba.org>
Date: Wed, 9 Oct 2019 17:07:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009155140.GA144847@jra4>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 09/10/2019 16:51, Jeremy Allison wrote:
> On Wed, Oct 09, 2019 at 10:25:19AM +0100, Rowland penny via samba-technical wrote:
>> On 08/10/2019 19:24, Jeremy Allison via samba-technical wrote:
>>> On Tue, Oct 08, 2019 at 10:59:41AM +0200, Andreas Schneider via samba-technical wrote:
>>>> Samba with version 4.11 currently still support a lot of systems which are
>>>> already out of support. We still get bugs to either fix support for Windows
>>>> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
>>>> still deployed.
>>>>
>>>> In order to remove support for those platforms which are very long EOL, we
>>>> should try to make announcements when we plan to remove support.
>>>>
>>>> ## Steps planned
>>>>
>>>> With Samba 4.12 we plan to disable SMB1 by default and then remove support for
>>>> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
>>> I think aiming for this by the end of 2020 is possible. There is
>>> a lot of work to do first though.
>>>
>>> Announcing this is what we're going for is a good first step to
>>> allow people to prepare to move off SMB1-dependent systems.
>>>
>>> Jeremy.
>>>
>> You do realise that we are discussing this on an open mailing list and by
> Yes, I am aware of that :-).
>
>> doing this, we could be seen to have already announced that we will totally
>> drop SMBv1 from version 4.13 or 4.14.
> "Announced" is different from discussing on samba-technical.
>
> "Announced" to me means something on news.samba.org and also
> in the release notes of the next release.
>
> That makes it official, whereas decisions here aren't.

Human nature being what it is, someone is bound to take it as gospel 
that it is official, when it isn't ;-)

Rowland



