Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED04207BB
	for <lists+samba-technical@lfdr.de>; Mon,  4 Oct 2021 11:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4i3ey71zDh26bmgPFLYCM4pF4TOFkmrNbA3xku/iQW8=; b=hYccYi7OOakLa937BYjdoQrZO2
	GJYm2NDvVg6XZ5h0qS+Shxre/IBEHqXwK7M5rEli7j6mpHQTz7w1kha3GKu8eR0SHm9fFLoQv9PoN
	kGYtqa02ccFdSp/j6q8L7kHXUODJnyp7xFswOVKjEijGo00BjQWQ0B8PluGY49ZA0nDWGFIPCIaMf
	lAPnAoT89WCqAPPZxCeJ7VLVPyi9//gvbIcFeVudmBQBp7hd2XjND23Ha0sbvTegRt510Bat/hfAs
	FlsFWxw3yO7Fu9f+oPVqzAiTpIQNYb793Ef14L8qozfuc2KvPAem4zBXnBREEPi9SAfwRwzfPZZR+
	Lcgi8M+Q==;
Received: from ip6-localhost ([::1]:42656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mXJq5-003rPp-RN; Mon, 04 Oct 2021 09:00:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mXJpz-003rPg-5h
 for samba-technical@lists.samba.org; Mon, 04 Oct 2021 09:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=4i3ey71zDh26bmgPFLYCM4pF4TOFkmrNbA3xku/iQW8=; b=hTPTXFJ3OeXWu5jnf6zpdUYGle
 NP5kQ5VBXfvwVbPqd9RZoRD+PdSylKz5+EYFoRgqX60zKt88/3FckajUBYWuFolbZRmAzsf7Y5XYY
 dU6/QdGlFvIHvBQ2oZhJSX+NGA1M/VukjewdNSNaWtqERJ1npWIWYYfMCCjhsFGBqIJXmJ+aka6lf
 mFY1Mon3VdE2+NFoIBDzQE46GN92ErVvxEaOnu+Nb1axTEiLqMEzVSPzFC72nYHD+1Fighm1KgyH7
 qIQG0H9EkmCwZ13awv+3gn9xK4MwA4op8A6l5ptzGD7jPFMLGUOBK7LovoEdPs/itnwJ2M8NcC+q9
 e5Kb3W+6oIUoLVnJrMmr9ezlQnuDVcZb/6N28I9OuzTUY5H/no1VFy3M2YutWm+O3MLybO8O3hfOQ
 hLoWGkK53M60P+GhKSPV1efVuZCkeIyBovZXni+SeJLhnscSkIHa/MlSlVWLlrxf1DMQZuCv6pWA5
 sEAIJhZh8KN2hNkMbhQ28QSR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mXJpy-001R5Z-9y
 for samba-technical@lists.samba.org; Mon, 04 Oct 2021 09:00:42 +0000
Subject: Re: "RN: " syntax for the automated WHATSNEW generation
To: samba-technical@lists.samba.org
References: <b5c58afe933683be74b8c1509e697ea319024c07.camel@samba.org>
Message-ID: <bf8474ff-1da5-2017-f457-598273d07213@samba.org>
Date: Mon, 4 Oct 2021 11:00:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b5c58afe933683be74b8c1509e697ea319024c07.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The release notes description can be multi-line, it must be followed by 
a blank line to mark the end of the RN.
It should be understandable for admins without code knowledge.

The wiki page was modified accordingly.


Jule


Am 01.10.21 um 20:02 schrieb Andrew Bartlett via samba-technical:
> I was just asking a new contributor to prepare a patch for backporting,
> and realised I don't know exactly the new RN: syntax.  Is it strictly
> one line (which might go on for a bit) or multi-line, and what is the
> guidance etc?
>
> Can someone who knows the exact syntax and what should be in the note
> please document the
>
> RN: ....
>
> syntax for the wiki:
>
> https://wiki.samba.org/index.php/Samba_Release_Planning#Release_Branch_Checkin_Procedure
>
> Thanks!
>
> Andrew Bartlett
>

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


